package s90;

import java.util.ArrayDeque;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import o9.d4;

/* loaded from: classes5.dex */
public final class z0 implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public final t0 f87080a;

    /* renamed from: b, reason: collision with root package name */
    public final d4 f87081b = new d4(this, 8);

    /* renamed from: c, reason: collision with root package name */
    public final ArrayDeque f87082c = new ArrayDeque();

    /* renamed from: d, reason: collision with root package name */
    public boolean f87083d;

    public z0(t0 t0Var) {
        this.f87080a = t0Var;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        synchronized (this.f87082c) {
            this.f87082c.addLast(runnable);
            try {
                this.f87080a.execute(this.f87081b);
            } catch (RejectedExecutionException unused) {
                this.f87082c.removeLast();
            }
        }
    }
}
