package defpackage;

import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pe7 extends q28 implements od5, xl3, xxb, ln8 {
    public j83 B;
    public s46 D;
    public uz0 E;
    public r00 o;
    public oid p;
    public ma9 w;
    public View x;
    public m73 y;
    public la9 z;
    public float q = Float.NaN;
    public boolean r = true;
    public long s = 9205357640488583168L;
    public float t = Float.NaN;
    public float u = Float.NaN;
    public boolean v = true;
    public final k49 A = new k49(null, y3b.h);
    public long C = 9205357640488583168L;

    public pe7(r00 r00Var, oid oidVar, ma9 ma9Var) {
        this.o = r00Var;
        this.p = oidVar;
        this.w = ma9Var;
    }

    @Override // defpackage.q28
    public final void A0() {
        la9 la9Var = this.z;
        if (la9Var != null) {
            ((ke5) la9Var).b();
        }
        this.z = null;
    }

    @Override // defpackage.xxb
    public final boolean I() {
        return false;
    }

    public final long I0() {
        j83 j83VarB = this.B;
        if (j83VarB == null) {
            j83VarB = bjc.b(new oe7(this, 2));
            this.B = j83VarB;
        }
        return ((ip8) j83VarB.getValue()).a;
    }

    public final void J0() {
        la9 la9Var = this.z;
        if (la9Var != null) {
            ((ke5) la9Var).b();
        }
        View viewU = this.x;
        if (viewU == null) {
            viewU = guc.U(this);
        }
        View view = viewU;
        this.x = view;
        m73 m73Var = this.y;
        if (m73Var == null) {
            m73Var = flb.v0(this).y;
        }
        m73 m73Var2 = m73Var;
        this.y = m73Var2;
        this.z = this.w.c(view, this.r, this.s, this.t, this.u, this.v, m73Var2, this.q);
        L0();
    }

    public final void K0() {
        m73 m73Var = this.y;
        if (m73Var == null) {
            m73Var = flb.v0(this).y;
            this.y = m73Var;
        }
        long j = ((ip8) this.o.invoke(m73Var)).a;
        if ((j & 9223372034707292159L) == 9205357640488583168L || (9223372034707292159L & I0()) == 9205357640488583168L) {
            this.C = 9205357640488583168L;
            la9 la9Var = this.z;
            if (la9Var != null) {
                ((ke5) la9Var).b();
                return;
            }
            return;
        }
        this.C = ip8.e(I0(), j);
        if (this.z == null) {
            J0();
        }
        la9 la9Var2 = this.z;
        if (la9Var2 != null) {
            la9Var2.a(this.q, this.C, 9205357640488583168L);
        }
        L0();
    }

    public final void L0() {
        m73 m73Var;
        la9 la9Var = this.z;
        if (la9Var == null || (m73Var = this.y) == null) {
            return;
        }
        ke5 ke5Var = (ke5) la9Var;
        long jD = ke5Var.d();
        s46 s46Var = this.D;
        if (y30.C(s46Var) && jD == s46Var.a) {
            return;
        }
        oid oidVar = this.p;
        if (oidVar != null) {
            oidVar.invoke(new yj3(m73Var.r(nk7.C0(ke5Var.d()))));
        }
        this.D = new s46(ke5Var.d());
    }

    @Override // defpackage.od5
    public final void X(eh8 eh8Var) {
        this.A.setValue(eh8Var);
    }

    @Override // defpackage.ln8
    public final void d0() {
        mo7.T(this, new oe7(this, 0));
    }

    @Override // defpackage.xl3
    public final void e0(cq6 cq6Var) {
        cq6Var.a();
        uz0 uz0Var = this.E;
        if (uz0Var != null) {
            uz0Var.e(c1e.a);
        }
    }

    @Override // defpackage.xxb
    public final boolean i() {
        return true;
    }

    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
        jybVar.d(qe7.a, new oe7(this, 1));
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return false;
    }

    @Override // defpackage.q28
    public final void y0() {
        d0();
        this.E = pwd.e(0, 7, null);
        vx0.c0(u0(), null, wb2.UNDISPATCHED, new m1(this, null, 29), 1);
    }

    @Override // defpackage.xl3
    public final void L() {
    }
}
