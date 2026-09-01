package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wf implements d55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ List b;
    public final /* synthetic */ obe c;

    public /* synthetic */ wf(List list, obe obeVar, int i) {
        this.a = i;
        this.b = list;
        this.c = obeVar;
    }

    private final Object a(Object obj, Object obj2, Object obj3, Object obj4) {
        int i;
        xr6 xr6Var = (xr6) obj;
        int iIntValue = ((Number) obj2).intValue();
        x12 x12Var = (x12) obj3;
        int iIntValue2 = ((Number) obj4).intValue();
        if ((iIntValue2 & 6) == 0) {
            i = (((p65) x12Var).f(xr6Var) ? 4 : 2) | iIntValue2;
        } else {
            i = iIntValue2;
        }
        if ((iIntValue2 & 48) == 0) {
            i |= ((p65) x12Var).d(iIntValue) ? 32 : 16;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(i & 1, (i & 147) != 146)) {
            hne hneVar = (hne) this.b.get(iIntValue);
            p65Var.Y(432414237);
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
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
            Integer numValueOf = Integer.valueOf(i2);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
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
            ka1.z(i3, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            rr7.s(hneVar, this.c, bgf.N(o28Var, "up_voter_item_" + iIntValue), false, p65Var, 0, 8);
            b09.H(p65Var, true, true, false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        int i10;
        boolean z;
        int i11;
        boolean z2;
        int i12;
        int i13 = this.a;
        c1e c1eVar = c1e.a;
        List list = this.b;
        switch (i13) {
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
                    hne hneVar = (hne) list.get(iIntValue);
                    p65Var.Y(-1461232636);
                    jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                    o28 o28Var = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var.T;
                    int i14 = (int) (j ^ (j >>> 32));
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
                    Integer numValueOf = Integer.valueOf(i14);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var.T;
                    int i15 = (int) (j2 ^ (j2 >>> 32));
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
                    ka1.z(i15, p65Var, cuVar3, p65Var, fnVar);
                    tp7.B(p65Var, cuVar4, r28VarR2);
                    rr7.s(hneVar, this.c, null, false, p65Var, 0, 12);
                    b09.H(p65Var, true, true, false);
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
                    hne hneVar2 = (hne) list.get(iIntValue3);
                    p65Var2.Y(193890090);
                    jp7 jp7Var2 = (jp7) p65Var2.j(kt7.a);
                    o28 o28Var2 = o28.b;
                    r28 r28VarJ2 = ka1.j(jp7Var2, o28Var2, 3, 1.0f);
                    zk7 zk7VarC3 = dy0.c(z46.h, false);
                    long j3 = p65Var2.T;
                    int i16 = (int) (j3 ^ (j3 >>> 32));
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
                    Integer numValueOf2 = Integer.valueOf(i16);
                    cu cuVar7 = q12.g;
                    tp7.B(p65Var2, cuVar7, numValueOf2);
                    fn fnVar2 = q12.h;
                    tp7.y(p65Var2, fnVar2);
                    cu cuVar8 = q12.d;
                    tp7.B(p65Var2, cuVar8, r28VarR3);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC4 = dy0.c(z46.d, false);
                    long j4 = p65Var2.T;
                    int i17 = (int) (j4 ^ (j4 >>> 32));
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
                    ka1.z(i17, p65Var2, cuVar7, p65Var2, fnVar2);
                    tp7.B(p65Var2, cuVar8, r28VarR4);
                    rr7.s(hneVar2, this.c, null, false, p65Var2, 0, 12);
                    b09.H(p65Var2, true, true, false);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
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
                    hne hneVar3 = (hne) list.get(iIntValue5);
                    p65Var3.Y(-117804324);
                    jp7 jp7Var3 = (jp7) p65Var3.j(kt7.a);
                    o28 o28Var3 = o28.b;
                    r28 r28VarJ3 = ka1.j(jp7Var3, o28Var3, 3, 1.0f);
                    zk7 zk7VarC5 = dy0.c(z46.h, false);
                    long j5 = p65Var3.T;
                    int i18 = (int) (j5 ^ (j5 >>> 32));
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
                    Integer numValueOf3 = Integer.valueOf(i18);
                    cu cuVar11 = q12.g;
                    tp7.B(p65Var3, cuVar11, numValueOf3);
                    fn fnVar3 = q12.h;
                    tp7.y(p65Var3, fnVar3);
                    cu cuVar12 = q12.d;
                    tp7.B(p65Var3, cuVar12, r28VarR5);
                    r28 r28VarD3 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC6 = dy0.c(z46.d, false);
                    long j6 = p65Var3.T;
                    int i19 = (int) (j6 ^ (j6 >>> 32));
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
                    ka1.z(i19, p65Var3, cuVar11, p65Var3, fnVar3);
                    tp7.B(p65Var3, cuVar12, r28VarR6);
                    rr7.s(hneVar3, this.c, null, false, p65Var3, 0, 12);
                    b09.H(p65Var3, true, true, false);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 3:
                xr6 xr6Var4 = (xr6) obj;
                int iIntValue7 = ((Number) obj2).intValue();
                x12 x12Var4 = (x12) obj3;
                int iIntValue8 = ((Number) obj4).intValue();
                if ((iIntValue8 & 6) == 0) {
                    i4 = iIntValue8 | (((p65) x12Var4).f(xr6Var4) ? 4 : 2);
                } else {
                    i4 = iIntValue8;
                }
                if ((iIntValue8 & 48) == 0) {
                    i4 |= ((p65) x12Var4).d(iIntValue7) ? 32 : 16;
                }
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(i4 & 1, (i4 & 147) != 146)) {
                    hne hneVar4 = (hne) list.get(iIntValue7);
                    p65Var4.Y(-16813551);
                    jp7 jp7Var4 = (jp7) p65Var4.j(kt7.a);
                    o28 o28Var4 = o28.b;
                    r28 r28VarJ4 = ka1.j(jp7Var4, o28Var4, 3, 1.0f);
                    zk7 zk7VarC7 = dy0.c(z46.h, false);
                    long j7 = p65Var4.T;
                    int i20 = (int) (j7 ^ (j7 >>> 32));
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
                    Integer numValueOf4 = Integer.valueOf(i20);
                    cu cuVar15 = q12.g;
                    tp7.B(p65Var4, cuVar15, numValueOf4);
                    fn fnVar4 = q12.h;
                    tp7.y(p65Var4, fnVar4);
                    cu cuVar16 = q12.d;
                    tp7.B(p65Var4, cuVar16, r28VarR7);
                    r28 r28VarD4 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC8 = dy0.c(z46.d, false);
                    long j8 = p65Var4.T;
                    int i21 = (int) (j8 ^ (j8 >>> 32));
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
                    ka1.z(i21, p65Var4, cuVar15, p65Var4, fnVar4);
                    tp7.B(p65Var4, cuVar16, r28VarR8);
                    rr7.s(hneVar4, this.c, null, false, p65Var4, 0, 12);
                    b09.H(p65Var4, true, true, false);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                xr6 xr6Var5 = (xr6) obj;
                int iIntValue9 = ((Number) obj2).intValue();
                x12 x12Var5 = (x12) obj3;
                int iIntValue10 = ((Number) obj4).intValue();
                if ((iIntValue10 & 6) == 0) {
                    i5 = iIntValue10 | (((p65) x12Var5).f(xr6Var5) ? 4 : 2);
                } else {
                    i5 = iIntValue10;
                }
                if ((iIntValue10 & 48) == 0) {
                    i5 |= ((p65) x12Var5).d(iIntValue9) ? 32 : 16;
                }
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(i5 & 1, (i5 & 147) != 146)) {
                    hne hneVar5 = (hne) list.get(iIntValue9);
                    p65Var5.Y(1764423127);
                    vg5.a(hneVar5, this.c, null, p65Var5, 0, 4);
                    p65Var5.p(false);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 5:
                xr6 xr6Var6 = (xr6) obj;
                int iIntValue11 = ((Number) obj2).intValue();
                x12 x12Var6 = (x12) obj3;
                int iIntValue12 = ((Number) obj4).intValue();
                if ((iIntValue12 & 6) == 0) {
                    i6 = iIntValue12 | (((p65) x12Var6).f(xr6Var6) ? 4 : 2);
                } else {
                    i6 = iIntValue12;
                }
                if ((iIntValue12 & 48) == 0) {
                    i6 |= ((p65) x12Var6).d(iIntValue11) ? 32 : 16;
                }
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(i6 & 1, (i6 & 147) != 146)) {
                    hne hneVar6 = (hne) list.get(iIntValue11);
                    p65Var6.Y(-58771774);
                    jp7 jp7Var5 = (jp7) p65Var6.j(kt7.a);
                    o28 o28Var5 = o28.b;
                    r28 r28VarJ5 = ka1.j(jp7Var5, o28Var5, 3, 1.0f);
                    zk7 zk7VarC9 = dy0.c(z46.h, false);
                    long j9 = p65Var6.T;
                    int i22 = (int) (j9 ^ (j9 >>> 32));
                    i89 i89VarL9 = p65Var6.l();
                    r28 r28VarR9 = gx1.R(p65Var6, r28VarJ5);
                    r12.W.getClass();
                    ot2 ot2Var5 = q12.b;
                    p65Var6.c0();
                    if (p65Var6.S) {
                        p65Var6.k(ot2Var5);
                    } else {
                        p65Var6.m0();
                    }
                    cu cuVar17 = q12.f;
                    tp7.B(p65Var6, cuVar17, zk7VarC9);
                    cu cuVar18 = q12.e;
                    tp7.B(p65Var6, cuVar18, i89VarL9);
                    Integer numValueOf5 = Integer.valueOf(i22);
                    cu cuVar19 = q12.g;
                    tp7.B(p65Var6, cuVar19, numValueOf5);
                    fn fnVar5 = q12.h;
                    tp7.y(p65Var6, fnVar5);
                    cu cuVar20 = q12.d;
                    tp7.B(p65Var6, cuVar20, r28VarR9);
                    r28 r28VarD5 = jfc.d(jfc.o(o28Var5, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC10 = dy0.c(z46.d, false);
                    long j10 = p65Var6.T;
                    int i23 = (int) (j10 ^ (j10 >>> 32));
                    i89 i89VarL10 = p65Var6.l();
                    r28 r28VarR10 = gx1.R(p65Var6, r28VarD5);
                    p65Var6.c0();
                    if (p65Var6.S) {
                        p65Var6.k(ot2Var5);
                    } else {
                        p65Var6.m0();
                    }
                    tp7.B(p65Var6, cuVar17, zk7VarC10);
                    tp7.B(p65Var6, cuVar18, i89VarL10);
                    ka1.z(i23, p65Var6, cuVar19, p65Var6, fnVar5);
                    tp7.B(p65Var6, cuVar20, r28VarR10);
                    rr7.s(hneVar6, this.c, null, false, p65Var6, 0, 12);
                    b09.H(p65Var6, true, true, false);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 6:
                xr6 xr6Var7 = (xr6) obj;
                int iIntValue13 = ((Number) obj2).intValue();
                x12 x12Var7 = (x12) obj3;
                int iIntValue14 = ((Number) obj4).intValue();
                if ((iIntValue14 & 6) == 0) {
                    i7 = iIntValue14 | (((p65) x12Var7).f(xr6Var7) ? 4 : 2);
                } else {
                    i7 = iIntValue14;
                }
                if ((iIntValue14 & 48) == 0) {
                    i7 |= ((p65) x12Var7).d(iIntValue13) ? 32 : 16;
                }
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(i7 & 1, (i7 & 147) != 146)) {
                    hne hneVar7 = (hne) list.get(iIntValue13);
                    p65Var7.Y(513345887);
                    jp7 jp7Var6 = (jp7) p65Var7.j(kt7.a);
                    o28 o28Var6 = o28.b;
                    r28 r28VarJ6 = ka1.j(jp7Var6, o28Var6, 3, 1.0f);
                    zk7 zk7VarC11 = dy0.c(z46.h, false);
                    long j11 = p65Var7.T;
                    int i24 = (int) (j11 ^ (j11 >>> 32));
                    i89 i89VarL11 = p65Var7.l();
                    r28 r28VarR11 = gx1.R(p65Var7, r28VarJ6);
                    r12.W.getClass();
                    ot2 ot2Var6 = q12.b;
                    p65Var7.c0();
                    if (p65Var7.S) {
                        p65Var7.k(ot2Var6);
                    } else {
                        p65Var7.m0();
                    }
                    cu cuVar21 = q12.f;
                    tp7.B(p65Var7, cuVar21, zk7VarC11);
                    cu cuVar22 = q12.e;
                    tp7.B(p65Var7, cuVar22, i89VarL11);
                    Integer numValueOf6 = Integer.valueOf(i24);
                    cu cuVar23 = q12.g;
                    tp7.B(p65Var7, cuVar23, numValueOf6);
                    fn fnVar6 = q12.h;
                    tp7.y(p65Var7, fnVar6);
                    cu cuVar24 = q12.d;
                    tp7.B(p65Var7, cuVar24, r28VarR11);
                    r28 r28VarD6 = jfc.d(jfc.o(o28Var6, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC12 = dy0.c(z46.d, false);
                    long j12 = p65Var7.T;
                    int i25 = (int) (j12 ^ (j12 >>> 32));
                    i89 i89VarL12 = p65Var7.l();
                    r28 r28VarR12 = gx1.R(p65Var7, r28VarD6);
                    p65Var7.c0();
                    if (p65Var7.S) {
                        p65Var7.k(ot2Var6);
                    } else {
                        p65Var7.m0();
                    }
                    tp7.B(p65Var7, cuVar21, zk7VarC12);
                    tp7.B(p65Var7, cuVar22, i89VarL12);
                    ka1.z(i25, p65Var7, cuVar23, p65Var7, fnVar6);
                    tp7.B(p65Var7, cuVar24, r28VarR12);
                    rr7.s(hneVar7, this.c, null, false, p65Var7, 0, 12);
                    b09.H(p65Var7, true, true, false);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 7:
                xr6 xr6Var8 = (xr6) obj;
                int iIntValue15 = ((Number) obj2).intValue();
                x12 x12Var8 = (x12) obj3;
                int iIntValue16 = ((Number) obj4).intValue();
                if ((iIntValue16 & 6) == 0) {
                    i8 = iIntValue16 | (((p65) x12Var8).f(xr6Var8) ? 4 : 2);
                } else {
                    i8 = iIntValue16;
                }
                if ((iIntValue16 & 48) == 0) {
                    i8 |= ((p65) x12Var8).d(iIntValue15) ? 32 : 16;
                }
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(i8 & 1, (i8 & 147) != 146)) {
                    hne hneVar8 = (hne) list.get(iIntValue15);
                    p65Var8.Y(-1691769183);
                    String str = "following_users_item_" + iIntValue15;
                    o28 o28Var7 = o28.b;
                    r28 r28VarX = ho2.x((jp7) p65Var8.j(kt7.a), bgf.N(o28Var7, str), 3, 1.0f);
                    zk7 zk7VarC13 = dy0.c(z46.h, false);
                    long j13 = p65Var8.T;
                    int i26 = (int) (j13 ^ (j13 >>> 32));
                    i89 i89VarL13 = p65Var8.l();
                    r28 r28VarR13 = gx1.R(p65Var8, r28VarX);
                    r12.W.getClass();
                    ot2 ot2Var7 = q12.b;
                    p65Var8.c0();
                    if (p65Var8.S) {
                        p65Var8.k(ot2Var7);
                    } else {
                        p65Var8.m0();
                    }
                    cu cuVar25 = q12.f;
                    tp7.B(p65Var8, cuVar25, zk7VarC13);
                    cu cuVar26 = q12.e;
                    tp7.B(p65Var8, cuVar26, i89VarL13);
                    Integer numValueOf7 = Integer.valueOf(i26);
                    cu cuVar27 = q12.g;
                    tp7.B(p65Var8, cuVar27, numValueOf7);
                    fn fnVar7 = q12.h;
                    tp7.y(p65Var8, fnVar7);
                    cu cuVar28 = q12.d;
                    tp7.B(p65Var8, cuVar28, r28VarR13);
                    r28 r28VarD7 = jfc.d(jfc.o(o28Var7, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC14 = dy0.c(z46.d, false);
                    long j14 = p65Var8.T;
                    int i27 = (int) (j14 ^ (j14 >>> 32));
                    i89 i89VarL14 = p65Var8.l();
                    r28 r28VarR14 = gx1.R(p65Var8, r28VarD7);
                    p65Var8.c0();
                    if (p65Var8.S) {
                        p65Var8.k(ot2Var7);
                    } else {
                        p65Var8.m0();
                    }
                    tp7.B(p65Var8, cuVar25, zk7VarC14);
                    tp7.B(p65Var8, cuVar26, i89VarL14);
                    ka1.z(i27, p65Var8, cuVar27, p65Var8, fnVar7);
                    tp7.B(p65Var8, cuVar28, r28VarR14);
                    rr7.s(hneVar8, this.c, null, false, p65Var8, 0, 12);
                    b09.H(p65Var8, true, true, false);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 8:
                xr6 xr6Var9 = (xr6) obj;
                int iIntValue17 = ((Number) obj2).intValue();
                x12 x12Var9 = (x12) obj3;
                int iIntValue18 = ((Number) obj4).intValue();
                if ((iIntValue18 & 6) == 0) {
                    i9 = iIntValue18 | (((p65) x12Var9).f(xr6Var9) ? 4 : 2);
                } else {
                    i9 = iIntValue18;
                }
                if ((iIntValue18 & 48) == 0) {
                    i9 |= ((p65) x12Var9).d(iIntValue17) ? 32 : 16;
                }
                p65 p65Var9 = (p65) x12Var9;
                if (p65Var9.P(i9 & 1, (i9 & 147) != 146)) {
                    hne hneVar9 = (hne) list.get(iIntValue17);
                    p65Var9.Y(-648604571);
                    jp7 jp7Var7 = (jp7) p65Var9.j(kt7.a);
                    o28 o28Var8 = o28.b;
                    r28 r28VarJ7 = ka1.j(jp7Var7, o28Var8, 3, 1.0f);
                    zk7 zk7VarC15 = dy0.c(z46.h, false);
                    long j15 = p65Var9.T;
                    int i28 = (int) (j15 ^ (j15 >>> 32));
                    i89 i89VarL15 = p65Var9.l();
                    r28 r28VarR15 = gx1.R(p65Var9, r28VarJ7);
                    r12.W.getClass();
                    ot2 ot2Var8 = q12.b;
                    p65Var9.c0();
                    if (p65Var9.S) {
                        p65Var9.k(ot2Var8);
                    } else {
                        p65Var9.m0();
                    }
                    cu cuVar29 = q12.f;
                    tp7.B(p65Var9, cuVar29, zk7VarC15);
                    cu cuVar30 = q12.e;
                    tp7.B(p65Var9, cuVar30, i89VarL15);
                    Integer numValueOf8 = Integer.valueOf(i28);
                    cu cuVar31 = q12.g;
                    tp7.B(p65Var9, cuVar31, numValueOf8);
                    fn fnVar8 = q12.h;
                    tp7.y(p65Var9, fnVar8);
                    cu cuVar32 = q12.d;
                    tp7.B(p65Var9, cuVar32, r28VarR15);
                    r28 r28VarD8 = jfc.d(jfc.o(o28Var8, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC16 = dy0.c(z46.d, false);
                    long j16 = p65Var9.T;
                    int i29 = (int) (j16 ^ (j16 >>> 32));
                    i89 i89VarL16 = p65Var9.l();
                    r28 r28VarR16 = gx1.R(p65Var9, r28VarD8);
                    p65Var9.c0();
                    if (p65Var9.S) {
                        p65Var9.k(ot2Var8);
                    } else {
                        p65Var9.m0();
                    }
                    tp7.B(p65Var9, cuVar29, zk7VarC16);
                    tp7.B(p65Var9, cuVar30, i89VarL16);
                    ka1.z(i29, p65Var9, cuVar31, p65Var9, fnVar8);
                    tp7.B(p65Var9, cuVar32, r28VarR16);
                    rr7.s(hneVar9, this.c, null, false, p65Var9, 0, 12);
                    b09.H(p65Var9, true, true, false);
                } else {
                    p65Var9.S();
                }
                return c1eVar;
            case 9:
                xr6 xr6Var10 = (xr6) obj;
                int iIntValue19 = ((Number) obj2).intValue();
                x12 x12Var10 = (x12) obj3;
                int iIntValue20 = ((Number) obj4).intValue();
                if ((iIntValue20 & 6) == 0) {
                    i10 = iIntValue20 | (((p65) x12Var10).f(xr6Var10) ? 4 : 2);
                } else {
                    i10 = iIntValue20;
                }
                if ((iIntValue20 & 48) == 0) {
                    i10 |= ((p65) x12Var10).d(iIntValue19) ? 32 : 16;
                }
                p65 p65Var10 = (p65) x12Var10;
                if (p65Var10.P(i10 & 1, (i10 & 147) != 146)) {
                    kmc kmcVar = (kmc) list.get(iIntValue19);
                    p65Var10.Y(1770634766);
                    o28 o28Var9 = o28.b;
                    r28 r28VarD9 = jfc.d(jfc.r(o28Var9, 3), 1.0f);
                    zk7 zk7VarC17 = dy0.c(z46.h, false);
                    long j17 = p65Var10.T;
                    int i30 = (int) (j17 ^ (j17 >>> 32));
                    i89 i89VarL17 = p65Var10.l();
                    r28 r28VarR17 = gx1.R(p65Var10, r28VarD9);
                    r12.W.getClass();
                    ot2 ot2Var9 = q12.b;
                    p65Var10.c0();
                    if (p65Var10.S) {
                        p65Var10.k(ot2Var9);
                    } else {
                        p65Var10.m0();
                    }
                    cu cuVar33 = q12.f;
                    tp7.B(p65Var10, cuVar33, zk7VarC17);
                    cu cuVar34 = q12.e;
                    tp7.B(p65Var10, cuVar34, i89VarL17);
                    Integer numValueOf9 = Integer.valueOf(i30);
                    cu cuVar35 = q12.g;
                    tp7.B(p65Var10, cuVar35, numValueOf9);
                    fn fnVar9 = q12.h;
                    tp7.y(p65Var10, fnVar9);
                    cu cuVar36 = q12.d;
                    tp7.B(p65Var10, cuVar36, r28VarR17);
                    r28 r28VarD10 = jfc.d(jfc.o(o28Var9, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC18 = dy0.c(z46.d, false);
                    long j18 = p65Var10.T;
                    int i31 = (int) (j18 ^ (j18 >>> 32));
                    i89 i89VarL18 = p65Var10.l();
                    r28 r28VarR18 = gx1.R(p65Var10, r28VarD10);
                    p65Var10.c0();
                    if (p65Var10.S) {
                        p65Var10.k(ot2Var9);
                    } else {
                        p65Var10.m0();
                    }
                    tp7.B(p65Var10, cuVar33, zk7VarC18);
                    tp7.B(p65Var10, cuVar34, i89VarL18);
                    ka1.z(i31, p65Var10, cuVar35, p65Var10, fnVar9);
                    tp7.B(p65Var10, cuVar36, r28VarR18);
                    if (iIntValue19 > 0) {
                        p65Var10.Y(-1995076390);
                        tp7.c(0.0f, 6, 6, 0L, p65Var10, w2g.G(o28Var9, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                        z = false;
                        p65Var10.p(false);
                        p65Var10 = p65Var10;
                    } else {
                        z = false;
                        p65Var10.Y(-1727307356);
                        p65Var10.p(false);
                    }
                    imc.a(kmcVar, this.c, null, null, p65Var10, 0, 12);
                    b09.H(p65Var10, true, true, z);
                } else {
                    p65Var10.S();
                }
                return c1eVar;
            case 10:
                xr6 xr6Var11 = (xr6) obj;
                int iIntValue21 = ((Number) obj2).intValue();
                x12 x12Var11 = (x12) obj3;
                int iIntValue22 = ((Number) obj4).intValue();
                if ((iIntValue22 & 6) == 0) {
                    i11 = iIntValue22 | (((p65) x12Var11).f(xr6Var11) ? 4 : 2);
                } else {
                    i11 = iIntValue22;
                }
                if ((iIntValue22 & 48) == 0) {
                    i11 |= ((p65) x12Var11).d(iIntValue21) ? 32 : 16;
                }
                p65 p65Var11 = (p65) x12Var11;
                if (p65Var11.P(i11 & 1, (i11 & 147) != 146)) {
                    kmc kmcVar2 = (kmc) list.get(iIntValue21);
                    p65Var11.Y(39422128);
                    o28 o28Var10 = o28.b;
                    r28 r28VarD11 = jfc.d(jfc.r(o28Var10, 3), 1.0f);
                    zk7 zk7VarC19 = dy0.c(z46.h, false);
                    long j19 = p65Var11.T;
                    int i32 = (int) (j19 ^ (j19 >>> 32));
                    i89 i89VarL19 = p65Var11.l();
                    r28 r28VarR19 = gx1.R(p65Var11, r28VarD11);
                    r12.W.getClass();
                    ot2 ot2Var10 = q12.b;
                    p65Var11.c0();
                    if (p65Var11.S) {
                        p65Var11.k(ot2Var10);
                    } else {
                        p65Var11.m0();
                    }
                    cu cuVar37 = q12.f;
                    tp7.B(p65Var11, cuVar37, zk7VarC19);
                    cu cuVar38 = q12.e;
                    tp7.B(p65Var11, cuVar38, i89VarL19);
                    Integer numValueOf10 = Integer.valueOf(i32);
                    cu cuVar39 = q12.g;
                    tp7.B(p65Var11, cuVar39, numValueOf10);
                    fn fnVar10 = q12.h;
                    tp7.y(p65Var11, fnVar10);
                    cu cuVar40 = q12.d;
                    tp7.B(p65Var11, cuVar40, r28VarR19);
                    r28 r28VarD12 = jfc.d(jfc.o(o28Var10, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC20 = dy0.c(z46.d, false);
                    long j20 = p65Var11.T;
                    int i33 = (int) (j20 ^ (j20 >>> 32));
                    i89 i89VarL20 = p65Var11.l();
                    r28 r28VarR20 = gx1.R(p65Var11, r28VarD12);
                    p65Var11.c0();
                    if (p65Var11.S) {
                        p65Var11.k(ot2Var10);
                    } else {
                        p65Var11.m0();
                    }
                    tp7.B(p65Var11, cuVar37, zk7VarC20);
                    tp7.B(p65Var11, cuVar38, i89VarL20);
                    ka1.z(i33, p65Var11, cuVar39, p65Var11, fnVar10);
                    tp7.B(p65Var11, cuVar40, r28VarR20);
                    if (iIntValue21 > 0) {
                        p65Var11.Y(1135666680);
                        tp7.c(0.0f, 6, 6, 0L, p65Var11, w2g.G(o28Var10, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                        z2 = false;
                    } else {
                        z2 = false;
                        p65Var11.Y(836447302);
                    }
                    p65Var11.p(z2);
                    imc.a(kmcVar2, this.c, null, null, p65Var11, 0, 12);
                    b09.H(p65Var11, true, true, z2);
                } else {
                    p65Var11.S();
                }
                return c1eVar;
            case 11:
                return a(obj, obj2, obj3, obj4);
            default:
                xr6 xr6Var12 = (xr6) obj;
                int iIntValue23 = ((Number) obj2).intValue();
                x12 x12Var12 = (x12) obj3;
                int iIntValue24 = ((Number) obj4).intValue();
                if ((iIntValue24 & 6) == 0) {
                    i12 = iIntValue24 | (((p65) x12Var12).f(xr6Var12) ? 4 : 2);
                } else {
                    i12 = iIntValue24;
                }
                if ((iIntValue24 & 48) == 0) {
                    i12 |= ((p65) x12Var12).d(iIntValue23) ? 32 : 16;
                }
                p65 p65Var12 = (p65) x12Var12;
                if (!p65Var12.P(i12 & 1, (i12 & 147) != 146)) {
                    p65Var12.S();
                    return c1eVar;
                }
                hne hneVar10 = (hne) list.get(iIntValue23);
                p65Var12.Y(676134284);
                jp7 jp7Var8 = (jp7) p65Var12.j(kt7.a);
                o28 o28Var11 = o28.b;
                r28 r28VarJ8 = ka1.j(jp7Var8, o28Var11, 3, 1.0f);
                zk7 zk7VarC21 = dy0.c(z46.h, false);
                long j21 = p65Var12.T;
                int i34 = (int) (j21 ^ (j21 >>> 32));
                i89 i89VarL21 = p65Var12.l();
                r28 r28VarR21 = gx1.R(p65Var12, r28VarJ8);
                r12.W.getClass();
                ot2 ot2Var11 = q12.b;
                p65Var12.c0();
                if (p65Var12.S) {
                    p65Var12.k(ot2Var11);
                } else {
                    p65Var12.m0();
                }
                cu cuVar41 = q12.f;
                tp7.B(p65Var12, cuVar41, zk7VarC21);
                cu cuVar42 = q12.e;
                tp7.B(p65Var12, cuVar42, i89VarL21);
                Integer numValueOf11 = Integer.valueOf(i34);
                cu cuVar43 = q12.g;
                tp7.B(p65Var12, cuVar43, numValueOf11);
                fn fnVar11 = q12.h;
                tp7.y(p65Var12, fnVar11);
                cu cuVar44 = q12.d;
                tp7.B(p65Var12, cuVar44, r28VarR21);
                r28 r28VarD13 = jfc.d(jfc.o(o28Var11, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC22 = dy0.c(z46.d, false);
                long j22 = p65Var12.T;
                int i35 = (int) (j22 ^ (j22 >>> 32));
                i89 i89VarL22 = p65Var12.l();
                r28 r28VarR22 = gx1.R(p65Var12, r28VarD13);
                p65Var12.c0();
                if (p65Var12.S) {
                    p65Var12.k(ot2Var11);
                } else {
                    p65Var12.m0();
                }
                tp7.B(p65Var12, cuVar41, zk7VarC22);
                tp7.B(p65Var12, cuVar42, i89VarL22);
                ka1.z(i35, p65Var12, cuVar43, p65Var12, fnVar11);
                tp7.B(p65Var12, cuVar44, r28VarR22);
                r28 r28VarE = w2g.E(o28Var11, 0.0f, 8.0f, 1);
                wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var12, 0);
                long j23 = p65Var12.T;
                int i36 = (int) (j23 ^ (j23 >>> 32));
                i89 i89VarL23 = p65Var12.l();
                r28 r28VarR23 = gx1.R(p65Var12, r28VarE);
                p65Var12.c0();
                if (p65Var12.S) {
                    p65Var12.k(ot2Var11);
                } else {
                    p65Var12.m0();
                }
                tp7.B(p65Var12, cuVar41, wv1VarA);
                tp7.B(p65Var12, cuVar42, i89VarL23);
                ka1.z(i36, p65Var12, cuVar43, p65Var12, fnVar11);
                tp7.B(p65Var12, cuVar44, r28VarR23);
                rr7.s(hneVar10, this.c, w2g.G(o28Var11, 0.0f, 0.0f, 0.0f, 8.0f, 7), false, p65Var12, 384, 8);
                tp7.c(0.0f, 6, 4, ((zo7) p65Var12.j(kt7.b)).x, p65Var12, jfc.d(w2g.G(o28Var11, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f));
                ho2.N(p65Var12, true, true, true, false);
                return c1eVar;
        }
    }
}
