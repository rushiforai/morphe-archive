package cl;

import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public class g1 extends t {

    /* renamed from: b, reason: collision with root package name */
    public final ExecutorService f20008b;

    public g1(ExecutorService executorService) {
        executorService.getClass();
        this.f20008b = executorService;
    }

    @Override // java.util.concurrent.ExecutorService
    public final boolean awaitTermination(long j11, TimeUnit timeUnit) {
        return this.f20008b.awaitTermination(j11, timeUnit);
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        this.f20008b.execute(runnable);
    }

    @Override // java.util.concurrent.ExecutorService
    public final boolean isShutdown() {
        return this.f20008b.isShutdown();
    }

    @Override // java.util.concurrent.ExecutorService
    public final boolean isTerminated() {
        return this.f20008b.isTerminated();
    }

    @Override // java.util.concurrent.ExecutorService
    public final void shutdown() {
        this.f20008b.shutdown();
    }

    @Override // java.util.concurrent.ExecutorService
    public final List shutdownNow() {
        return this.f20008b.shutdownNow();
    }

    public final String toString() {
        return super.toString() + "[" + this.f20008b + "]";
    }
}
