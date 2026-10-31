package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbna implements Runnable {
    final /* synthetic */ zzbnj zza;

    public zzbna(zzbnj zzbnjVar) {
        this.zza = zzbnjVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zza.zzl = null;
        if (this.zza.zzi.zzf()) {
            this.zza.zzd();
        }
    }
}
