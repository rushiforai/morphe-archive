package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hv4 implements ye1 {
    public final /* synthetic */ xv4 a;
    public final /* synthetic */ uef b;

    public hv4(xv4 xv4Var, uef uefVar) {
        this.a = xv4Var;
        this.b = uefVar;
    }

    @Override // defpackage.ye1
    public final void D(int i, String str) {
        str.getClass();
    }

    @Override // defpackage.ye1
    public final void c(String str, String str2, boolean z) {
        str.getClass();
        str2.getClass();
        n92 n92Var = null;
        xv4 xv4Var = this.a;
        if (z) {
            vx0.c0(f76.F(xv4Var), null, null, new uv4(xv4Var, str, str2, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(xv4Var), null, null, new uv4(xv4Var, str, str2, n92Var, 2), 3);
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
        xv4 xv4Var = this.a;
        vx0.c0(f76.F(xv4Var), null, null, new uv4(xv4Var, str, str2, null, 1), 3);
    }

    @Override // defpackage.ye1
    public final void j(rg1 rg1Var, boolean z) {
        rg1Var.getClass();
    }

    @Override // defpackage.ye1
    public final void m(eg1 eg1Var, String str) {
        eg1Var.getClass();
        String str2 = eg1Var.b;
        str2.getClass();
        xv4 xv4Var = this.a;
        xv4Var.f.h(str2, xv4Var.b, str, xv4Var.m);
        this.b.x(eg1Var);
    }

    @Override // defpackage.ye1
    public final void n(rg1 rg1Var) {
        rg1Var.getClass();
    }

    @Override // defpackage.ye1
    public final void o(String str, String str2) {
        str.getClass();
        xv4 xv4Var = this.a;
        if (xv4Var.k.add(str)) {
            ev6.L(xv4Var.f, str, xv4Var.b, str2, xv4Var.m);
        }
    }

    @Override // defpackage.ye1
    public final void s(String str, String str2) {
        str.getClass();
    }
}
