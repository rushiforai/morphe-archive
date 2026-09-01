package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ge1 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ oe1 b;
    public final /* synthetic */ i52 c;

    public /* synthetic */ ge1(oe1 oe1Var, i52 i52Var, int i) {
        this.a = i;
        this.b = oe1Var;
        this.c = i52Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        i52 i52Var = this.c;
        oe1 oe1Var = this.b;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                h52Var.getClass();
                q52 q52Var = h52Var.f;
                ka1.A(h52Var, null, "spread");
                q52 q52Var2 = h52Var.d;
                i52 i52Var2 = h52Var.c;
                wgd.k(q52Var2, i52Var2.c, 24.0f, 4);
                km4.o(h52Var.e, i52Var2.d, 24.0f, 4);
                int i2 = fe1.a[oe1Var.ordinal()];
                if (i2 == 1) {
                    wgd.k(q52Var, i52Var2.e, 24.0f, 4);
                } else if (i2 != 2) {
                    ygf.a();
                } else {
                    wgd.k(q52Var, i52Var.c, 24.0f, 4);
                }
                break;
            default:
                h52 h52Var2 = (h52) obj;
                h52Var2.getClass();
                q52 q52Var3 = h52Var2.f;
                ka1.A(h52Var2, null, "spread");
                q52 q52Var4 = h52Var2.d;
                i52 i52Var3 = h52Var2.c;
                wgd.k(q52Var4, i52Var3.c, 24.0f, 4);
                km4.o(h52Var2.e, i52Var3.d, 24.0f, 4);
                int i3 = re1.a[oe1Var.ordinal()];
                if (i3 == 1) {
                    wgd.k(q52Var3, i52Var3.e, 24.0f, 4);
                } else if (i3 != 2) {
                    ygf.a();
                } else {
                    wgd.k(q52Var3, i52Var.c, 24.0f, 4);
                }
                break;
        }
        return c1eVar;
    }
}
