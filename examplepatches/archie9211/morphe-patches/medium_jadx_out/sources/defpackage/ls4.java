package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ls4 extends b43 implements xxb, od5, u22, ln8, ssd {
    public static final wz7 w = new wz7(17);
    public m68 q;
    public final x45 r;
    public gr4 s;
    public cu6 t;
    public eh8 u;
    public final es4 v;

    public ls4(m68 m68Var, int i, k0 k0Var) {
        this.q = m68Var;
        this.r = k0Var;
        es4 es4Var = new es4(i, new xi1(2, this, ls4.class, "onFocusStateChange", "onFocusStateChange(Landroidx/compose/ui/focus/FocusState;Landroidx/compose/ui/focus/FocusState;)V", 0, 7), 10);
        I0(es4Var);
        this.v = es4Var;
    }

    @Override // defpackage.q28
    public final void C0() {
        cu6 cu6Var = this.t;
        if (cu6Var != null) {
            cu6Var.b();
        }
        this.t = null;
    }

    @Override // defpackage.xxb
    public final boolean I() {
        return false;
    }

    public final void L0(m68 m68Var, c56 c56Var) {
        if (!this.n) {
            m68Var.c(c56Var);
        } else {
            va6 va6Var = (va6) ((k92) u0()).a.o0(cd7.g);
            vx0.c0(u0(), null, null, new ku2(m68Var, c56Var, va6Var != null ? va6Var.R(new si3(m68Var, 10, c56Var)) : null, null, 23), 3);
        }
    }

    public final void M0(m68 m68Var) {
        gr4 gr4Var;
        if (g76.L(this.q, m68Var)) {
            return;
        }
        m68 m68Var2 = this.q;
        if (m68Var2 != null && (gr4Var = this.s) != null) {
            m68Var2.c(new hr4(gr4Var));
        }
        this.s = null;
        this.q = m68Var;
    }

    @Override // defpackage.od5
    public final void X(eh8 eh8Var) {
        this.u = eh8Var;
        if (this.v.N0().isFocused()) {
            boolean z = eh8Var.O0().n;
            u3b u3bVar = ms4.o;
            if (!z) {
                if (this.n) {
                    br7.r(this, u3bVar);
                }
            } else {
                eh8 eh8Var2 = this.u;
                if (eh8Var2 != null && eh8Var2.O0().n && this.n) {
                    br7.r(this, u3bVar);
                }
            }
        }
    }

    @Override // defpackage.ln8
    public final void d0() {
        rya ryaVar = new rya();
        mo7.T(this, new gd3(ryaVar, 13, this));
        cu6 cu6Var = (cu6) ryaVar.a;
        if (this.v.N0().isFocused()) {
            cu6 cu6Var2 = this.t;
            if (cu6Var2 != null) {
                cu6Var2.b();
            }
            if (cu6Var != null) {
                cu6Var.a();
            } else {
                cu6Var = null;
            }
            this.t = cu6Var;
        }
    }

    @Override // defpackage.xxb
    public final boolean i() {
        return true;
    }

    @Override // defpackage.ssd
    public final Object m() {
        return w;
    }

    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
        boolean zIsFocused = this.v.N0().isFocused();
        fj6[] fj6VarArr = gyb.a;
        iyb iybVar = eyb.l;
        fj6 fj6Var = gyb.a[4];
        jybVar.d(iybVar, Boolean.valueOf(zIsFocused));
        jybVar.d(sxb.w, new i4(null, new gi4(0, this, ls4.class, "requestFocus", "requestFocus()Z", 0, 8)));
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return false;
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }
}
