package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbhn implements Runnable {
    final /* synthetic */ zzazn zza;
    final /* synthetic */ zzbhy zzb;

    public zzbhn(zzbhy zzbhyVar, zzazn zzaznVar) {
        this.zza = zzaznVar;
        this.zzb = zzbhyVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zzc.zzk(this.zza);
    }
}
