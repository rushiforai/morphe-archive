package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class un7 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ mz1 b;

    public /* synthetic */ un7(mz1 mz1Var, int i) {
        this.a = i;
        this.b = mz1Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        mz1 mz1Var = this.b;
        switch (i) {
            case 0:
                hy8 hy8Var = (hy8) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    p65Var.S();
                } else {
                    mz1Var.f(hy8Var, p65Var, Integer.valueOf(iIntValue & 14));
                }
                break;
            case 1:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                } else {
                    mz1Var.invoke(p65Var2, 0);
                }
                break;
            case 2:
                xv1 xv1Var = (xv1) obj;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                xv1Var.getClass();
                if ((iIntValue3 & 6) == 0) {
                    iIntValue3 |= ((p65) x12Var3).f(xv1Var) ? 4 : 2;
                }
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 19) != 18)) {
                    p65Var3.S();
                } else {
                    mz1Var.f(xv1Var, p65Var3, Integer.valueOf(iIntValue3 & 14));
                }
                break;
            default:
                gq4 gq4Var = (gq4) obj;
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                gq4Var.getClass();
                if ((iIntValue4 & 6) == 0) {
                    iIntValue4 |= ((p65) x12Var4).f(gq4Var) ? 4 : 2;
                }
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 19) != 18)) {
                    p65Var4.S();
                } else {
                    if (1.0f <= 0.0d) {
                        z16.a("invalid weight; must be greater than zero");
                    }
                    mz1Var.k(gq4Var, new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), p65Var4, Integer.valueOf(iIntValue4 & 14));
                }
                break;
        }
        return c1eVar;
    }
}
