package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tid extends q28 implements u22, sp6 {
    public final mkd o;
    public gyd p;
    public rid q;

    public tid(mkd mkdVar) {
        this.o = mkdVar;
    }

    @Override // defpackage.q28
    public final void A0() {
        this.p = null;
        this.q = null;
    }

    @Override // defpackage.q28
    public final void B0() {
        rid ridVar = this.q;
        if (ridVar != null) {
            rid.a(ridVar, flb.v0(this).z, null, null, 30);
        }
        gx1.M(this);
    }

    public final void I0(mkd mkdVar, yy4 yy4Var) {
        skc skcVar = mkdVar.a;
        az4 az4Var = skcVar.f;
        d05 d05Var = skcVar.c;
        if (d05Var == null) {
            d05Var = d05.f;
        }
        zz4 zz4Var = skcVar.d;
        int i = zz4Var != null ? zz4Var.a : 0;
        a05 a05Var = skcVar.e;
        this.p = ((bz4) yy4Var).b(az4Var, d05Var, i, a05Var != null ? a05Var.a : 65535);
        gx1.M(this);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        rid ridVar = this.q;
        if (ridVar == null) {
            e26.b("Min size state is not set.");
            z72.b();
            return null;
        }
        k49 k49Var = ridVar.f;
        gyd gydVar = this.p;
        if (gydVar == null) {
            e26.b("Font resolution state is not set.");
            z72.b();
            return null;
        }
        Object value = gydVar.getValue();
        if (!g76.L(value, ridVar.e)) {
            ridVar.e = value;
            k49Var.setValue(Boolean.TRUE);
        }
        if (((Boolean) k49Var.getValue()).booleanValue()) {
            ridVar.g = uhd.a(ridVar.d, ridVar.b, ridVar.c, uhd.a, 1);
            k49Var.setValue(Boolean.FALSE);
        }
        long j2 = ridVar.g;
        t99 t99VarS = tk7Var.s(h72.e(j, h72.b((int) (j2 >> 32), 0, (int) (j2 & 4294967295L), 0, 10)));
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new y0(t99VarS, 14));
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int d(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.b(this, fb7Var, tk7Var, i);
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
        mkd mkdVarC = il7.C(this.o, flb.v0(this).z);
        yy4 yy4Var = (yy4) bo.K(this, z22.k);
        I0(mkdVarC, yy4Var);
        ip6 ip6Var = flb.v0(this).z;
        m73 m73Var = flb.v0(this).y;
        gyd gydVar = this.p;
        if (gydVar != null) {
            this.q = new rid(ip6Var, m73Var, yy4Var, mkdVarC, gydVar.getValue());
        } else {
            e26.b("Font resolution state is not set.");
            z72.b();
        }
    }

    @Override // defpackage.q28
    public final void z0() {
        rid ridVar = this.q;
        if (ridVar != null) {
            rid.a(ridVar, null, flb.v0(this).y, null, 29);
        }
        gx1.M(this);
    }
}
