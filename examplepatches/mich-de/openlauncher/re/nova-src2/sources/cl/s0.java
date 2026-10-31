package cl;

import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class s0 extends r0 {

    /* renamed from: h, reason: collision with root package name */
    public final ListenableFuture f20076h;

    public s0(ListenableFuture listenableFuture) {
        listenableFuture.getClass();
        this.f20076h = listenableFuture;
    }

    @Override // cl.s, com.google.common.util.concurrent.ListenableFuture
    public final void b(Runnable runnable, Executor executor) {
        this.f20076h.b(runnable, executor);
    }

    @Override // cl.s, java.util.concurrent.Future
    public final boolean cancel(boolean z11) {
        return this.f20076h.cancel(z11);
    }

    @Override // cl.s, java.util.concurrent.Future
    public final Object get() {
        return this.f20076h.get();
    }

    @Override // cl.s, java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.f20076h.isCancelled();
    }

    @Override // cl.s, java.util.concurrent.Future
    public final boolean isDone() {
        return this.f20076h.isDone();
    }

    @Override // cl.s
    public final String toString() {
        return this.f20076h.toString();
    }

    @Override // cl.s, java.util.concurrent.Future
    public final Object get(long j11, TimeUnit timeUnit) {
        return this.f20076h.get(j11, timeUnit);
    }
}
