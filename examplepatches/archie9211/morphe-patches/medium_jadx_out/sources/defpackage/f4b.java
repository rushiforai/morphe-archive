package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class f4b implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ String b;
    public final /* synthetic */ x45 c;

    public /* synthetic */ f4b(int i, x45 x45Var, String str) {
        this.b = str;
        this.c = x45Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        x45 x45Var = this.c;
        String str = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    boolean zF = p65Var.f(x45Var) | p65Var.f(str);
                    Object objM = p65Var.M();
                    if (zF || objM == w12.a) {
                        objM = new g4b(0, x45Var, str);
                        p65Var.j0(objM);
                    }
                    f76.w((m45) objM, null, false, null, null, null, rx0.c, p65Var, 805306368, 510);
                }
                break;
            default:
                ((Integer) obj2).getClass();
                tr7.e(str, x45Var, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ f4b(String str, x45 x45Var) {
        this.c = x45Var;
        this.b = str;
    }
}
