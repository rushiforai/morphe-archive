package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbpk implements Runnable {
    final /* synthetic */ zzbpl zza;

    public zzbpk(zzbpl zzbplVar) {
        this.zza = zzbplVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzbpo zzbpoVar = this.zza.zzb;
        if (zzbpoVar.zzD) {
            return;
        }
        zzbpoVar.zzy.zzg();
    }
}
