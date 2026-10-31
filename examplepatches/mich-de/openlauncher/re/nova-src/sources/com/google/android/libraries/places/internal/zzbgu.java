package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbgu implements Runnable {
    final /* synthetic */ zzbcf zza;
    final /* synthetic */ zzbgy zzb;

    public zzbgu(zzbgy zzbgyVar, zzbcf zzbcfVar) {
        this.zza = zzbcfVar;
        this.zzb = zzbgyVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zza.zzb(this.zza);
    }
}
