package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class nc8 {
    public jc8 a;
    public boolean b;

    public final void a() {
        jc8 jc8Var = this.a;
        if (jc8Var == null) {
            ygf.f("This input is not added to any dispatcher.");
            return;
        }
        if (!this.b) {
            jc8Var.d(this, null);
        }
        oc8 oc8Var = jc8Var.b;
        f70 f70Var = jc8Var.a;
        if (equals(oc8Var.h) && -1 == oc8Var.g) {
            lc8 lc8VarC = oc8Var.f;
            if (lc8VarC == null) {
                lc8VarC = oc8Var.c(-1);
            }
            oc8Var.f = null;
            oc8Var.g = 0;
            oc8Var.h = null;
            if (lc8VarC == null) {
                ((iq8) f70Var.b).a.run();
            } else {
                lc8VarC.b();
            }
            oc8Var.a.m(null, pc8.d);
        }
        this.b = false;
    }

    public void b(boolean z) {
    }
}
