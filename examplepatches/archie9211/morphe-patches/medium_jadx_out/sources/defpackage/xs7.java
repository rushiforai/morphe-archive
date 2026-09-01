package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xs7 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ i52 b;
    public final /* synthetic */ mx c;

    public /* synthetic */ xs7(i52 i52Var, mx mxVar, int i) {
        this.a = i;
        this.b = i52Var;
        this.c = mxVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        pwe pweVar = pwe.d;
        pwe pweVar2 = pwe.b;
        mx mxVar = this.c;
        i52 i52Var = this.b;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                b09.G(h52Var, null, "spread");
                i52 i52Var2 = h52Var.c;
                h52.c(h52Var, i52Var2.c, i52Var.c, 0.0f, 8.0f, 0.0f, 52);
                km4.o(h52Var.e, i52Var2.d, 0.0f, 6);
                if (mxVar != null) {
                    pweVar = pweVar2;
                }
                h52Var.e(pweVar);
                break;
            default:
                h52 h52Var2 = (h52) obj;
                b09.G(h52Var2, null, "spread");
                i52 i52Var3 = h52Var2.c;
                h52.c(h52Var2, i52Var3.c, i52Var.c, 0.0f, 8.0f, 0.0f, 52);
                km4.o(h52Var2.e, i52Var3.d, 0.0f, 6);
                if (mxVar != null) {
                    pweVar = pweVar2;
                }
                h52Var2.e(pweVar);
                break;
        }
        return c1eVar;
    }
}
