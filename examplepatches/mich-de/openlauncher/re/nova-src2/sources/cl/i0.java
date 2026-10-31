package cl;

import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public abstract class i0 extends c1 {

    /* renamed from: c, reason: collision with root package name */
    public final Executor f20020c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ j0 f20021d;

    public i0(j0 j0Var, Executor executor) {
        this.f20021d = j0Var;
        executor.getClass();
        this.f20020c = executor;
    }

    @Override // cl.c1
    public final void a(Throwable th2) {
        j0 j0Var = this.f20021d;
        j0Var.f20023p = null;
        if (th2 instanceof ExecutionException) {
            j0Var.o(((ExecutionException) th2).getCause());
        } else if (th2 instanceof CancellationException) {
            j0Var.cancel(false);
        } else {
            j0Var.o(th2);
        }
    }

    @Override // cl.c1
    public final void b(Object obj) {
        this.f20021d.f20023p = null;
        h(obj);
    }

    @Override // cl.c1
    public final boolean d() {
        return this.f20021d.isDone();
    }

    public abstract void h(Object obj);
}
