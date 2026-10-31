package cl;

import com.google.common.util.concurrent.ListenableFuture;

/* loaded from: classes3.dex */
public final class n1 extends c1 {

    /* renamed from: c, reason: collision with root package name */
    public final c0 f20046c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ p1 f20047d;

    public n1(p1 p1Var, c0 c0Var) {
        this.f20047d = p1Var;
        this.f20046c = c0Var;
    }

    @Override // cl.c1
    public final void a(Throwable th2) {
        this.f20047d.o(th2);
    }

    @Override // cl.c1
    public final void b(Object obj) {
        this.f20047d.p((ListenableFuture) obj);
    }

    @Override // cl.c1
    public final boolean d() {
        return this.f20047d.isDone();
    }

    @Override // cl.c1
    public final Object e() {
        c0 c0Var = this.f20046c;
        ListenableFuture listenableFutureCall = c0Var.call();
        vk.b0.f(listenableFutureCall, "AsyncCallable.call returned null instead of a Future. Did you mean to return immediateFuture(null)? %s", c0Var);
        return listenableFutureCall;
    }

    @Override // cl.c1
    public final String f() {
        return this.f20046c.toString();
    }
}
