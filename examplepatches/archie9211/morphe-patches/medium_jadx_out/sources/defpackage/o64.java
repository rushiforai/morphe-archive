package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class o64 implements d55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ List b;
    public final /* synthetic */ cs1 c;
    public final /* synthetic */ obe d;

    public /* synthetic */ o64(List list, cs1 cs1Var, obe obeVar, int i) {
        this.a = i;
        this.b = list;
        this.c = cs1Var;
        this.d = obeVar;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i;
        int i2;
        int i3;
        int i4 = this.a;
        c1e c1eVar = c1e.a;
        List list = this.b;
        switch (i4) {
            case 0:
                xr6 xr6Var = (xr6) obj;
                int iIntValue = ((Number) obj2).intValue();
                x12 x12Var = (x12) obj3;
                int iIntValue2 = ((Number) obj4).intValue();
                if ((iIntValue2 & 6) == 0) {
                    i = iIntValue2 | (((p65) x12Var).f(xr6Var) ? 4 : 2);
                } else {
                    i = iIntValue2;
                }
                if ((iIntValue2 & 48) == 0) {
                    i |= ((p65) x12Var).d(iIntValue) ? 32 : 16;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(i & 1, (i & 147) != 146)) {
                    x2f x2fVar = (x2f) list.get(iIntValue);
                    p65Var.Y(934669499);
                    if (x2fVar instanceof v2f) {
                        p65Var.Y(-939678681);
                        dg5.a(((v2f) x2fVar).a, this.c, null, 0L, p65Var, 0, 12);
                        p65Var = p65Var;
                        p65Var.p(false);
                    } else {
                        if (!(x2fVar instanceof w2f)) {
                            throw ho2.L(p65Var, -939680696, false);
                        }
                        p65Var.Y(-939671852);
                        vg5.a(((w2f) x2fVar).a, this.d, null, p65Var, 0, 4);
                        p65Var.p(false);
                    }
                    p65Var.p(false);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                xr6 xr6Var2 = (xr6) obj;
                int iIntValue3 = ((Number) obj2).intValue();
                x12 x12Var2 = (x12) obj3;
                int iIntValue4 = ((Number) obj4).intValue();
                if ((iIntValue4 & 6) == 0) {
                    i2 = iIntValue4 | (((p65) x12Var2).f(xr6Var2) ? 4 : 2);
                } else {
                    i2 = iIntValue4;
                }
                if ((iIntValue4 & 48) == 0) {
                    i2 |= ((p65) x12Var2).d(iIntValue3) ? 32 : 16;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
                    c3f c3fVar = (c3f) list.get(iIntValue3);
                    p65Var2.Y(637976742);
                    boolean z = c3fVar instanceof a3f;
                    o28 o28Var = o28.b;
                    if (z) {
                        p65Var2.Y(638038462);
                        dg5.a(((a3f) c3fVar).a, this.c, bgf.N(o28Var, "who_to_follow_item_" + iIntValue3), 0L, p65Var2, 0, 8);
                        p65Var2 = p65Var2;
                        p65Var2.p(false);
                    } else {
                        if (!(c3fVar instanceof b3f)) {
                            throw ho2.L(p65Var2, -1919082755, false);
                        }
                        p65Var2.Y(638457520);
                        vg5.a(((b3f) c3fVar).a, this.d, bgf.N(o28Var, "who_to_follow_item_" + iIntValue3), p65Var2, 0, 0);
                        p65Var2.p(false);
                    }
                    p65Var2.p(false);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            default:
                xr6 xr6Var3 = (xr6) obj;
                int iIntValue5 = ((Number) obj2).intValue();
                x12 x12Var3 = (x12) obj3;
                int iIntValue6 = ((Number) obj4).intValue();
                if ((iIntValue6 & 6) == 0) {
                    i3 = iIntValue6 | (((p65) x12Var3).f(xr6Var3) ? 4 : 2);
                } else {
                    i3 = iIntValue6;
                }
                if ((iIntValue6 & 48) == 0) {
                    i3 |= ((p65) x12Var3).d(iIntValue5) ? 32 : 16;
                }
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(i3 & 1, (i3 & 147) != 146)) {
                    jed jedVar = (jed) list.get(iIntValue5);
                    p65Var3.Y(-1523377813);
                    jp7 jp7Var = (jp7) p65Var3.j(kt7.a);
                    o28 o28Var2 = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var2, 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var3.T;
                    int i5 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var3.l();
                    r28 r28VarR = gx1.R(p65Var3, r28VarJ);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var);
                    } else {
                        p65Var3.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var3, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var3, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i5);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var3, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var3, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var3, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var3.T;
                    int i6 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var3.l();
                    r28 r28VarR2 = gx1.R(p65Var3, r28VarD);
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, cuVar, zk7VarC2);
                    tp7.B(p65Var3, cuVar2, i89VarL2);
                    ka1.z(i6, p65Var3, cuVar3, p65Var3, fnVar);
                    tp7.B(p65Var3, cuVar4, r28VarR2);
                    if (jedVar instanceof hed) {
                        p65Var3.Y(1020369940);
                        vc2.n(((hed) jedVar).a, this.c, null, false, p65Var3, 0, 12);
                        p65Var3.p(false);
                    } else {
                        if (!(jedVar instanceof ied)) {
                            throw ho2.L(p65Var3, -1352561033, false);
                        }
                        p65Var3.Y(1020659015);
                        rr7.s(((ied) jedVar).a, this.d, null, false, p65Var3, 0, 12);
                        p65Var3.p(false);
                    }
                    b09.H(p65Var3, true, true, false);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
        }
    }
}
