package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vl0 {
    public final jc8 a;
    public final iq8 b;

    public vl0(jc8 jc8Var, iq8 iq8Var) {
        this.a = jc8Var;
        this.b = iq8Var;
        if ((jc8Var == null ? iq8Var : jc8Var) != null) {
            return;
        }
        ay0.e("At least one dispatcher (NavigationEventDispatcher or OnBackPressedDispatcher) must be non-null.");
        throw null;
    }

    public final void a(n4 n4Var) {
        jc8 jc8Var = this.a;
        if (jc8Var != null) {
            jc8.a(jc8Var, (tl0) n4Var.b);
            return;
        }
        iq8 iq8Var = this.b;
        if (iq8Var != null) {
            iq8Var.b((ul0) n4Var.a);
        } else {
            ygf.f("Unreachable");
        }
    }

    public final void b(n4 n4Var) {
        if (this.a != null) {
            ((tl0) n4Var.b).e();
        } else if (this.b != null) {
            ((ul0) n4Var.a).e();
        } else {
            ygf.f("Unreachable");
        }
    }
}
