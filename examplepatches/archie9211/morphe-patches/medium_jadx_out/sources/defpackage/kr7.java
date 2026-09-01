package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class kr7 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ upc b;
    public final /* synthetic */ upc c;

    public /* synthetic */ kr7(upc upcVar, upc upcVar2, int i) {
        this.a = i;
        this.b = upcVar;
        this.c = upcVar2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        upc upcVar = this.c;
        upc upcVar2 = this.b;
        switch (i) {
            case 0:
                zl3 zl3Var = (zl3) obj;
                zl3Var.getClass();
                float fZ = zl3Var.Z(1.0f);
                float f = fZ / 2.0f;
                ho2.k(zl3Var, ((uu1) upcVar2.getValue()).a, zl3Var.Z(mr7.a) - f, 0L, new uuc(fZ, 0.0f, 0, 0, 30), 108);
                if (vj3.a(((vj3) upcVar.getValue()).a, 0.0f) > 0) {
                    ho2.k(zl3Var, ((uu1) upcVar2.getValue()).a, zl3Var.Z(((vj3) upcVar.getValue()).a) - f, 0L, ph4.R, 108);
                }
                break;
            default:
                zl3 zl3Var2 = (zl3) obj;
                zl3Var2.getClass();
                float fZ2 = zl3Var2.Z(1.0f);
                float f2 = fZ2 / 2.0f;
                ho2.k(zl3Var2, ((uu1) upcVar2.getValue()).a, zl3Var2.Z(nr7.a) - f2, 0L, new uuc(fZ2, 0.0f, 0, 0, 30), 108);
                if (vj3.a(((vj3) upcVar.getValue()).a, 0.0f) > 0) {
                    ho2.k(zl3Var2, ((uu1) upcVar2.getValue()).a, zl3Var2.Z(((vj3) upcVar.getValue()).a) - f2, 0L, ph4.R, 108);
                }
                break;
        }
        return c1eVar;
    }
}
