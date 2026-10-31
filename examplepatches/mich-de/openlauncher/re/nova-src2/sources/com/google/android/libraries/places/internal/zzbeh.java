package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbeh implements Runnable {
    final /* synthetic */ zzbvq zza;
    final /* synthetic */ zzbei zzb;

    public zzbeh(zzbei zzbeiVar, zzbvq zzbvqVar, int i5) {
        this.zza = zzbvqVar;
        this.zzb = zzbeiVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            int i5 = zzbvr.zza;
            this.zzb.zzr.zzc(2);
        } catch (Throwable th2) {
            this.zzb.zzF(th2);
        }
    }
}
