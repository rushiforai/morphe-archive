package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ef implements d55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ List b;
    public final /* synthetic */ e9d c;

    public /* synthetic */ ef(List list, e9d e9dVar, int i) {
        this.a = i;
        this.b = list;
        this.c = e9dVar;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
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
                    ybd ybdVar = (ybd) list.get(iIntValue);
                    p65Var.Y(-292571199);
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
                    en7.g(ybdVar, this.c, null, p65Var, 0, 4);
                    b09.H(p65Var, true, true, false);
                }
                break;
            case 1:
                xr6 xr6Var2 = (xr6) obj;
                int iIntValue3 = ((Number) obj2).intValue();
                x12 x12Var2 = (x12) obj3;
                int iIntValue4 = ((Number) obj4).intValue();
                int i5 = (iIntValue4 & 6) == 0 ? iIntValue4 | (((p65) x12Var2).f(xr6Var2) ? 4 : 2) : iIntValue4;
                if ((iIntValue4 & 48) == 0) {
                    i5 |= ((p65) x12Var2).d(iIntValue3) ? 32 : 16;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(i5 & 1, (i5 & 147) != 146)) {
                    p65Var2.S();
                } else {
                    ybd ybdVar2 = (ybd) list.get(iIntValue3);
                    p65Var2.Y(822138616);
                    jp7 jp7Var2 = (jp7) p65Var2.j(kt7.a);
                    o28 o28Var2 = o28.b;
                    r28 r28VarJ2 = ka1.j(jp7Var2, o28Var2, 3, 1.0f);
                    zk7 zk7VarC3 = dy0.c(z46.h, false);
                    long j3 = p65Var2.T;
                    int i6 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var2.l();
                    r28 r28VarR3 = gx1.R(p65Var2, r28VarJ2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    cu cuVar5 = q12.f;
                    tp7.B(p65Var2, cuVar5, zk7VarC3);
                    cu cuVar6 = q12.e;
                    tp7.B(p65Var2, cuVar6, i89VarL3);
                    Integer numValueOf2 = Integer.valueOf(i6);
                    cu cuVar7 = q12.g;
                    tp7.B(p65Var2, cuVar7, numValueOf2);
                    fn fnVar2 = q12.h;
                    tp7.y(p65Var2, fnVar2);
                    cu cuVar8 = q12.d;
                    tp7.B(p65Var2, cuVar8, r28VarR3);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC4 = dy0.c(z46.d, false);
                    long j4 = p65Var2.T;
                    int i7 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL4 = p65Var2.l();
                    r28 r28VarR4 = gx1.R(p65Var2, r28VarD2);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar5, zk7VarC4);
                    tp7.B(p65Var2, cuVar6, i89VarL4);
                    ka1.z(i7, p65Var2, cuVar7, p65Var2, fnVar2);
                    tp7.B(p65Var2, cuVar8, r28VarR4);
                    en7.g(ybdVar2, this.c, null, p65Var2, 0, 4);
                    b09.H(p65Var2, true, true, false);
                }
                break;
            case 2:
                xr6 xr6Var3 = (xr6) obj;
                int iIntValue5 = ((Number) obj2).intValue();
                x12 x12Var3 = (x12) obj3;
                int iIntValue6 = ((Number) obj4).intValue();
                int i8 = (iIntValue6 & 6) == 0 ? iIntValue6 | (((p65) x12Var3).f(xr6Var3) ? 4 : 2) : iIntValue6;
                if ((iIntValue6 & 48) == 0) {
                    i8 |= ((p65) x12Var3).d(iIntValue5) ? 32 : 16;
                }
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(i8 & 1, (i8 & 147) != 146)) {
                    p65Var3.S();
                } else {
                    ybd ybdVar3 = (ybd) list.get(iIntValue5);
                    p65Var3.Y(1471881307);
                    jp7 jp7Var3 = (jp7) p65Var3.j(kt7.a);
                    o28 o28Var3 = o28.b;
                    r28 r28VarJ3 = ka1.j(jp7Var3, o28Var3, 3, 1.0f);
                    zk7 zk7VarC5 = dy0.c(z46.h, false);
                    long j5 = p65Var3.T;
                    int i9 = (int) (j5 ^ (j5 >>> 32));
                    i89 i89VarL5 = p65Var3.l();
                    r28 r28VarR5 = gx1.R(p65Var3, r28VarJ3);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var3);
                    } else {
                        p65Var3.m0();
                    }
                    cu cuVar9 = q12.f;
                    tp7.B(p65Var3, cuVar9, zk7VarC5);
                    cu cuVar10 = q12.e;
                    tp7.B(p65Var3, cuVar10, i89VarL5);
                    Integer numValueOf3 = Integer.valueOf(i9);
                    cu cuVar11 = q12.g;
                    tp7.B(p65Var3, cuVar11, numValueOf3);
                    fn fnVar3 = q12.h;
                    tp7.y(p65Var3, fnVar3);
                    cu cuVar12 = q12.d;
                    tp7.B(p65Var3, cuVar12, r28VarR5);
                    r28 r28VarD3 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC6 = dy0.c(z46.d, false);
                    long j6 = p65Var3.T;
                    int i10 = (int) (j6 ^ (j6 >>> 32));
                    i89 i89VarL6 = p65Var3.l();
                    r28 r28VarR6 = gx1.R(p65Var3, r28VarD3);
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var3);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, cuVar9, zk7VarC6);
                    tp7.B(p65Var3, cuVar10, i89VarL6);
                    ka1.z(i10, p65Var3, cuVar11, p65Var3, fnVar3);
                    tp7.B(p65Var3, cuVar12, r28VarR6);
                    en7.g(ybdVar3, this.c, null, p65Var3, 0, 4);
                    b09.H(p65Var3, true, true, false);
                }
                break;
            default:
                xr6 xr6Var4 = (xr6) obj;
                int iIntValue7 = ((Number) obj2).intValue();
                x12 x12Var4 = (x12) obj3;
                int iIntValue8 = ((Number) obj4).intValue();
                int i11 = (iIntValue8 & 6) == 0 ? iIntValue8 | (((p65) x12Var4).f(xr6Var4) ? 4 : 2) : iIntValue8;
                if ((iIntValue8 & 48) == 0) {
                    i11 |= ((p65) x12Var4).d(iIntValue7) ? 32 : 16;
                }
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(i11 & 1, (i11 & 147) != 146)) {
                    p65Var4.S();
                } else {
                    ybd ybdVar4 = (ybd) list.get(iIntValue7);
                    p65Var4.Y(1360771433);
                    jp7 jp7Var4 = (jp7) p65Var4.j(kt7.a);
                    o28 o28Var4 = o28.b;
                    r28 r28VarJ4 = ka1.j(jp7Var4, o28Var4, 3, 1.0f);
                    zk7 zk7VarC7 = dy0.c(z46.h, false);
                    long j7 = p65Var4.T;
                    int i12 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL7 = p65Var4.l();
                    r28 r28VarR7 = gx1.R(p65Var4, r28VarJ4);
                    r12.W.getClass();
                    ot2 ot2Var4 = q12.b;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var4);
                    } else {
                        p65Var4.m0();
                    }
                    cu cuVar13 = q12.f;
                    tp7.B(p65Var4, cuVar13, zk7VarC7);
                    cu cuVar14 = q12.e;
                    tp7.B(p65Var4, cuVar14, i89VarL7);
                    Integer numValueOf4 = Integer.valueOf(i12);
                    cu cuVar15 = q12.g;
                    tp7.B(p65Var4, cuVar15, numValueOf4);
                    fn fnVar4 = q12.h;
                    tp7.y(p65Var4, fnVar4);
                    cu cuVar16 = q12.d;
                    tp7.B(p65Var4, cuVar16, r28VarR7);
                    r28 r28VarD4 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC8 = dy0.c(z46.d, false);
                    long j8 = p65Var4.T;
                    int i13 = (int) (j8 ^ (j8 >>> 32));
                    i89 i89VarL8 = p65Var4.l();
                    r28 r28VarR8 = gx1.R(p65Var4, r28VarD4);
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var4);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, cuVar13, zk7VarC8);
                    tp7.B(p65Var4, cuVar14, i89VarL8);
                    ka1.z(i13, p65Var4, cuVar15, p65Var4, fnVar4);
                    tp7.B(p65Var4, cuVar16, r28VarR8);
                    r28 r28VarE = w2g.E(o28Var4, 0.0f, 8.0f, 1);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var4, 0);
                    long j9 = p65Var4.T;
                    int i14 = (int) (j9 ^ (j9 >>> 32));
                    i89 i89VarL9 = p65Var4.l();
                    r28 r28VarR9 = gx1.R(p65Var4, r28VarE);
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var4);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, cuVar13, wv1VarA);
                    tp7.B(p65Var4, cuVar14, i89VarL9);
                    ka1.z(i14, p65Var4, cuVar15, p65Var4, fnVar4);
                    tp7.B(p65Var4, cuVar16, r28VarR9);
                    en7.g(ybdVar4, this.c, w2g.G(o28Var4, 0.0f, 0.0f, 0.0f, 8.0f, 7), p65Var4, 384, 0);
                    tp7.c(0.0f, 6, 4, ((zo7) p65Var4.j(kt7.b)).x, p65Var4, jfc.d(w2g.G(o28Var4, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f));
                    ho2.N(p65Var4, true, true, true, false);
                }
                break;
        }
        return c1eVar;
    }
}
