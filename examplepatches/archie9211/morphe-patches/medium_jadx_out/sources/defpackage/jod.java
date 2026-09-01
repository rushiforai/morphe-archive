package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jod implements b55 {
    public final /* synthetic */ float a;
    public final /* synthetic */ long b;
    public final /* synthetic */ mz1 c;

    public jod(float f, long j, mz1 mz1Var) {
        this.a = f;
        this.b = j;
        this.c = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            jy8 jy8Var = kod.a;
            r28 r28VarB = w2g.B(jfc.o(o28.b, 40.0f, 24.0f, this.a, 0.0f, 8), kod.a);
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarB);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            k40.d(new o10[]{b09.q(this.b, c82.a), jjd.a.a(pyd.a(ca9.d, p65Var))}, this.c, p65Var, 8);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
