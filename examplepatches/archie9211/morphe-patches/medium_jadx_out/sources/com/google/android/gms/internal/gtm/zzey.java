package com.google.android.gms.internal.gtm;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
final class zzey implements zzcy {
    final /* synthetic */ Runnable zza;
    final /* synthetic */ zzfa zzb;

    public zzey(zzfa zzfaVar, Runnable runnable) {
        this.zza = runnable;
        this.zzb = zzfaVar;
    }

    @Override // com.google.android.gms.internal.gtm.zzcy
    public final void zza(Throwable th) {
        this.zzb.zzb.post(this.zza);
    }
}
