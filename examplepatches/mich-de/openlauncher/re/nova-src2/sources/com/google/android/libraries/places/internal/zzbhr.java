package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbhr implements Runnable {
    final /* synthetic */ zzbdo zza;
    final /* synthetic */ zzbhy zzb;

    public zzbhr(zzbhy zzbhyVar, zzbdo zzbdoVar) {
        this.zza = zzbdoVar;
        this.zzb = zzbhyVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zzc.zzh(this.zza);
    }
}
