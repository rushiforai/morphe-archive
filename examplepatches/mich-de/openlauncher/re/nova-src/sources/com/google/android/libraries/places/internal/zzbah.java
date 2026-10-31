package com.google.android.libraries.places.internal;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ConcurrentNavigableMap;
import java.util.concurrent.ConcurrentSkipListMap;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class zzbah {
    private static final Logger zza = Logger.getLogger(zzbah.class.getName());
    private static final zzbah zzb = new zzbah();
    private final ConcurrentNavigableMap zzc = new ConcurrentSkipListMap();
    private final ConcurrentNavigableMap zzd = new ConcurrentSkipListMap();
    private final ConcurrentMap zze = new ConcurrentHashMap();
    private final ConcurrentMap zzf = new ConcurrentHashMap();
    private final ConcurrentMap zzg = new ConcurrentHashMap();

    public static zzbah zza() {
        return zzb;
    }

    private static void zzi(Map map, zzbao zzbaoVar) {
    }

    private static void zzj(Map map, zzbao zzbaoVar) {
    }

    public final void zzc(zzbao zzbaoVar) {
        zzi(this.zzf, zzbaoVar);
    }

    public final void zzd(zzbao zzbaoVar) {
        zzi(this.zzd, zzbaoVar);
    }

    public final void zze(zzbao zzbaoVar) {
        zzi(this.zze, zzbaoVar);
    }

    public final void zzf(zzbao zzbaoVar) {
        zzj(this.zzf, zzbaoVar);
    }

    public final void zzg(zzbao zzbaoVar) {
        zzj(this.zzd, zzbaoVar);
    }

    public final void zzh(zzbao zzbaoVar) {
        zzj(this.zze, zzbaoVar);
    }
}
