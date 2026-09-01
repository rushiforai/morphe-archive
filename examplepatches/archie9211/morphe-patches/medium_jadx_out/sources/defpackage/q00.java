package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class q00 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ y3f b;
    public final /* synthetic */ hy8 c;
    public final /* synthetic */ mz1 d;

    public /* synthetic */ q00(y3f y3fVar, hy8 hy8Var, mz1 mz1Var, int i) {
        this.a = i;
        this.b = y3fVar;
        this.c = hy8Var;
        this.d = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        mz1 mz1Var = this.d;
        hy8 hy8Var = this.c;
        y3f y3fVar = this.b;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    sn3 sn3Var = w72.a;
                    long j = ((uu1) p65Var.j(d82.a)).a;
                    k40.c(sn3Var.a(Float.valueOf((!((sv1) p65Var.j(tv1.a)).f() ? ((double) op8.f0(j)) < 0.5d : ((double) op8.f0(j)) > 0.5d) ? 0.6f : 0.74f)), pxf.E(597057613, new q00(y3fVar, hy8Var, mz1Var, i2), p65Var), p65Var, 56);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    r28 r28VarE = jfc.e(w2g.B(op8.p0(jfc.d(o28.b, 1.0f), y3fVar), hy8Var), 56.0f);
                    omb ombVarA = nmb.a(qb8.a, z46.n, p65Var2, 54);
                    int iS = w2g.s(p65Var2);
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, r28VarE);
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
