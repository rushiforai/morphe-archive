package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rw0 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ float b;
    public final /* synthetic */ mz1 c;

    public rw0(float f, mz1 mz1Var) {
        this.b = f;
        this.c = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        mz1 mz1Var = this.c;
        float f = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    mz1Var.f(w2g.h(0.0f, 0.0f, 0.0f, f, 7), p65Var, 0);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    r28 r28VarA = jfc.a(o28.b, f, 56.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    int iS = w2g.s(p65Var2);
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, r28VarA);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, zk7VarC);
                    tp7.B(p65Var2, q12.e, i89VarL);
                    cu cuVar = q12.g;
                    if (p65Var2.S || !g76.L(p65Var2.M(), Integer.valueOf(iS))) {
                        lv8.w(iS, p65Var2, iS, cuVar);
                    }
                    tp7.B(p65Var2, q12.d, r28VarR);
                    km4.H(0, mz1Var, p65Var2, true);
                }
                break;
        }
        return c1eVar;
    }

    public rw0(mz1 mz1Var, float f) {
        this.c = mz1Var;
        this.b = f;
    }
}
