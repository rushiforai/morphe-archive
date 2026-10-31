package com.google.android.libraries.places.internal;

import java.util.logging.Level;

/* loaded from: classes3.dex */
public final class zzben {
    final /* synthetic */ zzbeo zza;
    private final long zzb;

    public /* synthetic */ zzben(zzbeo zzbeoVar, long j11, zzbem zzbemVar) {
        this.zza = zzbeoVar;
        this.zzb = j11;
    }

    public final void zza() {
        zzbeo zzbeoVar = this.zza;
        long j11 = this.zzb;
        long jMax = Math.max(j11 + j11, j11);
        if (zzbeoVar.zzc.compareAndSet(j11, jMax)) {
            zzbeo.zza.logp(Level.WARNING, "io.grpc.internal.AtomicBackoff$State", "backoff", "Increased {0} to {1}", new Object[]{this.zza.zzb, Long.valueOf(jMax)});
        }
    }
}
