package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class n11 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ hy8 b;
    public final /* synthetic */ mz1 c;

    public /* synthetic */ n11(hy8 hy8Var, mz1 mz1Var, int i) {
        this.a = i;
        this.b = hy8Var;
        this.c = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        mz1 mz1Var = this.c;
        hy8 hy8Var = this.b;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    kjd.a(((myd) p65Var.j(qyd.b)).k, pxf.E(165539859, new n11(hy8Var, mz1Var, i2), p65Var), p65Var, 48);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    r28 r28VarB = w2g.B(jfc.a(o28.b, i11.a, i11.b), hy8Var);
                    omb ombVarA = nmb.a(qb8.e, z46.n, p65Var2, 54);
                    int iS = w2g.s(p65Var2);
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, r28VarB);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, ombVarA);
                    tp7.B(p65Var2, q12.e, i89VarL);
                    cu cuVar = q12.g;
                    if (p65Var2.S || !g76.L(p65Var2.M(), Integer.valueOf(iS))) {
                        lv8.w(iS, p65Var2, iS, cuVar);
                    }
                    tp7.B(p65Var2, q12.d, r28VarR);
                    mz1Var.f(qmb.a, p65Var2, 6);
                    p65Var2.p(true);
                }
                break;
        }
        return c1eVar;
    }
}
