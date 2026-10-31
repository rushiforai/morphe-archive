package cl;

import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes.dex */
public final class z0 implements ListenableFuture {

    /* renamed from: b, reason: collision with root package name */
    public static final z0 f20092b = new z0(null);

    /* renamed from: c, reason: collision with root package name */
    public static final Logger f20093c = Logger.getLogger(z0.class.getName());

    /* renamed from: a, reason: collision with root package name */
    public final Object f20094a;

    public z0(Object obj) {
        this.f20094a = obj;
    }

    @Override // com.google.common.util.concurrent.ListenableFuture
    public final void b(Runnable runnable, Executor executor) {
        vk.b0.g(executor, "Executor was null.");
        try {
            executor.execute(runnable);
        } catch (RuntimeException e3) {
            f20093c.log(Level.SEVERE, "RuntimeException while executing runnable " + runnable + " with executor " + executor, (Throwable) e3);
        }
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z11) {
        return false;
    }

    @Override // java.util.concurrent.Future
    public final Object get() {
        return this.f20094a;
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return false;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return true;
    }

    public final String toString() {
        return super.toString() + "[status=SUCCESS, result=[" + this.f20094a + "]]";
    }

    @Override // java.util.concurrent.Future
    public final Object get(long j11, TimeUnit timeUnit) {
        timeUnit.getClass();
        return this.f20094a;
    }
}
