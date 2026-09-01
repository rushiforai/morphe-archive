package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oda implements d55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ List b;
    public final /* synthetic */ Object c;

    public /* synthetic */ oda(List list, Object obj, int i) {
        this.a = i;
        this.b = list;
        this.c = obj;
    }

    private final Object a(Object obj, Object obj2, Object obj3, Object obj4) {
        int i;
        boolean z;
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
            p65Var.Y(-965826534);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.r(m40.V(o28Var, p65Var, 6), 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
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
            Integer numValueOf = Integer.valueOf(i2);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
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
            ka1.z(i3, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            if (iIntValue > 0) {
                p65Var.Y(-190262178);
                tp7.c(0.0f, 6, 6, 0L, p65Var, w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                z = false;
            } else {
                z = false;
                p65Var.Y(-193194499);
            }
            p65Var.p(z);
            il7.l((stc) this.c, null, 0L, null, p65Var, 0, 14);
            b09.H(p65Var, true, true, z);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object d(Object obj, Object obj2, Object obj3, Object obj4) {
        int i;
        p65 p65Var;
        o28 o28Var;
        boolean z;
        boolean z2;
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
        p65 p65Var2 = (p65) x12Var;
        if (p65Var2.P(i & 1, (i & 147) != 146)) {
            dab dabVar = (dab) this.b.get(iIntValue);
            p65Var2.Y(491346668);
            jp7 jp7Var = (jp7) p65Var2.j(kt7.a);
            o28 o28Var2 = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var2, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var2.T;
            int i2 = (int) (j ^ (j >>> 32));
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
            Integer numValueOf = Integer.valueOf(i2);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var2.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i3, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j3 = p65Var2.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, o28Var2);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i4, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            if (iIntValue > 0) {
                p65Var2.Y(-942651369);
                o28Var = o28Var2;
                p65Var = p65Var2;
                tp7.c(0.0f, 6, 6, 0L, p65Var, w2g.G(o28Var2, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                z = false;
            } else {
                p65Var = p65Var2;
                o28Var = o28Var2;
                z = false;
                p65Var.Y(-966973845);
            }
            p65Var.p(z);
            boolean z3 = dabVar instanceof cab;
            Object obj5 = this.c;
            if (z3) {
                p65Var.Y(-307495569);
                z2 = false;
                en7.d((cab) dabVar, (nab) obj5, bgf.N(o28Var, "reposter_item_" + iIntValue), p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(dabVar instanceof bab)) {
                    throw ho2.L(p65Var, -307497686, false);
                }
                p65Var.Y(-307485684);
                p65 p65Var3 = p65Var;
                il7.f((bab) dabVar, (nab) obj5, bgf.N(o28Var, "reposter_item_" + iIntValue), p65Var3, 0, 0);
                p65Var = p65Var3;
                z2 = false;
                p65Var.p(false);
            }
            ho2.N(p65Var, true, true, true, z2);
        } else {
            p65Var2.S();
        }
        return c1e.a;
    }

    private final Object g(Object obj, Object obj2, Object obj3, Object obj4) {
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
            dpc dpcVar = (dpc) this.b.get(iIntValue);
            p65Var.Y(1082301859);
            ht2.L(dpcVar, (cpc) this.c, null, p65Var, 0);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object h(Object obj, Object obj2, Object obj3, Object obj4) {
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
            wqc wqcVar = (wqc) ((ArrayList) this.b).get(iIntValue);
            p65Var.Y(-73696339);
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
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            hk7.j(wqcVar, (isc) this.c, jfc.d(o28Var, 1.0f), p65Var, 384, 0);
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            ho2.N(p65Var, true, true, true, false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object i(Object obj, Object obj2, Object obj3, Object obj4) {
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
            lt1 lt1Var = (lt1) ((ArrayList) this.b).get(iIntValue);
            p65Var.Y(1982307556);
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
            vc2.n(lt1Var, (cs1) this.c, null, false, p65Var, 0, 12);
            b09.H(p65Var, true, true, false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object j(Object obj, Object obj2, Object obj3, Object obj4) {
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
            ybd ybdVar = (ybd) ((ArrayList) this.b).get(iIntValue);
            p65Var.Y(139969810);
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
            en7.g(ybdVar, (e9d) this.c, null, p65Var, 0, 4);
            b09.H(p65Var, true, true, false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object l(Object obj, Object obj2, Object obj3, Object obj4) {
        int i;
        xr6 xr6Var = (xr6) obj;
        int iIntValue = ((Number) obj2).intValue();
        x12 x12Var = (x12) obj3;
        int iIntValue2 = ((Number) obj4).intValue();
        f8d f8dVar = (f8d) this.c;
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
            i8d i8dVar = (i8d) ((ArrayList) this.b).get(iIntValue);
            p65Var.Y(-1692634055);
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
            boolean zF = p65Var.f(f8dVar);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new k0b(5, f8dVar);
                p65Var.j0(objM);
            }
            qk7.l(i8dVar, (x45) objM, p65Var, 0);
            b09.H(p65Var, true, true, false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object n(Object obj, Object obj2, Object obj3, Object obj4) {
        int i;
        xr6 xr6Var = (xr6) obj;
        int iIntValue = ((Number) obj2).intValue();
        x12 x12Var = (x12) obj3;
        int iIntValue2 = ((Number) obj4).intValue();
        Object obj5 = this.c;
        lbd lbdVar = (lbd) obj5;
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
            k9d k9dVar = (k9d) this.b.get(iIntValue);
            p65Var.Y(739888316);
            boolean zF = p65Var.f(lbdVar);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                xi1 xi1Var = new xi1(2, (lbd) obj5, lbd.class, "onTagPillPresented", "onTagPillPresented(Ljava/lang/String;Lgen/model/SourceParameter;)V", 0, 18);
                p65Var.j0(xi1Var);
                objM = xi1Var;
            }
            b55 b55Var = (b55) ((qh6) objM);
            boolean zF2 = p65Var.f(lbdVar);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                objM2 = new fx2(7, lbdVar);
                p65Var.j0(objM2);
            }
            mo7.y(k9dVar, b55Var, (b55) objM2, null, p65Var, 0);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object o(Object obj, Object obj2, Object obj3, Object obj4) {
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
            ypd ypdVar = (ypd) ((ArrayList) this.b).get(iIntValue);
            p65Var.Y(-1457817169);
            bo.f(ypdVar, (mpd) this.c, null, p65Var, 0);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v22 */
    /* JADX WARN: Type inference failed for: r5v23, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r5v24 */
    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i;
        boolean z;
        boolean z2;
        int i2;
        int i3;
        int i4;
        ?? r5;
        int i5;
        int i6;
        int i7;
        boolean z3;
        int i8;
        ar0 ar0Var;
        ar0 ar0Var2;
        boolean z4;
        int i9;
        boolean z5;
        int i10;
        int i11;
        int i12 = this.a;
        int i13 = 5;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        List list = this.b;
        Object obj5 = this.c;
        switch (i12) {
            case 0:
                gr6 gr6Var = (gr6) obj;
                int iIntValue = ((Number) obj2).intValue();
                x12 x12Var = (x12) obj3;
                int iIntValue2 = ((Number) obj4).intValue();
                eb8 eb8Var = (eb8) obj5;
                if ((iIntValue2 & 6) == 0) {
                    i = iIntValue2 | (((p65) x12Var).f(gr6Var) ? 4 : 2);
                } else {
                    i = iIntValue2;
                }
                if ((iIntValue2 & 48) == 0) {
                    i |= ((p65) x12Var).d(iIntValue) ? 32 : 16;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(i & 1, (i & 147) != 146)) {
                    tga tgaVar = (tga) list.get(iIntValue);
                    p65Var.Y(1432074620);
                    o28 o28Var = o28.b;
                    r28 r28VarK = op8.K(1.0f, jfc.d(o28Var, 1.0f), false);
                    boolean zF = p65Var.f(eb8Var) | p65Var.f(tgaVar);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        z = false;
                        objM = new a3(eb8Var, tgaVar, z, 23);
                        p65Var.j0(objM);
                    } else {
                        z = false;
                    }
                    r28 r28VarR = hlg.r(r28VarK, false, null, null, (m45) objM, 15);
                    zk7 zk7VarC = dy0.c(z46.d, z);
                    long j = p65Var.T;
                    int i14 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR2 = gx1.R(p65Var, r28VarR);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, zk7VarC);
                    tp7.B(p65Var, q12.e, i89VarL);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i14));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR2);
                    ur7.a(new ax5(tgaVar.a), null, jfc.c, null, v82.g, 0.0f, null, 0, p65Var, 1573296, 1976);
                    if (tgaVar.b) {
                        p65Var.Y(-961522988);
                        w2g.e(vn7.J(R.drawable.ic_image_checkmark, 0, p65Var), vo7.R(p65Var, R.string.content_description_selected), w2g.C(iy0.a.a(o28Var, z46.l), 8.0f), null, null, 0.0f, null, p65Var, 8, 120);
                        z2 = false;
                    } else {
                        z2 = false;
                        p65Var.Y(-965422850);
                    }
                    p65Var.p(z2);
                    p65Var.p(true);
                    p65Var.p(z2);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                xr6 xr6Var = (xr6) obj;
                int iIntValue3 = ((Number) obj2).intValue();
                x12 x12Var2 = (x12) obj3;
                int iIntValue4 = ((Number) obj4).intValue();
                if ((iIntValue4 & 6) == 0) {
                    i2 = iIntValue4 | (((p65) x12Var2).f(xr6Var) ? 4 : 2);
                } else {
                    i2 = iIntValue4;
                }
                if ((iIntValue4 & 48) == 0) {
                    i2 |= ((p65) x12Var2).d(iIntValue3) ? 32 : 16;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
                    rg1 rg1Var = (rg1) list.get(iIntValue3);
                    p65Var2.Y(-260494832);
                    jp7 jp7Var = (jp7) p65Var2.j(kt7.a);
                    o28 o28Var2 = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var2, 3, 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.h, false);
                    long j2 = p65Var2.T;
                    int i15 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR3 = gx1.R(p65Var2, r28VarJ);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var2, cuVar, zk7VarC2);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var2, cuVar2, i89VarL2);
                    Integer numValueOf = Integer.valueOf(i15);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var2, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var2, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var2, cuVar4, r28VarR3);
                    r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC3 = dy0.c(z46.d, false);
                    long j3 = p65Var2.T;
                    int i16 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var2.l();
                    r28 r28VarR4 = gx1.R(p65Var2, r28VarD);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar, zk7VarC3);
                    tp7.B(p65Var2, cuVar2, i89VarL3);
                    ka1.z(i16, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR4);
                    g01.b(rg1Var, (ye1) obj5, w2g.G(o28Var2, 24.0f, 0.0f, 24.0f, 0.0f, 10), oe1.S, p65Var2, 3456, 0);
                    b09.H(p65Var2, true, true, false);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                xr6 xr6Var2 = (xr6) obj;
                int iIntValue5 = ((Number) obj2).intValue();
                x12 x12Var3 = (x12) obj3;
                int iIntValue6 = ((Number) obj4).intValue();
                l64 l64Var = (l64) obj5;
                if ((iIntValue6 & 6) == 0) {
                    i3 = iIntValue6 | (((p65) x12Var3).f(xr6Var2) ? 4 : 2);
                } else {
                    i3 = iIntValue6;
                }
                if ((iIntValue6 & 48) == 0) {
                    i3 |= ((p65) x12Var3).d(iIntValue5) ? 32 : 16;
                }
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(i3 & 1, (i3 & 147) != 146)) {
                    k9d k9dVar = (k9d) list.get(iIntValue5);
                    p65Var3.Y(1819349485);
                    boolean zH = p65Var3.h(l64Var);
                    Object objM2 = p65Var3.M();
                    if (zH || objM2 == uobVar) {
                        objM2 = new xi1(2, l64Var, l64.class, "onTagPresented", "onTagPresented(Ljava/lang/String;Lgen/model/SourceParameter;)V", 0, 4);
                        p65Var3.j0(objM2);
                    }
                    b55 b55Var = (b55) ((qh6) objM2);
                    boolean zH2 = p65Var3.h(l64Var);
                    Object objM3 = p65Var3.M();
                    if (zH2 || objM3 == uobVar) {
                        objM3 = new xi1(2, l64Var, l64.class, "onTagSelected", "onTagSelected(Ljava/lang/String;Lgen/model/SourceParameter;)V", 0, 5);
                        p65Var3.j0(objM3);
                    }
                    fo7.z(k9dVar, b55Var, (b55) ((qh6) objM3), null, p65Var3, 0);
                    p65Var3.p(false);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 3:
                xr6 xr6Var3 = (xr6) obj;
                int iIntValue7 = ((Number) obj2).intValue();
                x12 x12Var4 = (x12) obj3;
                int iIntValue8 = ((Number) obj4).intValue();
                if ((iIntValue8 & 6) == 0) {
                    i4 = iIntValue8 | (((p65) x12Var4).f(xr6Var3) ? 4 : 2);
                } else {
                    i4 = iIntValue8;
                }
                if ((iIntValue8 & 48) == 0) {
                    i4 |= ((p65) x12Var4).d(iIntValue7) ? 32 : 16;
                }
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(i4 & 1, (i4 & 147) != 146)) {
                    sb4 sb4Var = (sb4) ((az5) list).get(iIntValue7);
                    p65Var4.Y(975578812);
                    jp7 jp7Var2 = (jp7) p65Var4.j(kt7.a);
                    o28 o28Var3 = o28.b;
                    r28 r28VarJ2 = ka1.j(jp7Var2, o28Var3, 3, 1.0f);
                    zk7 zk7VarC4 = dy0.c(z46.h, false);
                    long j4 = p65Var4.T;
                    int i17 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL4 = p65Var4.l();
                    r28 r28VarR5 = gx1.R(p65Var4, r28VarJ2);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var3);
                    } else {
                        p65Var4.m0();
                    }
                    cu cuVar5 = q12.f;
                    tp7.B(p65Var4, cuVar5, zk7VarC4);
                    cu cuVar6 = q12.e;
                    tp7.B(p65Var4, cuVar6, i89VarL4);
                    Integer numValueOf2 = Integer.valueOf(i17);
                    cu cuVar7 = q12.g;
                    tp7.B(p65Var4, cuVar7, numValueOf2);
                    fn fnVar2 = q12.h;
                    tp7.y(p65Var4, fnVar2);
                    cu cuVar8 = q12.d;
                    tp7.B(p65Var4, cuVar8, r28VarR5);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC5 = dy0.c(z46.d, false);
                    long j5 = p65Var4.T;
                    int i18 = (int) (j5 ^ (j5 >>> 32));
                    i89 i89VarL5 = p65Var4.l();
                    r28 r28VarR6 = gx1.R(p65Var4, r28VarD2);
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var3);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, cuVar5, zk7VarC5);
                    tp7.B(p65Var4, cuVar6, i89VarL5);
                    ka1.z(i18, p65Var4, cuVar7, p65Var4, fnVar2);
                    tp7.B(p65Var4, cuVar8, r28VarR6);
                    if (iIntValue7 > 0) {
                        p65Var4.Y(-751626575);
                        tp7.c(0.0f, 6, 6, 0L, p65Var4, w2g.G(o28Var3, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                        r5 = 0;
                    } else {
                        r5 = 0;
                        p65Var4.Y(-761404688);
                    }
                    p65Var4.p(r5);
                    g01.d(sb4Var, (s26) obj5, null, p65Var4, r5);
                    b09.H(p65Var4, true, true, r5);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                xr6 xr6Var4 = (xr6) obj;
                int iIntValue9 = ((Number) obj2).intValue();
                x12 x12Var5 = (x12) obj3;
                int iIntValue10 = ((Number) obj4).intValue();
                if ((iIntValue10 & 6) == 0) {
                    i5 = iIntValue10 | (((p65) x12Var5).f(xr6Var4) ? 4 : 2);
                } else {
                    i5 = iIntValue10;
                }
                if ((iIntValue10 & 48) == 0) {
                    i5 |= ((p65) x12Var5).d(iIntValue9) ? 32 : 16;
                }
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(i5 & 1, (i5 & 147) != 146)) {
                    hne hneVar = (hne) list.get(iIntValue9);
                    p65Var5.Y(833323045);
                    String str = "followers_item_" + iIntValue9;
                    o28 o28Var4 = o28.b;
                    r28 r28VarX = ho2.x((jp7) p65Var5.j(kt7.a), bgf.N(o28Var4, str), 3, 1.0f);
                    zk7 zk7VarC6 = dy0.c(z46.h, false);
                    long j6 = p65Var5.T;
                    int i19 = (int) (j6 ^ (j6 >>> 32));
                    i89 i89VarL6 = p65Var5.l();
                    r28 r28VarR7 = gx1.R(p65Var5, r28VarX);
                    r12.W.getClass();
                    ot2 ot2Var4 = q12.b;
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var4);
                    } else {
                        p65Var5.m0();
                    }
                    cu cuVar9 = q12.f;
                    tp7.B(p65Var5, cuVar9, zk7VarC6);
                    cu cuVar10 = q12.e;
                    tp7.B(p65Var5, cuVar10, i89VarL6);
                    Integer numValueOf3 = Integer.valueOf(i19);
                    cu cuVar11 = q12.g;
                    tp7.B(p65Var5, cuVar11, numValueOf3);
                    fn fnVar3 = q12.h;
                    tp7.y(p65Var5, fnVar3);
                    cu cuVar12 = q12.d;
                    tp7.B(p65Var5, cuVar12, r28VarR7);
                    r28 r28VarD3 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC7 = dy0.c(z46.d, false);
                    long j7 = p65Var5.T;
                    int i20 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL7 = p65Var5.l();
                    r28 r28VarR8 = gx1.R(p65Var5, r28VarD3);
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var4);
                    } else {
                        p65Var5.m0();
                    }
                    tp7.B(p65Var5, cuVar9, zk7VarC7);
                    tp7.B(p65Var5, cuVar10, i89VarL7);
                    ka1.z(i20, p65Var5, cuVar11, p65Var5, fnVar3);
                    tp7.B(p65Var5, cuVar12, r28VarR8);
                    rr7.s(hneVar, (lw4) obj5, null, false, p65Var5, 0, 12);
                    b09.H(p65Var5, true, true, false);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 5:
                xr6 xr6Var5 = (xr6) obj;
                int iIntValue11 = ((Number) obj2).intValue();
                x12 x12Var6 = (x12) obj3;
                int iIntValue12 = ((Number) obj4).intValue();
                if ((iIntValue12 & 6) == 0) {
                    i6 = iIntValue12 | (((p65) x12Var6).f(xr6Var5) ? 4 : 2);
                } else {
                    i6 = iIntValue12;
                }
                if ((iIntValue12 & 48) == 0) {
                    i6 |= ((p65) x12Var6).d(iIntValue11) ? 32 : 16;
                }
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(i6 & 1, (i6 & 147) != 146)) {
                    Object obj6 = ((ArrayList) list).get(iIntValue11);
                    int i21 = i6 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER;
                    kl5 kl5Var = (kl5) obj6;
                    p65Var6.Y(-476074310);
                    jp7 jp7Var3 = (jp7) p65Var6.j(kt7.a);
                    o28 o28Var5 = o28.b;
                    r28 r28VarJ3 = ka1.j(jp7Var3, o28Var5, 3, 1.0f);
                    zk7 zk7VarC8 = dy0.c(z46.h, false);
                    long j8 = p65Var6.T;
                    int i22 = (int) (j8 ^ (j8 >>> 32));
                    i89 i89VarL8 = p65Var6.l();
                    r28 r28VarR9 = gx1.R(p65Var6, r28VarJ3);
                    r12.W.getClass();
                    ot2 ot2Var5 = q12.b;
                    p65Var6.c0();
                    if (p65Var6.S) {
                        p65Var6.k(ot2Var5);
                    } else {
                        p65Var6.m0();
                    }
                    cu cuVar13 = q12.f;
                    tp7.B(p65Var6, cuVar13, zk7VarC8);
                    cu cuVar14 = q12.e;
                    tp7.B(p65Var6, cuVar14, i89VarL8);
                    Integer numValueOf4 = Integer.valueOf(i22);
                    cu cuVar15 = q12.g;
                    tp7.B(p65Var6, cuVar15, numValueOf4);
                    fn fnVar4 = q12.h;
                    tp7.y(p65Var6, fnVar4);
                    cu cuVar16 = q12.d;
                    tp7.B(p65Var6, cuVar16, r28VarR9);
                    r28 r28VarD4 = jfc.d(jfc.o(o28Var5, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC9 = dy0.c(z46.d, false);
                    long j9 = p65Var6.T;
                    int i23 = (int) (j9 ^ (j9 >>> 32));
                    i89 i89VarL9 = p65Var6.l();
                    r28 r28VarR10 = gx1.R(p65Var6, r28VarD4);
                    p65Var6.c0();
                    if (p65Var6.S) {
                        p65Var6.k(ot2Var5);
                    } else {
                        p65Var6.m0();
                    }
                    tp7.B(p65Var6, cuVar13, zk7VarC9);
                    tp7.B(p65Var6, cuVar14, i89VarL9);
                    ka1.z(i23, p65Var6, cuVar15, p65Var6, fnVar4);
                    tp7.B(p65Var6, cuVar16, r28VarR10);
                    g76.k(iIntValue11, kl5Var, (sl5) obj5, bgf.N(o28Var5, "highlights_item_" + iIntValue11), p65Var6, (i21 >> 3) & 14);
                    b09.H(p65Var6, true, true, false);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 6:
                xr6 xr6Var6 = (xr6) obj;
                int iIntValue13 = ((Number) obj2).intValue();
                x12 x12Var7 = (x12) obj3;
                int iIntValue14 = ((Number) obj4).intValue();
                if ((iIntValue14 & 6) == 0) {
                    i7 = iIntValue14 | (((p65) x12Var7).f(xr6Var6) ? 4 : 2);
                } else {
                    i7 = iIntValue14;
                }
                if ((iIntValue14 & 48) == 0) {
                    i7 |= ((p65) x12Var7).d(iIntValue13) ? 32 : 16;
                }
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(i7 & 1, (i7 & 147) != 146)) {
                    c47 c47Var = (c47) ((ArrayList) list).get(iIntValue13);
                    p65Var7.Y(1731682460);
                    if (c47Var instanceof a47) {
                        p65Var7.Y(-1468157344);
                        a47 a47Var = (a47) c47Var;
                        k50.r(a47Var.a, af1.a(a47Var.b, p65Var7), a47Var.c, a47Var.d, (u37) obj5, p65Var7, 0);
                        z3 = false;
                        p65Var7.p(false);
                    } else {
                        z3 = false;
                        if (!(c47Var instanceof b47)) {
                            throw ho2.L(p65Var7, -1468159929, false);
                        }
                        p65Var7.Y(-1468144579);
                        k50.G(null, p65Var7, 0);
                        p65Var7.p(false);
                    }
                    p65Var7.p(z3);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 7:
                xr6 xr6Var7 = (xr6) obj;
                int iIntValue15 = ((Number) obj2).intValue();
                x12 x12Var8 = (x12) obj3;
                int iIntValue16 = ((Number) obj4).intValue();
                ar0 ar0Var3 = z46.d;
                ar0 ar0Var4 = z46.h;
                if ((iIntValue16 & 6) == 0) {
                    i8 = iIntValue16 | (((p65) x12Var8).f(xr6Var7) ? 4 : 2);
                } else {
                    i8 = iIntValue16;
                }
                if ((iIntValue16 & 48) == 0) {
                    i8 |= ((p65) x12Var8).d(iIntValue15) ? 32 : 16;
                }
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(i8 & 1, (i8 & 147) != 146)) {
                    wqc wqcVar = (wqc) ((ArrayList) list).get(iIntValue15);
                    p65Var8.Y(366597934);
                    o28 o28Var6 = o28.b;
                    if (iIntValue15 > 0) {
                        p65Var8.Y(366605962);
                        r28 r28VarJ4 = ka1.j((jp7) p65Var8.j(kt7.a), o28Var6, 3, 1.0f);
                        zk7 zk7VarC10 = dy0.c(ar0Var4, false);
                        long j10 = p65Var8.T;
                        int i24 = (int) (j10 ^ (j10 >>> 32));
                        i89 i89VarL10 = p65Var8.l();
                        r28 r28VarR11 = gx1.R(p65Var8, r28VarJ4);
                        r12.W.getClass();
                        ot2 ot2Var6 = q12.b;
                        p65Var8.c0();
                        if (p65Var8.S) {
                            p65Var8.k(ot2Var6);
                        } else {
                            p65Var8.m0();
                        }
                        cu cuVar17 = q12.f;
                        tp7.B(p65Var8, cuVar17, zk7VarC10);
                        cu cuVar18 = q12.e;
                        tp7.B(p65Var8, cuVar18, i89VarL10);
                        Integer numValueOf5 = Integer.valueOf(i24);
                        cu cuVar19 = q12.g;
                        tp7.B(p65Var8, cuVar19, numValueOf5);
                        fn fnVar5 = q12.h;
                        tp7.y(p65Var8, fnVar5);
                        cu cuVar20 = q12.d;
                        tp7.B(p65Var8, cuVar20, r28VarR11);
                        r28 r28VarD5 = jfc.d(jfc.o(o28Var6, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                        zk7 zk7VarC11 = dy0.c(ar0Var3, false);
                        ar0Var = ar0Var3;
                        ar0Var2 = ar0Var4;
                        long j11 = p65Var8.T;
                        int i25 = (int) (j11 ^ (j11 >>> 32));
                        i89 i89VarL11 = p65Var8.l();
                        r28 r28VarR12 = gx1.R(p65Var8, r28VarD5);
                        p65Var8.c0();
                        if (p65Var8.S) {
                            p65Var8.k(ot2Var6);
                        } else {
                            p65Var8.m0();
                        }
                        tp7.B(p65Var8, cuVar17, zk7VarC11);
                        tp7.B(p65Var8, cuVar18, i89VarL11);
                        ka1.z(i25, p65Var8, cuVar19, p65Var8, fnVar5);
                        tp7.B(p65Var8, cuVar20, r28VarR12);
                        tp7.c(0.0f, 0, 7, 0L, p65Var8, null);
                        z4 = false;
                        b09.H(p65Var8, true, true, false);
                    } else {
                        ar0Var = ar0Var3;
                        ar0Var2 = ar0Var4;
                        z4 = false;
                        p65Var8.Y(357384640);
                        p65Var8.p(false);
                    }
                    r28 r28VarJ5 = ka1.j((jp7) p65Var8.j(kt7.a), o28Var6, 3, 1.0f);
                    zk7 zk7VarC12 = dy0.c(ar0Var2, z4);
                    long j12 = p65Var8.T;
                    int i26 = (int) (j12 ^ (j12 >>> 32));
                    i89 i89VarL12 = p65Var8.l();
                    r28 r28VarR13 = gx1.R(p65Var8, r28VarJ5);
                    r12.W.getClass();
                    ot2 ot2Var7 = q12.b;
                    p65Var8.c0();
                    if (p65Var8.S) {
                        p65Var8.k(ot2Var7);
                    } else {
                        p65Var8.m0();
                    }
                    cu cuVar21 = q12.f;
                    tp7.B(p65Var8, cuVar21, zk7VarC12);
                    cu cuVar22 = q12.e;
                    tp7.B(p65Var8, cuVar22, i89VarL12);
                    Integer numValueOf6 = Integer.valueOf(i26);
                    cu cuVar23 = q12.g;
                    tp7.B(p65Var8, cuVar23, numValueOf6);
                    fn fnVar6 = q12.h;
                    tp7.y(p65Var8, fnVar6);
                    cu cuVar24 = q12.d;
                    tp7.B(p65Var8, cuVar24, r28VarR13);
                    r28 r28VarD6 = jfc.d(jfc.o(o28Var6, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC13 = dy0.c(ar0Var, false);
                    long j13 = p65Var8.T;
                    int i27 = (int) (j13 ^ (j13 >>> 32));
                    i89 i89VarL13 = p65Var8.l();
                    r28 r28VarR14 = gx1.R(p65Var8, r28VarD6);
                    p65Var8.c0();
                    if (p65Var8.S) {
                        p65Var8.k(ot2Var7);
                    } else {
                        p65Var8.m0();
                    }
                    tp7.B(p65Var8, cuVar21, zk7VarC13);
                    tp7.B(p65Var8, cuVar22, i89VarL13);
                    ka1.z(i27, p65Var8, cuVar23, p65Var8, fnVar6);
                    tp7.B(p65Var8, cuVar24, r28VarR14);
                    hk7.j(wqcVar, (e9a) obj5, null, p65Var8, 0, 4);
                    b09.H(p65Var8, true, true, false);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 8:
                xr6 xr6Var8 = (xr6) obj;
                int iIntValue17 = ((Number) obj2).intValue();
                x12 x12Var9 = (x12) obj3;
                int iIntValue18 = ((Number) obj4).intValue();
                if ((iIntValue18 & 6) == 0) {
                    i9 = iIntValue18 | (((p65) x12Var9).f(xr6Var8) ? 4 : 2);
                } else {
                    i9 = iIntValue18;
                }
                if ((iIntValue18 & 48) == 0) {
                    i9 |= ((p65) x12Var9).d(iIntValue17) ? 32 : 16;
                }
                p65 p65Var9 = (p65) x12Var9;
                if (p65Var9.P(i9 & 1, (i9 & 147) != 146)) {
                    kmc kmcVar = (kmc) ((az5) list).get(iIntValue17);
                    p65Var9.Y(577058594);
                    o28 o28Var7 = o28.b;
                    r28 r28VarD7 = jfc.d(jfc.r(o28Var7, 3), 1.0f);
                    zk7 zk7VarC14 = dy0.c(z46.h, false);
                    long j14 = p65Var9.T;
                    int i28 = (int) (j14 ^ (j14 >>> 32));
                    i89 i89VarL14 = p65Var9.l();
                    r28 r28VarR15 = gx1.R(p65Var9, r28VarD7);
                    r12.W.getClass();
                    ot2 ot2Var8 = q12.b;
                    p65Var9.c0();
                    if (p65Var9.S) {
                        p65Var9.k(ot2Var8);
                    } else {
                        p65Var9.m0();
                    }
                    cu cuVar25 = q12.f;
                    tp7.B(p65Var9, cuVar25, zk7VarC14);
                    cu cuVar26 = q12.e;
                    tp7.B(p65Var9, cuVar26, i89VarL14);
                    Integer numValueOf7 = Integer.valueOf(i28);
                    cu cuVar27 = q12.g;
                    tp7.B(p65Var9, cuVar27, numValueOf7);
                    fn fnVar7 = q12.h;
                    tp7.y(p65Var9, fnVar7);
                    cu cuVar28 = q12.d;
                    tp7.B(p65Var9, cuVar28, r28VarR15);
                    r28 r28VarD8 = jfc.d(jfc.o(o28Var7, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC15 = dy0.c(z46.d, false);
                    long j15 = p65Var9.T;
                    int i29 = (int) (j15 ^ (j15 >>> 32));
                    i89 i89VarL15 = p65Var9.l();
                    r28 r28VarR16 = gx1.R(p65Var9, r28VarD8);
                    p65Var9.c0();
                    if (p65Var9.S) {
                        p65Var9.k(ot2Var8);
                    } else {
                        p65Var9.m0();
                    }
                    tp7.B(p65Var9, cuVar25, zk7VarC15);
                    tp7.B(p65Var9, cuVar26, i89VarL15);
                    ka1.z(i29, p65Var9, cuVar27, p65Var9, fnVar7);
                    tp7.B(p65Var9, cuVar28, r28VarR16);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var9, 0);
                    long j16 = p65Var9.T;
                    int i30 = (int) (j16 ^ (j16 >>> 32));
                    i89 i89VarL16 = p65Var9.l();
                    r28 r28VarR17 = gx1.R(p65Var9, o28Var7);
                    p65Var9.c0();
                    if (p65Var9.S) {
                        p65Var9.k(ot2Var8);
                    } else {
                        p65Var9.m0();
                    }
                    tp7.B(p65Var9, cuVar25, wv1VarA);
                    tp7.B(p65Var9, cuVar26, i89VarL16);
                    ka1.z(i30, p65Var9, cuVar27, p65Var9, fnVar7);
                    tp7.B(p65Var9, cuVar28, r28VarR17);
                    if (iIntValue17 > 0) {
                        p65Var9.Y(-703552947);
                        tp7.c(0.0f, 6, 6, 0L, p65Var9, w2g.G(o28Var7, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                        z5 = false;
                    } else {
                        z5 = false;
                        p65Var9.Y(-722189124);
                    }
                    p65Var9.p(z5);
                    imc.a(kmcVar, (a1a) obj5, null, iIntValue17 > 0 ? imc.a : w2g.h(0.0f, 20.0f, 0.0f, 32.0f, 5), p65Var9, 0, 4);
                    ho2.N(p65Var9, true, true, true, false);
                } else {
                    p65Var9.S();
                }
                return c1eVar;
            case 9:
                xr6 xr6Var9 = (xr6) obj;
                int iIntValue19 = ((Number) obj2).intValue();
                x12 x12Var10 = (x12) obj3;
                int iIntValue20 = ((Number) obj4).intValue();
                if ((iIntValue20 & 6) == 0) {
                    i10 = iIntValue20 | (((p65) x12Var10).f(xr6Var9) ? 4 : 2);
                } else {
                    i10 = iIntValue20;
                }
                if ((iIntValue20 & 48) == 0) {
                    i10 |= ((p65) x12Var10).d(iIntValue19) ? 32 : 16;
                }
                p65 p65Var10 = (p65) x12Var10;
                if (p65Var10.P(i10 & 1, (i10 & 147) != 146)) {
                    hne hneVar2 = (hne) list.get(iIntValue19);
                    p65Var10.Y(931876469);
                    String str2 = "followers_item_" + iIntValue19;
                    o28 o28Var8 = o28.b;
                    r28 r28VarX2 = ho2.x((jp7) p65Var10.j(kt7.a), bgf.N(o28Var8, str2), 3, 1.0f);
                    zk7 zk7VarC16 = dy0.c(z46.h, false);
                    long j17 = p65Var10.T;
                    int i31 = (int) (j17 ^ (j17 >>> 32));
                    i89 i89VarL17 = p65Var10.l();
                    r28 r28VarR18 = gx1.R(p65Var10, r28VarX2);
                    r12.W.getClass();
                    ot2 ot2Var9 = q12.b;
                    p65Var10.c0();
                    if (p65Var10.S) {
                        p65Var10.k(ot2Var9);
                    } else {
                        p65Var10.m0();
                    }
                    cu cuVar29 = q12.f;
                    tp7.B(p65Var10, cuVar29, zk7VarC16);
                    cu cuVar30 = q12.e;
                    tp7.B(p65Var10, cuVar30, i89VarL17);
                    Integer numValueOf8 = Integer.valueOf(i31);
                    cu cuVar31 = q12.g;
                    tp7.B(p65Var10, cuVar31, numValueOf8);
                    fn fnVar8 = q12.h;
                    tp7.y(p65Var10, fnVar8);
                    cu cuVar32 = q12.d;
                    tp7.B(p65Var10, cuVar32, r28VarR18);
                    r28 r28VarD9 = jfc.d(jfc.o(o28Var8, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC17 = dy0.c(z46.d, false);
                    long j18 = p65Var10.T;
                    int i32 = (int) (j18 ^ (j18 >>> 32));
                    i89 i89VarL18 = p65Var10.l();
                    r28 r28VarR19 = gx1.R(p65Var10, r28VarD9);
                    p65Var10.c0();
                    if (p65Var10.S) {
                        p65Var10.k(ot2Var9);
                    } else {
                        p65Var10.m0();
                    }
                    tp7.B(p65Var10, cuVar29, zk7VarC17);
                    tp7.B(p65Var10, cuVar30, i89VarL18);
                    ka1.z(i32, p65Var10, cuVar31, p65Var10, fnVar8);
                    tp7.B(p65Var10, cuVar32, r28VarR19);
                    rr7.s(hneVar2, (jha) obj5, null, false, p65Var10, 0, 12);
                    b09.H(p65Var10, true, true, false);
                } else {
                    p65Var10.S();
                }
                return c1eVar;
            case 10:
                return a(obj, obj2, obj3, obj4);
            case 11:
                return d(obj, obj2, obj3, obj4);
            case 12:
                return g(obj, obj2, obj3, obj4);
            case 13:
                return h(obj, obj2, obj3, obj4);
            case 14:
                return i(obj, obj2, obj3, obj4);
            case 15:
                return j(obj, obj2, obj3, obj4);
            case 16:
                return l(obj, obj2, obj3, obj4);
            case 17:
                return n(obj, obj2, obj3, obj4);
            case 18:
                return o(obj, obj2, obj3, obj4);
            default:
                xr6 xr6Var10 = (xr6) obj;
                int iIntValue21 = ((Number) obj2).intValue();
                x12 x12Var11 = (x12) obj3;
                int iIntValue22 = ((Number) obj4).intValue();
                b55 b55Var2 = (b55) obj5;
                if ((iIntValue22 & 6) == 0) {
                    i11 = iIntValue22 | (((p65) x12Var11).f(xr6Var10) ? 4 : 2);
                } else {
                    i11 = iIntValue22;
                }
                if ((iIntValue22 & 48) == 0) {
                    i11 |= ((p65) x12Var11).d(iIntValue21) ? 32 : 16;
                }
                p65 p65Var11 = (p65) x12Var11;
                if (p65Var11.P(i11 & 1, (i11 & 147) != 146)) {
                    uwe uweVar = (uwe) list.get(iIntValue21);
                    p65Var11.Y(-668090413);
                    boolean zF2 = p65Var11.f(b55Var2) | p65Var11.f(uweVar);
                    Object objM4 = p65Var11.M();
                    if (zF2 || objM4 == uobVar) {
                        objM4 = new j8e(b55Var2, i13, uweVar);
                        p65Var11.j0(objM4);
                    }
                    tp7.m(uweVar, iIntValue21, (x45) objM4, p65Var11, i11 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                    p65Var11.p(false);
                } else {
                    p65Var11.S();
                }
                return c1eVar;
        }
    }
}
