package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ep9 implements c55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ yrb b;
    public final /* synthetic */ op9 c;
    public final /* synthetic */ fp9 d;
    public final /* synthetic */ gp9 e;

    public /* synthetic */ ep9(op9 op9Var, yrb yrbVar, fp9 fp9Var, gp9 gp9Var) {
        this.c = op9Var;
        this.b = yrbVar;
        this.d = fp9Var;
        this.e = gp9Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        o28 o28Var = o28.b;
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
                if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    qo7.c(this.c, this.b, this.d, this.e, w2g.B(o28Var, hy8Var), p65Var, 0);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    op9 op9Var = this.c;
                    boolean z = op9Var instanceof lp9;
                    r28 r28VarR = wgf.R(o28Var, this.b, z, 12);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
                    long j = p65Var2.T;
                    int i2 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarR);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, wv1VarA);
                    tp7.B(p65Var2, q12.e, i89VarL);
                    tp7.B(p65Var2, q12.g, Integer.valueOf(i2));
                    tp7.y(p65Var2, q12.h);
                    tp7.B(p65Var2, q12.d, r28VarR2);
                    fp9 fp9Var = this.d;
                    if (z) {
                        p65Var2.Y(957655107);
                        qo7.d((lp9) op9Var, fp9Var, this.e, p65Var2, 0);
                        p65Var2.p(false);
                    } else if (op9Var instanceof mp9) {
                        p65Var2.Y(957662320);
                        qo7.e((mp9) op9Var, fp9Var, p65Var2, 0);
                        p65Var2.p(false);
                    } else {
                        if (!(op9Var instanceof np9)) {
                            throw ho2.L(p65Var2, 957652958, false);
                        }
                        p65Var2.Y(957667917);
                        qo7.f(p65Var2, 0);
                        p65Var2.p(false);
                    }
                    p65Var2.p(true);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
        }
    }

    public /* synthetic */ ep9(yrb yrbVar, op9 op9Var, fp9 fp9Var, gp9 gp9Var) {
        this.b = yrbVar;
        this.c = op9Var;
        this.d = fp9Var;
        this.e = gp9Var;
    }
}
