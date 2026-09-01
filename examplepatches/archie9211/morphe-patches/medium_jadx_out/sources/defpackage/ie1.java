package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ie1 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ i52 b;
    public final /* synthetic */ oe1 c;
    public final /* synthetic */ i52 d;

    public /* synthetic */ ie1(i52 i52Var, oe1 oe1Var, i52 i52Var2, int i) {
        this.a = i;
        this.b = i52Var;
        this.c = oe1Var;
        this.d = i52Var2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        i52 i52Var = this.d;
        oe1 oe1Var = this.c;
        i52 i52Var2 = this.b;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                h52Var.getClass();
                q52 q52Var = h52Var.f;
                ka1.A(h52Var, null, "spread");
                q52 q52Var2 = h52Var.d;
                i52 i52Var3 = h52Var.c;
                wgd.k(q52Var2, i52Var3.c, 24.0f, 4);
                km4.o(h52Var.e, i52Var2.f, 12.0f, 4);
                int i2 = he1.a[oe1Var.ordinal()];
                if (i2 == 1) {
                    wgd.k(q52Var, i52Var3.e, 24.0f, 4);
                } else if (i2 != 2) {
                    ygf.a();
                } else {
                    wgd.k(q52Var, i52Var.c, 24.0f, 4);
                }
                break;
            case 1:
                h52 h52Var2 = (h52) obj;
                h52Var2.getClass();
                q52 q52Var3 = h52Var2.f;
                ka1.A(h52Var2, null, "spread");
                q52 q52Var4 = h52Var2.d;
                i52 i52Var4 = h52Var2.c;
                wgd.k(q52Var4, i52Var4.c, 24.0f, 4);
                km4.o(h52Var2.e, i52Var2.f, 4.0f, 4);
                int i3 = je1.a[oe1Var.ordinal()];
                if (i3 == 1) {
                    wgd.k(q52Var3, i52Var4.e, 12.0f, 4);
                } else if (i3 != 2) {
                    ygf.a();
                } else {
                    wgd.k(q52Var3, i52Var.c, 12.0f, 4);
                    km4.o(h52Var2.g, i52Var4.f, 8.0f, 4);
                }
                break;
            default:
                h52 h52Var3 = (h52) obj;
                h52Var3.getClass();
                q52 q52Var5 = h52Var3.f;
                ka1.A(h52Var3, null, "spread");
                q52 q52Var6 = h52Var3.d;
                i52 i52Var5 = h52Var3.c;
                wgd.k(q52Var6, i52Var5.c, 24.0f, 4);
                km4.o(h52Var3.e, i52Var2.f, 4.0f, 4);
                int i4 = se1.a[oe1Var.ordinal()];
                if (i4 == 1) {
                    wgd.k(q52Var5, i52Var5.e, 12.0f, 4);
                } else if (i4 != 2) {
                    ygf.a();
                } else {
                    wgd.k(q52Var5, i52Var.c, 12.0f, 4);
                    km4.o(h52Var3.g, i52Var5.f, 8.0f, 4);
                }
                break;
        }
        return c1eVar;
    }
}
