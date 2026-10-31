package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzblc implements Runnable {
    final /* synthetic */ zzbma zza;

    public /* synthetic */ zzblc(zzbma zzbmaVar, zzblb zzblbVar) {
        this.zza = zzbmaVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzbma zzbmaVar = this.zza;
        if (zzbmaVar.zzG == null) {
            return;
        }
        zzbma.zzP(zzbmaVar);
    }
}
