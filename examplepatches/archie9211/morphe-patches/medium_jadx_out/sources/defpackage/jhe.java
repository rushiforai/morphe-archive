package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jhe implements d55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ List b;
    public final /* synthetic */ int c;
    public final /* synthetic */ stc d;
    public final /* synthetic */ sh9 e;
    public final /* synthetic */ Object f;

    public /* synthetic */ jhe(List list, int i, Object obj, stc stcVar, sh9 sh9Var, int i2) {
        this.a = i2;
        this.b = list;
        this.c = i;
        this.f = obj;
        this.d = stcVar;
        this.e = sh9Var;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj5 = this.f;
        int i2 = this.c;
        List list = this.b;
        switch (i) {
            case 0:
                xr6 xr6Var = (xr6) obj;
                int iIntValue = ((Number) obj2).intValue();
                x12 x12Var = (x12) obj3;
                int iIntValue2 = ((Number) obj4).intValue();
                int i3 = (iIntValue2 & 6) == 0 ? iIntValue2 | (((p65) x12Var).f(xr6Var) ? 4 : 2) : iIntValue2;
                if ((iIntValue2 & 48) == 0) {
                    i3 |= ((p65) x12Var).d(iIntValue) ? 32 : 16;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(i3 & 1, (i3 & 147) != 146)) {
                    p65Var.S();
                } else {
                    dr9 dr9Var = (dr9) list.get(iIntValue);
                    p65Var.Y(-808383730);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
                    long j = p65Var.T;
                    int i4 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    o28 o28Var = o28.b;
                    r28 r28VarR = gx1.R(p65Var, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var, cuVar, wv1VarA);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i4);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var, cuVar4, r28VarR);
                    sn3 sn3Var = kt7.a;
                    r28 r28VarJ = ka1.j((jp7) p65Var.j(sn3Var), o28Var, 3, 1.0f);
                    ar0 ar0Var = z46.h;
                    zk7 zk7VarC = dy0.c(ar0Var, false);
                    long j2 = p65Var.T;
                    int i5 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var.l();
                    r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, cuVar, zk7VarC);
                    tp7.B(p65Var, cuVar2, i89VarL2);
                    ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
                    tp7.B(p65Var, cuVar4, r28VarR2);
                    r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    ar0 ar0Var2 = z46.d;
                    zk7 zk7VarC2 = dy0.c(ar0Var2, false);
                    long j3 = p65Var.T;
                    int i6 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var.l();
                    r28 r28VarR3 = gx1.R(p65Var, r28VarD);
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, cuVar, zk7VarC2);
                    tp7.B(p65Var, cuVar2, i89VarL3);
                    ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
                    tp7.B(p65Var, cuVar4, r28VarR3);
                    il7.k(dr9Var, this.d, this.e, bgf.N(o28Var, "user_profile_post_".concat(dr9Var.a)), null, p65Var, 0, 16);
                    p65Var.p(true);
                    p65Var.p(true);
                    if (iIntValue < i2 - 1 || ((ohe) obj5).b) {
                        p65Var.Y(-145196205);
                        r28 r28VarJ2 = ka1.j((jp7) p65Var.j(sn3Var), o28Var, 3, 1.0f);
                        zk7 zk7VarC3 = dy0.c(ar0Var, false);
                        long j4 = p65Var.T;
                        int i7 = (int) (j4 ^ (j4 >>> 32));
                        i89 i89VarL4 = p65Var.l();
                        r28 r28VarR4 = gx1.R(p65Var, r28VarJ2);
                        p65Var.c0();
                        if (p65Var.S) {
                            p65Var.k(ot2Var);
                        } else {
                            p65Var.m0();
                        }
                        tp7.B(p65Var, cuVar, zk7VarC3);
                        tp7.B(p65Var, cuVar2, i89VarL4);
                        ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
                        tp7.B(p65Var, cuVar4, r28VarR4);
                        r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                        zk7 zk7VarC4 = dy0.c(ar0Var2, false);
                        long j5 = p65Var.T;
                        int i8 = (int) (j5 ^ (j5 >>> 32));
                        i89 i89VarL5 = p65Var.l();
                        r28 r28VarR5 = gx1.R(p65Var, r28VarD2);
                        p65Var.c0();
                        if (p65Var.S) {
                            p65Var.k(ot2Var);
                        } else {
                            p65Var.m0();
                        }
                        tp7.B(p65Var, cuVar, zk7VarC4);
                        tp7.B(p65Var, cuVar2, i89VarL5);
                        ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
                        tp7.B(p65Var, cuVar4, r28VarR5);
                        tp7.c(0.0f, 0, 7, 0L, p65Var, null);
                        z = true;
                        z2 = false;
                        b09.H(p65Var, true, true, false);
                    } else {
                        p65Var.Y(-166049719);
                        p65Var.p(false);
                        z2 = false;
                        z = true;
                    }
                    p65Var.p(z);
                    p65Var.p(z2);
                }
                break;
            default:
                xr6 xr6Var2 = (xr6) obj;
                int iIntValue3 = ((Number) obj2).intValue();
                x12 x12Var2 = (x12) obj3;
                int iIntValue4 = ((Number) obj4).intValue();
                int i9 = (iIntValue4 & 6) == 0 ? iIntValue4 | (((p65) x12Var2).f(xr6Var2) ? 4 : 2) : iIntValue4;
                if ((iIntValue4 & 48) == 0) {
                    i9 |= ((p65) x12Var2).d(iIntValue3) ? 32 : 16;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(i9 & 1, (i9 & 147) != 146)) {
                    p65Var2.S();
                } else {
                    dr9 dr9Var2 = (dr9) list.get(iIntValue3);
                    p65Var2.Y(-2059114430);
                    wv1 wv1VarA2 = uv1.a(qb8.c, z46.p, p65Var2, 0);
                    long j6 = p65Var2.T;
                    int i10 = (int) (j6 ^ (j6 >>> 32));
                    i89 i89VarL6 = p65Var2.l();
                    o28 o28Var2 = o28.b;
                    r28 r28VarR6 = gx1.R(p65Var2, o28Var2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    cu cuVar5 = q12.f;
                    tp7.B(p65Var2, cuVar5, wv1VarA2);
                    cu cuVar6 = q12.e;
                    tp7.B(p65Var2, cuVar6, i89VarL6);
                    Integer numValueOf2 = Integer.valueOf(i10);
                    cu cuVar7 = q12.g;
                    tp7.B(p65Var2, cuVar7, numValueOf2);
                    fn fnVar2 = q12.h;
                    tp7.y(p65Var2, fnVar2);
                    cu cuVar8 = q12.d;
                    tp7.B(p65Var2, cuVar8, r28VarR6);
                    sn3 sn3Var2 = kt7.a;
                    r28 r28VarJ3 = ka1.j((jp7) p65Var2.j(sn3Var2), o28Var2, 3, 1.0f);
                    ar0 ar0Var3 = z46.h;
                    zk7 zk7VarC5 = dy0.c(ar0Var3, false);
                    long j7 = p65Var2.T;
                    int i11 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL7 = p65Var2.l();
                    r28 r28VarR7 = gx1.R(p65Var2, r28VarJ3);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar5, zk7VarC5);
                    tp7.B(p65Var2, cuVar6, i89VarL7);
                    ka1.z(i11, p65Var2, cuVar7, p65Var2, fnVar2);
                    tp7.B(p65Var2, cuVar8, r28VarR7);
                    r28 r28VarD3 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    ar0 ar0Var4 = z46.d;
                    zk7 zk7VarC6 = dy0.c(ar0Var4, false);
                    long j8 = p65Var2.T;
                    int i12 = (int) (j8 ^ (j8 >>> 32));
                    i89 i89VarL8 = p65Var2.l();
                    r28 r28VarR8 = gx1.R(p65Var2, r28VarD3);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar5, zk7VarC6);
                    tp7.B(p65Var2, cuVar6, i89VarL8);
                    ka1.z(i12, p65Var2, cuVar7, p65Var2, fnVar2);
                    tp7.B(p65Var2, cuVar8, r28VarR8);
                    il7.k(dr9Var2, this.d, this.e, bgf.N(o28Var2, "your_responses_item_".concat(dr9Var2.a)), null, p65Var2, 0, 16);
                    p65Var2.p(true);
                    p65Var2.p(true);
                    if (iIntValue3 < i2 - 1 || ((kff) obj5).c) {
                        p65Var2.Y(-850012645);
                        r28 r28VarJ4 = ka1.j((jp7) p65Var2.j(sn3Var2), o28Var2, 3, 1.0f);
                        zk7 zk7VarC7 = dy0.c(ar0Var3, false);
                        long j9 = p65Var2.T;
                        int i13 = (int) (j9 ^ (j9 >>> 32));
                        i89 i89VarL9 = p65Var2.l();
                        r28 r28VarR9 = gx1.R(p65Var2, r28VarJ4);
                        p65Var2.c0();
                        if (p65Var2.S) {
                            p65Var2.k(ot2Var2);
                        } else {
                            p65Var2.m0();
                        }
                        tp7.B(p65Var2, cuVar5, zk7VarC7);
                        tp7.B(p65Var2, cuVar6, i89VarL9);
                        ka1.z(i13, p65Var2, cuVar7, p65Var2, fnVar2);
                        tp7.B(p65Var2, cuVar8, r28VarR9);
                        r28 r28VarD4 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                        zk7 zk7VarC8 = dy0.c(ar0Var4, false);
                        long j10 = p65Var2.T;
                        int i14 = (int) (j10 ^ (j10 >>> 32));
                        i89 i89VarL10 = p65Var2.l();
                        r28 r28VarR10 = gx1.R(p65Var2, r28VarD4);
                        p65Var2.c0();
                        if (p65Var2.S) {
                            p65Var2.k(ot2Var2);
                        } else {
                            p65Var2.m0();
                        }
                        tp7.B(p65Var2, cuVar5, zk7VarC8);
                        tp7.B(p65Var2, cuVar6, i89VarL10);
                        ka1.z(i14, p65Var2, cuVar7, p65Var2, fnVar2);
                        tp7.B(p65Var2, cuVar8, r28VarR10);
                        tp7.c(0.0f, 0, 7, 0L, p65Var2, null);
                        z3 = true;
                        z4 = false;
                        b09.H(p65Var2, true, true, false);
                    } else {
                        p65Var2.Y(-863438063);
                        z4 = false;
                        p65Var2.p(false);
                        z3 = true;
                    }
                    p65Var2.p(z3);
                    p65Var2.p(z4);
                }
                break;
        }
        return c1eVar;
    }
}
