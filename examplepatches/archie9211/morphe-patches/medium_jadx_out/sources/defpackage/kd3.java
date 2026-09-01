package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kd3 implements d55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ List c;
    public final /* synthetic */ Object d;

    public /* synthetic */ kd3(List list, int i, Object obj, int i2) {
        this.a = i2;
        this.c = list;
        this.b = i;
        this.d = obj;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        boolean z;
        r28 r28Var;
        long j;
        sh9 sh9Var;
        dr9 dr9Var;
        int i;
        o28 o28Var;
        boolean z2;
        int i2;
        p65 p65Var;
        boolean z3;
        int i3 = this.a;
        c1e c1eVar = c1e.a;
        int i4 = this.b;
        List list = this.c;
        Object obj5 = this.d;
        switch (i3) {
            case 0:
                sh9 sh9Var2 = (sh9) obj5;
                xr6 xr6Var = (xr6) obj;
                int iIntValue = ((Number) obj2).intValue();
                x12 x12Var = (x12) obj3;
                int iIntValue2 = ((Number) obj4).intValue();
                ar0 ar0Var = z46.d;
                ar0 ar0Var2 = z46.h;
                int i5 = (iIntValue2 & 6) == 0 ? iIntValue2 | (((p65) x12Var).f(xr6Var) ? 4 : 2) : iIntValue2;
                if ((iIntValue2 & 48) == 0) {
                    i5 |= ((p65) x12Var).d(iIntValue) ? 32 : 16;
                }
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(i5 & 1, (i5 & 147) != 146)) {
                    p65Var2.S();
                } else {
                    dr9 dr9Var2 = (dr9) list.get(iIntValue);
                    p65Var2.Y(1436690967);
                    o28 o28Var2 = o28.b;
                    if (i4 > 0) {
                        p65Var2.Y(1436695337);
                        r28 r28VarA0 = flb.a0(o28Var2, ((zo7) p65Var2.j(kt7.b)).c, rv8.r);
                        z = false;
                        p65Var2.p(false);
                        r28Var = r28VarA0;
                    } else {
                        z = false;
                        p65Var2.Y(1436804643);
                        p65Var2.p(false);
                        r28Var = o28Var2;
                    }
                    if (i4 > 0) {
                        p65Var2.Y(1436910818);
                        j = ((zo7) p65Var2.j(kt7.b)).z;
                        p65Var2.p(z);
                    } else {
                        p65Var2.Y(1436997091);
                        j = ((zo7) p65Var2.j(kt7.b)).x;
                        p65Var2.p(z);
                    }
                    long j2 = j;
                    if (i4 > 0 || iIntValue > 0) {
                        p65Var2.Y(1437140621);
                        r28 r28VarJ = ka1.j((jp7) p65Var2.j(kt7.a), o28Var2, 3, 1.0f);
                        zk7 zk7VarC = dy0.c(ar0Var2, z);
                        long j3 = p65Var2.T;
                        int i6 = (int) (j3 ^ (j3 >>> 32));
                        i89 i89VarL = p65Var2.l();
                        r28 r28VarR = gx1.R(p65Var2, r28VarJ);
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
                        Integer numValueOf = Integer.valueOf(i6);
                        cu cuVar3 = q12.g;
                        tp7.B(p65Var2, cuVar3, numValueOf);
                        fn fnVar = q12.h;
                        tp7.y(p65Var2, fnVar);
                        cu cuVar4 = q12.d;
                        tp7.B(p65Var2, cuVar4, r28VarR);
                        sh9Var = sh9Var2;
                        dr9Var = dr9Var2;
                        r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                        zk7 zk7VarC2 = dy0.c(ar0Var, false);
                        long j4 = p65Var2.T;
                        int i7 = (int) (j4 ^ (j4 >>> 32));
                        i89 i89VarL2 = p65Var2.l();
                        r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
                        p65Var2.c0();
                        i = iIntValue;
                        if (p65Var2.S) {
                            p65Var2.k(ot2Var);
                        } else {
                            p65Var2.m0();
                        }
                        tp7.B(p65Var2, cuVar, zk7VarC2);
                        tp7.B(p65Var2, cuVar2, i89VarL2);
                        ka1.z(i7, p65Var2, cuVar3, p65Var2, fnVar);
                        tp7.B(p65Var2, cuVar4, r28VarR2);
                        o28Var = o28Var2;
                        tp7.c(0.0f, 0, 4, j2, p65Var2, w2g.G(r28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                        z = false;
                        b09.H(p65Var2, true, true, false);
                    } else {
                        p65Var2.Y(1419478867);
                        p65Var2.p(z);
                        sh9Var = sh9Var2;
                        dr9Var = dr9Var2;
                        i = iIntValue;
                        o28Var = o28Var2;
                    }
                    if (i4 == 0 && i == 0) {
                        p65Var2.Y(1437524401);
                        r28 r28VarJ2 = ka1.j((jp7) p65Var2.j(kt7.a), o28Var, 3, 1.0f);
                        zk7 zk7VarC3 = dy0.c(ar0Var2, z);
                        long j5 = p65Var2.T;
                        int i8 = (int) (j5 ^ (j5 >>> 32));
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
                        Integer numValueOf2 = Integer.valueOf(i8);
                        cu cuVar7 = q12.g;
                        tp7.B(p65Var2, cuVar7, numValueOf2);
                        fn fnVar2 = q12.h;
                        tp7.y(p65Var2, fnVar2);
                        cu cuVar8 = q12.d;
                        tp7.B(p65Var2, cuVar8, r28VarR3);
                        r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                        zk7 zk7VarC4 = dy0.c(ar0Var, false);
                        long j6 = p65Var2.T;
                        int i9 = (int) (j6 ^ (j6 >>> 32));
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
                        ka1.z(i9, p65Var2, cuVar7, p65Var2, fnVar2);
                        tp7.B(p65Var2, cuVar8, r28VarR4);
                        nk7.q(dr9Var, ig5.TwoForOne, sh9Var, r28Var, null, p65Var2, 48, 16);
                        z2 = false;
                        b09.H(p65Var2, true, true, false);
                    } else {
                        sh9 sh9Var3 = sh9Var;
                        dr9 dr9Var3 = dr9Var;
                        o28 o28Var3 = o28Var;
                        p65Var2.Y(1437912397);
                        r28 r28VarJ3 = ka1.j((jp7) p65Var2.j(kt7.a), o28Var3, 3, 1.0f);
                        zk7 zk7VarC5 = dy0.c(ar0Var2, z);
                        long j7 = p65Var2.T;
                        int i10 = (int) (j7 ^ (j7 >>> 32));
                        i89 i89VarL5 = p65Var2.l();
                        r28 r28VarR5 = gx1.R(p65Var2, r28VarJ3);
                        r12.W.getClass();
                        ot2 ot2Var3 = q12.b;
                        p65Var2.c0();
                        if (p65Var2.S) {
                            p65Var2.k(ot2Var3);
                        } else {
                            p65Var2.m0();
                        }
                        cu cuVar9 = q12.f;
                        tp7.B(p65Var2, cuVar9, zk7VarC5);
                        cu cuVar10 = q12.e;
                        tp7.B(p65Var2, cuVar10, i89VarL5);
                        Integer numValueOf3 = Integer.valueOf(i10);
                        cu cuVar11 = q12.g;
                        tp7.B(p65Var2, cuVar11, numValueOf3);
                        fn fnVar3 = q12.h;
                        tp7.y(p65Var2, fnVar3);
                        cu cuVar12 = q12.d;
                        tp7.B(p65Var2, cuVar12, r28VarR5);
                        r28 r28VarD3 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                        zk7 zk7VarC6 = dy0.c(ar0Var, false);
                        long j8 = p65Var2.T;
                        int i11 = (int) (j8 ^ (j8 >>> 32));
                        i89 i89VarL6 = p65Var2.l();
                        r28 r28VarR6 = gx1.R(p65Var2, r28VarD3);
                        p65Var2.c0();
                        if (p65Var2.S) {
                            p65Var2.k(ot2Var3);
                        } else {
                            p65Var2.m0();
                        }
                        tp7.B(p65Var2, cuVar9, zk7VarC6);
                        tp7.B(p65Var2, cuVar10, i89VarL6);
                        ka1.z(i11, p65Var2, cuVar11, p65Var2, fnVar3);
                        tp7.B(p65Var2, cuVar12, r28VarR6);
                        il7.k(dr9Var3, stc.M, sh9Var3, r28Var, null, p65Var2, 48, 16);
                        z2 = false;
                        b09.H(p65Var2, true, true, false);
                    }
                    p65Var2.p(z2);
                }
                break;
            default:
                rfe rfeVar = (rfe) obj5;
                xr6 xr6Var2 = (xr6) obj;
                int iIntValue3 = ((Number) obj2).intValue();
                x12 x12Var2 = (x12) obj3;
                int iIntValue4 = ((Number) obj4).intValue();
                int i12 = (iIntValue4 & 6) == 0 ? iIntValue4 | (((p65) x12Var2).f(xr6Var2) ? 4 : 2) : iIntValue4;
                if ((iIntValue4 & 48) == 0) {
                    i12 |= ((p65) x12Var2).d(iIntValue3) ? 32 : 16;
                }
                p65 p65Var3 = (p65) x12Var2;
                if (!p65Var3.P(i12 & 1, (i12 & 147) != 146)) {
                    p65Var3.S();
                } else {
                    jt0 jt0Var = (jt0) ((ArrayList) list).get(iIntValue3);
                    p65Var3.Y(-911062006);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var3, 0);
                    long j9 = p65Var3.T;
                    int i13 = (int) (j9 ^ (j9 >>> 32));
                    i89 i89VarL7 = p65Var3.l();
                    o28 o28Var4 = o28.b;
                    r28 r28VarR7 = gx1.R(p65Var3, o28Var4);
                    r12.W.getClass();
                    ot2 ot2Var4 = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var4);
                    } else {
                        p65Var3.m0();
                    }
                    cu cuVar13 = q12.f;
                    tp7.B(p65Var3, cuVar13, wv1VarA);
                    cu cuVar14 = q12.e;
                    tp7.B(p65Var3, cuVar14, i89VarL7);
                    Integer numValueOf4 = Integer.valueOf(i13);
                    cu cuVar15 = q12.g;
                    tp7.B(p65Var3, cuVar15, numValueOf4);
                    fn fnVar4 = q12.h;
                    tp7.y(p65Var3, fnVar4);
                    cu cuVar16 = q12.d;
                    tp7.B(p65Var3, cuVar16, r28VarR7);
                    sn3 sn3Var = kt7.a;
                    r28 r28VarJ4 = ka1.j((jp7) p65Var3.j(sn3Var), o28Var4, 3, 1.0f);
                    ar0 ar0Var3 = z46.h;
                    zk7 zk7VarC7 = dy0.c(ar0Var3, false);
                    long j10 = p65Var3.T;
                    int i14 = (int) (j10 ^ (j10 >>> 32));
                    i89 i89VarL8 = p65Var3.l();
                    r28 r28VarR8 = gx1.R(p65Var3, r28VarJ4);
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var4);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, cuVar13, zk7VarC7);
                    tp7.B(p65Var3, cuVar14, i89VarL8);
                    ka1.z(i14, p65Var3, cuVar15, p65Var3, fnVar4);
                    tp7.B(p65Var3, cuVar16, r28VarR8);
                    r28 r28VarD4 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    ar0 ar0Var4 = z46.d;
                    zk7 zk7VarC8 = dy0.c(ar0Var4, false);
                    long j11 = p65Var3.T;
                    int i15 = (int) (j11 ^ (j11 >>> 32));
                    i89 i89VarL9 = p65Var3.l();
                    r28 r28VarR9 = gx1.R(p65Var3, r28VarD4);
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var4);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, cuVar13, zk7VarC8);
                    tp7.B(p65Var3, cuVar14, i89VarL9);
                    ka1.z(i15, p65Var3, cuVar15, p65Var3, fnVar4);
                    tp7.B(p65Var3, cuVar16, r28VarR9);
                    boolean zF = p65Var3.f(rfeVar);
                    Object objM = p65Var3.M();
                    if (zF || objM == w12.a) {
                        i2 = iIntValue3;
                        hgb hgbVar = new hgb(1, rfeVar, rfe.class, "onBookSelected", "onBookSelected(Lcom/medium/android/profile/ui/books/BookUiModel;)V", 0, 18);
                        p65Var3.j0(hgbVar);
                        objM = hgbVar;
                    } else {
                        i2 = iIntValue3;
                    }
                    boolean z4 = false;
                    hlg.b(jt0Var, (x45) ((qh6) objM), null, p65Var3, 0);
                    p65Var3.p(true);
                    p65Var3.p(true);
                    if (i2 < i4 - 1) {
                        p65Var3.Y(-634769745);
                        r28 r28VarJ5 = ka1.j((jp7) p65Var3.j(sn3Var), o28Var4, 3, 1.0f);
                        zk7 zk7VarC9 = dy0.c(ar0Var3, false);
                        long j12 = p65Var3.T;
                        int i16 = (int) (j12 ^ (j12 >>> 32));
                        i89 i89VarL10 = p65Var3.l();
                        r28 r28VarR10 = gx1.R(p65Var3, r28VarJ5);
                        p65Var3.c0();
                        if (p65Var3.S) {
                            p65Var3.k(ot2Var4);
                        } else {
                            p65Var3.m0();
                        }
                        tp7.B(p65Var3, cuVar13, zk7VarC9);
                        tp7.B(p65Var3, cuVar14, i89VarL10);
                        ka1.z(i16, p65Var3, cuVar15, p65Var3, fnVar4);
                        tp7.B(p65Var3, cuVar16, r28VarR10);
                        r28 r28VarD5 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                        zk7 zk7VarC10 = dy0.c(ar0Var4, false);
                        long j13 = p65Var3.T;
                        int i17 = (int) (j13 ^ (j13 >>> 32));
                        i89 i89VarL11 = p65Var3.l();
                        r28 r28VarR11 = gx1.R(p65Var3, r28VarD5);
                        p65Var3.c0();
                        if (p65Var3.S) {
                            p65Var3.k(ot2Var4);
                        } else {
                            p65Var3.m0();
                        }
                        tp7.B(p65Var3, cuVar13, zk7VarC10);
                        tp7.B(p65Var3, cuVar14, i89VarL11);
                        ka1.z(i17, p65Var3, cuVar15, p65Var3, fnVar4);
                        tp7.B(p65Var3, cuVar16, r28VarR11);
                        tp7.c(0.0f, 6, 6, 0L, p65Var3, w2g.E(o28Var4, 24.0f, 0.0f, 2));
                        p65Var = p65Var3;
                        z3 = true;
                        z4 = false;
                        b09.H(p65Var, true, true, false);
                    } else {
                        p65Var = p65Var3;
                        z3 = true;
                        p65Var.Y(-642704629);
                        p65Var.p(false);
                    }
                    p65Var.p(z3);
                    p65Var.p(z4);
                }
                break;
        }
        return c1eVar;
    }
}
