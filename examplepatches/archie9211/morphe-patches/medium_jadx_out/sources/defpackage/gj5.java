package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gj5 extends q28 implements u22, sp6, ln8 {
    public mkd o;
    public int p;
    public int q;
    public boolean r;
    public int s;
    public int t;
    public mkd u;
    public gyd v;

    @Override // defpackage.q28
    public final void A0() {
        this.u = null;
        this.v = null;
        this.r = false;
    }

    @Override // defpackage.q28
    public final void B0() {
        this.u = il7.C(this.o, flb.v0(this).z);
        this.r = true;
        gx1.M(this);
    }

    public final mkd I0() {
        mkd mkdVar = this.u;
        if (mkdVar != null) {
            return mkdVar;
        }
        e26.b("Resolved style is not set.");
        z72.b();
        return null;
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        if (this.r) {
            mkd mkdVarI0 = I0();
            yy4 yy4Var = (yy4) bo.K(this, z22.k);
            String str = uhd.a;
            int iA = (int) (uhd.a(mkdVarI0, bl7Var, yy4Var, str, 1) & 4294967295L);
            int iA2 = ((int) (uhd.a(mkdVarI0, bl7Var, yy4Var, str + '\n' + str, 2) & 4294967295L)) - iA;
            int i = this.p;
            this.s = i == 1 ? -1 : ((i - 1) * iA2) + iA;
            int i2 = this.q;
            this.t = i2 == Integer.MAX_VALUE ? -1 : ((i2 - 1) * iA2) + iA;
            this.r = false;
        }
        int i3 = this.s;
        int iV = i3 != -1 ? iq7.v(i3, f72.i(j), f72.g(j)) : f72.i(j);
        int i4 = this.t;
        t99 t99VarS = tk7Var.s(f72.a(j, 0, 0, iV, i4 != -1 ? iq7.v(i4, f72.i(j), f72.g(j)) : f72.g(j), 3));
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new y0(t99VarS, 6));
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int d(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.b(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.ln8
    public final void d0() {
        if (this.v != null) {
            mo7.T(this, new fj5(this, 1));
        }
        this.r = true;
        gx1.M(this);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int e(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.f(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int g(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.h(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }

    @Override // defpackage.q28
    public final void y0() {
        yy4 yy4Var = (yy4) bo.K(this, z22.k);
        this.u = il7.C(this.o, flb.v0(this).z);
        az4 az4Var = I0().a.f;
        d05 d05Var = I0().a.c;
        if (d05Var == null) {
            d05Var = d05.f;
        }
        zz4 zz4Var = I0().a.d;
        int i = zz4Var != null ? zz4Var.a : 0;
        a05 a05Var = I0().a.e;
        this.v = ((bz4) yy4Var).b(az4Var, d05Var, i, a05Var != null ? a05Var.a : 65535);
        mo7.T(this, new fj5(this, 0));
        this.r = true;
    }

    @Override // defpackage.q28
    public final void z0() {
        this.r = true;
        gx1.M(this);
    }
}
