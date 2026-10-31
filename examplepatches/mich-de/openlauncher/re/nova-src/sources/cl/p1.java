package cl;

import java.util.concurrent.Callable;
import java.util.concurrent.RunnableFuture;

/* loaded from: classes.dex */
public final class p1 extends q0 implements RunnableFuture {

    /* renamed from: h, reason: collision with root package name */
    public volatile c1 f20059h;

    public p1(Callable callable) {
        this.f20059h = new o1(this, callable);
    }

    @Override // cl.s
    public final void e() {
        c1 c1Var;
        if (q() && (c1Var = this.f20059h) != null) {
            c1Var.c();
        }
        this.f20059h = null;
    }

    @Override // cl.s
    public final String l() {
        c1 c1Var = this.f20059h;
        if (c1Var == null) {
            return super.l();
        }
        return "task=[" + c1Var + "]";
    }

    @Override // java.util.concurrent.RunnableFuture, java.lang.Runnable
    public final void run() {
        c1 c1Var = this.f20059h;
        if (c1Var != null) {
            c1Var.run();
        }
        this.f20059h = null;
    }
}
