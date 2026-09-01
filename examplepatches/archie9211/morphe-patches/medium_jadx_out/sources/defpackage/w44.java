package defpackage;

import java.lang.reflect.Method;
import java.util.concurrent.CancellationException;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w44 extends v44 implements x33 {
    public final Executor c;

    public w44(Executor executor) {
        Method method;
        this.c = executor;
        Method method2 = j32.a;
        try {
            ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = executor instanceof ScheduledThreadPoolExecutor ? (ScheduledThreadPoolExecutor) executor : null;
            if (scheduledThreadPoolExecutor != null && (method = j32.a) != null) {
                method.invoke(scheduledThreadPoolExecutor, Boolean.TRUE);
            }
        } catch (Throwable unused) {
        }
    }

    @Override // defpackage.kb2
    public final void E0(ib2 ib2Var, Runnable runnable) {
        try {
            this.c.execute(runnable);
        } catch (RejectedExecutionException e) {
            CancellationException cancellationException = new CancellationException("The task was rejected");
            cancellationException.initCause(e);
            bo.D(ib2Var, cancellationException);
            r13 r13Var = xg3.a;
            vz2.c.E0(ib2Var, runnable);
        }
    }

    @Override // defpackage.x33
    public final yh3 Q(long j, Runnable runnable, ib2 ib2Var) {
        Executor executor = this.c;
        ScheduledFuture<?> scheduledFutureSchedule = null;
        ScheduledExecutorService scheduledExecutorService = executor instanceof ScheduledExecutorService ? (ScheduledExecutorService) executor : null;
        if (scheduledExecutorService != null) {
            try {
                scheduledFutureSchedule = scheduledExecutorService.schedule(runnable, j, TimeUnit.MILLISECONDS);
            } catch (RejectedExecutionException e) {
                CancellationException cancellationException = new CancellationException("The task was rejected");
                cancellationException.initCause(e);
                bo.D(ib2Var, cancellationException);
            }
        }
        return scheduledFutureSchedule != null ? new xh3(scheduledFutureSchedule) : wy2.k.Q(j, runnable, ib2Var);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        Executor executor = this.c;
        ExecutorService executorService = executor instanceof ExecutorService ? (ExecutorService) executor : null;
        if (executorService != null) {
            executorService.shutdown();
        }
    }

    public final boolean equals(Object obj) {
        return (obj instanceof w44) && ((w44) obj).c == this.c;
    }

    @Override // defpackage.x33
    public final void g0(long j, x51 x51Var) {
        Executor executor = this.c;
        ScheduledFuture<?> scheduledFutureSchedule = null;
        ScheduledExecutorService scheduledExecutorService = executor instanceof ScheduledExecutorService ? (ScheduledExecutorService) executor : null;
        if (scheduledExecutorService != null) {
            p0g p0gVar = new p0g(this, 14, x51Var);
            ib2 ib2Var = x51Var.e;
            try {
                scheduledFutureSchedule = scheduledExecutorService.schedule(p0gVar, j, TimeUnit.MILLISECONDS);
            } catch (RejectedExecutionException e) {
                CancellationException cancellationException = new CancellationException("The task was rejected");
                cancellationException.initCause(e);
                bo.D(ib2Var, cancellationException);
            }
        }
        if (scheduledFutureSchedule != null) {
            x51Var.w(new p51(0, scheduledFutureSchedule));
        } else {
            wy2.k.g0(j, x51Var);
        }
    }

    public final int hashCode() {
        return System.identityHashCode(this.c);
    }

    @Override // defpackage.kb2
    public final String toString() {
        return this.c.toString();
    }
}
