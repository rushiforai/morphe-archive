package com.google.android.libraries.places.internal;

import android.graphics.Color;
import android.net.Uri;
import android.text.TextUtils;
import b.c0;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.libraries.places.api.model.AddressComponent;
import com.google.android.libraries.places.api.model.AddressComponents;
import com.google.android.libraries.places.api.model.DayOfWeek;
import com.google.android.libraries.places.api.model.LocalDate;
import com.google.android.libraries.places.api.model.LocalTime;
import com.google.android.libraries.places.api.model.OpeningHours;
import com.google.android.libraries.places.api.model.Period;
import com.google.android.libraries.places.api.model.PhotoMetadata;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.google.android.libraries.places.api.model.PlusCode;
import com.google.android.libraries.places.api.model.SpecialDay;
import com.google.android.libraries.places.api.model.TimeOfWeek;
import com.google.android.libraries.places.internal.zzja;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* loaded from: classes3.dex */
final class zzix {
    private static final zzoa zza;
    private static final zzoa zzb;
    private static final zzoa zzc;

    static {
        zznz zznzVar = new zznz();
        zznzVar.zza("OPERATIONAL", Place.BusinessStatus.OPERATIONAL);
        zznzVar.zza("CLOSED_TEMPORARILY", Place.BusinessStatus.CLOSED_TEMPORARILY);
        zznzVar.zza("CLOSED_PERMANENTLY", Place.BusinessStatus.CLOSED_PERMANENTLY);
        zza = zznzVar.zzc();
        zznz zznzVar2 = new zznz();
        zznzVar2.zza(PlaceTypes.ACCOUNTING, Place.Type.ACCOUNTING);
        zznzVar2.zza(PlaceTypes.ADMINISTRATIVE_AREA_LEVEL_1, Place.Type.ADMINISTRATIVE_AREA_LEVEL_1);
        zznzVar2.zza(PlaceTypes.ADMINISTRATIVE_AREA_LEVEL_2, Place.Type.ADMINISTRATIVE_AREA_LEVEL_2);
        zznzVar2.zza(PlaceTypes.ADMINISTRATIVE_AREA_LEVEL_3, Place.Type.ADMINISTRATIVE_AREA_LEVEL_3);
        zznzVar2.zza(PlaceTypes.ADMINISTRATIVE_AREA_LEVEL_4, Place.Type.ADMINISTRATIVE_AREA_LEVEL_4);
        zznzVar2.zza(PlaceTypes.ADMINISTRATIVE_AREA_LEVEL_5, Place.Type.ADMINISTRATIVE_AREA_LEVEL_5);
        zznzVar2.zza(PlaceTypes.AIRPORT, Place.Type.AIRPORT);
        zznzVar2.zza(PlaceTypes.AMUSEMENT_PARK, Place.Type.AMUSEMENT_PARK);
        zznzVar2.zza(PlaceTypes.AQUARIUM, Place.Type.AQUARIUM);
        zznzVar2.zza(PlaceTypes.ARCHIPELAGO, Place.Type.ARCHIPELAGO);
        zznzVar2.zza(PlaceTypes.ART_GALLERY, Place.Type.ART_GALLERY);
        zznzVar2.zza(PlaceTypes.ATM, Place.Type.ATM);
        zznzVar2.zza(PlaceTypes.BAKERY, Place.Type.BAKERY);
        zznzVar2.zza(PlaceTypes.BANK, Place.Type.BANK);
        zznzVar2.zza(PlaceTypes.BAR, Place.Type.BAR);
        zznzVar2.zza(PlaceTypes.BEAUTY_SALON, Place.Type.BEAUTY_SALON);
        zznzVar2.zza(PlaceTypes.BICYCLE_STORE, Place.Type.BICYCLE_STORE);
        zznzVar2.zza(PlaceTypes.BOOK_STORE, Place.Type.BOOK_STORE);
        zznzVar2.zza(PlaceTypes.BOWLING_ALLEY, Place.Type.BOWLING_ALLEY);
        zznzVar2.zza(PlaceTypes.BUS_STATION, Place.Type.BUS_STATION);
        zznzVar2.zza(PlaceTypes.CAFE, Place.Type.CAFE);
        zznzVar2.zza(PlaceTypes.CAMPGROUND, Place.Type.CAMPGROUND);
        zznzVar2.zza(PlaceTypes.CAR_DEALER, Place.Type.CAR_DEALER);
        zznzVar2.zza(PlaceTypes.CAR_RENTAL, Place.Type.CAR_RENTAL);
        zznzVar2.zza(PlaceTypes.CAR_REPAIR, Place.Type.CAR_REPAIR);
        zznzVar2.zza(PlaceTypes.CAR_WASH, Place.Type.CAR_WASH);
        zznzVar2.zza(PlaceTypes.CASINO, Place.Type.CASINO);
        zznzVar2.zza(PlaceTypes.CEMETERY, Place.Type.CEMETERY);
        zznzVar2.zza(PlaceTypes.CHURCH, Place.Type.CHURCH);
        zznzVar2.zza(PlaceTypes.CITY_HALL, Place.Type.CITY_HALL);
        zznzVar2.zza(PlaceTypes.CLOTHING_STORE, Place.Type.CLOTHING_STORE);
        zznzVar2.zza(PlaceTypes.COLLOQUIAL_AREA, Place.Type.COLLOQUIAL_AREA);
        zznzVar2.zza(PlaceTypes.CONTINENT, Place.Type.CONTINENT);
        zznzVar2.zza(PlaceTypes.CONVENIENCE_STORE, Place.Type.CONVENIENCE_STORE);
        zznzVar2.zza("country", Place.Type.COUNTRY);
        zznzVar2.zza(PlaceTypes.COURTHOUSE, Place.Type.COURTHOUSE);
        zznzVar2.zza(PlaceTypes.DENTIST, Place.Type.DENTIST);
        zznzVar2.zza(PlaceTypes.DEPARTMENT_STORE, Place.Type.DEPARTMENT_STORE);
        zznzVar2.zza(PlaceTypes.DOCTOR, Place.Type.DOCTOR);
        zznzVar2.zza(PlaceTypes.DRUGSTORE, Place.Type.DRUGSTORE);
        zznzVar2.zza(PlaceTypes.ELECTRICIAN, Place.Type.ELECTRICIAN);
        zznzVar2.zza(PlaceTypes.ELECTRONICS_STORE, Place.Type.ELECTRONICS_STORE);
        zznzVar2.zza(PlaceTypes.EMBASSY, Place.Type.EMBASSY);
        zznzVar2.zza(PlaceTypes.ESTABLISHMENT, Place.Type.ESTABLISHMENT);
        zznzVar2.zza(PlaceTypes.FINANCE, Place.Type.FINANCE);
        zznzVar2.zza(PlaceTypes.FIRE_STATION, Place.Type.FIRE_STATION);
        zznzVar2.zza(PlaceTypes.FLOOR, Place.Type.FLOOR);
        zznzVar2.zza(PlaceTypes.FLORIST, Place.Type.FLORIST);
        zznzVar2.zza(PlaceTypes.FOOD, Place.Type.FOOD);
        zznzVar2.zza(PlaceTypes.FUNERAL_HOME, Place.Type.FUNERAL_HOME);
        zznzVar2.zza(PlaceTypes.FURNITURE_STORE, Place.Type.FURNITURE_STORE);
        zznzVar2.zza(PlaceTypes.GAS_STATION, Place.Type.GAS_STATION);
        zznzVar2.zza(PlaceTypes.GENERAL_CONTRACTOR, Place.Type.GENERAL_CONTRACTOR);
        zznzVar2.zza(PlaceTypes.GEOCODE, Place.Type.GEOCODE);
        zznzVar2.zza("grocery_or_supermarket", Place.Type.GROCERY_OR_SUPERMARKET);
        zznzVar2.zza(PlaceTypes.GYM, Place.Type.GYM);
        zznzVar2.zza(PlaceTypes.HAIR_CARE, Place.Type.HAIR_CARE);
        zznzVar2.zza(PlaceTypes.HARDWARE_STORE, Place.Type.HARDWARE_STORE);
        zznzVar2.zza(PlaceTypes.HEALTH, Place.Type.HEALTH);
        zznzVar2.zza(PlaceTypes.HINDU_TEMPLE, Place.Type.HINDU_TEMPLE);
        zznzVar2.zza(PlaceTypes.HOME_GOODS_STORE, Place.Type.HOME_GOODS_STORE);
        zznzVar2.zza(PlaceTypes.HOSPITAL, Place.Type.HOSPITAL);
        zznzVar2.zza(PlaceTypes.INSURANCE_AGENCY, Place.Type.INSURANCE_AGENCY);
        zznzVar2.zza(PlaceTypes.INTERSECTION, Place.Type.INTERSECTION);
        zznzVar2.zza(PlaceTypes.JEWELRY_STORE, Place.Type.JEWELRY_STORE);
        zznzVar2.zza(PlaceTypes.LAUNDRY, Place.Type.LAUNDRY);
        zznzVar2.zza(PlaceTypes.LAWYER, Place.Type.LAWYER);
        zznzVar2.zza(PlaceTypes.LIBRARY, Place.Type.LIBRARY);
        zznzVar2.zza(PlaceTypes.LIGHT_RAIL_STATION, Place.Type.LIGHT_RAIL_STATION);
        zznzVar2.zza(PlaceTypes.LIQUOR_STORE, Place.Type.LIQUOR_STORE);
        zznzVar2.zza(PlaceTypes.LOCAL_GOVERNMENT_OFFICE, Place.Type.LOCAL_GOVERNMENT_OFFICE);
        zznzVar2.zza(PlaceTypes.LOCALITY, Place.Type.LOCALITY);
        zznzVar2.zza(PlaceTypes.LOCKSMITH, Place.Type.LOCKSMITH);
        zznzVar2.zza(PlaceTypes.LODGING, Place.Type.LODGING);
        zznzVar2.zza(PlaceTypes.MEAL_DELIVERY, Place.Type.MEAL_DELIVERY);
        zznzVar2.zza(PlaceTypes.MEAL_TAKEAWAY, Place.Type.MEAL_TAKEAWAY);
        zznzVar2.zza(PlaceTypes.MOSQUE, Place.Type.MOSQUE);
        zznzVar2.zza(PlaceTypes.MOVIE_RENTAL, Place.Type.MOVIE_RENTAL);
        zznzVar2.zza(PlaceTypes.MOVIE_THEATER, Place.Type.MOVIE_THEATER);
        zznzVar2.zza(PlaceTypes.MOVING_COMPANY, Place.Type.MOVING_COMPANY);
        zznzVar2.zza(PlaceTypes.MUSEUM, Place.Type.MUSEUM);
        zznzVar2.zza(PlaceTypes.NATURAL_FEATURE, Place.Type.NATURAL_FEATURE);
        zznzVar2.zza(PlaceTypes.NEIGHBORHOOD, Place.Type.NEIGHBORHOOD);
        zznzVar2.zza(PlaceTypes.NIGHT_CLUB, Place.Type.NIGHT_CLUB);
        zznzVar2.zza(PlaceTypes.PAINTER, Place.Type.PAINTER);
        zznzVar2.zza(PlaceTypes.PARK, Place.Type.PARK);
        zznzVar2.zza(PlaceTypes.PARKING, Place.Type.PARKING);
        zznzVar2.zza(PlaceTypes.PET_STORE, Place.Type.PET_STORE);
        zznzVar2.zza(PlaceTypes.PHARMACY, Place.Type.PHARMACY);
        zznzVar2.zza(PlaceTypes.PHYSIOTHERAPIST, Place.Type.PHYSIOTHERAPIST);
        zznzVar2.zza(PlaceTypes.PLACE_OF_WORSHIP, Place.Type.PLACE_OF_WORSHIP);
        zznzVar2.zza(PlaceTypes.PLUMBER, Place.Type.PLUMBER);
        zznzVar2.zza(PlaceTypes.PLUS_CODE, Place.Type.PLUS_CODE);
        zznzVar2.zza(PlaceTypes.POINT_OF_INTEREST, Place.Type.POINT_OF_INTEREST);
        zznzVar2.zza(PlaceTypes.POLICE, Place.Type.POLICE);
        zznzVar2.zza(PlaceTypes.POLITICAL, Place.Type.POLITICAL);
        zznzVar2.zza(PlaceTypes.POST_BOX, Place.Type.POST_BOX);
        zznzVar2.zza(PlaceTypes.POST_OFFICE, Place.Type.POST_OFFICE);
        zznzVar2.zza(PlaceTypes.POSTAL_CODE_PREFIX, Place.Type.POSTAL_CODE_PREFIX);
        zznzVar2.zza(PlaceTypes.POSTAL_CODE_SUFFIX, Place.Type.POSTAL_CODE_SUFFIX);
        zznzVar2.zza(PlaceTypes.POSTAL_CODE, Place.Type.POSTAL_CODE);
        zznzVar2.zza(PlaceTypes.POSTAL_TOWN, Place.Type.POSTAL_TOWN);
        zznzVar2.zza(PlaceTypes.PREMISE, Place.Type.PREMISE);
        zznzVar2.zza(PlaceTypes.PRIMARY_SCHOOL, Place.Type.PRIMARY_SCHOOL);
        zznzVar2.zza(PlaceTypes.REAL_ESTATE_AGENCY, Place.Type.REAL_ESTATE_AGENCY);
        zznzVar2.zza(PlaceTypes.RESTAURANT, Place.Type.RESTAURANT);
        zznzVar2.zza(PlaceTypes.ROOFING_CONTRACTOR, Place.Type.ROOFING_CONTRACTOR);
        zznzVar2.zza(PlaceTypes.ROOM, Place.Type.ROOM);
        zznzVar2.zza(PlaceTypes.ROUTE, Place.Type.ROUTE);
        zznzVar2.zza(PlaceTypes.RV_PARK, Place.Type.RV_PARK);
        zznzVar2.zza(PlaceTypes.SCHOOL, Place.Type.SCHOOL);
        zznzVar2.zza(PlaceTypes.SECONDARY_SCHOOL, Place.Type.SECONDARY_SCHOOL);
        zznzVar2.zza(PlaceTypes.SHOE_STORE, Place.Type.SHOE_STORE);
        zznzVar2.zza(PlaceTypes.SHOPPING_MALL, Place.Type.SHOPPING_MALL);
        zznzVar2.zza(PlaceTypes.SPA, Place.Type.SPA);
        zznzVar2.zza(PlaceTypes.STADIUM, Place.Type.STADIUM);
        zznzVar2.zza(PlaceTypes.STORAGE, Place.Type.STORAGE);
        zznzVar2.zza("store", Place.Type.STORE);
        zznzVar2.zza(PlaceTypes.STREET_ADDRESS, Place.Type.STREET_ADDRESS);
        zznzVar2.zza(PlaceTypes.STREET_NUMBER, Place.Type.STREET_NUMBER);
        zznzVar2.zza(PlaceTypes.SUBLOCALITY_LEVEL_1, Place.Type.SUBLOCALITY_LEVEL_1);
        zznzVar2.zza(PlaceTypes.SUBLOCALITY_LEVEL_2, Place.Type.SUBLOCALITY_LEVEL_2);
        zznzVar2.zza(PlaceTypes.SUBLOCALITY_LEVEL_3, Place.Type.SUBLOCALITY_LEVEL_3);
        zznzVar2.zza(PlaceTypes.SUBLOCALITY_LEVEL_4, Place.Type.SUBLOCALITY_LEVEL_4);
        zznzVar2.zza(PlaceTypes.SUBLOCALITY_LEVEL_5, Place.Type.SUBLOCALITY_LEVEL_5);
        zznzVar2.zza(PlaceTypes.SUBLOCALITY, Place.Type.SUBLOCALITY);
        zznzVar2.zza(PlaceTypes.SUBPREMISE, Place.Type.SUBPREMISE);
        zznzVar2.zza(PlaceTypes.SUBWAY_STATION, Place.Type.SUBWAY_STATION);
        zznzVar2.zza(PlaceTypes.SUPERMARKET, Place.Type.SUPERMARKET);
        zznzVar2.zza(PlaceTypes.SYNAGOGUE, Place.Type.SYNAGOGUE);
        zznzVar2.zza(PlaceTypes.TAXI_STAND, Place.Type.TAXI_STAND);
        zznzVar2.zza(PlaceTypes.TOURIST_ATTRACTION, Place.Type.TOURIST_ATTRACTION);
        zznzVar2.zza(PlaceTypes.TOWN_SQUARE, Place.Type.TOWN_SQUARE);
        zznzVar2.zza(PlaceTypes.TRAIN_STATION, Place.Type.TRAIN_STATION);
        zznzVar2.zza(PlaceTypes.TRANSIT_STATION, Place.Type.TRANSIT_STATION);
        zznzVar2.zza(PlaceTypes.TRAVEL_AGENCY, Place.Type.TRAVEL_AGENCY);
        zznzVar2.zza(PlaceTypes.UNIVERSITY, Place.Type.UNIVERSITY);
        zznzVar2.zza(PlaceTypes.VETERINARY_CARE, Place.Type.VETERINARY_CARE);
        zznzVar2.zza(PlaceTypes.ZOO, Place.Type.ZOO);
        zzb = zznzVar2.zzc();
        zznz zznzVar3 = new zznz();
        zznzVar3.zza("ACCESS", OpeningHours.HoursType.ACCESS);
        zznzVar3.zza("BREAKFAST", OpeningHours.HoursType.BREAKFAST);
        zznzVar3.zza("BRUNCH", OpeningHours.HoursType.BRUNCH);
        zznzVar3.zza("DELIVERY", OpeningHours.HoursType.DELIVERY);
        zznzVar3.zza("DINNER", OpeningHours.HoursType.DINNER);
        zznzVar3.zza("DRIVE_THROUGH", OpeningHours.HoursType.DRIVE_THROUGH);
        zznzVar3.zza("HAPPY_HOUR", OpeningHours.HoursType.HAPPY_HOUR);
        zznzVar3.zza("KITCHEN", OpeningHours.HoursType.KITCHEN);
        zznzVar3.zza("LUNCH", OpeningHours.HoursType.LUNCH);
        zznzVar3.zza("ONLINE_SERVICE_HOURS", OpeningHours.HoursType.ONLINE_SERVICE_HOURS);
        zznzVar3.zza("PICKUP", OpeningHours.HoursType.PICKUP);
        zznzVar3.zza("SENIOR_HOURS", OpeningHours.HoursType.SENIOR_HOURS);
        zznzVar3.zza("TAKEOUT", OpeningHours.HoursType.TAKEOUT);
        zzc = zznzVar3.zzc();
    }

    public static LocalDate zza(String str) {
        if (str == null) {
            return null;
        }
        try {
            return LocalDate.newInstance(Integer.parseInt(str.substring(0, 4)), Integer.parseInt(str.substring(5, 7)), Integer.parseInt(str.substring(8, 10)));
        } catch (IllegalArgumentException e3) {
            throw new IllegalArgumentException(c0.l("Unable to convert ", str, " to LocalDate; date should be in format YYYY-MM-DD."), e3);
        }
    }

    public static Place.BooleanPlaceAttributeValue zzb(Boolean bool) {
        return bool == null ? Place.BooleanPlaceAttributeValue.UNKNOWN : bool.booleanValue() ? Place.BooleanPlaceAttributeValue.TRUE : Place.BooleanPlaceAttributeValue.FALSE;
    }

    public static TimeOfWeek zzc(zzja.zzd.zzc zzcVar) {
        DayOfWeek dayOfWeek;
        LocalDate localDateZza = null;
        if (zzcVar == null) {
            return null;
        }
        try {
            Integer numZzb = zzcVar.zzb();
            zzmt.zzc(numZzb, "Unable to convert Pablo response to TimeOfWeek: The \"day\" field is missing.");
            String strZzd = zzcVar.zzd();
            zzmt.zzc(strZzd, "Unable to convert Pablo response to TimeOfWeek: The \"time\" field is missing.");
            String str = "Unable to convert " + strZzd + " to LocalTime, must be of format \"hhmm\".";
            zzmt.zzf(strZzd.length() == 4, str);
            try {
                LocalTime localTimeNewInstance = LocalTime.newInstance(Integer.parseInt(strZzd.substring(0, 2)), Integer.parseInt(strZzd.substring(2, 4)));
                try {
                    localDateZza = zza(zzcVar.zzc());
                } catch (IllegalArgumentException unused) {
                }
                switch (numZzb.intValue()) {
                    case 0:
                        dayOfWeek = DayOfWeek.SUNDAY;
                        break;
                    case 1:
                        dayOfWeek = DayOfWeek.MONDAY;
                        break;
                    case 2:
                        dayOfWeek = DayOfWeek.TUESDAY;
                        break;
                    case 3:
                        dayOfWeek = DayOfWeek.WEDNESDAY;
                        break;
                    case 4:
                        dayOfWeek = DayOfWeek.THURSDAY;
                        break;
                    case 5:
                        dayOfWeek = DayOfWeek.FRIDAY;
                        break;
                    case 6:
                        dayOfWeek = DayOfWeek.SATURDAY;
                        break;
                    default:
                        throw new IllegalArgumentException("pabloDayOfWeek can only be an integer between 0 and 6");
                }
                TimeOfWeek.Builder builder = TimeOfWeek.builder(dayOfWeek, localTimeNewInstance);
                builder.setDate(localDateZza);
                builder.setTruncated(Boolean.TRUE.equals(zzcVar.zza()));
                return builder.build();
            } catch (NumberFormatException e3) {
                throw new IllegalArgumentException(str, e3);
            }
        } catch (NullPointerException e11) {
            throw new IllegalArgumentException(e11.getMessage(), e11);
        }
    }

    public static List zzd(List list) {
        return list != null ? list : new ArrayList();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Deprecated
    public static List zze(List list) {
        if (list.isEmpty()) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        boolean z11 = false;
        zzoy zzoyVarListIterator = ((zznx) list).listIterator(0);
        while (zzoyVarListIterator.hasNext()) {
            String str = (String) zzoyVarListIterator.next();
            zzoa zzoaVar = zzb;
            if (zzoaVar.containsKey(str)) {
                arrayList.add((Place.Type) zzoaVar.get(str));
            } else {
                z11 = true;
            }
        }
        if (z11) {
            arrayList.add(Place.Type.OTHER);
        }
        return arrayList;
    }

    public static List zzf(List list) {
        if (list.isEmpty()) {
            return null;
        }
        return list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x010c  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x010e  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x011b  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0157  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x01c9  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x01de  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x01e0  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x021c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Place zzg(zzja zzjaVar, List list) throws ApiException {
        AddressComponents addressComponentsNewInstance;
        AddressComponent addressComponentBuild;
        LatLng latLngZzi;
        LatLngBounds latLngBounds;
        Integer numValueOf;
        zznx zznxVarZzg;
        ArrayList arrayList;
        zzja.zzf zzfVarZze;
        PlusCode plusCodeBuild;
        zznx zznxVarZzh;
        PhotoMetadata photoMetadataBuild;
        Place.Builder builder = Place.builder();
        builder.setAttributions(list);
        if (zzjaVar != null) {
            zznx zznxVarZzf = zzjaVar.zzf();
            ArrayList arrayList2 = null;
            if (zznxVarZzf.isEmpty()) {
                addressComponentsNewInstance = null;
            } else {
                ArrayList arrayList3 = new ArrayList();
                zzoy zzoyVarListIterator = zznxVarZzf.listIterator(0);
                while (zzoyVarListIterator.hasNext()) {
                    zzja.zza zzaVar = (zzja.zza) zzoyVarListIterator.next();
                    if (zzaVar == null) {
                        addressComponentBuild = null;
                    } else {
                        try {
                            String strZzb = zzaVar.zzb();
                            if (strZzb == null) {
                                throw null;
                            }
                            AddressComponent.Builder builder2 = AddressComponent.builder(strZzb, zzaVar.zza());
                            builder2.setShortName(zzaVar.zzc());
                            addressComponentBuild = builder2.build();
                        } catch (IllegalStateException | NullPointerException e3) {
                            throw zzh(c0.l("AddressComponent not properly defined (", e3.getMessage(), ")."));
                        }
                    }
                    zzk(arrayList3, addressComponentBuild);
                }
                addressComponentsNewInstance = AddressComponents.newInstance(arrayList3);
            }
            zzja.zzc zzcVarZzb = zzjaVar.zzb();
            if (zzcVarZzb != null) {
                latLngZzi = zzi(zzcVarZzb.zza());
                zzja.zzc.zzb zzbVarZzb = zzcVarZzb.zzb();
                if (zzbVarZzb == null) {
                    latLngBounds = null;
                } else {
                    LatLng latLngZzi2 = zzi(zzbVarZzb.zzb());
                    LatLng latLngZzi3 = zzi(zzbVarZzb.zza());
                    if (latLngZzi2 != null && latLngZzi3 != null) {
                        latLngBounds = new LatLngBounds(latLngZzi2, latLngZzi3);
                    }
                }
            } else {
                latLngZzi = null;
                latLngBounds = null;
            }
            String strZzG = zzjaVar.zzG();
            Uri uri = strZzG != null ? Uri.parse(strZzG) : null;
            String strZzC = zzjaVar.zzC();
            String strConcat = strZzC != null ? strZzC.concat(".png") : null;
            String strZzB = zzjaVar.zzB();
            if (strZzB != null) {
                try {
                    numValueOf = Integer.valueOf(Color.parseColor(strZzB));
                } catch (IllegalArgumentException unused) {
                }
                builder.setAddress(zzjaVar.zzA());
                builder.setAddressComponents(addressComponentsNewInstance);
                builder.setBusinessStatus((Place.BusinessStatus) zza.getOrDefault(zzjaVar.zzz(), null));
                builder.setCurbsidePickup(zzb(zzjaVar.zzj()));
                builder.setCurrentOpeningHours(zzj(zzjaVar.zzc()));
                builder.setDelivery(zzb(zzjaVar.zzk()));
                builder.setDineIn(zzb(zzjaVar.zzl()));
                zzja.zzb zzbVarZza = zzjaVar.zza();
                builder.setEditorialSummary(zzbVarZza != null ? null : zzbVarZza.zzb());
                zzja.zzb zzbVarZza2 = zzjaVar.zza();
                builder.setEditorialSummaryLanguageCode(zzbVarZza2 != null ? null : zzbVarZza2.zza());
                builder.setIconBackgroundColor(numValueOf);
                builder.setIconUrl(strConcat);
                builder.setId(zzjaVar.zzF());
                builder.setLatLng(latLngZzi);
                builder.setName(zzjaVar.zzE());
                builder.setOpeningHours(zzj(zzjaVar.zzd()));
                builder.setPhoneNumber(zzjaVar.zzD());
                zznxVarZzg = zzjaVar.zzg();
                if (zznxVarZzg.isEmpty()) {
                    arrayList = new ArrayList();
                    zzoy zzoyVarListIterator2 = zznxVarZzg.listIterator(0);
                    while (zzoyVarListIterator2.hasNext()) {
                        zzja.zze zzeVar = (zzja.zze) zzoyVarListIterator2.next();
                        if (zzeVar == null) {
                            photoMetadataBuild = null;
                        } else {
                            String strZzd = zzeVar.zzd();
                            if (TextUtils.isEmpty(strZzd)) {
                                throw zzh("Photo reference not provided for a PhotoMetadata result.");
                            }
                            Integer numZzb = zzeVar.zzb();
                            Integer numZzc = zzeVar.zzc();
                            PhotoMetadata.Builder builder3 = PhotoMetadata.builder(strZzd);
                            zznx zznxVarZza = zzeVar.zza();
                            builder3.setAttributions(zznxVarZza.isEmpty() ? b.f42142b : zzmh.zzc(", ").zzd().zzf(zznxVarZza));
                            builder3.setHeight(numZzb == null ? 0 : numZzb.intValue());
                            builder3.setWidth(numZzc == null ? 0 : numZzc.intValue());
                            photoMetadataBuild = builder3.build();
                        }
                        zzk(arrayList, photoMetadataBuild);
                    }
                } else {
                    arrayList = null;
                }
                builder.setPhotoMetadatas(arrayList);
                builder.setPlaceTypes(zzf(zzjaVar.zzi()));
                zzfVarZze = zzjaVar.zze();
                if (zzfVarZze != null) {
                    plusCodeBuild = null;
                } else {
                    PlusCode.Builder builder4 = PlusCode.builder();
                    builder4.setCompoundCode(zzfVarZze.zza());
                    builder4.setGlobalCode(zzfVarZze.zzb());
                    plusCodeBuild = builder4.build();
                }
                builder.setPlusCode(plusCodeBuild);
                builder.setPriceLevel(zzjaVar.zzw());
                builder.setRating(zzjaVar.zzv());
                builder.setReservable(zzb(zzjaVar.zzm()));
                zznxVarZzh = zzjaVar.zzh();
                if (!zznxVarZzh.isEmpty()) {
                    ArrayList arrayList4 = new ArrayList();
                    zzoy zzoyVarListIterator3 = zznxVarZzh.listIterator(0);
                    while (zzoyVarListIterator3.hasNext()) {
                        zzk(arrayList4, zzj((zzja.zzd) zzoyVarListIterator3.next()));
                    }
                    if (!arrayList4.isEmpty()) {
                        arrayList2 = arrayList4;
                    }
                }
                builder.setSecondaryOpeningHours(arrayList2);
                builder.setServesBeer(zzb(zzjaVar.zzn()));
                builder.setServesBreakfast(zzb(zzjaVar.zzo()));
                builder.setServesBrunch(zzb(zzjaVar.zzo()));
                builder.setServesDinner(zzb(zzjaVar.zzp()));
                builder.setServesLunch(zzb(zzjaVar.zzq()));
                builder.setServesVegetarianFood(zzb(zzjaVar.zzr()));
                builder.setServesWine(zzb(zzjaVar.zzs()));
                builder.setTakeout(zzb(zzjaVar.zzt()));
                builder.setTypes(zze(zzjaVar.zzi()));
                builder.setUserRatingsTotal(zzjaVar.zzx());
                builder.setUtcOffsetMinutes(zzjaVar.zzy());
                builder.setViewport(latLngBounds);
                builder.setWebsiteUri(uri);
                builder.setWheelchairAccessibleEntrance(zzb(zzjaVar.zzu()));
            } else {
                numValueOf = null;
                builder.setAddress(zzjaVar.zzA());
                builder.setAddressComponents(addressComponentsNewInstance);
                builder.setBusinessStatus((Place.BusinessStatus) zza.getOrDefault(zzjaVar.zzz(), null));
                builder.setCurbsidePickup(zzb(zzjaVar.zzj()));
                builder.setCurrentOpeningHours(zzj(zzjaVar.zzc()));
                builder.setDelivery(zzb(zzjaVar.zzk()));
                builder.setDineIn(zzb(zzjaVar.zzl()));
                zzja.zzb zzbVarZza3 = zzjaVar.zza();
                builder.setEditorialSummary(zzbVarZza3 != null ? null : zzbVarZza3.zzb());
                zzja.zzb zzbVarZza22 = zzjaVar.zza();
                builder.setEditorialSummaryLanguageCode(zzbVarZza22 != null ? null : zzbVarZza22.zza());
                builder.setIconBackgroundColor(numValueOf);
                builder.setIconUrl(strConcat);
                builder.setId(zzjaVar.zzF());
                builder.setLatLng(latLngZzi);
                builder.setName(zzjaVar.zzE());
                builder.setOpeningHours(zzj(zzjaVar.zzd()));
                builder.setPhoneNumber(zzjaVar.zzD());
                zznxVarZzg = zzjaVar.zzg();
                if (zznxVarZzg.isEmpty()) {
                }
                builder.setPhotoMetadatas(arrayList);
                builder.setPlaceTypes(zzf(zzjaVar.zzi()));
                zzfVarZze = zzjaVar.zze();
                if (zzfVarZze != null) {
                }
                builder.setPlusCode(plusCodeBuild);
                builder.setPriceLevel(zzjaVar.zzw());
                builder.setRating(zzjaVar.zzv());
                builder.setReservable(zzb(zzjaVar.zzm()));
                zznxVarZzh = zzjaVar.zzh();
                if (!zznxVarZzh.isEmpty()) {
                }
                builder.setSecondaryOpeningHours(arrayList2);
                builder.setServesBeer(zzb(zzjaVar.zzn()));
                builder.setServesBreakfast(zzb(zzjaVar.zzo()));
                builder.setServesBrunch(zzb(zzjaVar.zzo()));
                builder.setServesDinner(zzb(zzjaVar.zzp()));
                builder.setServesLunch(zzb(zzjaVar.zzq()));
                builder.setServesVegetarianFood(zzb(zzjaVar.zzr()));
                builder.setServesWine(zzb(zzjaVar.zzs()));
                builder.setTakeout(zzb(zzjaVar.zzt()));
                builder.setTypes(zze(zzjaVar.zzi()));
                builder.setUserRatingsTotal(zzjaVar.zzx());
                builder.setUtcOffsetMinutes(zzjaVar.zzy());
                builder.setViewport(latLngBounds);
                builder.setWebsiteUri(uri);
                builder.setWheelchairAccessibleEntrance(zzb(zzjaVar.zzu()));
            }
        }
        return builder.build();
    }

    private static ApiException zzh(String str) {
        return new ApiException(new Status(8, "Unexpected server error: ".concat(String.valueOf(str)), null, null));
    }

    private static LatLng zzi(zzja.zzc.zza zzaVar) {
        if (zzaVar == null) {
            return null;
        }
        Double dZza = zzaVar.zza();
        Double dZzb = zzaVar.zzb();
        if (dZza == null || dZzb == null) {
            return null;
        }
        return new LatLng(dZza.doubleValue(), dZzb.doubleValue());
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static OpeningHours zzj(zzja.zzd zzdVar) {
        ArrayList arrayList;
        SpecialDay specialDayBuild;
        Period periodBuild;
        if (zzdVar == null) {
            return null;
        }
        OpeningHours.Builder builder = OpeningHours.builder();
        zznx zznxVarZza = zzdVar.zza();
        if (zznxVarZza.isEmpty()) {
            arrayList = null;
        } else {
            arrayList = new ArrayList();
            zzoy zzoyVarListIterator = zznxVarZza.listIterator(0);
            while (zzoyVarListIterator.hasNext()) {
                zzja.zzd.zza zzaVar = (zzja.zzd.zza) zzoyVarListIterator.next();
                if (zzaVar != null) {
                    Period.Builder builder2 = Period.builder();
                    builder2.setOpen(zzc(zzaVar.zzb()));
                    builder2.setClose(zzc(zzaVar.zza()));
                    periodBuild = builder2.build();
                } else {
                    periodBuild = null;
                }
                zzk(arrayList, periodBuild);
            }
        }
        builder.setPeriods(zzd(arrayList));
        builder.setWeekdayText(zzdVar.zzc());
        builder.setHoursType((OpeningHours.HoursType) zzc.getOrDefault(zzdVar.zzd(), null));
        zznx zznxVarZzb = zzdVar.zzb();
        ArrayList arrayList2 = new ArrayList();
        if (!zznxVarZzb.isEmpty()) {
            zzoy zzoyVarListIterator2 = zznxVarZzb.listIterator(0);
            while (zzoyVarListIterator2.hasNext()) {
                zzja.zzd.zzb zzbVar = (zzja.zzd.zzb) zzoyVarListIterator2.next();
                if (zzbVar == null) {
                    specialDayBuild = null;
                } else {
                    try {
                        LocalDate localDateZza = zza(zzbVar.zzb());
                        if (localDateZza == null) {
                            throw null;
                        }
                        SpecialDay.Builder builder3 = SpecialDay.builder(localDateZza);
                        builder3.setExceptional(Boolean.TRUE.equals(zzbVar.zza()));
                        specialDayBuild = builder3.build();
                    } catch (IllegalArgumentException | NullPointerException unused) {
                    }
                }
                zzk(arrayList2, specialDayBuild);
            }
        }
        builder.setSpecialDays(arrayList2);
        return builder.build();
    }

    private static boolean zzk(Collection collection, Object obj) {
        if (obj != null) {
            return collection.add(obj);
        }
        return false;
    }
}
