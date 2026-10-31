package com.google.android.libraries.places.internal;

import java.lang.Thread;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class zzbdw implements Executor {
    private final Thread.UncaughtExceptionHandler zza;
    private final Queue zzb = new ConcurrentLinkedQueue();
    private final AtomicReference zzc = new AtomicReference();

    public zzbdw(Thread.UncaughtExceptionHandler uncaughtExceptionHandler) {
        this.zza = uncaughtExceptionHandler;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        zzc(runnable);
        zzb();
    }

    public final zzbdv zza(Runnable runnable, long j11, TimeUnit timeUnit, ScheduledExecutorService scheduledExecutorService) {
        zzbdt zzbdtVar = new zzbdt(runnable);
        return new zzbdv(zzbdtVar, scheduledExecutorService.schedule(new zzbds(this, zzbdtVar, runnable), j11, timeUnit), null);
    }

    public final void zzb() {
        do {
            AtomicReference atomicReference = this.zzc;
            Thread threadCurrentThread = Thread.currentThread();
            while (!atomicReference.compareAndSet(null, threadCurrentThread)) {
                if (atomicReference.get() != null && atomicReference.get() != null) {
                    return;
                }
            }
            while (true) {
                try {
                    Runnable runnable = (Runnable) this.zzb.poll();
                    if (runnable == null) {
                        break;
                    }
                    try {
                        runnable.run();
                    } catch (Throwable th2) {
                        this.zza.uncaughtException(Thread.currentThread(), th2);
                    }
                } catch (Throwable th3) {
                    this.zzc.set(null);
                    throw th3;
                }
            }
            this.zzc.set(null);
        } while (!this.zzb.isEmpty());
    }

    public final void zzc(Runnable runnable) {
        zzmt.zzc(runnable, "runnable is null");
        this.zzb.add(runnable);
    }

    public final void zzd() {
        zzmt.zzp(Thread.currentThread() == this.zzc.get(), "Not called from the SynchronizationContext");
    }
}
