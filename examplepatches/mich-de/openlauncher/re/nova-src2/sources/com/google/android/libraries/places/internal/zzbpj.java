package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbpj implements Runnable {
    final /* synthetic */ zzbqq zza;
    final /* synthetic */ zzbpl zzb;

    public zzbpj(zzbpl zzbplVar, zzbqq zzbqqVar) {
        this.zza = zzbqqVar;
        this.zzb = zzbplVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zzb.zzy.zzf(this.zza);
    }
}
