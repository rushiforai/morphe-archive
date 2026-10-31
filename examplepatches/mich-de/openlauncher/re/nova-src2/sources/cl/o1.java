package cl;

import java.util.concurrent.Callable;

/* loaded from: classes.dex */
public final class o1 extends c1 {

    /* renamed from: c, reason: collision with root package name */
    public final Callable f20052c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ p1 f20053d;

    public o1(p1 p1Var, Callable callable) {
        this.f20053d = p1Var;
        callable.getClass();
        this.f20052c = callable;
    }

    @Override // cl.c1
    public final void a(Throwable th2) {
        this.f20053d.o(th2);
    }

    @Override // cl.c1
    public final void b(Object obj) {
        this.f20053d.n(obj);
    }

    @Override // cl.c1
    public final boolean d() {
        return this.f20053d.isDone();
    }

    @Override // cl.c1
    public final Object e() {
        return this.f20052c.call();
    }

    @Override // cl.c1
    public final String f() {
        return this.f20052c.toString();
    }
}
