package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ss4 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ m45 e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ j55 g;

    public /* synthetic */ ss4(r28 r28Var, boolean z, tkb tkbVar, boolean z2, m45 m45Var, mz1 mz1Var) {
        this.b = r28Var;
        this.c = z;
        this.f = tkbVar;
        this.d = z2;
        this.e = m45Var;
        this.g = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        j55 j55Var = this.g;
        Object obj3 = this.f;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                vx0.g(this.c, (xn7) obj3, this.e, (m45) j55Var, this.b, this.d, (x12) obj, tr7.y(49));
                break;
            default:
                w06 w06Var = (w06) obj3;
                mz1 mz1Var = (mz1) j55Var;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    r28 r28VarD = jfc.d(hlg.P(this.b, this.c, null, w06Var, this.d, new vkb(4), this.e), 1.0f);
                    wv1 wv1VarA = uv1.a(qb8.e, z46.q, p65Var, 54);
                    int iS = w2g.s(p65Var);
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarD);
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
                    mz1Var.f(xv1.a, p65Var, 6);
                    p65Var.p(true);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ss4(boolean z, xn7 xn7Var, m45 m45Var, m45 m45Var2, r28 r28Var, boolean z2, int i) {
        this.c = z;
        this.f = xn7Var;
        this.e = m45Var;
        this.g = m45Var2;
        this.b = r28Var;
        this.d = z2;
    }
}
