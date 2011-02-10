//
//  StationInfo.m
//  WindMobile
//
//  Created by Stefan Hochuli Paychère on 31.01.11.
//  Copyright 2011 Pistache Software. All rights reserved.
//

#import "StationInfo.h"

#define STATION_INFO_ID_KEY @"@id"
#define STATION_INFO_NAME_KEY @"@name"
#define STATION_INFO_SHORT_NAME_KEY @"@shortName"
#define STATION_INFO_ALTITUDE_KEY @"@altitude"
#define STATION_INFO_DATA_VALIDITY_KEY @"@dataValidity"
	
@implementation StationInfo
@synthesize stationInfo;
- (id)initWithDictionary:(NSDictionary *)aDictionary{
	self = [super init];
	if(self != nil && aDictionary != nil){
		stationInfo = [aDictionary retain];
		//coordinate
		NSString *wgs84Latitude = [stationInfo objectForKey:@"@wgs84Latitude"];
		NSString *wgs84Longitude = [stationInfo objectForKey:@"@wgs84Longitude"];
		
		if(wgs84Latitude != nil && wgs84Longitude != nil){
			coordinate.latitude = [wgs84Latitude doubleValue];
			coordinate.longitude = [wgs84Longitude doubleValue];
		}
	}
	return self;
}

#pragma mark -
#pragma mark - NSDictionary composition

- (NSUInteger)count{
	return [stationInfo count];
}

- (id)objectForKey:(id)aKey{
	return [stationInfo objectForKey:aKey];
}

- (NSEnumerator *)keyEnumerator{
	return [stationInfo keyEnumerator];
}

- (NSString *)description{
	return [NSString stringWithFormat:@"StationInfo %f,%f %@", coordinate.longitude,coordinate.latitude ,[stationInfo description]];
}

#pragma mark -
#pragma mark - StationInfo properties
@dynamic name;
- (NSString*)name{
	return (NSString*)[stationInfo objectForKey:STATION_INFO_NAME_KEY];
}

@dynamic shortName;
- (NSString*)shortName{
	return (NSString*)[stationInfo objectForKey:STATION_INFO_SHORT_NAME_KEY];
}

@dynamic altitude;
- (NSString*)altitude{
	return (NSString*)[stationInfo objectForKey:STATION_INFO_ALTITUDE_KEY];
}

@dynamic dataValidity;
- (NSString*)dataValidity{
	return (NSString*)[stationInfo objectForKey:STATION_INFO_DATA_VALIDITY_KEY];
}

@dynamic stationID;
- (NSString*)stationID{
	return (NSString*)[stationInfo objectForKey:STATION_INFO_ID_KEY];
}

#pragma mark -
#pragma mark - MKAnnotation protocol
@synthesize coordinate;
- (NSString *)title{
	return self.name;
}

- (NSString *)subtitle{
	return [NSString stringWithFormat:NSLocalizedStringFromTable(@"ALTITUDE_SHORT_FORMAT", @"WindMobile", nil),
			self.altitude];
}


@end