package cl;

import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.Delayed;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class h1 extends xk.w implements ScheduledFuture, ListenableFuture, Future {

    /* renamed from: d, reason: collision with root package name */
    public final s f20016d;

    /* renamed from: e, reason: collision with root package name */
    public final ScheduledFuture f20017e;

    public h1(s sVar, ScheduledFuture scheduledFuture) {
        this.f20016d = sVar;
        this.f20017e = scheduledFuture;
    }

    public final boolean A(boolean z11) {
        return this.f20016d.cancel(z11);
    }

    @Override // com.google.common.util.concurrent.ListenableFuture
    public final void b(Runnable runnable, Executor executor) {
        this.f20016d.b(runnable, executor);
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z11) {
        boolean zA = A(z11);
        if (zA) {
            this.f20017e.cancel(z11);
        }
        return zA;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Delayed delayed) {
        return this.f20017e.compareTo(delayed);
    }

    @Override // xk.w
    public final Object delegate() {
        return this.f20016d;
    }

    @Override // java.util.concurrent.Future
    public final Object get() {
        return this.f20016d.get();
    }

    @Override // java.util.concurrent.Delayed
    public final long getDelay(TimeUnit timeUnit) {
        return this.f20017e.getDelay(timeUnit);
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.f20016d.isCancelled();
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return this.f20016d.isDone();
    }

    @Override // java.util.concurrent.Future
    public final Object get(long j11, TimeUnit timeUnit) {
        return this.f20016d.get(j11, timeUnit);
    }
}
