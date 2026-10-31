package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzjv {
    private static final zznx zza = zznx.zzo("accessibilityOptions", "addressComponents", "attributions", "businessStatus", "curbsidePickup", "currentOpeningHours", "delivery", "dineIn", "displayName", "editorialSummary", "formattedAddress", "iconBackgroundColor", "iconMaskBaseUri", "id", "internationalPhoneNumber", "location", "photos", "plusCode", "priceLevel", "primaryType", "primaryTypeDisplayName", "rating", "regularOpeningHours", "regularSecondaryOpeningHours", "reservable", "reviews", "servesBeer", "servesBreakfast", "servesBrunch", "servesDinner", "servesLunch", "servesVegetarianFood", "servesWine", "takeout", "types", "userRatingCount", "utcOffsetMinutes", "viewport", "websiteUri");

    public static String zza(List list) {
        ArrayList arrayList = new ArrayList(list);
        arrayList.add("attributions");
        return zzc(arrayList, true);
    }

    public static String zzb(List list) {
        ArrayList arrayList = new ArrayList(list);
        arrayList.add("attributions");
        return zzc(arrayList, false);
    }

    private static String zzc(List list, boolean z11) {
        if (list.isEmpty()) {
            return b.f42142b;
        }
        ArrayList arrayList = new ArrayList();
        Iterator it = list.iterator();
        while (it.hasNext()) {
            String strConcat = (String) it.next();
            if (z11) {
                strConcat = "places.".concat(String.valueOf(strConcat));
            }
            arrayList.add(strConcat);
        }
        return zzmh.zzc(",").zzf(arrayList);
    }
}
