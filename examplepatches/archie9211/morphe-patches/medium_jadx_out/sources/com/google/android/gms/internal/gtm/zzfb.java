package com.google.android.gms.internal.gtm;

import android.os.SystemClock;
import defpackage.cp1;
import defpackage.vp7;
import defpackage.y3b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
final class zzfb {
    private final cp1 zza;
    private long zzb;

    public zzfb(cp1 cp1Var) {
        vp7.p(cp1Var);
        this.zza = cp1Var;
    }

    public final void zza() {
        this.zzb = 0L;
    }

    public final void zzb() {
        ((y3b) this.zza).getClass();
        this.zzb = SystemClock.elapsedRealtime();
    }

    public final boolean zzc(long j) {
        if (this.zzb == 0) {
            return true;
        }
        ((y3b) this.zza).getClass();
        return SystemClock.elapsedRealtime() - this.zzb > j;
    }
}
