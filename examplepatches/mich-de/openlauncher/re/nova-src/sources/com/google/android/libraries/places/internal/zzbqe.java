package com.google.android.libraries.places.internal;

import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class zzbqe implements Executor, Runnable {
    private static final Logger zza = Logger.getLogger(zzbqe.class.getName());
    private static final zzbpz zzb;
    private final Executor zzc;
    private final Queue zzd = new ConcurrentLinkedQueue();
    private volatile int zze = 0;

    /* JADX WARN: Multi-variable type inference failed */
    static {
        zzbpz zzbqdVar;
        Object[] objArr = 0;
        try {
            zzbqdVar = new zzbqb(AtomicIntegerFieldUpdater.newUpdater(zzbqe.class, "zze"), null);
        } catch (Throwable th2) {
            zza.logp(Level.SEVERE, "io.grpc.internal.SerializingExecutor", "getAtomicHelper", "FieldUpdaterAtomicHelper failed", th2);
            zzbqdVar = new zzbqd(objArr == true ? 1 : 0);
        }
        zzb = zzbqdVar;
    }

    public zzbqe(Executor executor) {
        zzmt.zzc(executor, "'executor' must not be null.");
        this.zzc = executor;
    }

    private final void zzc(Runnable runnable) {
        if (zzb.zzb(this, 0, -1)) {
            try {
                this.zzc.execute(this);
            } catch (Throwable th2) {
                if (runnable != null) {
                    this.zzd.remove(runnable);
                }
                zzb.zza(this, 0);
                throw th2;
            }
        }
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        zzmt.zzc(runnable, "'r' must not be null.");
        this.zzd.add(runnable);
        zzc(runnable);
    }

    @Override // java.lang.Runnable
    public final void run() {
        Runnable runnable;
        try {
            Executor executor = this.zzc;
            while (executor == this.zzc && (runnable = (Runnable) this.zzd.poll()) != null) {
                try {
                    runnable.run();
                } catch (RuntimeException e3) {
                    zza.logp(Level.SEVERE, "io.grpc.internal.SerializingExecutor", "run", "Exception while executing runnable " + runnable.toString(), (Throwable) e3);
                }
            }
            zzb.zza(this, 0);
            if (this.zzd.isEmpty()) {
                return;
            }
            zzc(null);
        } catch (Throwable th2) {
            zzb.zza(this, 0);
            throw th2;
        }
    }
}
