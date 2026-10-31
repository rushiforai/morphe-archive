package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
abstract class zzbgi implements Runnable {
    private final zzazj zza;

    public zzbgi(zzazj zzazjVar) {
        this.zza = zzazjVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzazj zzazjVarZza = this.zza.zza();
        try {
            zza();
        } finally {
            this.zza.zze(zzazjVarZza);
        }
    }

    public abstract void zza();
}
