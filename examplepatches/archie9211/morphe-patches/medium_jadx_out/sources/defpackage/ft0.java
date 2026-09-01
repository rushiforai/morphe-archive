package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ft0 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ i52 b;
    public final /* synthetic */ i52 c;
    public final /* synthetic */ i52 d;

    public /* synthetic */ ft0(i52 i52Var, i52 i52Var2, i52 i52Var3, int i) {
        this.a = i;
        this.b = i52Var;
        this.c = i52Var2;
        this.d = i52Var3;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        i52 i52Var = this.d;
        i52 i52Var2 = this.c;
        i52 i52Var3 = this.b;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                h52Var.getClass();
                wgd.k(h52Var.d, i52Var3.e, 16.0f, 4);
                wgd.k(h52Var.f, i52Var2.c, 16.0f, 4);
                km4.o(h52Var.e, i52Var.f, 8.0f, 4);
                ka1.A(h52Var, null, "spread");
                break;
            case 1:
                h52 h52Var2 = (h52) obj;
                h52Var2.getClass();
                h52.c(h52Var2, i52Var3.e, i52Var2.c, 16.0f, 16.0f, 0.0f, 48);
                km4.o(h52Var2.e, i52Var.f, 8.0f, 4);
                break;
            case 2:
                h52 h52Var3 = (h52) obj;
                h52Var3.getClass();
                h52.c(h52Var3, i52Var3.e, i52Var2.c, 16.0f, 16.0f, 0.0f, 48);
                km4.o(h52Var3.e, i52Var.f, 8.0f, 4);
                break;
            case 3:
                h52 h52Var4 = (h52) obj;
                h52Var4.getClass();
                km4.o(h52Var4.e, i52Var3.f, 16.0f, 4);
                wgd.k(h52Var4.d, h52Var4.c.c, 0.0f, 6);
                wgd.k(h52Var4.f, i52Var2.c, 0.0f, 6);
                km4.o(h52Var4.g, i52Var.d, 0.0f, 6);
                h52Var4.f(new ze3(null, "spread"));
                h52Var4.d(new ze3(null, "wrap"));
                break;
            default:
                h52 h52Var5 = (h52) obj;
                b09.G(h52Var5, null, "spread");
                km4.o(h52Var5.e, i52Var3.f, 0.0f, 6);
                km4.o(h52Var5.g, i52Var2.d, 8.0f, 4);
                h52.c(h52Var5, i52Var.e, h52Var5.c.e, 8.0f, 0.0f, 0.0f, 56);
                break;
        }
        return c1eVar;
    }
}
