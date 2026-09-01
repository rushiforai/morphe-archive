package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vl1 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ float b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public vl1(float f, hy8 hy8Var, long j, mz1 mz1Var, long j2) {
        this.b = f;
        this.c = hy8Var;
        this.d = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.d;
        float f = this.b;
        Object obj4 = this.c;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    o28 o28Var = o28.b;
                    r28 r28VarB = w2g.B(jfc.b(o28Var, 0.0f, f, 1), (hy8) obj4);
                    Object objM = p65Var.M();
                    if (objM == w12.a) {
                        objM = new yl1();
                        p65Var.j0(objM);
                    }
                    yl1 yl1Var = (yl1) objM;
                    mz1 mz1Var = (mz1) obj3;
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
                    cu cuVar = q12.f;
                    tp7.B(p65Var, cuVar, yl1Var);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var, cuVar2, i89VarL);
                    cu cuVar3 = q12.g;
                    if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                        lv8.w(iS, p65Var, iS, cuVar3);
                    }
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var, cuVar4, r28VarR);
                    p65Var.Y(-410471693);
                    p65Var.p(false);
                    r28 r28VarJ = kng.J(o28Var, "label");
                    jy8 jy8Var = wl1.a;
                    r28 r28VarD = w2g.D(r28VarJ, 8.0f, 0.0f);
                    omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 54);
                    int iS2 = w2g.s(p65Var);
                    i89 i89VarL2 = p65Var.l();
                    r28 r28VarR2 = gx1.R(p65Var, r28VarD);
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, cuVar, ombVarA);
                    tp7.B(p65Var, cuVar2, i89VarL2);
                    if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS2))) {
                        lv8.w(iS2, p65Var, iS2, cuVar3);
                    }
                    tp7.B(p65Var, cuVar4, r28VarR2);
                    mz1Var.invoke(p65Var, 0);
                    p65Var.p(true);
                    p65Var.Y(-409588813);
                    p65Var.p(false);
                    p65Var.p(true);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                dr9 dr9Var = (dr9) obj4;
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    nx5 nx5Var = new nx5((Context) p65Var2.j(eo.b));
                    nx5Var.c = dr9Var.b;
                    nx5Var.r = dqb.FILL;
                    ord[] ordVarArr = {new gmb(f, f, f, f)};
                    q84 q84Var = tx5.a;
                    tx5.b(nx5Var, k80.Q0(ordVarArr));
                    ur7.b(nx5Var.a(), dr9Var.b.getAlt(), (r28) obj3, hlg.O(((zo7) p65Var2.j(kt7.b)).c, p65Var2), null, null, null, null, null, null, p65Var2, 0, 0, 32752);
                }
                break;
        }
        return c1eVar;
    }

    public vl1(dr9 dr9Var, float f, r28 r28Var) {
        this.c = dr9Var;
        this.b = f;
        this.d = r28Var;
    }
}
