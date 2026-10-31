package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbhv implements Runnable {
    final /* synthetic */ zzbcf zza;
    final /* synthetic */ zzbhx zzb;

    public zzbhv(zzbhx zzbhxVar, zzbcf zzbcfVar) {
        this.zza = zzbcfVar;
        this.zzb = zzbhxVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zza.zze(this.zza);
    }
}
