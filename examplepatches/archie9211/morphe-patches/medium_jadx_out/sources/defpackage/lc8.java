package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class lc8 {
    public vp7 a;
    public boolean b;
    public jc8 c;

    public abstract void a();

    public abstract void b();

    public abstract void c(ic8 ic8Var);

    public abstract void d(ic8 ic8Var);

    public final void e() {
        jc8 jc8Var = this.c;
        if (jc8Var == null || !jc8Var.c.remove(this)) {
            return;
        }
        oc8 oc8Var = jc8Var.b;
        if (equals(oc8Var.f)) {
            if (oc8Var.g == -1) {
                a();
            }
            oc8Var.f = null;
            oc8Var.g = 0;
            oc8Var.h = null;
        }
        oc8Var.d.remove(this);
        oc8Var.e.remove(this);
        this.c = null;
        oc8Var.b();
    }

    public final void f(boolean z) {
        if (this.b == z) {
            return;
        }
        this.b = z;
        jc8 jc8Var = this.c;
        if (jc8Var != null) {
            jc8Var.b.b();
        }
    }
}
