package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class le1 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ oe1 b;
    public final /* synthetic */ float c;
    public final /* synthetic */ i52 d;
    public final /* synthetic */ float e;

    public /* synthetic */ le1(oe1 oe1Var, float f, i52 i52Var, float f2, int i) {
        this.a = i;
        this.b = oe1Var;
        this.c = f;
        this.d = i52Var;
        this.e = f2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        i52 i52Var = this.d;
        float f = this.c;
        float f2 = this.e;
        oe1 oe1Var = this.b;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                h52Var.getClass();
                q52 q52Var = h52Var.e;
                q52 q52Var2 = h52Var.f;
                i52 i52Var2 = h52Var.c;
                int i2 = ke1.a[oe1Var.ordinal()];
                if (i2 == 1) {
                    ka1.A(h52Var, null, "spread");
                    h52Var.d(new ze3(new vj3(f), null));
                    wgd.k(h52Var.d, i52Var2.c, 0.0f, 6);
                    wgd.k(q52Var2, i52Var2.e, 0.0f, 6);
                    km4.o(q52Var, i52Var.f, 8.0f, 4);
                } else if (i2 != 2) {
                    ygf.a();
                } else {
                    h52Var.f(new ze3(new vj3(f2), null));
                    h52Var.d(new ze3(null, "spread"));
                    wgd.k(q52Var2, i52Var2.e, 0.0f, 6);
                    km4.o(q52Var, i52Var2.d, 0.0f, 6);
                    km4.o(h52Var.g, i52Var2.f, 0.0f, 6);
                }
                break;
            default:
                h52 h52Var2 = (h52) obj;
                h52Var2.getClass();
                q52 q52Var3 = h52Var2.e;
                q52 q52Var4 = h52Var2.f;
                i52 i52Var3 = h52Var2.c;
                int i3 = te1.a[oe1Var.ordinal()];
                if (i3 == 1) {
                    ka1.A(h52Var2, null, "spread");
                    h52Var2.d(new ze3(new vj3(f), null));
                    wgd.k(h52Var2.d, i52Var3.c, 0.0f, 6);
                    wgd.k(q52Var4, i52Var3.e, 0.0f, 6);
                    km4.o(q52Var3, i52Var.f, 8.0f, 4);
                } else if (i3 != 2) {
                    ygf.a();
                } else {
                    h52Var2.f(new ze3(new vj3(f2), null));
                    h52Var2.d(new ze3(null, "spread"));
                    wgd.k(q52Var4, i52Var3.e, 0.0f, 6);
                    km4.o(q52Var3, i52Var3.d, 0.0f, 6);
                    km4.o(h52Var2.g, i52Var3.f, 0.0f, 6);
                }
                break;
        }
        return c1eVar;
    }
}
