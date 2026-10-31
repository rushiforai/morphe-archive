package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbph implements Runnable {
    final /* synthetic */ zzbpl zza;

    public zzbph(zzbpl zzbplVar) {
        this.zza = zzbplVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zza.zzb.zzD = true;
        zzbpo zzbpoVar = this.zza.zzb;
        zzbpoVar.zzy.zzd(zzbpoVar.zzw.zza, this.zza.zzb.zzw.zzb, this.zza.zzb.zzw.zzc);
    }
}
