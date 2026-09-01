package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class rr5 extends q28 implements ssd, ub9, u22 {
    public zj3 o;
    public lr p;
    public boolean q;

    public rr5(lr lrVar, zj3 zj3Var) {
        this.o = zj3Var;
        this.p = lrVar;
    }

    @Override // defpackage.q28
    public final void A0() {
        M0();
    }

    @Override // defpackage.ub9
    public final void H() {
        M0();
    }

    public final void I0() {
        lr lrVar;
        rya ryaVar = new rya();
        br7.A(this, new ox8(16, ryaVar));
        rr5 rr5Var = (rr5) ryaVar.a;
        if (rr5Var == null || (lrVar = rr5Var.p) == null) {
            lrVar = this.p;
        }
        J0(lrVar);
    }

    public abstract void J0(pb9 pb9Var);

    public final void K0() {
        nya nyaVar = new nya();
        nyaVar.a = true;
        br7.C(this, new ck3(nyaVar));
        if (nyaVar.a) {
            I0();
        }
    }

    public abstract boolean L0(int i);

    public final void M0() {
        if (this.q) {
            this.q = false;
            if (this.n) {
                rya ryaVar = new rya();
                br7.A(this, new en(ryaVar, 1));
                rr5 rr5Var = (rr5) ryaVar.a;
                if (rr5Var != null) {
                    rr5Var.I0();
                } else {
                    J0(null);
                }
            }
        }
    }

    @Override // defpackage.ub9
    public final boolean l0() {
        return false;
    }

    @Override // defpackage.ub9
    public final long n() {
        if (this.o == null) {
            return iqd.a;
        }
        m73 m73Var = flb.v0(this).y;
        int i = iqd.b;
        return aq7.x(m73Var.i0(10.0f), m73Var.i0(40.0f), m73Var.i0(10.0f), m73Var.i0(40.0f));
    }

    @Override // defpackage.ub9
    public final void o0() {
        M0();
    }

    @Override // defpackage.ub9
    public final void y(lb9 lb9Var, mb9 mb9Var, long j) {
        if (mb9Var == mb9.Main) {
            List list = lb9Var.a;
            int size = list.size();
            for (int i = 0; i < size; i++) {
                if (L0(((rb9) list.get(i)).i)) {
                    int i2 = lb9Var.f;
                    if (i2 == 4) {
                        this.q = true;
                        K0();
                        return;
                    } else {
                        if (i2 == 5) {
                            M0();
                            return;
                        }
                        return;
                    }
                }
            }
        }
    }

    @Override // defpackage.q28
    public final void z0() {
        M0();
    }

    @Override // defpackage.ub9
    public final void M() {
    }
}
