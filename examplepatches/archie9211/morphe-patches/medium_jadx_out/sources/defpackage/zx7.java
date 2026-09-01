package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zx7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ b55 d;

    public zx7(dsd dsdVar, mz1 mz1Var, nod nodVar) {
        this.a = 2;
        this.b = dsdVar;
        this.d = mz1Var;
        this.c = nodVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.c;
        b55 b55Var = this.d;
        Object obj4 = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    r28 r28VarR = wgf.R(pwd.e0(w2g.E((r28) obj4, 0.0f, 8.0f, 1), a76.Max), (yrb) obj3, false, 14);
                    mz1 mz1Var = (mz1) b55Var;
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
                    int iS = w2g.s(p65Var);
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR2 = gx1.R(p65Var, r28VarR);
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
                    tp7.B(p65Var, q12.d, r28VarR2);
                    mz1Var.f(xv1.a, p65Var, 6);
                    p65Var.p(true);
                }
                break;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    if (1.0f <= 0.0d) {
                        z16.a("invalid weight; must be greater than zero");
                    }
                    r28 r28VarG = w2g.G(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), ((b55) obj4) != null ? 12.0f : 0.0f, 0.0f, ((b55) obj3) != null ? 12.0f : 0.0f, 0.0f, 10);
                    zk7 zk7VarC = dy0.c(z46.d, false);
                    int iS2 = w2g.s(p65Var2);
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR3 = gx1.R(p65Var2, r28VarG);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, zk7VarC);
                    tp7.B(p65Var2, q12.e, i89VarL2);
                    cu cuVar2 = q12.g;
                    if (p65Var2.S || !g76.L(p65Var2.M(), Integer.valueOf(iS2))) {
                        lv8.w(iS2, p65Var2, iS2, cuVar2);
                    }
                    tp7.B(p65Var2, q12.d, r28VarR3);
                    b55Var.invoke(p65Var2, 0);
                    p65Var2.p(true);
                }
                break;
            default:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Number) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    v12 v12Var = new v12(new m23(5, (dsd) obj4));
                    mz1 mz1Var2 = (mz1) b55Var;
                    nod nodVar = (nod) obj3;
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    int iS3 = w2g.s(p65Var3);
                    i89 i89VarL3 = p65Var3.l();
                    r28 r28VarR4 = gx1.R(p65Var3, v12Var);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var3);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, q12.f, zk7VarC2);
                    tp7.B(p65Var3, q12.e, i89VarL3);
                    cu cuVar3 = q12.g;
                    if (p65Var3.S || !g76.L(p65Var3.M(), Integer.valueOf(iS3))) {
                        lv8.w(iS3, p65Var3, iS3, cuVar3);
                    }
                    tp7.B(p65Var3, q12.d, r28VarR4);
                    mz1Var2.f(nodVar, p65Var3, 6);
                    p65Var3.p(true);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ zx7(Object obj, Object obj2, b55 b55Var, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = b55Var;
    }
}
