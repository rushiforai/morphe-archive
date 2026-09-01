package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c31 extends q28 implements ln8, h01, xl3 {
    public final d31 o;
    public boolean p;
    public x45 q;

    public c31(d31 d31Var, x45 x45Var) {
        this.o = d31Var;
        this.q = x45Var;
        d31Var.a = this;
    }

    @Override // defpackage.q28
    public final void B0() {
        I0();
    }

    @Override // defpackage.q28
    public final void C0() {
        I0();
    }

    public final void I0() {
        this.p = false;
        this.o.b = null;
        wgf.y(this);
    }

    @Override // defpackage.xl3
    public final void L() {
        I0();
    }

    @Override // defpackage.h01
    public final m73 b() {
        return flb.v0(this).y;
    }

    @Override // defpackage.ln8
    public final void d0() {
        I0();
    }

    @Override // defpackage.xl3
    public final void e0(cq6 cq6Var) {
        boolean z = this.p;
        d31 d31Var = this.o;
        if (!z) {
            d31Var.b = null;
            mo7.T(this, new cn(this, 5, d31Var));
            if (d31Var.b == null) {
                throw lv8.v("DrawResult not defined, did you forget to call onDraw?");
            }
            this.p = true;
        }
        yl3 yl3Var = d31Var.b;
        yl3Var.getClass();
        yl3Var.a.invoke(cq6Var);
    }

    @Override // defpackage.h01
    public final long f() {
        return nk7.C0(flb.t0(this, 4).c);
    }

    @Override // defpackage.h01
    public final ip6 getLayoutDirection() {
        return flb.v0(this).z;
    }

    @Override // defpackage.q28
    public final void z0() {
        I0();
    }

    @Override // defpackage.q28
    public final void A0() {
    }
}
