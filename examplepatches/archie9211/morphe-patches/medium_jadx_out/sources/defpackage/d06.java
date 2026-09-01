package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class d06 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ e06 b;

    public /* synthetic */ d06(e06 e06Var, int i) {
        this.a = i;
        this.b = e06Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        e06 e06Var = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    kt7.a(false, pxf.E(176224656, new d06(e06Var, i2), p65Var), p65Var, 48);
                }
                break;
            default:
                j06 j06Var = e06Var.c;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    q58 q58Var = j06Var.b;
                    boolean zF = p65Var2.f(q58Var);
                    Object objM = p65Var2.M();
                    if (zF || objM == w12.a) {
                        objM = new k0(1, q58Var, x45.class, "invoke", "invoke(Ljava/lang/Object;)Ljava/lang/Object;", 0, 19);
                        p65Var2.j0(objM);
                    }
                    k40.r(j06Var.c, j06Var.d, j06Var.e, j06Var.f, null, j06Var.g, false, 0, (x45) ((qh6) objM), p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
