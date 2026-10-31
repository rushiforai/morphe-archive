package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbhl implements Runnable {
    final /* synthetic */ int zza;
    final /* synthetic */ zzbhy zzb;

    public zzbhl(zzbhy zzbhyVar, int i5) {
        this.zza = i5;
        this.zzb = zzbhyVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zzc.zzm(this.zza);
    }
}
