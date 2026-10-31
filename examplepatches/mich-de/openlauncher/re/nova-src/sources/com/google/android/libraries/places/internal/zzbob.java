package com.google.android.libraries.places.internal;

import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
final class zzbob implements Runnable {
    final /* synthetic */ zzboe zza;

    public /* synthetic */ zzbob(zzboe zzboeVar, zzboa zzboaVar) {
        this.zza = zzboeVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzboe zzboeVar = this.zza;
        zzboc zzbocVar = null;
        if (!zzboeVar.zzf) {
            zzboeVar.zzg = null;
            return;
        }
        long jZzk = zzboeVar.zzk();
        if (zzboeVar.zze - jZzk > 0) {
            zzboe zzboeVar2 = this.zza;
            zzboeVar2.zzg = zzboeVar2.zza.schedule(new zzbod(zzboeVar2, zzbocVar), zzboeVar2.zze - jZzk, TimeUnit.NANOSECONDS);
        } else {
            this.zza.zzf = false;
            this.zza.zzg = null;
            this.zza.zzc.run();
        }
    }
}
