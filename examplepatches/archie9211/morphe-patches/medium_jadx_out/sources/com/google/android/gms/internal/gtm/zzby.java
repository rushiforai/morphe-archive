package com.google.android.gms.internal.gtm;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
final class zzby implements Runnable {
    final /* synthetic */ zzca zza;
    final /* synthetic */ zzel zzb;

    public zzby(zzca zzcaVar, zzel zzelVar) {
        this.zzb = zzelVar;
        this.zza = zzcaVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.zza.zza.zzg()) {
            return;
        }
        this.zza.zza.zzE("Connected to service after a timeout");
        zzca zzcaVar = this.zza;
        zzcb.zzi(zzcaVar.zza, this.zzb);
    }
}
