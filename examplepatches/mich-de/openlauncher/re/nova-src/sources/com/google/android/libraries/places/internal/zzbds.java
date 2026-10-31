package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbds implements Runnable {
    final /* synthetic */ zzbdt zza;
    final /* synthetic */ Runnable zzb;
    final /* synthetic */ zzbdw zzc;

    public zzbds(zzbdw zzbdwVar, zzbdt zzbdtVar, Runnable runnable) {
        this.zza = zzbdtVar;
        this.zzb = runnable;
        this.zzc = zzbdwVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzbdw zzbdwVar = this.zzc;
        zzbdwVar.zzc(this.zza);
        zzbdwVar.zzb();
    }

    public final String toString() {
        return String.valueOf(this.zzb.toString()).concat("(scheduled in SynchronizationContext)");
    }
}
