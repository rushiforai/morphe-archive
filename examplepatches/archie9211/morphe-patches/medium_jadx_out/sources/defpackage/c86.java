package defpackage;

import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class c86 extends oqb {
    public static final zmb b;
    public static final zmb c;
    public static final long d = Long.getLong("rx2.io-keep-alive-time", 60).longValue();
    public static final b86 e;
    public static final boolean f;
    public static final z76 g;
    public final AtomicReference a;

    static {
        b86 b86Var = new b86(new zmb("RxCachedThreadSchedulerShutdown"));
        e = b86Var;
        b86Var.dispose();
        int iMax = Math.max(1, Math.min(10, Integer.getInteger("rx2.io-priority", 5).intValue()));
        zmb zmbVar = new zmb(iMax, "RxCachedThreadScheduler", false);
        b = zmbVar;
        c = new zmb(iMax, "RxCachedWorkerPoolEvictor", false);
        f = Boolean.getBoolean("rx2.io-scheduled-release");
        z76 z76Var = new z76(0L, null, zmbVar);
        g = z76Var;
        z76Var.c.dispose();
        ScheduledFuture scheduledFuture = z76Var.e;
        if (scheduledFuture != null) {
            scheduledFuture.cancel(true);
        }
        ScheduledExecutorService scheduledExecutorService = z76Var.d;
        if (scheduledExecutorService != null) {
            scheduledExecutorService.shutdownNow();
        }
    }

    public c86() {
        z76 z76Var = g;
        AtomicReference atomicReference = new AtomicReference(z76Var);
        this.a = atomicReference;
        z76 z76Var2 = new z76(d, TimeUnit.SECONDS, b);
        while (!atomicReference.compareAndSet(z76Var, z76Var2)) {
            if (atomicReference.get() != z76Var) {
                z76Var2.c.dispose();
                ScheduledFuture scheduledFuture = z76Var2.e;
                if (scheduledFuture != null) {
                    scheduledFuture.cancel(true);
                }
                ScheduledExecutorService scheduledExecutorService = z76Var2.d;
                if (scheduledExecutorService != null) {
                    scheduledExecutorService.shutdownNow();
                    return;
                }
                return;
            }
        }
    }

    @Override // defpackage.oqb
    public final nqb a() {
        return new a86((z76) this.a.get());
    }
}
