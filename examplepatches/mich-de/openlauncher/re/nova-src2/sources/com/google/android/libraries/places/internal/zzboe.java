package com.google.android.libraries.places.internal;

import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
final class zzboe {
    private final ScheduledExecutorService zza;
    private final Executor zzb;
    private final Runnable zzc;
    private final zzna zzd;
    private long zze;
    private boolean zzf;
    private ScheduledFuture zzg;

    public zzboe(Runnable runnable, Executor executor, ScheduledExecutorService scheduledExecutorService, zzna zznaVar) {
        this.zzc = runnable;
        this.zzb = executor;
        this.zza = scheduledExecutorService;
        this.zzd = zznaVar;
        zznaVar.zzd();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final long zzk() {
        return this.zzd.zza(TimeUnit.NANOSECONDS);
    }

    public final void zzh(boolean z11) {
        ScheduledFuture scheduledFuture;
        this.zzf = false;
        if (!z11 || (scheduledFuture = this.zzg) == null) {
            return;
        }
        scheduledFuture.cancel(false);
        this.zzg = null;
    }

    public final void zzi(long j11, TimeUnit timeUnit) {
        long nanos = timeUnit.toNanos(j11);
        long jZzk = zzk() + nanos;
        this.zzf = true;
        if (jZzk - this.zze < 0 || this.zzg == null) {
            ScheduledFuture scheduledFuture = this.zzg;
            if (scheduledFuture != null) {
                scheduledFuture.cancel(false);
            }
            this.zzg = this.zza.schedule(new zzbod(this, null), nanos, TimeUnit.NANOSECONDS);
        }
        this.zze = jZzk;
    }
}
