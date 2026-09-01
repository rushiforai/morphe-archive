package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class asb extends b43 implements u22, ln8 {
    public fp A;
    public ep B;
    public boolean C;
    public nsb q;
    public hw8 r;
    public boolean s;
    public dn4 t;
    public m68 u;
    public xy0 v;
    public boolean w;
    public fx8 x;
    public msb y;
    public a43 z;

    @Override // defpackage.q28
    public final void A0() {
        a43 a43Var = this.z;
        if (a43Var != null) {
            J0(a43Var);
        }
    }

    @Override // defpackage.q28
    public final void B0() {
        boolean zM0 = M0();
        if (this.C != zM0) {
            this.C = zM0;
            nsb nsbVar = this.q;
            hw8 hw8Var = this.r;
            boolean z = this.w;
            fx8 fx8Var = z ? this.B : this.x;
            N0(this.v, this.t, this.u, hw8Var, fx8Var, nsbVar, z, this.s);
        }
    }

    public final void L0() {
        a43 a43Var = this.z;
        if (a43Var != null) {
            if (((q28) a43Var).a.n) {
                return;
            }
            I0(a43Var);
            return;
        }
        if (this.w) {
            mo7.T(this, new i5b(15, this));
        }
        fx8 fx8Var = this.w ? this.B : this.x;
        if (fx8Var != null) {
            a43 a43VarC = fx8Var.c();
            if (((q28) a43VarC).a.n) {
                return;
            }
            I0(a43VarC);
            this.z = a43VarC;
        }
    }

    public final boolean M0() {
        ip6 ip6Var = ip6.Ltr;
        if (this.n) {
            ip6Var = flb.v0(this).z;
        }
        return ip6Var != ip6.Rtl || this.r == hw8.Vertical;
    }

    public final void N0(xy0 xy0Var, dn4 dn4Var, m68 m68Var, hw8 hw8Var, fx8 fx8Var, nsb nsbVar, boolean z, boolean z2) {
        boolean z3;
        this.q = nsbVar;
        this.r = hw8Var;
        boolean z4 = true;
        if (this.w != z) {
            this.w = z;
            z3 = true;
        } else {
            z3 = false;
        }
        if (g76.L(this.x, fx8Var)) {
            z4 = false;
        } else {
            this.x = fx8Var;
        }
        if (z3 || (z4 && !z)) {
            a43 a43Var = this.z;
            if (a43Var != null) {
                J0(a43Var);
            }
            this.z = null;
            L0();
        }
        this.s = z2;
        this.t = dn4Var;
        this.u = m68Var;
        this.v = xy0Var;
        boolean zM0 = M0();
        this.C = zM0;
        msb msbVar = this.y;
        if (msbVar != null) {
            msbVar.d1(xy0Var, dn4Var, m68Var, hw8Var, this.w ? this.B : this.x, nsbVar, z2, zM0);
        }
    }

    @Override // defpackage.ln8
    public final void d0() {
        fp fpVar = (fp) bo.K(this, gx8.a);
        if (g76.L(fpVar, this.A)) {
            return;
        }
        this.A = fpVar;
        this.B = null;
        a43 a43Var = this.z;
        if (a43Var != null) {
            J0(a43Var);
        }
        this.z = null;
        L0();
        msb msbVar = this.y;
        if (msbVar != null) {
            nsb nsbVar = this.q;
            hw8 hw8Var = this.r;
            fx8 fx8Var = this.w ? this.B : this.x;
            msbVar.d1(this.v, this.t, this.u, hw8Var, fx8Var, nsbVar, this.s, this.C);
        }
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }

    @Override // defpackage.q28
    public final void y0() {
        this.C = M0();
        L0();
        if (this.y == null) {
            nsb nsbVar = this.q;
            fx8 fx8Var = this.w ? this.B : this.x;
            msb msbVar = new msb(this.v, this.t, this.u, this.r, fx8Var, nsbVar, this.s, this.C);
            I0(msbVar);
            this.y = msbVar;
        }
    }
}
