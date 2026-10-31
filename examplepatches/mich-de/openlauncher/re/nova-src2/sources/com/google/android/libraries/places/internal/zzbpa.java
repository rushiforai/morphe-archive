package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbpa implements Runnable {
    final zzboy zza;
    final /* synthetic */ zzbpo zzb;

    public zzbpa(zzbpo zzbpoVar, zzboy zzboyVar) {
        this.zzb = zzbpoVar;
        this.zza = zzboyVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzbpm zzbpmVarZzaf = this.zzb.zzaf(this.zzb.zzs.zze, false);
        if (zzbpmVarZzaf == null) {
            return;
        }
        this.zzb.zzd.execute(new zzboz(this, zzbpmVarZzaf));
    }
}
