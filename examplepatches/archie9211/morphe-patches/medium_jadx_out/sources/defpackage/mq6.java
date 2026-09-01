package defpackage;

import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class mq6 implements ivc {
    public final l68 a;
    public final /* synthetic */ nq6 b;
    public final /* synthetic */ Object c;

    public mq6(nq6 nq6Var, Object obj) {
        this.b = nq6Var;
        this.c = obj;
        int[] iArr = r46.a;
        this.a = new l68();
    }

    @Override // defpackage.ivc
    public final int a() {
        aq6 aq6Var = (aq6) this.b.j.g(this.c);
        if (aq6Var != null) {
            return ((o78) ((v68) aq6Var.n()).b).c;
        }
        return 0;
    }

    @Override // defpackage.ivc
    public final void b(bb8 bb8Var) {
        hj0 hj0Var;
        aq6 aq6Var = (aq6) this.b.j.g(this.c);
        q28 q28Var = (aq6Var == null || (hj0Var = aq6Var.F) == null) ? null : (q28) hj0Var.g;
        if (q28Var == null || !q28Var.n) {
            return;
        }
        br7.B(q28Var, "androidx.compose.foundation.lazy.layout.TraversablePrefetchStateNode", bb8Var);
    }

    @Override // defpackage.ivc
    public final long c(int i) {
        aq6 aq6Var = (aq6) this.b.j.g(this.c);
        if (aq6Var == null || !aq6Var.H()) {
            return 0L;
        }
        int i2 = ((o78) ((v68) aq6Var.n()).b).c;
        if (i < 0 || i >= i2) {
            b26.d("Index (" + i + ") is out of bound of [0, " + i2 + ')');
        }
        if (!this.a.c(i)) {
            return 0L;
        }
        int i3 = ((aq6) ((v68) aq6Var.n()).get(i)).G.p.a;
        return (((long) ((aq6) ((v68) aq6Var.n()).get(i)).G.p.b) & 4294967295L) | (((long) i3) << 32);
    }

    @Override // defpackage.ivc
    public final void dispose() {
        this.b.g(this.c);
    }

    @Override // defpackage.ivc
    public final void d(int i, long j) {
        nq6 nq6Var = this.b;
        aq6 aq6Var = (aq6) nq6Var.j.g(this.c);
        if (aq6Var == null || !aq6Var.H()) {
            return;
        }
        int i2 = ((o78) ((v68) aq6Var.n()).b).c;
        if (i < 0 || i >= i2) {
            b26.d("Index (" + i + mgKMENwrbHf.hEGq + i2 + ')');
        }
        if (aq6Var.I()) {
            b26.a("Pre-measure called on node that is not placed");
        }
        aq6 aq6Var2 = nq6Var.a;
        aq6Var2.q = true;
        ((mn) dq6.a(aq6Var)).w((aq6) ((v68) aq6Var.n()).get(i), j);
        aq6Var2.q = false;
        this.a.a(i);
    }
}
