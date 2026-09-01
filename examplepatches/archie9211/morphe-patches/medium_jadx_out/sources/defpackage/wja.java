package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wja implements d55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ List b;
    public final /* synthetic */ stc c;
    public final /* synthetic */ sh9 d;

    public /* synthetic */ wja(List list, stc stcVar, sh9 sh9Var, int i) {
        this.a = i;
        this.b = list;
        this.c = stcVar;
        this.d = sh9Var;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        boolean z;
        boolean z2;
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
                    p65Var.Y(313962821);
                    o28 o28Var = o28.b;
                    r28 r28VarD = jfc.d(jfc.r(o28Var, 3), 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var.T;
                    int i3 = (int) (j ^ (j >>> 32));
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
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var.T;
                    int i4 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var.l();
                    r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
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
                    if (iIntValue > 0) {
                        p65Var.Y(839294461);
                        tp7.c(0.0f, 6, 6, 0L, p65Var, w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                        z = false;
                    } else {
                        z = false;
                        p65Var.Y(817194964);
                    }
                    p65Var.p(z);
                    il7.k(dr9Var, this.c, this.d, null, null, p65Var, 0, 24);
                    b09.H(p65Var, true, true, z);
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
                    dr9 dr9Var2 = (dr9) list.get(iIntValue3);
                    p65Var2.Y(-777800003);
                    jp7 jp7Var = (jp7) p65Var2.j(kt7.a);
                    o28 o28Var2 = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var2, 3, 1.0f);
                    zk7 zk7VarC3 = dy0.c(z46.h, false);
                    long j3 = p65Var2.T;
                    int i6 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var2.l();
                    r28 r28VarR3 = gx1.R(p65Var2, r28VarJ);
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
                    r28 r28VarD3 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC4 = dy0.c(z46.d, false);
                    long j4 = p65Var2.T;
                    int i7 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL4 = p65Var2.l();
                    r28 r28VarR4 = gx1.R(p65Var2, r28VarD3);
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
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
                    long j5 = p65Var2.T;
                    int i8 = (int) (j5 ^ (j5 >>> 32));
                    i89 i89VarL5 = p65Var2.l();
                    r28 r28VarR5 = gx1.R(p65Var2, o28Var2);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar5, wv1VarA);
                    tp7.B(p65Var2, cuVar6, i89VarL5);
                    ka1.z(i8, p65Var2, cuVar7, p65Var2, fnVar2);
                    tp7.B(p65Var2, cuVar8, r28VarR5);
                    il7.k(dr9Var2, this.c, this.d, null, null, p65Var2, 0, 24);
                    tp7.c(0.0f, 6, 6, 0L, p65Var2, jfc.d(w2g.E(o28Var2, 24.0f, 0.0f, 2), 1.0f));
                    ho2.N(p65Var2, true, true, true, false);
                }
                break;
            case 2:
                xr6 xr6Var3 = (xr6) obj;
                int iIntValue5 = ((Number) obj2).intValue();
                x12 x12Var3 = (x12) obj3;
                int iIntValue6 = ((Number) obj4).intValue();
                int i9 = (iIntValue6 & 6) == 0 ? iIntValue6 | (((p65) x12Var3).f(xr6Var3) ? 4 : 2) : iIntValue6;
                if ((iIntValue6 & 48) == 0) {
                    i9 |= ((p65) x12Var3).d(iIntValue5) ? 32 : 16;
                }
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(i9 & 1, (i9 & 147) != 146)) {
                    p65Var3.S();
                } else {
                    dr9 dr9Var3 = (dr9) list.get(iIntValue5);
                    p65Var3.Y(1058558257);
                    il7.k(dr9Var3, this.c, this.d, null, null, p65Var3, 0, 24);
                    tp7.c(0.0f, 6, 4, ((zo7) p65Var3.j(kt7.b)).x, p65Var3, jfc.d(w2g.G(o28.b, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f));
                    p65Var3.p(false);
                }
                break;
            default:
                xr6 xr6Var4 = (xr6) obj;
                int iIntValue7 = ((Number) obj2).intValue();
                x12 x12Var4 = (x12) obj3;
                int iIntValue8 = ((Number) obj4).intValue();
                int i10 = (iIntValue8 & 6) == 0 ? iIntValue8 | (((p65) x12Var4).f(xr6Var4) ? 4 : 2) : iIntValue8;
                if ((iIntValue8 & 48) == 0) {
                    i10 |= ((p65) x12Var4).d(iIntValue7) ? 32 : 16;
                }
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(i10 & 1, (i10 & 147) != 146)) {
                    p65Var4.S();
                } else {
                    dr9 dr9Var4 = (dr9) list.get(iIntValue7);
                    p65Var4.Y(1175281098);
                    r28 r28VarX = ho2.x((jp7) p65Var4.j(kt7.a), km4.k(xr6Var4), 3, 1.0f);
                    zk7 zk7VarC5 = dy0.c(z46.h, false);
                    long j6 = p65Var4.T;
                    int i11 = (int) (j6 ^ (j6 >>> 32));
                    i89 i89VarL6 = p65Var4.l();
                    r28 r28VarR6 = gx1.R(p65Var4, r28VarX);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var3);
                    } else {
                        p65Var4.m0();
                    }
                    cu cuVar9 = q12.f;
                    tp7.B(p65Var4, cuVar9, zk7VarC5);
                    cu cuVar10 = q12.e;
                    tp7.B(p65Var4, cuVar10, i89VarL6);
                    Integer numValueOf3 = Integer.valueOf(i11);
                    cu cuVar11 = q12.g;
                    tp7.B(p65Var4, cuVar11, numValueOf3);
                    fn fnVar3 = q12.h;
                    tp7.y(p65Var4, fnVar3);
                    cu cuVar12 = q12.d;
                    tp7.B(p65Var4, cuVar12, r28VarR6);
                    o28 o28Var3 = o28.b;
                    r28 r28VarD4 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC6 = dy0.c(z46.d, false);
                    long j7 = p65Var4.T;
                    int i12 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL7 = p65Var4.l();
                    r28 r28VarR7 = gx1.R(p65Var4, r28VarD4);
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var3);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, cuVar9, zk7VarC6);
                    tp7.B(p65Var4, cuVar10, i89VarL7);
                    ka1.z(i12, p65Var4, cuVar11, p65Var4, fnVar3);
                    tp7.B(p65Var4, cuVar12, r28VarR7);
                    wv1 wv1VarA2 = uv1.a(qb8.c, z46.p, p65Var4, 0);
                    long j8 = p65Var4.T;
                    int i13 = (int) (j8 ^ (j8 >>> 32));
                    i89 i89VarL8 = p65Var4.l();
                    r28 r28VarR8 = gx1.R(p65Var4, o28Var3);
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var3);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, cuVar9, wv1VarA2);
                    tp7.B(p65Var4, cuVar10, i89VarL8);
                    ka1.z(i13, p65Var4, cuVar11, p65Var4, fnVar3);
                    tp7.B(p65Var4, cuVar12, r28VarR8);
                    if (iIntValue7 > 0) {
                        p65Var4.Y(-129378731);
                        tp7.c(0.0f, 6, 6, 0L, p65Var4, w2g.G(o28Var3, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                        z2 = false;
                    } else {
                        z2 = false;
                        p65Var4.Y(-157601100);
                    }
                    p65Var4.p(z2);
                    il7.k(dr9Var4, this.c, this.d, null, null, p65Var4, 0, 24);
                    ho2.N(p65Var4, true, true, true, z2);
                }
                break;
        }
        return c1eVar;
    }
}
