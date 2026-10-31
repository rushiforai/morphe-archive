package pb0;

import java.lang.reflect.InvocationTargetException;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import o7.g0;

/* loaded from: classes5.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final ThreadFactory f82495a;

    /* renamed from: b, reason: collision with root package name */
    public final long f82496b;

    /* renamed from: c, reason: collision with root package name */
    public final ConcurrentLinkedQueue f82497c;

    /* renamed from: d, reason: collision with root package name */
    public final xb0.c f82498d;

    /* renamed from: e, reason: collision with root package name */
    public final ScheduledExecutorService f82499e;

    /* renamed from: f, reason: collision with root package name */
    public final ScheduledFuture f82500f;

    public a(rb0.e eVar, long j11, TimeUnit timeUnit) throws IllegalAccessException, SecurityException, IllegalArgumentException, InvocationTargetException {
        ScheduledExecutorService scheduledExecutorServiceNewScheduledThreadPool;
        ScheduledFuture<?> scheduledFutureScheduleWithFixedDelay;
        this.f82495a = eVar;
        long nanos = timeUnit != null ? timeUnit.toNanos(j11) : 0L;
        this.f82496b = nanos;
        this.f82497c = new ConcurrentLinkedQueue();
        this.f82498d = new xb0.c();
        if (timeUnit != null) {
            scheduledExecutorServiceNewScheduledThreadPool = Executors.newScheduledThreadPool(1, new ic.a(eVar));
            i.f(scheduledExecutorServiceNewScheduledThreadPool);
            scheduledFutureScheduleWithFixedDelay = scheduledExecutorServiceNewScheduledThreadPool.scheduleWithFixedDelay(new g0(this, 7), nanos, nanos, TimeUnit.NANOSECONDS);
        } else {
            scheduledExecutorServiceNewScheduledThreadPool = null;
            scheduledFutureScheduleWithFixedDelay = null;
        }
        this.f82499e = scheduledExecutorServiceNewScheduledThreadPool;
        this.f82500f = scheduledFutureScheduleWithFixedDelay;
    }

    public final void a() {
        xb0.c cVar = this.f82498d;
        try {
            ScheduledFuture scheduledFuture = this.f82500f;
            if (scheduledFuture != null) {
                scheduledFuture.cancel(true);
            }
            ScheduledExecutorService scheduledExecutorService = this.f82499e;
            if (scheduledExecutorService != null) {
                scheduledExecutorService.shutdownNow();
            }
            cVar.b();
        } catch (Throwable th2) {
            cVar.b();
            throw th2;
        }
    }
}
