export type UserData = {
	id: number;
	name: string;
	email: string;
	pixelsPainted: number;
	level: number;
	isCustomer: boolean;
	needsPhoneVerification: boolean;
	droplets: number;
	charges: { count: number; max: number; cooldownMs: number };
	favoriteLocations: { id: number; latitude: number; longitude: number }[];
	maxFavoriteLocations: number;
	showLastPixel: boolean;
	allianceId: number;
	allianceRole: 'admin' | 'member';
	extraColorsBitmap: number;
	equippedFlag: number;
	flagsBitmap: string;
	picture?: string;
	discord: string;
	country?: string;
	role?: 'user' | 'moderator' | 'admin';
};

export type LeaderboardPeriod = 'today' | 'week' | 'month' | 'all-time';
export type LeaderboardEntry = { id: number; name: string; pixelsPainted: number };
export type LeaderboardPlayerEntry = {
	id: number;
	name: string;
	allianceId: number;
	allianceName: string;
	pixelsPainted: number;
	equippedFlag: number;
	picture?: string;
	discord?: string;
};
export type LeaderboardRegionEntry = {
	id: number;
	name: string;
	cityId: number;
	number: number;
	countryId: number;
	pixelsPainted: number;
	lastLatitude: number;
	lastLongitude: number;
};
export type LeaderboardRegionAllianceEntry = { id: number; name: string; pixelsPainted: number };
export type LeaderboardCountryEntry = { id: number; pixelsPainted: number };
export type AllianceLeaderboardEntry = {
	userId: number;
	name: string;
	equippedFlag: number;
	pixelsPainted: number;
	lastLatitude?: number;
	lastLongitude?: number;
	picture?: string;
	discord?: string;
};

export type AllianceMember = { id: number; name: string; role: 'member' | 'admin'; picture?: string };
export type AllianceData = {
	id: number;
	name: string;
	role: 'member' | 'admin';
	pixelsPainted: number;
	members: number;
	description: string;
	hq?: { latitude: number; longitude: number };
};
export type AllianceBannedMember = { id: number; name: string; picture?: string };

export type Bounds = { min: [number, number]; max: [number, number] };
