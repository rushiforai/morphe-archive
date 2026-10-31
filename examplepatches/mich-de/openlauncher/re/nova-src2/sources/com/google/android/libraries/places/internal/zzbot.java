package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbot implements Runnable {
    final /* synthetic */ zzbpo zza;

    public zzbot(zzbpo zzbpoVar) {
        this.zza = zzbpoVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzbpo zzbpoVar = this.zza;
        if (zzbpoVar.zzD) {
            return;
        }
        zzbpoVar.zzy.zzg();
    }
}
