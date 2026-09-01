package defpackage;

import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jc8 {
    public final f70 a;
    public final oc8 b = new oc8();
    public final LinkedHashSet c;
    public final LinkedHashSet d;

    public jc8(f70 f70Var) {
        this.a = f70Var;
        new LinkedHashSet();
        this.c = new LinkedHashSet();
        this.d = new LinkedHashSet();
    }

    public static void a(jc8 jc8Var, lc8 lc8Var) {
        jc8Var.getClass();
        lc8Var.getClass();
        if (jc8Var.c.add(lc8Var)) {
            oc8 oc8Var = jc8Var.b;
            if (lc8Var.c != null) {
                rd6.v("Handler '", lc8Var, "' is already registered with a dispatcher");
                return;
            }
            oc8Var.e.addFirst(lc8Var);
            lc8Var.c = jc8Var;
            oc8Var.b();
        }
    }

    public final void b(nc8 nc8Var) {
        if (this.d.add(nc8Var)) {
            this.b.a(this, nc8Var, -1);
        }
    }

    public final void c(bq8 bq8Var, int i) {
        if (i != 1 && i != 0) {
            ywb.g(b09.w(i, "Unsupported priority value: "));
        } else if (this.d.add(bq8Var)) {
            this.b.a(this, bq8Var, i);
        }
    }

    public final void d(nc8 nc8Var, ic8 ic8Var) {
        oc8 oc8Var = this.b;
        if (oc8Var.g != 0) {
            return;
        }
        lc8 lc8VarC = oc8Var.c(-1);
        oc8Var.f = lc8VarC;
        oc8Var.g = -1;
        oc8Var.h = nc8Var;
        if (ic8Var != null) {
            if (lc8VarC != null) {
                lc8VarC.d(ic8Var);
            }
            oc8Var.a.m(null, new qc8(ic8Var));
        }
    }
}
