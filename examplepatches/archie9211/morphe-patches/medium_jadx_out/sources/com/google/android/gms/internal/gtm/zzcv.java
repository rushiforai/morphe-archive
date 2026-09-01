package com.google.android.gms.internal.gtm;

import android.os.Handler;
import defpackage.vp7;
import defpackage.y3b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
abstract class zzcv {
    private static volatile Handler zza;
    private final zzbu zzb;
    private final Runnable zzc;
    private volatile long zzd;

    public zzcv(zzbu zzbuVar) {
        vp7.p(zzbuVar);
        this.zzb = zzbuVar;
        this.zzc = new zzcu(this);
    }

    private final Handler zzi() {
        Handler handler;
        if (zza != null) {
            return zza;
        }
        synchronized (zzcv.class) {
            try {
                if (zza == null) {
                    zza = new zzfy(this.zzb.zza().getMainLooper());
                }
                handler = zza;
            } catch (Throwable th) {
                throw th;
            }
        }
        return handler;
    }

    public abstract void zza();

    public final long zzb() {
        if (this.zzd == 0) {
            return 0L;
        }
        ((y3b) this.zzb.zzr()).getClass();
        return Math.abs(System.currentTimeMillis() - this.zzd);
    }

    public final void zze(long j) {
        if (zzh()) {
            if (j < 0) {
                zzf();
                return;
            }
            ((y3b) this.zzb.zzr()).getClass();
            long jAbs = j - Math.abs(System.currentTimeMillis() - this.zzd);
            long j2 = jAbs >= 0 ? jAbs : 0L;
            zzi().removeCallbacks(this.zzc);
            if (zzi().postDelayed(this.zzc, j2)) {
                return;
            }
            this.zzb.zzm().zzJ("Failed to adjust delayed post. time", Long.valueOf(j2));
        }
    }

    public final void zzf() {
        this.zzd = 0L;
        zzi().removeCallbacks(this.zzc);
    }

    public final void zzg(long j) {
        zzf();
        if (j >= 0) {
            ((y3b) this.zzb.zzr()).getClass();
            this.zzd = System.currentTimeMillis();
            if (zzi().postDelayed(this.zzc, j)) {
                return;
            }
            this.zzb.zzm().zzJ("Failed to schedule delayed post. time", Long.valueOf(j));
        }
    }

    public final boolean zzh() {
        return this.zzd != 0;
    }
}
