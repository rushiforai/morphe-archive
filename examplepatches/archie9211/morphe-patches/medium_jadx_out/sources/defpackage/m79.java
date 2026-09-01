package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m79 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ float b;
    public final /* synthetic */ i52 c;

    public /* synthetic */ m79(float f, i52 i52Var, int i) {
        this.a = i;
        this.b = f;
        this.c = i52Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        i52 i52Var = this.c;
        float f = this.b;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                b09.G(h52Var, null, "spread");
                h52Var.d(new ze3(new vj3(f), null));
                q52 q52Var = h52Var.d;
                i52 i52Var2 = h52Var.c;
                wgd.k(q52Var, i52Var2.c, 0.0f, 6);
                wgd.k(h52Var.f, i52Var2.e, 0.0f, 6);
                h52.b(h52Var, i52Var2.d, i52Var.d, 0.0f, 0.0f, 1.0f, 60);
                break;
            case 1:
                h52 h52Var2 = (h52) obj;
                b09.G(h52Var2, null, "spread");
                h52Var2.d(new ze3(new vj3(f), null));
                q52 q52Var2 = h52Var2.d;
                i52 i52Var3 = h52Var2.c;
                wgd.k(q52Var2, i52Var3.c, 0.0f, 6);
                wgd.k(h52Var2.f, i52Var3.e, 0.0f, 6);
                h52.b(h52Var2, i52Var3.d, i52Var.d, 0.0f, 0.0f, 1.0f, 60);
                break;
            default:
                h52 h52Var3 = (h52) obj;
                b09.G(h52Var3, null, "spread");
                h52Var3.d(new ze3(new vj3(f), null));
                q52 q52Var3 = h52Var3.d;
                i52 i52Var4 = h52Var3.c;
                wgd.k(q52Var3, i52Var4.c, 0.0f, 6);
                wgd.k(h52Var3.f, i52Var4.e, 0.0f, 6);
                h52.b(h52Var3, i52Var4.d, i52Var.d, 0.0f, 0.0f, 1.0f, 60);
                break;
        }
        return c1eVar;
    }
}
