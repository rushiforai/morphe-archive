package com.google.android.libraries.places.internal;

import com.google.android.libraries.places.api.net.FetchPlaceRequest;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/* loaded from: classes3.dex */
final class zzhx extends zzik {
    public zzhx(FetchPlaceRequest fetchPlaceRequest, Locale locale, String str, boolean z11, zzki zzkiVar) {
        super(fetchPlaceRequest, locale, str, false, zzkiVar);
    }

    @Override // com.google.android.libraries.places.internal.zzik
    public final String zze() {
        return "details/json";
    }

    @Override // com.google.android.libraries.places.internal.zzik
    public final Map zzf() {
        FetchPlaceRequest fetchPlaceRequest = (FetchPlaceRequest) zzb();
        HashMap map = new HashMap();
        zzik.zzg(map, "placeid", fetchPlaceRequest.getPlaceId(), null);
        zzik.zzg(map, "sessiontoken", fetchPlaceRequest.getSessionToken(), null);
        zzik.zzg(map, "fields", zzjd.zza(fetchPlaceRequest.getPlaceFields()), null);
        return map;
    }
}
