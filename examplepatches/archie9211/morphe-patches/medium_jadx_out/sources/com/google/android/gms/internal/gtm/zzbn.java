package com.google.android.gms.internal.gtm;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
final class zzbn implements Runnable {
    final /* synthetic */ zzcy zza;
    final /* synthetic */ zzbp zzb;

    public zzbn(zzbp zzbpVar, zzcy zzcyVar) {
        this.zza = zzcyVar;
        this.zzb = zzbpVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zza.zzf(this.zza);
    }
}
