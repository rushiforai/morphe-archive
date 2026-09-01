package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class t implements c55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ String b;
    public final /* synthetic */ List c;
    public final /* synthetic */ iaa d;

    public /* synthetic */ t(String str, List list, iaa iaaVar) {
        this.b = str;
        this.c = list;
        this.d = iaaVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((gq4) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    for (k9d k9dVar : this.c) {
                        iaa iaaVar = this.d;
                        boolean zF = p65Var.f(iaaVar);
                        Object objM = p65Var.M();
                        uob uobVar = w12.a;
                        if (zF || objM == uobVar) {
                            objM = new k6c(3, iaaVar);
                            p65Var.j0(objM);
                        }
                        b55 b55Var = (b55) objM;
                        boolean zF2 = p65Var.f(iaaVar);
                        String str = this.b;
                        boolean zF3 = zF2 | p65Var.f(str);
                        Object objM2 = p65Var.M();
                        if (zF3 || objM2 == uobVar) {
                            objM2 = new r(iaaVar, i2, str);
                            p65Var.j0(objM2);
                        }
                        fo7.z(k9dVar, b55Var, (b55) objM2, null, p65Var, 0);
                    }
                } else {
                    p65Var.S();
                }
                break;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    o28 o28Var = o28.b;
                    r28 r28VarD = jfc.d(jfc.r(o28Var, 3), 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var2.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, r28VarD);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var2, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var2, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i3);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var2, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var2, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var2, cuVar4, r28VarR);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var2.T;
                    int i4 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarD2);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar, zk7VarC2);
                    tp7.B(p65Var2, cuVar2, i89VarL2);
                    ka1.z(i4, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR2);
                    rv8.a(this.b, this.c, this.d, null, p65Var2, 0);
                    p65Var2.p(true);
                    p65Var2.p(true);
                } else {
                    p65Var2.S();
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ t(List list, iaa iaaVar, String str) {
        this.c = list;
        this.d = iaaVar;
        this.b = str;
    }
}
