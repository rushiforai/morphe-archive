package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class id3 implements c55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;

    public /* synthetic */ id3(int i, he3 he3Var) {
        this.b = i;
        this.c = he3Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        r28 r28VarG;
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.b;
        Object obj4 = this.c;
        switch (i) {
            case 0:
                he3 he3Var = (he3) obj4;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    p65Var.S();
                } else {
                    jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                    o28 o28Var = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarJ);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i3);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var.T;
                    int i4 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var.l();
                    r28 r28VarR2 = gx1.R(p65Var, r28VarD);
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, cuVar, zk7VarC2);
                    tp7.B(p65Var, cuVar2, i89VarL2);
                    ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
                    tp7.B(p65Var, cuVar4, r28VarR2);
                    if (i2 > 0) {
                        p65Var.Y(-968138242);
                        r28VarG = w2g.G(flb.a0(w2g.G(o28Var, 0.0f, 24.0f, 0.0f, 0.0f, 13), ((zo7) p65Var.j(kt7.b)).c, rv8.r), 0.0f, 48.0f, 0.0f, 24.0f, 5);
                        p65Var.p(false);
                    } else {
                        p65Var.Y(-967880105);
                        p65Var.p(false);
                        r28VarG = w2g.G(o28Var, 0.0f, 40.0f, 0.0f, 0.0f, 13);
                    }
                    nk7.o(he3Var.a, r28VarG, p65Var, 0);
                    p65Var.p(true);
                    p65Var.p(true);
                }
                break;
            default:
                mz1 mz1Var = (mz1) obj4;
                xr6 xr6Var = (xr6) obj;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).f(xr6Var) ? 4 : 2;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    p65Var2.S();
                } else {
                    mz1Var.k(xr6Var, Integer.valueOf(i2), p65Var2, Integer.valueOf(iIntValue2 & 14));
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ id3(mz1 mz1Var, int i) {
        this.c = mz1Var;
        this.b = i;
    }
}
