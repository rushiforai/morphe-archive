package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yuc extends b43 implements ub9, cr4, ur4 {
    public m45 q;
    public boolean r;
    public final w4d s;

    public yuc(m45 m45Var) {
        this.q = m45Var;
        dp dpVar = new dp(6, this);
        lb9 lb9Var = r4d.a;
        w4d w4dVar = new w4d(null, null, dpVar);
        I0(w4dVar);
        this.s = w4dVar;
    }

    @Override // defpackage.cr4
    public final void F(zr4 zr4Var) {
        this.r = zr4Var.isFocused();
    }

    @Override // defpackage.ub9
    public final void H() {
        this.s.H();
    }

    @Override // defpackage.ub9
    public final boolean l0() {
        return false;
    }

    @Override // defpackage.ub9
    public final long n() {
        zj3 zj3Var = d46.h;
        m73 m73Var = flb.v0(this).y;
        zj3Var.getClass();
        int i = iqd.b;
        return aq7.x(m73Var.i0(10.0f), m73Var.i0(40.0f), m73Var.i0(10.0f), m73Var.i0(40.0f));
    }

    @Override // defpackage.ub9
    public final void o0() {
        H();
    }

    @Override // defpackage.ub9
    public final void y(lb9 lb9Var, mb9 mb9Var, long j) {
        this.s.y(lb9Var, mb9Var, j);
    }

    @Override // defpackage.q28
    public final void z0() {
        H();
    }

    @Override // defpackage.ub9
    public final void M() {
    }
}
