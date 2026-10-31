package cl;

import java.util.concurrent.Callable;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class j1 extends g1 implements e1 {

    /* renamed from: c, reason: collision with root package name */
    public final ScheduledExecutorService f20024c;

    public j1(ScheduledExecutorService scheduledExecutorService) {
        super(scheduledExecutorService);
        this.f20024c = scheduledExecutorService;
    }

    @Override // java.util.concurrent.ScheduledExecutorService
    public final ScheduledFuture schedule(Callable callable, long j11, TimeUnit timeUnit) {
        p1 p1Var = new p1(callable);
        return new h1(p1Var, this.f20024c.schedule(p1Var, j11, timeUnit));
    }

    @Override // java.util.concurrent.ScheduledExecutorService
    public final ScheduledFuture scheduleAtFixedRate(Runnable runnable, long j11, long j12, TimeUnit timeUnit) {
        i1 i1Var = new i1(runnable);
        return new h1(i1Var, this.f20024c.scheduleAtFixedRate(i1Var, j11, j12, timeUnit));
    }

    @Override // java.util.concurrent.ScheduledExecutorService
    public final ScheduledFuture scheduleWithFixedDelay(Runnable runnable, long j11, long j12, TimeUnit timeUnit) {
        i1 i1Var = new i1(runnable);
        return new h1(i1Var, this.f20024c.scheduleWithFixedDelay(i1Var, j11, j12, timeUnit));
    }

    @Override // java.util.concurrent.ScheduledExecutorService
    public final ScheduledFuture schedule(Runnable runnable, long j11, TimeUnit timeUnit) {
        p1 p1Var = new p1(Executors.callable(runnable, null));
        return new h1(p1Var, this.f20024c.schedule(p1Var, j11, timeUnit));
    }
}
