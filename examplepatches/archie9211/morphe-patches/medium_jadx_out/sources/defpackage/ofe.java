package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ofe implements c55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ ige b;
    public final /* synthetic */ rfe c;

    public /* synthetic */ ofe(rfe rfeVar, ige igeVar) {
        this.c = rfeVar;
        this.b = igeVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        rfe rfeVar = this.c;
        ige igeVar = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj2;
                ((Integer) obj3).getClass();
                ((lw) obj).getClass();
                p65 p65Var = (p65) x12Var;
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, false);
                long j = p65Var.T;
                int i2 = (int) (j ^ (j >>> 32));
                i89 i89VarL = p65Var.l();
                r28 r28VarR = gx1.R(x12Var, r28VarJ);
                r12.W.getClass();
                ot2 ot2Var = q12.b;
                p65 p65Var2 = (p65) x12Var;
                p65Var2.c0();
                if (p65Var2.S) {
                    p65Var2.k(ot2Var);
                } else {
                    p65Var2.m0();
                }
                cu cuVar = q12.f;
                tp7.B(x12Var, cuVar, zk7VarC);
                cu cuVar2 = q12.e;
                tp7.B(x12Var, cuVar2, i89VarL);
                Integer numValueOf = Integer.valueOf(i2);
                cu cuVar3 = q12.g;
                tp7.B(x12Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(x12Var, fnVar);
                cu cuVar4 = q12.d;
                tp7.B(x12Var, cuVar4, r28VarR);
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, false);
                long j2 = p65Var2.T;
                int i3 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var2.l();
                r28 r28VarR2 = gx1.R(x12Var, r28VarD);
                p65Var2.c0();
                if (p65Var2.S) {
                    p65Var2.k(ot2Var);
                } else {
                    p65Var2.m0();
                }
                tp7.B(x12Var, cuVar, zk7VarC2);
                tp7.B(x12Var, cuVar2, i89VarL2);
                tp7.B(x12Var, cuVar3, Integer.valueOf(i3));
                tp7.y(x12Var, fnVar);
                tp7.B(x12Var, cuVar4, r28VarR2);
                dl7.j(new qfe(rfeVar, igeVar), w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8), x12Var, 0);
                p65Var2.p(true);
                p65Var2.p(true);
                break;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var3 = (p65) x12Var2;
                if (!p65Var3.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    p65Var3.S();
                } else {
                    vv2.c(igeVar.b, null, null, sfe.a, null, pxf.E(-1612734531, new ofe(rfeVar, igeVar), p65Var3), p65Var3, 199680, 22);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ofe(ige igeVar, rfe rfeVar) {
        this.b = igeVar;
        this.c = rfeVar;
    }
}
