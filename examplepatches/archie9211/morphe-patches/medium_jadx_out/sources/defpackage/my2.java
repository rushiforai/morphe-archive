package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class my2 extends q28 implements xl3 {
    public final d56 o;
    public boolean p;
    public boolean q;
    public boolean r;

    public my2(d56 d56Var) {
        this.o = d56Var;
    }

    @Override // defpackage.xl3
    public final void e0(cq6 cq6Var) {
        cq6Var.a();
        m50 m50Var = cq6Var.a.b;
        if (this.p) {
            ho2.r(cq6Var, uu1.b(0.3f, uu1.b), 0L, m50Var.B(), 0.0f, 122);
        } else if (this.q || this.r) {
            ho2.r(cq6Var, uu1.b(0.1f, uu1.b), 0L, m50Var.B(), 0.0f, 122);
        }
    }

    @Override // defpackage.q28
    public final void y0() {
        vx0.c0(u0(), null, null, new m1(this, null, 8), 3);
    }

    @Override // defpackage.xl3
    public final void L() {
    }
}
