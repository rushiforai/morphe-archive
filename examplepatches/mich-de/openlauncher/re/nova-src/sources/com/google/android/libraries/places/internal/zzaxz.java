package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzaxz implements zzaxy {
    private static final Object zza = new Object();
    private volatile zzaxy zzb;
    private volatile Object zzc = zza;

    private zzaxz(zzaxy zzaxyVar) {
        this.zzb = zzaxyVar;
    }

    public static zzaxy zza(zzaxy zzaxyVar) {
        return new zzaxz(zzaxyVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbvt
    public final Object zzb() {
        Object obj = this.zzc;
        if (obj != zza) {
            return obj;
        }
        if (this.zzb == null) {
            return this.zzc;
        }
        zzdy zzdyVar = new zzdy();
        this.zzc = zzdyVar;
        this.zzb = null;
        return zzdyVar;
    }
}
