package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h98 implements ye1 {
    public final /* synthetic */ m98 a;
    public final /* synthetic */ uef b;

    public h98(m98 m98Var, uef uefVar) {
        this.a = m98Var;
        this.b = uefVar;
    }

    @Override // defpackage.ye1
    public final void D(int i, String str) {
        str.getClass();
        m98 m98Var = this.a;
        vx0.c0(f76.F(m98Var), null, null, new wm4(m98Var, str, i, (n92) null, 4), 3);
    }

    @Override // defpackage.ye1
    public final void c(String str, String str2, boolean z) {
        str.getClass();
        str2.getClass();
        n92 n92Var = null;
        m98 m98Var = this.a;
        if (z) {
            vx0.c0(f76.F(m98Var), null, null, new dde(m98Var, str, str2, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(m98Var), null, null, new dde(m98Var, str, str2, n92Var, 3), 3);
        }
    }

    @Override // defpackage.ye1
    public final void f(String str, String str2) {
        str.getClass();
        this.b.w(str, str2);
    }

    @Override // defpackage.ye1
    public final void g(String str, String str2) {
        str.getClass();
        m98 m98Var = this.a;
        vx0.c0(f76.F(m98Var), null, null, new dde(m98Var, str, str2, null, 2), 3);
    }

    @Override // defpackage.ye1
    public final void j(rg1 rg1Var, boolean z) {
        rg1Var.getClass();
        m98 m98Var = this.a;
        vx0.c0(f76.F(m98Var), null, null, new lj1(z, m98Var, rg1Var, (n92) null, 15), 3);
    }

    @Override // defpackage.ye1
    public final void m(eg1 eg1Var, String str) {
        eg1Var.getClass();
        String str2 = eg1Var.b;
        str2.getClass();
        m98 m98Var = this.a;
        m98Var.g.h(str2, m98Var.b, str, m98Var.o);
        this.b.x(eg1Var);
    }

    @Override // defpackage.ye1
    public final void n(rg1 rg1Var) {
        rg1Var.getClass();
        m98 m98Var = this.a;
        vx0.c0(f76.F(m98Var), null, null, new fde(m98Var, rg1Var, null, 1), 3);
    }

    @Override // defpackage.ye1
    public final void o(String str, String str2) {
        str.getClass();
        m98 m98Var = this.a;
        if (m98Var.q.add(str)) {
            ev6.L(m98Var.g, str, m98Var.b, str2, m98Var.o);
        }
    }

    @Override // defpackage.ye1
    public final void s(String str, String str2) {
        str.getClass();
        m98 m98Var = this.a;
        vx0.c0(f76.F(m98Var), null, null, new dde(m98Var, str, str2, null, 1), 3);
    }
}
