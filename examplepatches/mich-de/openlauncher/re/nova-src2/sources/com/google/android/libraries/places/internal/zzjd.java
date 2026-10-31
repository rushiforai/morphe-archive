package com.google.android.libraries.places.internal;

import android.text.TextUtils;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzjd {
    private static final zzoa zza;

    static {
        zznz zznzVar = new zznz();
        zznzVar.zza(Place.Field.ADDRESS, "formatted_address");
        zznzVar.zza(Place.Field.ADDRESS_COMPONENTS, "address_components");
        zznzVar.zza(Place.Field.BUSINESS_STATUS, "business_status");
        zznzVar.zza(Place.Field.CURBSIDE_PICKUP, "curbside_pickup");
        zznzVar.zza(Place.Field.CURRENT_OPENING_HOURS, "current_opening_hours");
        zznzVar.zza(Place.Field.DELIVERY, "delivery");
        zznzVar.zza(Place.Field.DINE_IN, "dine_in");
        zznzVar.zza(Place.Field.EDITORIAL_SUMMARY, "editorial_summary");
        zznzVar.zza(Place.Field.ICON_BACKGROUND_COLOR, "icon_background_color");
        zznzVar.zza(Place.Field.ICON_URL, "icon_mask_base_uri");
        zznzVar.zza(Place.Field.ID, "place_id");
        zznzVar.zza(Place.Field.LAT_LNG, "geometry/location");
        zznzVar.zza(Place.Field.NAME, PendingUpgradeStore.KEY_NAME);
        zznzVar.zza(Place.Field.OPENING_HOURS, "opening_hours");
        zznzVar.zza(Place.Field.PHONE_NUMBER, "international_phone_number");
        zznzVar.zza(Place.Field.PHOTO_METADATAS, "photos");
        zznzVar.zza(Place.Field.PLUS_CODE, PlaceTypes.PLUS_CODE);
        zznzVar.zza(Place.Field.PRICE_LEVEL, "price_level");
        zznzVar.zza(Place.Field.RATING, "rating");
        zznzVar.zza(Place.Field.RESERVABLE, "reservable");
        zznzVar.zza(Place.Field.SECONDARY_OPENING_HOURS, "secondary_opening_hours");
        zznzVar.zza(Place.Field.SERVES_BEER, "serves_beer");
        zznzVar.zza(Place.Field.SERVES_BREAKFAST, "serves_breakfast");
        zznzVar.zza(Place.Field.SERVES_BRUNCH, "serves_brunch");
        zznzVar.zza(Place.Field.SERVES_DINNER, "serves_dinner");
        zznzVar.zza(Place.Field.SERVES_LUNCH, "serves_lunch");
        zznzVar.zza(Place.Field.SERVES_VEGETARIAN_FOOD, "serves_vegetarian_food");
        zznzVar.zza(Place.Field.SERVES_WINE, "serves_wine");
        zznzVar.zza(Place.Field.TAKEOUT, "takeout");
        zznzVar.zza(Place.Field.TYPES, "types");
        zznzVar.zza(Place.Field.USER_RATINGS_TOTAL, "user_ratings_total");
        zznzVar.zza(Place.Field.UTC_OFFSET, "utc_offset");
        zznzVar.zza(Place.Field.VIEWPORT, "geometry/viewport");
        zznzVar.zza(Place.Field.WEBSITE_URI, "website");
        zznzVar.zza(Place.Field.WHEELCHAIR_ACCESSIBLE_ENTRANCE, "wheelchair_accessible_entrance");
        zza = zznzVar.zzc();
    }

    public static String zza(List list) {
        StringBuilder sb2 = new StringBuilder();
        Iterator it = list.iterator();
        while (it.hasNext()) {
            String str = (String) zza.get((Place.Field) it.next());
            if (!TextUtils.isEmpty(str)) {
                if (sb2.length() > 0) {
                    sb2.append(",");
                }
                sb2.append(str);
            }
        }
        return sb2.toString();
    }

    public static List zzb(List list) {
        ArrayList arrayList = new ArrayList(list.size());
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
