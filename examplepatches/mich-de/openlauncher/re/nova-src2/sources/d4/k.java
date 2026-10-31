package d4;

import com.google.common.util.concurrent.ListenableFuture;
import java.lang.ref.WeakReference;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public final class k implements ListenableFuture {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f48971a;

    /* renamed from: b, reason: collision with root package name */
    public final j f48972b = new j(this);

    public k(h hVar) {
        this.f48971a = new WeakReference(hVar);
    }

    @Override // com.google.common.util.concurrent.ListenableFuture
    public final void b(Runnable runnable, Executor executor) {
        this.f48972b.b(runnable, executor);
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z11) {
        h hVar = (h) this.f48971a.get();
        boolean zCancel = this.f48972b.cancel(z11);
        if (zCancel && hVar != null) {
            hVar.f48966a = null;
            hVar.f48967b = null;
            hVar.f48968c.m(null);
        }
        return zCancel;
    }

    @Override // java.util.concurrent.Future
    public final Object get() {
        return this.f48972b.get();
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.f48972b.f48963a instanceof a;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return this.f48972b.isDone();
    }

    public final String toString() {
        return this.f48972b.toString();
    }

    @Override // java.util.concurrent.Future
    public final Object get(long j11, TimeUnit timeUnit) {
        return this.f48972b.get(j11, timeUnit);
    }
}
