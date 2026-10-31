package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzbdq extends RuntimeException {
    private final zzbdo zza;
    private final zzbcf zzb;

    public zzbdq(zzbdo zzbdoVar, zzbcf zzbcfVar) {
        super(zzbdo.zzh(zzbdoVar), zzbdoVar.zzj(), true, true);
        this.zza = zzbdoVar;
        this.zzb = zzbcfVar;
    }

    public final zzbdo zza() {
        return this.zza;
    }
}
