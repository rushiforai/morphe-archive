package com.google.android.libraries.places.internal;

import java.util.Collection;
import java.util.concurrent.Future;

/* loaded from: classes3.dex */
final class zzboh implements Runnable {
    final /* synthetic */ Collection zza;
    final /* synthetic */ zzbpm zzb;
    final /* synthetic */ Future zzc;
    final /* synthetic */ boolean zzd;
    final /* synthetic */ Future zze;
    final /* synthetic */ zzbpo zzf;

    public zzboh(zzbpo zzbpoVar, Collection collection, zzbpm zzbpmVar, Future future, boolean z11, Future future2) {
        this.zza = collection;
        this.zzb = zzbpmVar;
        this.zzc = future;
        this.zzd = z11;
        this.zze = future2;
        this.zzf = zzbpoVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        for (zzbpm zzbpmVar : this.zza) {
            if (zzbpmVar != this.zzb) {
                zzbpmVar.zza.zzh(zzbpo.zza);
            }
        }
        Future future = this.zzc;
        if (future != null) {
            future.cancel(false);
            if (!this.zzd && this.zzf.zzv.decrementAndGet() == Integer.MIN_VALUE) {
                zzbdw zzbdwVar = (zzbdw) this.zzf.zze;
                zzbdwVar.zzc(new zzbog(this));
                zzbdwVar.zzb();
            }
        }
        Future future2 = this.zze;
        if (future2 != null) {
            future2.cancel(false);
        }
        this.zzf.zzc();
    }
}
