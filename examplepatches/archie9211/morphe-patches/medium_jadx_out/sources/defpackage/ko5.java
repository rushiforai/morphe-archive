package defpackage;

import com.drew.imaging.eps.ld.PdtluglzAX;
import com.medium.reader.R;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ko5 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ float b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ ko5(Object obj, float f, Object obj2, Object obj3, Object obj4, int i) {
        this.a = i;
        this.d = obj;
        this.b = f;
        this.c = obj2;
        this.e = obj3;
        this.f = obj4;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        int i2 = 2;
        c1e c1eVar = c1e.a;
        Object obj2 = this.f;
        Object obj3 = this.e;
        Object obj4 = this.c;
        Object obj5 = this.d;
        final int i3 = 1;
        switch (i) {
            case 0:
                final uo5 uo5Var = (uo5) obj5;
                final stc stcVar = (stc) obj4;
                final no5 no5Var = (no5) obj2;
                xu6 xu6Var = (xu6) obj;
                xu6Var.getClass();
                ArrayList arrayList = uo5Var.a;
                p44 p44Var = new p44(15);
                int size = arrayList.size();
                dy4 dy4Var = new dy4(p44Var, 5, arrayList);
                rl5 rl5Var = new rl5(i3, arrayList);
                final float f = this.b;
                xu6Var.l0(size, dy4Var, rl5Var, new mz1(new oo5(arrayList, f, stcVar, (md3) obj3), true, 2039820996));
                if (uo5Var.c) {
                    final int i4 = 0;
                    ev6.j(xu6Var, "home_featured_loading_more", new mz1(new c55() { // from class: io5
                        @Override // defpackage.c55
                        public final Object f(Object obj6, Object obj7, Object obj8) {
                            int i5 = i4;
                            c1e c1eVar2 = c1e.a;
                            float f2 = f;
                            switch (i5) {
                                case 0:
                                    x12 x12Var = (x12) obj7;
                                    int iIntValue = ((Integer) obj8).intValue();
                                    ((xr6) obj6).getClass();
                                    p65 p65Var = (p65) x12Var;
                                    if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                                        p65Var.S();
                                    } else {
                                        jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                                        o28 o28Var = o28.b;
                                        r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                                        zk7 zk7VarC = dy0.c(z46.h, false);
                                        long j = p65Var.T;
                                        int i6 = (int) (j ^ (j >>> 32));
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
                                        Integer numValueOf = Integer.valueOf(i6);
                                        cu cuVar3 = q12.g;
                                        tp7.B(p65Var, cuVar3, numValueOf);
                                        fn fnVar = q12.h;
                                        tp7.y(p65Var, fnVar);
                                        cu cuVar4 = q12.d;
                                        tp7.B(p65Var, cuVar4, r28VarR);
                                        r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                                        zk7 zk7VarC2 = dy0.c(z46.d, false);
                                        long j2 = p65Var.T;
                                        int i7 = (int) (j2 ^ (j2 >>> 32));
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
                                        ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
                                        tp7.B(p65Var, cuVar4, r28VarR2);
                                        tp7.c(0.0f, 0, 6, 0L, p65Var, w2g.E(o28Var, f2, 0.0f, 2));
                                        il7.l(stcVar, null, 0L, null, p65Var, 0, 14);
                                        p65Var.p(true);
                                        p65Var.p(true);
                                    }
                                    break;
                                default:
                                    x12 x12Var2 = (x12) obj7;
                                    int iIntValue2 = ((Integer) obj8).intValue();
                                    ((xr6) obj6).getClass();
                                    p65 p65Var2 = (p65) x12Var2;
                                    if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                                        p65Var2.S();
                                    } else {
                                        jp7 jp7Var2 = (jp7) p65Var2.j(kt7.a);
                                        o28 o28Var2 = o28.b;
                                        r28 r28VarJ2 = ka1.j(jp7Var2, o28Var2, 3, 1.0f);
                                        zk7 zk7VarC3 = dy0.c(z46.h, false);
                                        long j3 = p65Var2.T;
                                        int i8 = (int) (j3 ^ (j3 >>> 32));
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
                                        r28 r28VarD2 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                                        zk7 zk7VarC4 = dy0.c(z46.d, false);
                                        long j4 = p65Var2.T;
                                        int i9 = (int) (j4 ^ (j4 >>> 32));
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
                                        tp7.c(0.0f, 0, 6, 0L, p65Var2, w2g.E(o28Var2, f2, 0.0f, 2));
                                        il7.l(stcVar, null, 0L, null, p65Var2, 0, 14);
                                        p65Var2.p(true);
                                        p65Var2.p(true);
                                    }
                                    break;
                            }
                            return c1eVar2;
                        }
                    }, true, -1561610891), 2);
                }
                if (!uo5Var.d) {
                    ev6.j(xu6Var, "home_featured_no_more_items", new mz1(new c55() { // from class: jo5
                        @Override // defpackage.c55
                        public final Object f(Object obj6, Object obj7, Object obj8) {
                            x12 x12Var = (x12) obj7;
                            int iIntValue = ((Integer) obj8).intValue();
                            ((xr6) obj6).getClass();
                            p65 p65Var = (p65) x12Var;
                            if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                                o28 o28Var = o28.b;
                                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                                zk7 zk7VarC = dy0.c(z46.h, false);
                                long j = p65Var.T;
                                int i5 = (int) (j ^ (j >>> 32));
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
                                Integer numValueOf = Integer.valueOf(i5);
                                cu cuVar3 = q12.g;
                                tp7.B(p65Var, cuVar3, numValueOf);
                                fn fnVar = q12.h;
                                tp7.y(p65Var, fnVar);
                                cu cuVar4 = q12.d;
                                tp7.B(p65Var, cuVar4, r28VarR);
                                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                                zk7 zk7VarC2 = dy0.c(z46.d, false);
                                long j2 = p65Var.T;
                                int i6 = (int) (j2 ^ (j2 >>> 32));
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
                                ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
                                tp7.B(p65Var, cuVar4, r28VarR2);
                                tp7.c(0.0f, 0, 6, 0L, p65Var, w2g.E(o28Var, f, 0.0f, 2));
                                String strR = vo7.R(p65Var, R.string.home_featured_end_of_feed_title);
                                String strR2 = vo7.R(p65Var, R.string.home_featured_end_of_feed_message);
                                String strR3 = vo7.R(p65Var, R.string.home_featured_end_of_feed_action);
                                no5 no5Var2 = no5Var;
                                boolean zF = p65Var.f(no5Var2);
                                uo5 uo5Var2 = uo5Var;
                                boolean zF2 = zF | p65Var.f(uo5Var2);
                                Object objM = p65Var.M();
                                if (zF2 || objM == w12.a) {
                                    objM = new gd3(no5Var2, 27, uo5Var2);
                                    p65Var.j0(objM);
                                }
                                gq7.a(null, null, strR, strR2, 0L, null, null, strR3, (m45) objM, 0.0f, 0.0f, p65Var, 0, 0, 1651);
                                p65Var.p(true);
                                p65Var.p(true);
                            } else {
                                p65Var.S();
                            }
                            return c1e.a;
                        }
                    }, true, -1633302050), 2);
                }
                break;
            case 1:
                wp5 wp5Var = (wp5) obj5;
                final stc stcVar2 = (stc) obj4;
                md3 md3Var = (md3) obj3;
                k8b k8bVar = (k8b) obj2;
                xu6 xu6Var2 = (xu6) obj;
                xu6Var2.getClass();
                ArrayList arrayList2 = wp5Var.a;
                p44 p44Var2 = new p44(16);
                int size2 = arrayList2.size();
                dy4 dy4Var2 = new dy4(p44Var2, 6, arrayList2);
                rl5 rl5Var2 = new rl5(i2, arrayList2);
                final float f2 = this.b;
                xu6Var2.l0(size2, dy4Var2, rl5Var2, new mz1(new hp5(arrayList2, f2, stcVar2, md3Var, k8bVar), true, 2039820996));
                if (wp5Var.c) {
                    ev6.j(xu6Var2, PdtluglzAX.LrBMKQuJTR, new mz1(new c55() { // from class: io5
                        @Override // defpackage.c55
                        public final Object f(Object obj6, Object obj7, Object obj8) {
                            int i5 = i3;
                            c1e c1eVar2 = c1e.a;
                            float f22 = f2;
                            switch (i5) {
                                case 0:
                                    x12 x12Var = (x12) obj7;
                                    int iIntValue = ((Integer) obj8).intValue();
                                    ((xr6) obj6).getClass();
                                    p65 p65Var = (p65) x12Var;
                                    if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                                        p65Var.S();
                                    } else {
                                        jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                                        o28 o28Var = o28.b;
                                        r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                                        zk7 zk7VarC = dy0.c(z46.h, false);
                                        long j = p65Var.T;
                                        int i6 = (int) (j ^ (j >>> 32));
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
                                        Integer numValueOf = Integer.valueOf(i6);
                                        cu cuVar3 = q12.g;
                                        tp7.B(p65Var, cuVar3, numValueOf);
                                        fn fnVar = q12.h;
                                        tp7.y(p65Var, fnVar);
                                        cu cuVar4 = q12.d;
                                        tp7.B(p65Var, cuVar4, r28VarR);
                                        r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                                        zk7 zk7VarC2 = dy0.c(z46.d, false);
                                        long j2 = p65Var.T;
                                        int i7 = (int) (j2 ^ (j2 >>> 32));
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
                                        ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
                                        tp7.B(p65Var, cuVar4, r28VarR2);
                                        tp7.c(0.0f, 0, 6, 0L, p65Var, w2g.E(o28Var, f22, 0.0f, 2));
                                        il7.l(stcVar2, null, 0L, null, p65Var, 0, 14);
                                        p65Var.p(true);
                                        p65Var.p(true);
                                    }
                                    break;
                                default:
                                    x12 x12Var2 = (x12) obj7;
                                    int iIntValue2 = ((Integer) obj8).intValue();
                                    ((xr6) obj6).getClass();
                                    p65 p65Var2 = (p65) x12Var2;
                                    if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                                        p65Var2.S();
                                    } else {
                                        jp7 jp7Var2 = (jp7) p65Var2.j(kt7.a);
                                        o28 o28Var2 = o28.b;
                                        r28 r28VarJ2 = ka1.j(jp7Var2, o28Var2, 3, 1.0f);
                                        zk7 zk7VarC3 = dy0.c(z46.h, false);
                                        long j3 = p65Var2.T;
                                        int i8 = (int) (j3 ^ (j3 >>> 32));
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
                                        r28 r28VarD2 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                                        zk7 zk7VarC4 = dy0.c(z46.d, false);
                                        long j4 = p65Var2.T;
                                        int i9 = (int) (j4 ^ (j4 >>> 32));
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
                                        tp7.c(0.0f, 0, 6, 0L, p65Var2, w2g.E(o28Var2, f22, 0.0f, 2));
                                        il7.l(stcVar2, null, 0L, null, p65Var2, 0, 14);
                                        p65Var2.p(true);
                                        p65Var2.p(true);
                                    }
                                    break;
                            }
                            return c1eVar2;
                        }
                    }, true, 1957032674), 2);
                }
                break;
            default:
                long jLongValue = ((Long) obj).longValue();
                Object obj6 = ((rya) obj5).a;
                obj6.getClass();
                tr7.q((vw) obj6, jLongValue, this.b, (nw) obj4, (xw) obj3, (x45) obj2);
                break;
        }
        return c1eVar;
    }
}
