package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbpg implements Runnable {
    final /* synthetic */ zzboy zza;
    final /* synthetic */ zzbpm zzb;
    final /* synthetic */ zzbpl zzc;

    public zzbpg(zzbpl zzbplVar, zzboy zzboyVar, zzbpm zzbpmVar) {
        this.zza = zzboyVar;
        this.zzb = zzbpmVar;
        this.zzc = zzbplVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        synchronized (this.zza.zza) {
            zzboy zzboyVar = this.zza;
            if (zzboyVar.zzc) {
                return;
            }
            zzboyVar.zza();
            this.zzc.zzb.zzd.execute(new zzbpf(this));
        }
    }
}
