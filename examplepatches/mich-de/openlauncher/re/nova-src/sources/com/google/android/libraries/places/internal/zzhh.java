package com.google.android.libraries.places.internal;

import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.api.model.PlaceTypes;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
final class zzhh {
    private final zzoa zza;

    public zzhh() {
        zznz zznzVar = new zznz();
        zznzVar.zza(PlaceTypes.ACCOUNTING, Place.Type.ACCOUNTING);
        zznzVar.zza(PlaceTypes.ADMINISTRATIVE_AREA_LEVEL_1, Place.Type.ADMINISTRATIVE_AREA_LEVEL_1);
        zznzVar.zza(PlaceTypes.ADMINISTRATIVE_AREA_LEVEL_2, Place.Type.ADMINISTRATIVE_AREA_LEVEL_2);
        zznzVar.zza(PlaceTypes.ADMINISTRATIVE_AREA_LEVEL_3, Place.Type.ADMINISTRATIVE_AREA_LEVEL_3);
        zznzVar.zza(PlaceTypes.ADMINISTRATIVE_AREA_LEVEL_4, Place.Type.ADMINISTRATIVE_AREA_LEVEL_4);
        zznzVar.zza(PlaceTypes.ADMINISTRATIVE_AREA_LEVEL_5, Place.Type.ADMINISTRATIVE_AREA_LEVEL_5);
        zznzVar.zza(PlaceTypes.AIRPORT, Place.Type.AIRPORT);
        zznzVar.zza(PlaceTypes.AMUSEMENT_PARK, Place.Type.AMUSEMENT_PARK);
        zznzVar.zza(PlaceTypes.AQUARIUM, Place.Type.AQUARIUM);
        zznzVar.zza(PlaceTypes.ARCHIPELAGO, Place.Type.ARCHIPELAGO);
        zznzVar.zza(PlaceTypes.ART_GALLERY, Place.Type.ART_GALLERY);
        zznzVar.zza(PlaceTypes.ATM, Place.Type.ATM);
        zznzVar.zza(PlaceTypes.BAKERY, Place.Type.BAKERY);
        zznzVar.zza(PlaceTypes.BANK, Place.Type.BANK);
        zznzVar.zza(PlaceTypes.BAR, Place.Type.BAR);
        zznzVar.zza(PlaceTypes.BEAUTY_SALON, Place.Type.BEAUTY_SALON);
        zznzVar.zza(PlaceTypes.BICYCLE_STORE, Place.Type.BICYCLE_STORE);
        zznzVar.zza(PlaceTypes.BOOK_STORE, Place.Type.BOOK_STORE);
        zznzVar.zza(PlaceTypes.BOWLING_ALLEY, Place.Type.BOWLING_ALLEY);
        zznzVar.zza(PlaceTypes.BUS_STATION, Place.Type.BUS_STATION);
        zznzVar.zza(PlaceTypes.CAFE, Place.Type.CAFE);
        zznzVar.zza(PlaceTypes.CAMPGROUND, Place.Type.CAMPGROUND);
        zznzVar.zza(PlaceTypes.CAR_DEALER, Place.Type.CAR_DEALER);
        zznzVar.zza(PlaceTypes.CAR_RENTAL, Place.Type.CAR_RENTAL);
        zznzVar.zza(PlaceTypes.CAR_REPAIR, Place.Type.CAR_REPAIR);
        zznzVar.zza(PlaceTypes.CAR_WASH, Place.Type.CAR_WASH);
        zznzVar.zza(PlaceTypes.CASINO, Place.Type.CASINO);
        zznzVar.zza(PlaceTypes.CEMETERY, Place.Type.CEMETERY);
        zznzVar.zza(PlaceTypes.CHURCH, Place.Type.CHURCH);
        zznzVar.zza(PlaceTypes.CITY_HALL, Place.Type.CITY_HALL);
        zznzVar.zza(PlaceTypes.CLOTHING_STORE, Place.Type.CLOTHING_STORE);
        zznzVar.zza(PlaceTypes.COLLOQUIAL_AREA, Place.Type.COLLOQUIAL_AREA);
        zznzVar.zza(PlaceTypes.CONTINENT, Place.Type.CONTINENT);
        zznzVar.zza(PlaceTypes.CONVENIENCE_STORE, Place.Type.CONVENIENCE_STORE);
        zznzVar.zza("country", Place.Type.COUNTRY);
        zznzVar.zza(PlaceTypes.COURTHOUSE, Place.Type.COURTHOUSE);
        zznzVar.zza(PlaceTypes.DENTIST, Place.Type.DENTIST);
        zznzVar.zza(PlaceTypes.DEPARTMENT_STORE, Place.Type.DEPARTMENT_STORE);
        zznzVar.zza(PlaceTypes.DOCTOR, Place.Type.DOCTOR);
        zznzVar.zza(PlaceTypes.DRUGSTORE, Place.Type.DRUGSTORE);
        zznzVar.zza(PlaceTypes.ELECTRICIAN, Place.Type.ELECTRICIAN);
        zznzVar.zza(PlaceTypes.ELECTRONICS_STORE, Place.Type.ELECTRONICS_STORE);
        zznzVar.zza(PlaceTypes.EMBASSY, Place.Type.EMBASSY);
        zznzVar.zza(PlaceTypes.ESTABLISHMENT, Place.Type.ESTABLISHMENT);
        zznzVar.zza(PlaceTypes.FINANCE, Place.Type.FINANCE);
        zznzVar.zza(PlaceTypes.FIRE_STATION, Place.Type.FIRE_STATION);
        zznzVar.zza(PlaceTypes.FLOOR, Place.Type.FLOOR);
        zznzVar.zza(PlaceTypes.FLORIST, Place.Type.FLORIST);
        zznzVar.zza(PlaceTypes.FOOD, Place.Type.FOOD);
        zznzVar.zza(PlaceTypes.FUNERAL_HOME, Place.Type.FUNERAL_HOME);
        zznzVar.zza(PlaceTypes.FURNITURE_STORE, Place.Type.FURNITURE_STORE);
        zznzVar.zza(PlaceTypes.GAS_STATION, Place.Type.GAS_STATION);
        zznzVar.zza(PlaceTypes.GENERAL_CONTRACTOR, Place.Type.GENERAL_CONTRACTOR);
        zznzVar.zza(PlaceTypes.GEOCODE, Place.Type.GEOCODE);
        zznzVar.zza("grocery_or_supermarket", Place.Type.GROCERY_OR_SUPERMARKET);
        zznzVar.zza(PlaceTypes.GYM, Place.Type.GYM);
        zznzVar.zza(PlaceTypes.HAIR_CARE, Place.Type.HAIR_CARE);
        zznzVar.zza(PlaceTypes.HARDWARE_STORE, Place.Type.HARDWARE_STORE);
        zznzVar.zza(PlaceTypes.HEALTH, Place.Type.HEALTH);
        zznzVar.zza(PlaceTypes.HINDU_TEMPLE, Place.Type.HINDU_TEMPLE);
        zznzVar.zza(PlaceTypes.HOME_GOODS_STORE, Place.Type.HOME_GOODS_STORE);
        zznzVar.zza(PlaceTypes.HOSPITAL, Place.Type.HOSPITAL);
        zznzVar.zza(PlaceTypes.INSURANCE_AGENCY, Place.Type.INSURANCE_AGENCY);
        zznzVar.zza(PlaceTypes.INTERSECTION, Place.Type.INTERSECTION);
        zznzVar.zza(PlaceTypes.JEWELRY_STORE, Place.Type.JEWELRY_STORE);
        zznzVar.zza(PlaceTypes.LAUNDRY, Place.Type.LAUNDRY);
        zznzVar.zza(PlaceTypes.LAWYER, Place.Type.LAWYER);
        zznzVar.zza(PlaceTypes.LIBRARY, Place.Type.LIBRARY);
        zznzVar.zza(PlaceTypes.LIGHT_RAIL_STATION, Place.Type.LIGHT_RAIL_STATION);
        zznzVar.zza(PlaceTypes.LIQUOR_STORE, Place.Type.LIQUOR_STORE);
        zznzVar.zza(PlaceTypes.LOCAL_GOVERNMENT_OFFICE, Place.Type.LOCAL_GOVERNMENT_OFFICE);
        zznzVar.zza(PlaceTypes.LOCALITY, Place.Type.LOCALITY);
        zznzVar.zza(PlaceTypes.LOCKSMITH, Place.Type.LOCKSMITH);
        zznzVar.zza(PlaceTypes.LODGING, Place.Type.LODGING);
        zznzVar.zza(PlaceTypes.MEAL_DELIVERY, Place.Type.MEAL_DELIVERY);
        zznzVar.zza(PlaceTypes.MEAL_TAKEAWAY, Place.Type.MEAL_TAKEAWAY);
        zznzVar.zza(PlaceTypes.MOSQUE, Place.Type.MOSQUE);
        zznzVar.zza(PlaceTypes.MOVIE_RENTAL, Place.Type.MOVIE_RENTAL);
        zznzVar.zza(PlaceTypes.MOVIE_THEATER, Place.Type.MOVIE_THEATER);
        zznzVar.zza(PlaceTypes.MOVING_COMPANY, Place.Type.MOVING_COMPANY);
        zznzVar.zza(PlaceTypes.MUSEUM, Place.Type.MUSEUM);
        zznzVar.zza(PlaceTypes.NATURAL_FEATURE, Place.Type.NATURAL_FEATURE);
        zznzVar.zza(PlaceTypes.NEIGHBORHOOD, Place.Type.NEIGHBORHOOD);
        zznzVar.zza(PlaceTypes.NIGHT_CLUB, Place.Type.NIGHT_CLUB);
        zznzVar.zza(PlaceTypes.PAINTER, Place.Type.PAINTER);
        zznzVar.zza(PlaceTypes.PARK, Place.Type.PARK);
        zznzVar.zza(PlaceTypes.PARKING, Place.Type.PARKING);
        zznzVar.zza(PlaceTypes.PET_STORE, Place.Type.PET_STORE);
        zznzVar.zza(PlaceTypes.PHARMACY, Place.Type.PHARMACY);
        zznzVar.zza(PlaceTypes.PHYSIOTHERAPIST, Place.Type.PHYSIOTHERAPIST);
        zznzVar.zza(PlaceTypes.PLACE_OF_WORSHIP, Place.Type.PLACE_OF_WORSHIP);
        zznzVar.zza(PlaceTypes.PLUMBER, Place.Type.PLUMBER);
        zznzVar.zza(PlaceTypes.PLUS_CODE, Place.Type.PLUS_CODE);
        zznzVar.zza(PlaceTypes.POINT_OF_INTEREST, Place.Type.POINT_OF_INTEREST);
        zznzVar.zza(PlaceTypes.POLICE, Place.Type.POLICE);
        zznzVar.zza(PlaceTypes.POLITICAL, Place.Type.POLITICAL);
        zznzVar.zza(PlaceTypes.POST_BOX, Place.Type.POST_BOX);
        zznzVar.zza(PlaceTypes.POST_OFFICE, Place.Type.POST_OFFICE);
        zznzVar.zza(PlaceTypes.POSTAL_CODE_PREFIX, Place.Type.POSTAL_CODE_PREFIX);
        zznzVar.zza(PlaceTypes.POSTAL_CODE_SUFFIX, Place.Type.POSTAL_CODE_SUFFIX);
        zznzVar.zza(PlaceTypes.POSTAL_CODE, Place.Type.POSTAL_CODE);
        zznzVar.zza(PlaceTypes.POSTAL_TOWN, Place.Type.POSTAL_TOWN);
        zznzVar.zza(PlaceTypes.PREMISE, Place.Type.PREMISE);
        zznzVar.zza(PlaceTypes.PRIMARY_SCHOOL, Place.Type.PRIMARY_SCHOOL);
        zznzVar.zza(PlaceTypes.REAL_ESTATE_AGENCY, Place.Type.REAL_ESTATE_AGENCY);
        zznzVar.zza(PlaceTypes.RESTAURANT, Place.Type.RESTAURANT);
        zznzVar.zza(PlaceTypes.ROOFING_CONTRACTOR, Place.Type.ROOFING_CONTRACTOR);
        zznzVar.zza(PlaceTypes.ROOM, Place.Type.ROOM);
        zznzVar.zza(PlaceTypes.ROUTE, Place.Type.ROUTE);
        zznzVar.zza(PlaceTypes.RV_PARK, Place.Type.RV_PARK);
        zznzVar.zza(PlaceTypes.SCHOOL, Place.Type.SCHOOL);
        zznzVar.zza(PlaceTypes.SECONDARY_SCHOOL, Place.Type.SECONDARY_SCHOOL);
        zznzVar.zza(PlaceTypes.SHOE_STORE, Place.Type.SHOE_STORE);
        zznzVar.zza(PlaceTypes.SHOPPING_MALL, Place.Type.SHOPPING_MALL);
        zznzVar.zza(PlaceTypes.SPA, Place.Type.SPA);
        zznzVar.zza(PlaceTypes.STADIUM, Place.Type.STADIUM);
        zznzVar.zza(PlaceTypes.STORAGE, Place.Type.STORAGE);
        zznzVar.zza("store", Place.Type.STORE);
        zznzVar.zza(PlaceTypes.STREET_ADDRESS, Place.Type.STREET_ADDRESS);
        zznzVar.zza(PlaceTypes.STREET_NUMBER, Place.Type.STREET_NUMBER);
        zznzVar.zza(PlaceTypes.SUBLOCALITY_LEVEL_1, Place.Type.SUBLOCALITY_LEVEL_1);
        zznzVar.zza(PlaceTypes.SUBLOCALITY_LEVEL_2, Place.Type.SUBLOCALITY_LEVEL_2);
        zznzVar.zza(PlaceTypes.SUBLOCALITY_LEVEL_3, Place.Type.SUBLOCALITY_LEVEL_3);
        zznzVar.zza(PlaceTypes.SUBLOCALITY_LEVEL_4, Place.Type.SUBLOCALITY_LEVEL_4);
        zznzVar.zza(PlaceTypes.SUBLOCALITY_LEVEL_5, Place.Type.SUBLOCALITY_LEVEL_5);
        zznzVar.zza(PlaceTypes.SUBLOCALITY, Place.Type.SUBLOCALITY);
        zznzVar.zza(PlaceTypes.SUBPREMISE, Place.Type.SUBPREMISE);
        zznzVar.zza(PlaceTypes.SUBWAY_STATION, Place.Type.SUBWAY_STATION);
        zznzVar.zza(PlaceTypes.SUPERMARKET, Place.Type.SUPERMARKET);
        zznzVar.zza(PlaceTypes.SYNAGOGUE, Place.Type.SYNAGOGUE);
        zznzVar.zza(PlaceTypes.TAXI_STAND, Place.Type.TAXI_STAND);
        zznzVar.zza(PlaceTypes.TOURIST_ATTRACTION, Place.Type.TOURIST_ATTRACTION);
        zznzVar.zza(PlaceTypes.TOWN_SQUARE, Place.Type.TOWN_SQUARE);
        zznzVar.zza(PlaceTypes.TRAIN_STATION, Place.Type.TRAIN_STATION);
        zznzVar.zza(PlaceTypes.TRANSIT_STATION, Place.Type.TRANSIT_STATION);
        zznzVar.zza(PlaceTypes.TRAVEL_AGENCY, Place.Type.TRAVEL_AGENCY);
        zznzVar.zza(PlaceTypes.UNIVERSITY, Place.Type.UNIVERSITY);
        zznzVar.zza(PlaceTypes.VETERINARY_CARE, Place.Type.VETERINARY_CARE);
        zznzVar.zza(PlaceTypes.ZOO, Place.Type.ZOO);
        this.zza = zznzVar.zzc();
    }

    @Deprecated
    public final List zza(List list) {
        list.getClass();
        if (list.isEmpty()) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        Iterator it = list.iterator();
        boolean z11 = false;
        while (it.hasNext()) {
            String str = (String) it.next();
            if (this.zza.containsKey(str)) {
                arrayList.add((Place.Type) this.zza.get(str));
            } else {
                z11 = true;
            }
        }
        if (z11) {
            arrayList.add(Place.Type.OTHER);
        }
        return arrayList;
    }
}
