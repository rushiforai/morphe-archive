package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbka implements Runnable {
    final /* synthetic */ zzbkb zza;

    public zzbka(zzbkb zzbkbVar) {
        this.zza = zzbkbVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzbkb zzbkbVar = this.zza;
        zzbkbVar.zzc.zzr.remove(zzbkbVar.zza);
        if (this.zza.zzc.zzv.zza() == zzaze.SHUTDOWN && this.zza.zzc.zzr.isEmpty()) {
            zzbkd.zzB(this.zza.zzc);
        }
    }
}
