package defpackage;

import java.lang.ref.WeakReference;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t41 implements d37 {
    public final WeakReference a;
    public final s41 b = new s41(this);

    public t41(q41 q41Var) {
        this.a = new WeakReference(q41Var);
    }

    @Override // defpackage.d37
    public final void a(Runnable runnable, Executor executor) {
        this.b.a(runnable, executor);
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z) {
        q41 q41Var = (q41) this.a.get();
        boolean zCancel = this.b.cancel(z);
        if (zCancel && q41Var != null) {
            q41Var.a = null;
            q41Var.b = null;
            q41Var.c.k(null);
        }
        return zCancel;
    }

    @Override // java.util.concurrent.Future
    public final Object get() {
        return this.b.get();
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.b.a instanceof c2;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return this.b.isDone();
    }

    public final String toString() {
        return this.b.toString();
    }

    @Override // java.util.concurrent.Future
    public final Object get(long j, TimeUnit timeUnit) {
        return this.b.get(j, timeUnit);
    }
}
