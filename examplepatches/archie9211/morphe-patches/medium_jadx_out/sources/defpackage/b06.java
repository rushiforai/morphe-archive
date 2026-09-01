package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b06 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ i52 b;
    public final /* synthetic */ i52 c;
    public final /* synthetic */ long d;

    public /* synthetic */ b06(i52 i52Var, i52 i52Var2, long j, int i) {
        this.a = i;
        this.b = i52Var;
        this.c = i52Var2;
        this.d = j;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        pwe pweVar = pwe.d;
        pwe pweVar2 = pwe.b;
        long j = this.d;
        i52 i52Var = this.c;
        i52 i52Var2 = this.b;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                b09.G(h52Var, null, "wrap");
                wgd.k(h52Var.f, i52Var2.c, 6.0f, 4);
                km4.o(h52Var.e, i52Var.d, 0.0f, 6);
                if (j > 0) {
                    pweVar = pweVar2;
                }
                h52Var.e(pweVar);
                break;
            default:
                h52 h52Var2 = (h52) obj;
                b09.G(h52Var2, null, "wrap");
                wgd.k(h52Var2.f, i52Var2.c, 6.0f, 4);
                km4.o(h52Var2.e, i52Var.d, 0.0f, 6);
                if (j > 0) {
                    pweVar = pweVar2;
                }
                h52Var2.e(pweVar);
                break;
        }
        return c1eVar;
    }
}
