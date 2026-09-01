package defpackage;

import android.window.OnBackInvokedDispatcher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iq8 {
    public final Runnable a;
    public final w5d b = new w5d(new yj8(5, this));

    public iq8(Runnable runnable) {
        this.a = runnable;
    }

    public final void a(iy6 iy6Var, dq8 dq8Var) {
        dq8Var.getClass();
        final wx6 lifecycle = iy6Var.getLifecycle();
        if (((ky6) lifecycle).d == vx6.DESTROYED) {
            return;
        }
        cq8 cq8Var = new cq8(dq8Var, new eq8(iy6Var, dq8Var));
        dq8Var.a.add(cq8Var);
        cq8Var.g(false);
        jc8.a(c().c, cq8Var);
        final h03 h03Var = new h03(cq8Var, this, lifecycle);
        lifecycle.a(h03Var);
        dq8Var.c.add(new AutoCloseable() { // from class: fq8
            @Override // java.lang.AutoCloseable
            public final void close() {
                lifecycle.b(h03Var);
            }
        });
    }

    public final void b(dq8 dq8Var) {
        dq8Var.getClass();
        cq8 cq8Var = new cq8(dq8Var, new eq8(null, dq8Var));
        dq8Var.a.add(cq8Var);
        jc8.a(c().c, cq8Var);
    }

    public final gq8 c() {
        return (gq8) this.b.getValue();
    }

    public final void d() {
        c().a();
    }

    public final void e(OnBackInvokedDispatcher onBackInvokedDispatcher) {
        c().c.c(new zp8(onBackInvokedDispatcher, 0), 1);
        c().c.c(new zp8(onBackInvokedDispatcher, 1000000), 0);
    }
}
