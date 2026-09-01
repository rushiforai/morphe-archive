package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u61 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ mz1 b;

    public /* synthetic */ u61(mz1 mz1Var, int i) {
        this.a = i;
        this.b = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        xv1 xv1Var = xv1.a;
        o28 o28Var = o28.b;
        mz1 mz1Var = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
                    int iS = w2g.s(p65Var);
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, wv1VarA);
                    tp7.B(p65Var, q12.e, i89VarL);
                    cu cuVar = q12.g;
                    if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                        lv8.w(iS, p65Var, iS, cuVar);
                    }
                    tp7.B(p65Var, q12.d, r28VarR);
                    mz1Var.f(xv1Var, p65Var, 6);
                    p65Var.p(true);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    wv1 wv1VarA2 = uv1.a(qb8.c, z46.p, p65Var2, 0);
                    int iS2 = w2g.s(p65Var2);
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, wv1VarA2);
                    tp7.B(p65Var2, q12.e, i89VarL2);
                    cu cuVar2 = q12.g;
                    if (p65Var2.S || !g76.L(p65Var2.M(), Integer.valueOf(iS2))) {
                        lv8.w(iS2, p65Var2, iS2, cuVar2);
                    }
                    tp7.B(p65Var2, q12.d, r28VarR2);
                    mz1Var.f(xv1Var, p65Var2, 6);
                    p65Var2.p(true);
                }
                break;
        }
        return c1eVar;
    }
}
