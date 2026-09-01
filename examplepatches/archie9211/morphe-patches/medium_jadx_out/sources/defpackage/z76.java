package defpackage;

import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class z76 implements Runnable {
    public final long a;
    public final ConcurrentLinkedQueue b;
    public final g22 c;
    public final ScheduledExecutorService d;
    public final ScheduledFuture e;
    public final ThreadFactory f;

    public z76(long j, TimeUnit timeUnit, ThreadFactory threadFactory) {
        z76 z76Var;
        ScheduledExecutorService scheduledExecutorServiceNewScheduledThreadPool;
        ScheduledFuture<?> scheduledFutureScheduleWithFixedDelay;
        long nanos = timeUnit != null ? timeUnit.toNanos(j) : 0L;
        this.a = nanos;
        this.b = new ConcurrentLinkedQueue();
        this.c = new g22(0);
        this.f = threadFactory;
        if (timeUnit != null) {
            scheduledExecutorServiceNewScheduledThreadPool = Executors.newScheduledThreadPool(1, c86.c);
            z76Var = this;
            scheduledFutureScheduleWithFixedDelay = scheduledExecutorServiceNewScheduledThreadPool.scheduleWithFixedDelay(z76Var, nanos, nanos, TimeUnit.NANOSECONDS);
        } else {
            z76Var = this;
            scheduledExecutorServiceNewScheduledThreadPool = null;
            scheduledFutureScheduleWithFixedDelay = null;
        }
        z76Var.d = scheduledExecutorServiceNewScheduledThreadPool;
        z76Var.e = scheduledFutureScheduleWithFixedDelay;
    }

    @Override // java.lang.Runnable
    public final void run() {
        ConcurrentLinkedQueue<b86> concurrentLinkedQueue = this.b;
        if (concurrentLinkedQueue.isEmpty()) {
            return;
        }
        long jNanoTime = System.nanoTime();
        for (b86 b86Var : concurrentLinkedQueue) {
            if (b86Var.c > jNanoTime) {
                return;
            }
            if (concurrentLinkedQueue.remove(b86Var)) {
                this.c.g(b86Var);
            }
        }
    }
}
