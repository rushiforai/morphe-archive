package com.google.android.libraries.places.internal;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/* loaded from: classes3.dex */
abstract class zzik extends zzfi {
    private final Locale zza;
    private final String zzb;
    private final zzki zzc;

    public zzik(zzjt zzjtVar, Locale locale, String str, boolean z11, zzki zzkiVar) {
        super(zzjtVar);
        this.zza = locale;
        this.zzb = str;
        this.zzc = zzkiVar;
    }

    public static void zzg(Map map, String str, Object obj, Object obj2) {
        String string = obj != null ? obj.toString() : null;
        if (TextUtils.isEmpty(string)) {
            return;
        }
        map.put(str, string);
    }

    @Override // com.google.android.libraries.places.internal.zzfi
    public final String zzc() {
        zziw zziwVar = new zziw(zze(), this.zzb);
        zziwVar.zza(this.zza);
        zziwVar.zzb(zzf());
        return zziwVar.zzc();
    }

    @Override // com.google.android.libraries.places.internal.zzfi
    public final Map zzd() {
        HashMap map = new HashMap();
        map.putAll(this.zzc.zza());
        map.put("X-Places-Android-Sdk", "3.5.0");
        return map;
    }

    public abstract String zze();

    public abstract Map zzf();
}
