package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nd implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ b55 b;
    public final /* synthetic */ mz1 c;

    public /* synthetic */ nd(b55 b55Var, mz1 mz1Var, int i) {
        this.a = i;
        this.b = b55Var;
        this.c = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        mz1 mz1Var = this.c;
        b55 b55Var = this.b;
        int i2 = 1;
        int i3 = 0;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    if (b55Var == null) {
                        p65Var.Y(-1102039173);
                    } else {
                        p65Var.Y(795734342);
                        b55Var.invoke(p65Var, 0);
                    }
                    p65Var.p(false);
                    mz1Var.invoke(p65Var, 0);
                }
                break;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    if (b55Var == null) {
                        p65Var2.Y(690531395);
                    } else {
                        p65Var2.Y(-254819458);
                        b55Var.invoke(p65Var2, 0);
                    }
                    p65Var2.p(false);
                    mz1Var.invoke(p65Var2, 0);
                }
                break;
            case 2:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Number) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    jy8 jy8Var = qd.a;
                    qd.b(pxf.E(-459506658, new nd(b55Var, mz1Var, i3), p65Var3), p65Var3, 438);
                }
                break;
            default:
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Number) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    r28 r28VarD = w2g.D(jfc.d(o28.b, 1.0f), 8.0f, 2.0f);
                    zk7 zk7VarC = dy0.c(z46.d, false);
                    int iS = w2g.s(p65Var4);
                    i89 i89VarL = p65Var4.l();
                    r28 r28VarR = gx1.R(p65Var4, r28VarD);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, q12.f, zk7VarC);
                    tp7.B(p65Var4, q12.e, i89VarL);
                    cu cuVar = q12.g;
                    if (p65Var4.S || !g76.L(p65Var4.M(), Integer.valueOf(iS))) {
                        lv8.w(iS, p65Var4, iS, cuVar);
                    }
                    tp7.B(p65Var4, q12.d, r28VarR);
                    rd.c(pxf.E(-1975681962, new nd(b55Var, mz1Var, i2), p65Var4), p65Var4, 438);
                    p65Var4.p(true);
                }
                break;
        }
        return c1eVar;
    }
}
