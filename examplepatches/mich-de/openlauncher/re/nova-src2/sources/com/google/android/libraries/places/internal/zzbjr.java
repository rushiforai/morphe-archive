package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbjr implements Runnable {
    final /* synthetic */ zzbgf zza;
    final /* synthetic */ boolean zzb;
    final /* synthetic */ zzbkd zzc;

    public zzbjr(zzbkd zzbkdVar, zzbgf zzbgfVar, boolean z11) {
        this.zza = zzbgfVar;
        this.zzb = z11;
        this.zzc = zzbkdVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzc.zzs.zzc(this.zza, this.zzb);
    }
}
