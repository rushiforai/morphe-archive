package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbhj implements Runnable {
    final /* synthetic */ zzazc zza;
    final /* synthetic */ zzbhy zzb;

    public zzbhj(zzbhy zzbhyVar, zzazc zzazcVar) {
        this.zza = zzazcVar;
        this.zzb = zzbhyVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zzc.zzv(this.zza);
    }
}
