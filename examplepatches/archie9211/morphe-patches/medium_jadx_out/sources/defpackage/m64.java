package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m64 implements d55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ List b;
    public final /* synthetic */ sh9 c;

    public /* synthetic */ m64(List list, sh9 sh9Var, int i) {
        this.a = i;
        this.b = list;
        this.c = sh9Var;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        boolean z;
        int i = this.a;
        c1e c1eVar = c1e.a;
        List list = this.b;
        switch (i) {
            case 0:
                xr6 xr6Var = (xr6) obj;
                int iIntValue = ((Number) obj2).intValue();
                x12 x12Var = (x12) obj3;
                int iIntValue2 = ((Number) obj4).intValue();
                int i2 = (iIntValue2 & 6) == 0 ? iIntValue2 | (((p65) x12Var).f(xr6Var) ? 4 : 2) : iIntValue2;
                if ((iIntValue2 & 48) == 0) {
                    i2 |= ((p65) x12Var).d(iIntValue) ? 32 : 16;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(i2 & 1, (i2 & 147) != 146)) {
                    p65Var.S();
                } else {
                    dr9 dr9Var = (dr9) list.get(iIntValue);
                    p65Var.Y(-295060910);
                    nk7.q(dr9Var, ig5.TwoForOne, this.c, jfc.f(jfc.p(o28.b, 264.0f), 320.0f, 0.0f, 2), new jy8(12.0f, 32.0f, 4.0f, 20.0f), p65Var, 3120, 0);
                    p65Var.p(false);
                }
                break;
            default:
                xr6 xr6Var2 = (xr6) obj;
                int iIntValue3 = ((Number) obj2).intValue();
                x12 x12Var2 = (x12) obj3;
                int iIntValue4 = ((Number) obj4).intValue();
                int i3 = (iIntValue4 & 6) == 0 ? iIntValue4 | (((p65) x12Var2).f(xr6Var2) ? 4 : 2) : iIntValue4;
                if ((iIntValue4 & 48) == 0) {
                    i3 |= ((p65) x12Var2).d(iIntValue3) ? 32 : 16;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
                    p65Var2.S();
                } else {
                    dr9 dr9Var2 = (dr9) list.get(iIntValue3);
                    p65Var2.Y(-176989060);
                    o28 o28Var = o28.b;
                    r28 r28VarD = jfc.d(jfc.r(o28Var, 3), 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var2.T;
                    int i4 = (int) (j ^ (j >>> 32));
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
                    Integer numValueOf = Integer.valueOf(i4);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var2, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var2, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var2, cuVar4, r28VarR);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var2.T;
                    int i5 = (int) (j2 ^ (j2 >>> 32));
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
                    ka1.z(i5, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR2);
                    if (iIntValue3 > 0) {
                        p65Var2.Y(447858520);
                        tp7.c(0.0f, 6, 6, 0L, p65Var2, w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                        z = false;
                    } else {
                        z = false;
                        p65Var2.Y(428115767);
                    }
                    p65Var2.p(z);
                    il7.k(dr9Var2, stc.M, this.c, null, null, p65Var2, 48, 24);
                    b09.H(p65Var2, true, true, z);
                }
                break;
        }
        return c1eVar;
    }
}
