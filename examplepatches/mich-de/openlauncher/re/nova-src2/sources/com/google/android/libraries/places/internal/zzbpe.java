package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbpe implements Runnable {
    final /* synthetic */ zzbcf zza;
    final /* synthetic */ zzbpl zzb;

    public zzbpe(zzbpl zzbplVar, zzbcf zzbcfVar) {
        this.zza = zzbcfVar;
        this.zzb = zzbplVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zzb.zzy.zze(this.zza);
    }
}
