package defpackage;

import android.view.View;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicLong;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class nr0 {
    public static final AtomicLong b = new AtomicLong(0);
    public final g22 a;

    public nr0() {
        b.decrementAndGet();
        new HashMap();
        this.a = new g22(0);
    }

    public abstract void a(pr0 pr0Var);

    public pr0 b(View view) {
        view.getClass();
        return new pr0(g(view));
    }

    public /* bridge */ pr0 c(View view) {
        return b(view);
    }

    public abstract int d();

    public int e() {
        return d();
    }

    public boolean f(nr0 nr0Var) {
        return h(nr0Var);
    }

    public abstract ete g(View view);

    public abstract boolean h(nr0 nr0Var);

    public void l(pr0 pr0Var) {
        g22 g22Var = this.a;
        if (!g22Var.b) {
            synchronized (g22Var) {
                try {
                    if (!g22Var.b) {
                        ym0 ym0Var = (ym0) g22Var.c;
                        g22Var.c = null;
                        g22.e(ym0Var);
                    }
                } finally {
                }
            }
        }
        ly6 ly6Var = pr0Var.v;
        or0 or0Var = pr0Var.u;
        if (or0Var != null) {
            vx6 vx6Var = vx6.DESTROYED;
            vx6Var.getClass();
            ky6 ky6Var = or0Var.a;
            vx6 vx6Var2 = ky6Var.d;
            vx6Var2.getClass();
            if (vx6Var2.compareTo(vx6Var) <= 0) {
                vx6Var = vx6Var2;
            }
            ky6Var.g(vx6Var);
            ly6Var.getClass();
            boolean zRemove = ly6Var.k.remove(or0Var);
            or0Var.a.b(ly6Var.l);
            if (ly6Var.m && zRemove) {
                ly6Var.i();
            }
        }
        pr0Var.u = null;
        ly6Var.j(false);
        pr0Var.s = null;
    }

    public /* bridge */ void m(pr0 pr0Var) {
        l(pr0Var);
    }

    public void i(pr0 pr0Var) {
    }

    public void j(pr0 pr0Var) {
    }

    public void k(boolean z) {
    }
}
