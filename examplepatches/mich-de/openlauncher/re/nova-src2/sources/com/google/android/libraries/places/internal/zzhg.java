package com.google.android.libraries.places.internal;

import com.google.android.libraries.places.api.model.Place;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzhg {
    private static final zzoa zza;

    static {
        zznz zznzVar = new zznz();
        zznzVar.zza(Place.Field.ADDRESS, "formattedAddress");
        zznzVar.zza(Place.Field.ADDRESS_COMPONENTS, "addressComponents");
        zznzVar.zza(Place.Field.BUSINESS_STATUS, "businessStatus");
        zznzVar.zza(Place.Field.CURBSIDE_PICKUP, "curbsidePickup");
        zznzVar.zza(Place.Field.CURRENT_OPENING_HOURS, "currentOpeningHours");
        zznzVar.zza(Place.Field.DELIVERY, "delivery");
        zznzVar.zza(Place.Field.DINE_IN, "dineIn");
        zznzVar.zza(Place.Field.EDITORIAL_SUMMARY, "editorialSummary");
        zznzVar.zza(Place.Field.ICON_BACKGROUND_COLOR, "iconBackgroundColor");
        zznzVar.zza(Place.Field.ICON_URL, "iconMaskBaseUri");
        zznzVar.zza(Place.Field.ID, "id");
        zznzVar.zza(Place.Field.LAT_LNG, "location");
        zznzVar.zza(Place.Field.NAME, "displayName");
        zznzVar.zza(Place.Field.OPENING_HOURS, "regularOpeningHours");
        zznzVar.zza(Place.Field.PHONE_NUMBER, "internationalPhoneNumber");
        zznzVar.zza(Place.Field.PHOTO_METADATAS, "photos");
        zznzVar.zza(Place.Field.PLUS_CODE, "plusCode");
        zznzVar.zza(Place.Field.PRICE_LEVEL, "priceLevel");
        zznzVar.zza(Place.Field.PRIMARY_TYPE, "primaryType");
        zznzVar.zza(Place.Field.RATING, "rating");
        zznzVar.zza(Place.Field.RESERVABLE, "reservable");
        zznzVar.zza(Place.Field.REVIEWS, "reviews");
        zznzVar.zza(Place.Field.SECONDARY_OPENING_HOURS, "regularSecondaryOpeningHours");
        zznzVar.zza(Place.Field.SERVES_BEER, "servesBeer");
        zznzVar.zza(Place.Field.SERVES_BREAKFAST, "servesBreakfast");
        zznzVar.zza(Place.Field.SERVES_BRUNCH, "servesBrunch");
        zznzVar.zza(Place.Field.SERVES_DINNER, "servesDinner");
        zznzVar.zza(Place.Field.SERVES_LUNCH, "servesLunch");
        zznzVar.zza(Place.Field.SERVES_VEGETARIAN_FOOD, "servesVegetarianFood");
        zznzVar.zza(Place.Field.SERVES_WINE, "servesWine");
        zznzVar.zza(Place.Field.TAKEOUT, "takeout");
        zznzVar.zza(Place.Field.TYPES, "types");
        zznzVar.zza(Place.Field.USER_RATINGS_TOTAL, "userRatingCount");
        zznzVar.zza(Place.Field.UTC_OFFSET, "utcOffsetMinutes");
        zznzVar.zza(Place.Field.VIEWPORT, "viewport");
        zznzVar.zza(Place.Field.WEBSITE_URI, "websiteUri");
        zznzVar.zza(Place.Field.WHEELCHAIR_ACCESSIBLE_ENTRANCE, "accessibilityOptions");
        zza = zznzVar.zzc();
    }

    public static List zza(List list) {
        ArrayList arrayList = new ArrayList();
        Iterator it = list.iterator();
        while (it.hasNext()) {
            String str = (String) zza.get((Place.Field) it.next());
            if (str != null) {
                arrayList.add(str);
            }
        }
        return arrayList;
    }
}
