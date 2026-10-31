package com.google.android.libraries.places.internal;

import android.location.Location;
import com.google.android.libraries.places.api.net.FindCurrentPlaceRequest;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/* loaded from: classes3.dex */
final class zzif extends zzik {
    private final Location zza;
    private final zznx zzb;

    public zzif(FindCurrentPlaceRequest findCurrentPlaceRequest, Location location, zznx zznxVar, Locale locale, String str, boolean z11, zzki zzkiVar) {
        super(findCurrentPlaceRequest, locale, str, false, zzkiVar);
        this.zza = location;
        this.zzb = zznxVar;
    }

    @Override // com.google.android.libraries.places.internal.zzik
    public final String zze() {
        return "findplacefromuserlocation/json";
    }

    /* JADX WARN: Removed duplicated region for block: B:4:0x0028  */
    @Override // com.google.android.libraries.places.internal.zzik
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Map zzf() {
        Integer numValueOf;
        FindCurrentPlaceRequest findCurrentPlaceRequest = (FindCurrentPlaceRequest) zzb();
        HashMap map = new HashMap();
        zzik.zzg(map, "location", zzjc.zza(this.zza), null);
        zzik.zzg(map, "wifiaccesspoints", zzjc.zze(this.zzb, 4000), null);
        Location location = this.zza;
        if (location == null) {
            numValueOf = null;
        } else {
            float accuracy = location.getAccuracy();
            if (location.hasAccuracy() && accuracy > 0.0f) {
                numValueOf = Integer.valueOf(Math.round(accuracy * 100.0f));
            }
        }
        zzik.zzg(map, "precision", numValueOf, null);
        zzik.zzg(map, "timestamp", Long.valueOf(this.zza.getTime()), null);
        zzik.zzg(map, "fields", zzjd.zza(findCurrentPlaceRequest.getPlaceFields()), null);
        return map;
    }
}
