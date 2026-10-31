package t70;

import java.lang.reflect.Method;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import kotlin.coroutines.CoroutineContext;

/* loaded from: classes.dex */
public final class k1 extends j1 implements r0 {

    /* renamed from: c, reason: collision with root package name */
    public final Executor f88811c;

    public k1(Executor executor) {
        Method method;
        this.f88811c = executor;
        Method method2 = y70.a.f96782a;
        try {
            ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = executor instanceof ScheduledThreadPoolExecutor ? (ScheduledThreadPoolExecutor) executor : null;
            if (scheduledThreadPoolExecutor != null && (method = y70.a.f96782a) != null) {
                method.invoke(scheduledThreadPoolExecutor, Boolean.TRUE);
            }
        } catch (Throwable unused) {
        }
    }

    @Override // t70.r0
    public final void V(long j11, m mVar) {
        Executor executor = this.f88811c;
        ScheduledFuture<?> scheduledFutureSchedule = null;
        ScheduledExecutorService scheduledExecutorService = executor instanceof ScheduledExecutorService ? (ScheduledExecutorService) executor : null;
        if (scheduledExecutorService != null) {
            mk.w wVar = new mk.w(22, this, mVar);
            CoroutineContext coroutineContext = mVar.f88824e;
            try {
                scheduledFutureSchedule = scheduledExecutorService.schedule(wVar, j11, TimeUnit.MILLISECONDS);
            } catch (RejectedExecutionException e3) {
                m0.g(coroutineContext, ph.a.a("The task was rejected", e3));
            }
        }
        if (scheduledFutureSchedule != null) {
            mVar.w(new i(scheduledFutureSchedule));
        } else {
            n0.f88840j.V(j11, mVar);
        }
    }

    @Override // t70.r0
    public final a1 a(long j11, Runnable runnable, CoroutineContext coroutineContext) {
        Executor executor = this.f88811c;
        ScheduledFuture<?> scheduledFutureSchedule = null;
        ScheduledExecutorService scheduledExecutorService = executor instanceof ScheduledExecutorService ? (ScheduledExecutorService) executor : null;
        if (scheduledExecutorService != null) {
            try {
                scheduledFutureSchedule = scheduledExecutorService.schedule(runnable, j11, TimeUnit.MILLISECONDS);
            } catch (RejectedExecutionException e3) {
                m0.g(coroutineContext, ph.a.a("The task was rejected", e3));
            }
        }
        return scheduledFutureSchedule != null ? new z0(scheduledFutureSchedule) : n0.f88840j.a(j11, runnable, coroutineContext);
    }

    @Override // t70.c0
    public final void c0(CoroutineContext coroutineContext, Runnable runnable) {
        try {
            this.f88811c.execute(runnable);
        } catch (RejectedExecutionException e3) {
            m0.g(coroutineContext, ph.a.a("The task was rejected", e3));
            a80.e eVar = y0.f88884a;
            a80.d.f488c.c0(coroutineContext, runnable);
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        Executor executor = this.f88811c;
        ExecutorService executorService = executor instanceof ExecutorService ? (ExecutorService) executor : null;
        if (executorService != null) {
            executorService.shutdown();
        }
    }

    public final boolean equals(Object obj) {
        return (obj instanceof k1) && ((k1) obj).f88811c == this.f88811c;
    }

    public final int hashCode() {
        return System.identityHashCode(this.f88811c);
    }

    @Override // t70.c0
    public final String toString() {
        return this.f88811c.toString();
    }
}
