package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbjl implements Runnable {
    final /* synthetic */ zzbkd zza;

    public zzbjl(zzbkd zzbkdVar) {
        this.zza = zzbkdVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zza.zzo = null;
        this.zza.zzi.zza(2, "CONNECTING after backoff");
        zzbkd.zzA(this.zza, zzaze.CONNECTING);
        zzbkd.zzE(this.zza);
    }
}
