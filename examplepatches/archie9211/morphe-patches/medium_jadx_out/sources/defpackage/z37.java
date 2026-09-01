package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z37 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ v52 b;

    public /* synthetic */ z37(v52 v52Var, int i) {
        this.a = i;
        this.b = v52Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                h52Var.getClass();
                q52 q52Var = h52Var.d;
                i52 i52Var = h52Var.c;
                wgd.k(q52Var, i52Var.c, 0.0f, 6);
                wgd.k(h52Var.f, i52Var.e, 0.0f, 6);
                h52.b(h52Var, this.b, i52Var.f, 24.0f, 24.0f, 0.0f, 48);
                break;
            case 1:
                h52 h52Var2 = (h52) obj;
                h52Var2.getClass();
                h52Var2.f(new ze3(null, "spread"));
                h52Var2.d(new ze3(null, "spread"));
                q52 q52Var2 = h52Var2.d;
                i52 i52Var2 = h52Var2.c;
                wgd.k(q52Var2, i52Var2.c, 0.0f, 6);
                wgd.k(h52Var2.f, i52Var2.e, 0.0f, 6);
                h52.b(h52Var2, this.b, i52Var2.f, 0.0f, 0.0f, 0.0f, 60);
                break;
            case 2:
                h52 h52Var3 = (h52) obj;
                h52Var3.getClass();
                q52 q52Var3 = h52Var3.d;
                i52 i52Var3 = h52Var3.c;
                wgd.k(q52Var3, i52Var3.c, 0.0f, 6);
                wgd.k(h52Var3.f, i52Var3.e, 0.0f, 6);
                h52.b(h52Var3, this.b, i52Var3.f, 24.0f, 24.0f, 0.0f, 48);
                break;
            default:
                h52 h52Var4 = (h52) obj;
                h52Var4.getClass();
                q52 q52Var4 = h52Var4.d;
                i52 i52Var4 = h52Var4.c;
                wgd.k(q52Var4, i52Var4.c, 0.0f, 6);
                wgd.k(h52Var4.f, i52Var4.e, 0.0f, 6);
                km4.o(h52Var4.g, i52Var4.f, 0.0f, 6);
                km4.o(h52Var4.e, this.b, 0.0f, 6);
                h52Var4.f(new ze3(null, "spread"));
                h52Var4.d(new ze3(null, "spread"));
                break;
        }
        return c1eVar;
    }
}
