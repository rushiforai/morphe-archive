package defpackage;

import android.view.View;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fd3 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ fd3(kv6 kv6Var, Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = kv6Var;
        this.c = obj;
        this.d = obj2;
        this.e = obj3;
    }

    private final Object a(Object obj, Object obj2, Object obj3) {
        xe xeVar = (xe) this.c;
        m45 m45Var = (m45) this.b;
        m45 m45Var2 = (m45) this.d;
        cs1 cs1Var = (cs1) this.e;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (xeVar instanceof ue) {
                p65Var.Y(-558319416);
                rx0.i((ue) xeVar, m45Var, m45Var2, cs1Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (xeVar instanceof ve) {
                p65Var.Y(-557960498);
                rx0.e((ve) xeVar, m45Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(xeVar instanceof we)) {
                    throw ho2.L(p65Var, 1921649635, false);
                }
                p65Var.Y(-557684939);
                rx0.b(r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object d(Object obj, Object obj2, Object obj3) {
        kv6 kv6Var = (kv6) this.b;
        kf kfVar = (kf) this.c;
        e9d e9dVar = (e9d) this.d;
        m45 m45Var = (m45) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        int i = 0;
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zF = p65Var.f(kfVar) | p65Var.f(e9dVar);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new i0(kfVar, 3, e9dVar);
                p65Var.j0(objM);
            }
            k40.t(null, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, 0, 509);
            boolean zF2 = p65Var.f(kv6Var) | p65Var.f(m45Var);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                objM2 = new df(kv6Var, m45Var, null, i);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6Var);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object g(Object obj, Object obj2, Object obj3) {
        kv6 kv6Var = (kv6) this.b;
        yf yfVar = (yf) this.c;
        obe obeVar = (obe) this.d;
        tf tfVar = (tf) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zF = p65Var.f(yfVar) | p65Var.f(obeVar);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new i0(yfVar, 4, obeVar);
                p65Var.j0(objM);
            }
            k40.t(null, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, 0, 509);
            boolean zF2 = p65Var.f(kv6Var) | p65Var.f(tfVar);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                objM2 = new j0(kv6Var, tfVar, null, 9);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6Var);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object h(Object obj, Object obj2, Object obj3) {
        kv6 kv6Var = (kv6) this.b;
        ng ngVar = (ng) this.c;
        cs1 cs1Var = (cs1) this.d;
        ig igVar = (ig) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zF = p65Var.f(ngVar) | p65Var.f(cs1Var);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new i0(ngVar, 5, cs1Var);
                p65Var.j0(objM);
            }
            k40.t(null, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, 0, 509);
            boolean zF2 = p65Var.f(kv6Var) | p65Var.f(igVar);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                objM2 = new j0(kv6Var, igVar, null, 10);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6Var);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object i(Object obj, Object obj2, Object obj3) {
        kv6 kv6Var = (kv6) this.b;
        bh bhVar = (bh) this.c;
        obe obeVar = (obe) this.d;
        wg wgVar = (wg) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zF = p65Var.f(bhVar) | p65Var.f(obeVar);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new i0(bhVar, 6, obeVar);
                p65Var.j0(objM);
            }
            k40.t(null, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, 0, 509);
            boolean zF2 = p65Var.f(kv6Var) | p65Var.f(wgVar);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                objM2 = new j0(kv6Var, wgVar, null, 11);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6Var);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object j(Object obj, Object obj2, Object obj3) {
        kv6 kv6Var = (kv6) this.b;
        rh rhVar = (rh) this.c;
        obe obeVar = (obe) this.d;
        oh ohVar = (oh) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zF = p65Var.f(rhVar) | p65Var.f(obeVar);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new i0(rhVar, 7, obeVar);
                p65Var.j0(objM);
            }
            k40.t(null, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, 0, 509);
            boolean zF2 = p65Var.f(kv6Var) | p65Var.f(ohVar);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                objM2 = new j0(kv6Var, ohVar, null, 12);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6Var);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object l(Object obj, Object obj2, Object obj3) {
        kv6 kv6Var = (kv6) this.b;
        li liVar = (li) this.c;
        cs1 cs1Var = (cs1) this.d;
        hi hiVar = (hi) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zF = p65Var.f(liVar) | p65Var.f(cs1Var);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new i0(liVar, 8, cs1Var);
                p65Var.j0(objM);
            }
            k40.t(null, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, 0, 509);
            boolean zF2 = p65Var.f(kv6Var) | p65Var.f(hiVar);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                objM2 = new j0(kv6Var, hiVar, null, 13);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6Var);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object n(Object obj, Object obj2, Object obj3) {
        kv6 kv6Var = (kv6) this.b;
        yi yiVar = (yi) this.c;
        e9d e9dVar = (e9d) this.d;
        ti tiVar = (ti) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zF = p65Var.f(yiVar) | p65Var.f(e9dVar);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new i0(yiVar, 9, e9dVar);
                p65Var.j0(objM);
            }
            k40.t(null, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, 0, 509);
            boolean zF2 = p65Var.f(kv6Var) | p65Var.f(tiVar);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                objM2 = new j0(kv6Var, tiVar, null, 14);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6Var);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object o(Object obj, Object obj2, Object obj3) {
        kv6 kv6Var = (kv6) this.b;
        kj kjVar = (kj) this.c;
        obe obeVar = (obe) this.d;
        fj fjVar = (fj) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zF = p65Var.f(kjVar) | p65Var.f(obeVar);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new i0(kjVar, 10, obeVar);
                p65Var.j0(objM);
            }
            k40.t(null, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, 0, 509);
            boolean zF2 = p65Var.f(kv6Var) | p65Var.f(fjVar);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                objM2 = new j0(kv6Var, fjVar, null, 15);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6Var);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object r(Object obj, Object obj2, Object obj3) {
        zu0 zu0Var = (zu0) this.c;
        String str = (String) this.b;
        g08 g08Var = (g08) this.d;
        pu0 pu0Var = (pu0) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            kyd.p(zu0Var, str, g08Var, pu0Var, null, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object t(Object obj, Object obj2, Object obj3) {
        String str;
        mkd mkdVar;
        boolean z;
        String str2 = (String) this.c;
        mkd mkdVar2 = (mkd) this.b;
        String str3 = (String) this.d;
        mkd mkdVar3 = (mkd) this.e;
        jy0 jy0Var = (jy0) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        jy0Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(jy0Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            xjd xjdVarK = ek7.K(p65Var);
            int iI0 = ((m73) p65Var.j(z22.h)).i0(jy0Var.b());
            boolean zF = p65Var.f(str2) | p65Var.f(mkdVar2) | p65Var.d(iI0);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                long jB = h72.b(0, iI0, 0, 0, 13);
                str = str2;
                mkdVar = mkdVar2;
                objM = Integer.valueOf(xjd.a(xjdVarK, str, mkdVar2, 3, jB, 968).b.f);
                p65Var.j0(objM);
            } else {
                str = str2;
                mkdVar = mkdVar2;
            }
            int iIntValue2 = ((Number) objM).intValue();
            boolean z2 = (str3 == null || muc.b0(str3) || iIntValue2 >= 3) ? false : true;
            wv1 wv1VarA = uv1.a(new h70(4.0f, true, new z10(21)), z46.p, p65Var, 6);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            jjd.b(str, bgf.N(o28Var, "repost_story_title"), 0L, 0L, 0L, null, null, 0L, 2, false, 3, 0, null, mkdVar, p65Var, 48, 24960, 110588);
            if (z2) {
                p65Var.Y(-2021193973);
                jjd.b(str3, bgf.N(o28Var, "repost_story_subtitle"), 0L, 0L, 0L, null, null, 0L, 2, false, 3 - iIntValue2, 0, null, mkd.a(mkdVar3, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 384, 110588);
                z = false;
            } else {
                z = false;
                p65Var.Y(-2028418740);
            }
            p65Var.p(z);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object u(Object obj, Object obj2, Object obj3) {
        gj1 gj1Var = (gj1) this.c;
        si1 si1Var = (si1) this.b;
        bo4 bo4Var = (bo4) this.d;
        ye1 ye1Var = (ye1) this.e;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (gj1Var instanceof cj1) {
                p65Var.Y(-1116067131);
                sgg.b(((cj1) gj1Var).a, si1Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (g76.L(gj1Var, dj1.a)) {
                p65Var.Y(-1115799229);
                sgg.c(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (g76.L(gj1Var, ej1.a)) {
                p65Var.Y(-1115620638);
                sgg.d(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(gj1Var instanceof fj1)) {
                    throw ho2.L(p65Var, -1560024440, false);
                }
                p65Var.Y(-1115432499);
                sgg.e((fj1) gj1Var, bo4Var, si1Var, ye1Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object v(Object obj, Object obj2, Object obj3) {
        fj1 fj1Var = (fj1) this.c;
        bo4 bo4Var = (bo4) this.b;
        si1 si1Var = (si1) this.d;
        ye1 ye1Var = (ye1) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            sgg.a(fj1Var, bo4Var, si1Var, ye1Var, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object w(Object obj, Object obj2, Object obj3) {
        nu1 nu1Var = (nu1) this.c;
        hu1 hu1Var = (hu1) this.b;
        bo4 bo4Var = (bo4) this.d;
        cs1 cs1Var = (cs1) this.e;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (nu1Var instanceof ju1) {
                p65Var.Y(-1848720921);
                gx1.f(((ju1) nu1Var).a, hu1Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (g76.L(nu1Var, ku1.a)) {
                p65Var.Y(-1848447067);
                gx1.g(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (g76.L(nu1Var, lu1.a)) {
                p65Var.Y(-1848262524);
                gx1.h(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(nu1Var instanceof mu1)) {
                    throw ho2.L(p65Var, 1880024807, false);
                }
                p65Var.Y(-1848068061);
                gx1.i((mu1) nu1Var, bo4Var, hu1Var, cs1Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r9v3 */
    /* JADX WARN: Type inference failed for: r9v4, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r9v5 */
    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        ?? r9;
        Object obj4;
        gu6 gu6Var;
        r28 r28VarB;
        Object iuVar;
        boolean z;
        boolean z2;
        int i = this.a;
        iy0 iy0Var = iy0.a;
        o28 o28Var = o28.b;
        Object obj5 = w12.a;
        c1e c1eVar = c1e.a;
        Object obj6 = this.e;
        Object obj7 = this.d;
        Object obj8 = this.b;
        Object obj9 = this.c;
        switch (i) {
            case 0:
                me3 me3Var = (me3) obj9;
                kv6 kv6Var = (kv6) obj8;
                ld3 ld3Var = (ld3) obj7;
                sh9 sh9Var = (sh9) obj6;
                hy8 hy8Var = (hy8) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    r28 r28VarB2 = w2g.B(o28Var, hy8Var).b(jfc.c);
                    if (me3Var instanceof ie3) {
                        p65Var.Y(-1007691329);
                        nk7.g((ie3) me3Var, kv6Var, ld3Var, sh9Var, r28VarB2, p65Var, 0);
                        p65Var.p(false);
                    } else if (me3Var instanceof je3) {
                        p65Var.Y(-1007681645);
                        nk7.h((je3) me3Var, ld3Var, r28VarB2, p65Var, 0);
                        p65Var.p(false);
                    } else if (me3Var instanceof ke3) {
                        p65Var.Y(-1007675319);
                        nk7.k(0, 0L, p65Var, r28VarB2);
                        p65Var.p(false);
                    } else {
                        if (!(me3Var instanceof le3)) {
                            throw ho2.L(p65Var, -1007692651, false);
                        }
                        p65Var.Y(-1007670868);
                        boolean zF = p65Var.f(ld3Var) | p65Var.f(me3Var);
                        Object objM = p65Var.M();
                        if (zF || objM == obj5) {
                            r9 = 0;
                            Object gd3Var = new gd3(ld3Var, false ? 1 : 0, me3Var);
                            p65Var.j0(gd3Var);
                            obj4 = gd3Var;
                        } else {
                            r9 = 0;
                            obj4 = objM;
                        }
                        nk7.l(r9, p65Var, (m45) obj4, r28VarB2);
                        p65Var.p(r9);
                    }
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                sv4 sv4Var = (sv4) obj9;
                kv6 kv6Var2 = (kv6) obj8;
                iv4 iv4Var = (iv4) obj7;
                ye1 ye1Var = (ye1) obj6;
                hy8 hy8Var2 = (hy8) obj;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                hy8Var2.getClass();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).f(hy8Var2) ? 4 : 2;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    r28 r28VarB3 = w2g.B(jfc.c, hy8Var2);
                    if (sv4Var instanceof ov4) {
                        p65Var2.Y(-314315832);
                        rx0.g((ov4) sv4Var, kv6Var2, iv4Var, ye1Var, r28VarB3, p65Var2, 0);
                        p65Var2.p(false);
                    } else if (sv4Var instanceof pv4) {
                        p65Var2.Y(-1672695811);
                        rx0.q((pv4) sv4Var, iv4Var, r28VarB3, p65Var2, 0);
                        p65Var2.p(false);
                    } else if (sv4Var instanceof qv4) {
                        p65Var2.Y(-1672689335);
                        rx0.t(r28VarB3, p65Var2, 0);
                        p65Var2.p(false);
                    } else {
                        if (!(sv4Var instanceof rv4)) {
                            throw ho2.L(p65Var2, -1672709252, false);
                        }
                        p65Var2.Y(-1672686105);
                        rx0.p(r28VarB3, p65Var2, 0);
                        p65Var2.p(false);
                    }
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                gu6 gu6Var2 = (gu6) obj9;
                r28 r28Var = (r28) obj8;
                Object obj10 = (xt6) obj7;
                l78 l78Var = (l78) obj6;
                nob nobVar = (nob) obj;
                ((Integer) obj3).getClass();
                p65 p65Var3 = (p65) ((x12) obj2);
                Object objM2 = p65Var3.M();
                Object obj11 = objM2;
                if (objM2 == obj5) {
                    Object ut6Var = new ut6(nobVar, new ei4(l78Var, 9));
                    p65Var3.j0(ut6Var);
                    obj11 = ut6Var;
                }
                ut6 ut6Var2 = (ut6) obj11;
                Object objM3 = p65Var3.M();
                Object obj12 = objM3;
                if (objM3 == obj5) {
                    Object kvcVar = new kvc(new hx4(ut6Var2));
                    p65Var3.j0(kvcVar);
                    obj12 = kvcVar;
                }
                kvc kvcVar2 = (kvc) obj12;
                if (gu6Var2 != null) {
                    p65Var3.Y(1743490539);
                    p65Var3.Y(887527095);
                    Object obj13 = ez9.a;
                    if (obj13 != null) {
                        p65Var3.Y(1345554384);
                    } else {
                        p65Var3.Y(1345603457);
                        View view = (View) p65Var3.j(eo.f);
                        boolean zF2 = p65Var3.f(view);
                        Object objM4 = p65Var3.M();
                        if (zF2 || objM4 == obj5) {
                            Object tag = view.getTag(R.id.compose_prefetch_scheduler);
                            Object obj14 = tag instanceof cz9 ? (cz9) tag : null;
                            if (obj14 == null) {
                                objM4 = new vr(view);
                                view.setTag(R.id.compose_prefetch_scheduler, objM4);
                            } else {
                                objM4 = obj14;
                            }
                            p65Var3.j0(objM4);
                        }
                        obj13 = (cz9) objM4;
                    }
                    p65Var3.p(false);
                    Object obj15 = obj13;
                    p65Var3.p(false);
                    Object[] objArr = {gu6Var2, ut6Var2, kvcVar2, obj15};
                    boolean zF3 = p65Var3.f(gu6Var2) | p65Var3.h(ut6Var2) | p65Var3.h(kvcVar2) | p65Var3.h(obj15);
                    Object objM5 = p65Var3.M();
                    if (zF3 || objM5 == obj5) {
                        gu6Var = gu6Var2;
                        iuVar = new iu(gu6Var, ut6Var2, kvcVar2, obj15, 12);
                        p65Var3.j0(iuVar);
                    } else {
                        iuVar = objM5;
                        gu6Var = gu6Var2;
                    }
                    kyd.j(objArr, (x45) iuVar, p65Var3);
                    p65Var3.p(false);
                } else {
                    gu6Var = gu6Var2;
                    p65Var3.Y(1744076749);
                    p65Var3.p(false);
                }
                int i2 = hu6.a;
                if (gu6Var != null && (r28VarB = r28Var.b(new tsd(gu6Var))) != null) {
                    r28Var = r28VarB;
                }
                boolean zF4 = p65Var3.f(ut6Var2) | p65Var3.f(obj10);
                Object objM6 = p65Var3.M();
                Object obj16 = objM6;
                if (zF4 || objM6 == obj5) {
                    Object hm4Var = new hm4(ut6Var2, 17, obj10);
                    p65Var3.j0(hm4Var);
                    obj16 = hm4Var;
                }
                f76.v(kvcVar2, r28Var, (b55) obj16, p65Var3, 8);
                return c1eVar;
            case 3:
                wce wceVar = (wce) obj9;
                kv6 kv6Var3 = (kv6) obj8;
                b98 b98Var = (b98) obj7;
                ye1 ye1Var2 = (ye1) obj6;
                hy8 hy8Var3 = (hy8) obj;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                hy8Var3.getClass();
                if ((iIntValue3 & 6) == 0) {
                    iIntValue3 |= ((p65) x12Var3).f(hy8Var3) ? 4 : 2;
                }
                p65 p65Var4 = (p65) x12Var3;
                if (p65Var4.P(iIntValue3 & 1, (iIntValue3 & 19) != 18)) {
                    r28 r28VarB4 = w2g.B(jfc.c, hy8Var3);
                    if (wceVar instanceof tce) {
                        p65Var4.Y(1911003244);
                        op8.g((tce) wceVar, kv6Var3, b98Var, ye1Var2, r28VarB4, p65Var4, 0);
                        p65Var4.p(false);
                    } else if (wceVar instanceof uce) {
                        p65Var4.Y(200203865);
                        op8.o((uce) wceVar, b98Var, r28VarB4, p65Var4, 0);
                        p65Var4.p(false);
                    } else {
                        if (!(wceVar instanceof vce)) {
                            throw ho2.L(p65Var4, 200190569, false);
                        }
                        p65Var4.Y(200210213);
                        op8.u(r28VarB4, p65Var4, 0);
                        p65Var4.p(false);
                    }
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                kma kmaVar = (kma) obj9;
                x45 x45Var = (x45) obj8;
                x45 x45Var2 = (x45) obj7;
                x45 x45Var3 = (x45) obj6;
                hy8 hy8Var4 = (hy8) obj;
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                hy8Var4.getClass();
                if ((iIntValue4 & 6) == 0) {
                    iIntValue4 |= ((p65) x12Var4).f(hy8Var4) ? 4 : 2;
                }
                p65 p65Var5 = (p65) x12Var4;
                if (p65Var5.P(iIntValue4 & 1, (iIntValue4 & 19) != 18)) {
                    r28 r28VarG = w2g.G(w2g.B(o28Var, hy8Var4), 0.0f, 4.0f, 0.0f, 0.0f, 13);
                    rh4 rh4Var = jfc.c;
                    r28 r28VarB5 = r28VarG.b(rh4Var);
                    ar0 ar0Var = z46.d;
                    zk7 zk7VarC = dy0.c(ar0Var, false);
                    long j = p65Var5.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var5.l();
                    r28 r28VarR = gx1.R(p65Var5, r28VarB5);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var);
                    } else {
                        p65Var5.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var5, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var5, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i3);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var5, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var5, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var5, cuVar4, r28VarR);
                    jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 64.0f, 7);
                    boolean zF5 = p65Var5.f(kmaVar) | p65Var5.f(x45Var);
                    Object objM7 = p65Var5.M();
                    if (zF5 || objM7 == obj5) {
                        objM7 = new pda(kmaVar, x45Var);
                        p65Var5.j0(objM7);
                    }
                    k40.t(null, null, jy8VarH, null, null, null, false, null, (x45) objM7, p65Var5, 384, 507);
                    ima imaVar = kmaVar instanceof ima ? (ima) kmaVar : null;
                    r28 r28VarG2 = w2g.G(jfc.d(jfc.o(iy0Var.a(o28Var, z46.k), 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f), 24.0f, 0.0f, 24.0f, 8.0f, 2);
                    if (imaVar == null || !imaVar.e) {
                        p65Var5.Y(567339660);
                        boolean zF6 = p65Var5.f(kmaVar) | p65Var5.f(x45Var3);
                        Object objM8 = p65Var5.M();
                        if (zF6 || objM8 == obj5) {
                            objM8 = new bma(kmaVar, x45Var3);
                            p65Var5.j0(objM8);
                        }
                        mo7.k((m45) objM8, vo7.R(p65Var5, R.string.publication_selection_select_cta), yn7.M, r28VarG2, false, p65Var5, 384, 16);
                        p65Var5.p(false);
                    } else {
                        p65Var5.Y(566483347);
                        boolean zF7 = p65Var5.f(x45Var2) | p65Var5.f(kmaVar);
                        Object objM9 = p65Var5.M();
                        if (zF7 || objM9 == obj5) {
                            objM9 = new bma(x45Var2, kmaVar);
                            p65Var5.j0(objM9);
                        }
                        String strR = vo7.R(p65Var5, R.string.publication_selection_withdraw_submission_cta);
                        yn7 yn7Var = yn7.M;
                        float f = i11.a;
                        sn3 sn3Var = kt7.b;
                        mo7.l((m45) objM9, strR, yn7Var, r28VarG2, i11.a(((zo7) p65Var5.j(sn3Var)).a, ((zo7) p65Var5.j(sn3Var)).n, ((zo7) p65Var5.j(sn3Var)).a, uu1.b(0.5f, ((zo7) p65Var5.j(sn3Var)).n), p65Var5, 0, 0), false, p65Var5, 384, 32);
                        p65Var5 = p65Var5;
                        p65Var5.p(false);
                    }
                    if (imaVar == null) {
                        z = true;
                    } else if (imaVar.h) {
                        p65Var5.Y(567972246);
                        sn3 sn3Var2 = kt7.b;
                        r28 r28VarA0 = flb.a0(rh4Var, uu1.b(0.3f, ((zo7) p65Var5.j(sn3Var2)).a), rv8.r);
                        Object objM10 = p65Var5.M();
                        if (objM10 == obj5) {
                            objM10 = new lg9(8);
                            p65Var5.j0(objM10);
                        }
                        r28 r28VarR2 = hlg.r(r28VarA0, false, null, null, (m45) objM10, 14);
                        zk7 zk7VarC2 = dy0.c(ar0Var, false);
                        long j2 = p65Var5.T;
                        int i4 = (int) (j2 ^ (j2 >>> 32));
                        i89 i89VarL2 = p65Var5.l();
                        r28 r28VarR3 = gx1.R(p65Var5, r28VarR2);
                        p65Var5.c0();
                        if (p65Var5.S) {
                            p65Var5.k(ot2Var);
                        } else {
                            p65Var5.m0();
                        }
                        tp7.B(p65Var5, cuVar, zk7VarC2);
                        tp7.B(p65Var5, cuVar2, i89VarL2);
                        ka1.z(i4, p65Var5, cuVar3, p65Var5, fnVar);
                        tp7.B(p65Var5, cuVar4, r28VarR3);
                        br7.a(iy0Var.a(o28Var, z46.h), ((Boolean) p65Var5.j(l36.a)).booleanValue() ? Float.valueOf(0.75f) : null, 0.0f, ((zo7) p65Var5.j(sn3Var2)).n, p65Var5, 0, 4);
                        z = true;
                        p65Var5.p(true);
                        z2 = false;
                        p65Var5.p(z2);
                        p65Var5.p(z);
                    } else {
                        z = true;
                    }
                    z2 = false;
                    p65Var5.Y(560633399);
                    p65Var5.p(z2);
                    p65Var5.p(z);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 5:
                kv6 kv6Var4 = (kv6) obj8;
                zhb zhbVar = (zhb) obj9;
                lgb lgbVar = (lgb) obj7;
                ngb ngbVar = (ngb) obj6;
                x12 x12Var5 = (x12) obj2;
                int iIntValue5 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var6 = (p65) x12Var5;
                if (p65Var6.P(iIntValue5 & 1, (iIntValue5 & 17) != 16)) {
                    rh4 rh4Var2 = jfc.c;
                    boolean zF8 = p65Var6.f(zhbVar) | p65Var6.f(lgbVar) | p65Var6.f(ngbVar);
                    Object objM11 = p65Var6.M();
                    if (zF8 || objM11 == obj5) {
                        objM11 = new pi9(zhbVar, lgbVar, ngbVar, 7);
                        p65Var6.j0(objM11);
                    }
                    k40.t(rh4Var2, kv6Var4, null, null, null, null, false, null, (x45) objM11, p65Var6, 6, 508);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 6:
                noc nocVar = (noc) obj9;
                c5d c5dVar = (c5d) obj8;
                koc kocVar = (koc) obj7;
                az5 az5Var = (az5) obj6;
                x12 x12Var6 = (x12) obj2;
                int iIntValue6 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var7 = (p65) x12Var6;
                if (!p65Var7.P(iIntValue6 & 1, (iIntValue6 & 17) != 16)) {
                    p65Var7.S();
                    return c1eVar;
                }
                rh4 rh4Var3 = jfc.c;
                wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var7, 0);
                long j3 = p65Var7.T;
                int i5 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL3 = p65Var7.l();
                r28 r28VarR4 = gx1.R(p65Var7, rh4Var3);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var7.c0();
                if (p65Var7.S) {
                    p65Var7.k(ot2Var2);
                } else {
                    p65Var7.m0();
                }
                cu cuVar5 = q12.f;
                tp7.B(p65Var7, cuVar5, wv1VarA);
                cu cuVar6 = q12.e;
                tp7.B(p65Var7, cuVar6, i89VarL3);
                Integer numValueOf2 = Integer.valueOf(i5);
                cu cuVar7 = q12.g;
                tp7.B(p65Var7, cuVar7, numValueOf2);
                fn fnVar2 = q12.h;
                tp7.y(p65Var7, fnVar2);
                cu cuVar8 = q12.d;
                tp7.B(p65Var7, cuVar8, r28VarR4);
                yi2.o(nocVar.a, null, pxf.E(1388045653, new qg9(kocVar, 26, nocVar), p65Var7), p65Var7, 384, 2);
                o28 o28Var2 = o28.b;
                r28 r28VarB6 = w2g.C(jfc.d(o28Var2, 1.0f).b(new sq6(1.0f, true)), 24.0f).b(new vff(1.0f));
                float f2 = aoc.b;
                r28 r28VarD = jfc.d(jfc.r(r28VarB6, 3), 1.0f);
                ar0 ar0Var2 = z46.h;
                zk7 zk7VarC3 = dy0.c(ar0Var2, false);
                long j4 = p65Var7.T;
                int i6 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL4 = p65Var7.l();
                r28 r28VarR5 = gx1.R(p65Var7, r28VarD);
                p65Var7.c0();
                if (p65Var7.S) {
                    p65Var7.k(ot2Var2);
                } else {
                    p65Var7.m0();
                }
                tp7.B(p65Var7, cuVar5, zk7VarC3);
                tp7.B(p65Var7, cuVar6, i89VarL4);
                ka1.z(i6, p65Var7, cuVar7, p65Var7, fnVar2);
                tp7.B(p65Var7, cuVar8, r28VarR5);
                r28 r28VarD2 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, f2, 0.0f, 11), 1.0f);
                zk7 zk7VarC4 = dy0.c(z46.d, false);
                long j5 = p65Var7.T;
                int i7 = (int) (j5 ^ (j5 >>> 32));
                i89 i89VarL5 = p65Var7.l();
                r28 r28VarR6 = gx1.R(p65Var7, r28VarD2);
                p65Var7.c0();
                if (p65Var7.S) {
                    p65Var7.k(ot2Var2);
                } else {
                    p65Var7.m0();
                }
                tp7.B(p65Var7, cuVar5, zk7VarC4);
                tp7.B(p65Var7, cuVar6, i89VarL5);
                ka1.z(i7, p65Var7, cuVar7, p65Var7, fnVar2);
                tp7.B(p65Var7, cuVar8, r28VarR6);
                l5d.b(az5Var, c5dVar, kocVar, iy0Var.a(o28Var2, ar0Var2), p65Var7, 48);
                p65Var7.p(true);
                p65Var7.p(true);
                Object objM12 = p65Var7.M();
                if (objM12 == obj5) {
                    objM12 = new ioc(0, c5dVar, c5d.class, "emitLeft", "emitLeft()Z", 8, 0);
                    p65Var7.j0(objM12);
                }
                m45 m45Var = (m45) objM12;
                Object objM13 = p65Var7.M();
                if (objM13 == obj5) {
                    objM13 = new ioc(0, c5dVar, c5d.class, "emitRight", "emitRight()Z", 8, 1);
                    p65Var7.j0(objM13);
                }
                yi2.a(m45Var, (m45) objM13, null, p65Var7, 0);
                p65Var7.p(true);
                return c1eVar;
            case 7:
                c0d c0dVar = (c0d) obj9;
                yrb yrbVar = (yrb) obj8;
                hu7 hu7Var = (hu7) obj7;
                lyc lycVar = (lyc) obj6;
                hy8 hy8Var5 = (hy8) obj;
                x12 x12Var7 = (x12) obj2;
                int iIntValue7 = ((Integer) obj3).intValue();
                hy8Var5.getClass();
                if ((iIntValue7 & 6) == 0) {
                    iIntValue7 |= ((p65) x12Var7).f(hy8Var5) ? 4 : 2;
                }
                p65 p65Var8 = (p65) x12Var7;
                if (p65Var8.P(iIntValue7 & 1, (iIntValue7 & 19) != 18)) {
                    o28 o28Var3 = o28.b;
                    r28 r28VarX = ho2.x((jp7) p65Var8.j(kt7.a), w2g.B(o28Var3, hy8Var5).b(jfc.c), 3, 1.0f);
                    zk7 zk7VarC5 = dy0.c(z46.h, false);
                    long j6 = p65Var8.T;
                    int i8 = (int) (j6 ^ (j6 >>> 32));
                    i89 i89VarL6 = p65Var8.l();
                    r28 r28VarR7 = gx1.R(p65Var8, r28VarX);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var8.c0();
                    if (p65Var8.S) {
                        p65Var8.k(ot2Var3);
                    } else {
                        p65Var8.m0();
                    }
                    cu cuVar9 = q12.f;
                    tp7.B(p65Var8, cuVar9, zk7VarC5);
                    cu cuVar10 = q12.e;
                    tp7.B(p65Var8, cuVar10, i89VarL6);
                    Integer numValueOf3 = Integer.valueOf(i8);
                    cu cuVar11 = q12.g;
                    tp7.B(p65Var8, cuVar11, numValueOf3);
                    fn fnVar3 = q12.h;
                    tp7.y(p65Var8, fnVar3);
                    cu cuVar12 = q12.d;
                    tp7.B(p65Var8, cuVar12, r28VarR7);
                    r28 r28VarD3 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC6 = dy0.c(z46.d, false);
                    long j7 = p65Var8.T;
                    int i9 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL7 = p65Var8.l();
                    r28 r28VarR8 = gx1.R(p65Var8, r28VarD3);
                    p65Var8.c0();
                    if (p65Var8.S) {
                        p65Var8.k(ot2Var3);
                    } else {
                        p65Var8.m0();
                    }
                    tp7.B(p65Var8, cuVar9, zk7VarC6);
                    tp7.B(p65Var8, cuVar10, i89VarL7);
                    ka1.z(i9, p65Var8, cuVar11, p65Var8, fnVar3);
                    tp7.B(p65Var8, cuVar12, r28VarR8);
                    nk7.Q(c0dVar, yrbVar, hu7Var, lycVar, null, p65Var8, 0);
                    p65Var8.p(true);
                    p65Var8.p(true);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 8:
                kv6 kv6Var5 = (kv6) obj8;
                cad cadVar = (cad) obj9;
                t9d t9dVar = (t9d) obj7;
                sh9 sh9Var2 = (sh9) obj6;
                hy8 hy8Var6 = (hy8) obj;
                x12 x12Var8 = (x12) obj2;
                int iIntValue8 = ((Integer) obj3).intValue();
                hy8Var6.getClass();
                if ((iIntValue8 & 6) == 0) {
                    iIntValue8 |= ((p65) x12Var8).f(hy8Var6) ? 4 : 2;
                }
                p65 p65Var9 = (p65) x12Var8;
                if (p65Var9.P(iIntValue8 & 1, (iIntValue8 & 19) != 18)) {
                    flb.O(kv6Var5, cadVar, t9dVar, sh9Var2, w2g.B(o28Var, hy8Var6).b(jfc.c), p65Var9, 0);
                } else {
                    p65Var9.S();
                }
                return c1eVar;
            case 9:
                h3e h3eVar = (h3e) obj9;
                pw6 pw6Var = (pw6) obj8;
                gx5 gx5Var = (gx5) obj7;
                b3e b3eVar = (b3e) obj6;
                hy8 hy8Var7 = (hy8) obj;
                x12 x12Var9 = (x12) obj2;
                int iIntValue9 = ((Integer) obj3).intValue();
                hy8Var7.getClass();
                if ((iIntValue9 & 6) == 0) {
                    iIntValue9 |= ((p65) x12Var9).f(hy8Var7) ? 4 : 2;
                }
                p65 p65Var10 = (p65) x12Var9;
                if (p65Var10.P(iIntValue9 & 1, (iIntValue9 & 19) != 18)) {
                    r28 r28VarB7 = w2g.B(jfc.c, hy8Var7);
                    if (h3eVar instanceof g3e) {
                        p65Var10.Y(2009798694);
                        d3e.c(pw6Var, r28VarB7, p65Var10, 0);
                        p65Var10.p(false);
                    } else if (h3eVar instanceof e3e) {
                        p65Var10.Y(-2120647841);
                        d3e.a((e3e) h3eVar, r28VarB7, pw6Var, gx5Var, b3eVar, p65Var10, 0);
                        p65Var10.p(false);
                    } else {
                        if (!(h3eVar instanceof f3e)) {
                            throw ho2.L(p65Var10, 2009796753, false);
                        }
                        p65Var10.Y(-2120368345);
                        f3e f3eVar = (f3e) h3eVar;
                        boolean zF9 = p65Var10.f(b3eVar);
                        Object objM14 = p65Var10.M();
                        if (zF9 || objM14 == obj5) {
                            objM14 = new ibd(0, b3eVar, b3e.class, "onRefresh", "onRefresh()V", 0, 18);
                            p65Var10.j0(objM14);
                        }
                        d3e.b(f3eVar, (m45) ((qh6) objM14), r28VarB7, p65Var10, 0);
                        p65Var10.p(false);
                    }
                } else {
                    p65Var10.S();
                }
                return c1eVar;
            case 10:
                pw6 pw6Var2 = (pw6) obj9;
                e3e e3eVar = (e3e) obj8;
                b3e b3eVar2 = (b3e) obj7;
                gx5 gx5Var2 = (gx5) obj6;
                x12 x12Var10 = (x12) obj2;
                int iIntValue10 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var11 = (p65) x12Var10;
                if (p65Var11.P(iIntValue10 & 1, (iIntValue10 & 17) != 16)) {
                    rh4 rh4Var4 = jfc.c;
                    ((jp7) p65Var11.j(kt7.a)).getClass();
                    r28 r28VarD4 = jfc.d(jfc.r(rh4Var4, 3), 1.0f);
                    zk7 zk7VarC7 = dy0.c(z46.h, false);
                    long j8 = p65Var11.T;
                    int i10 = (int) (j8 ^ (j8 >>> 32));
                    i89 i89VarL8 = p65Var11.l();
                    r28 r28VarR9 = gx1.R(p65Var11, r28VarD4);
                    r12.W.getClass();
                    ot2 ot2Var4 = q12.b;
                    p65Var11.c0();
                    if (p65Var11.S) {
                        p65Var11.k(ot2Var4);
                    } else {
                        p65Var11.m0();
                    }
                    cu cuVar13 = q12.f;
                    tp7.B(p65Var11, cuVar13, zk7VarC7);
                    cu cuVar14 = q12.e;
                    tp7.B(p65Var11, cuVar14, i89VarL8);
                    Integer numValueOf4 = Integer.valueOf(i10);
                    cu cuVar15 = q12.g;
                    tp7.B(p65Var11, cuVar15, numValueOf4);
                    fn fnVar4 = q12.h;
                    tp7.y(p65Var11, fnVar4);
                    cu cuVar16 = q12.d;
                    tp7.B(p65Var11, cuVar16, r28VarR9);
                    r28 r28VarD5 = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC8 = dy0.c(z46.d, false);
                    long j9 = p65Var11.T;
                    int i11 = (int) (j9 ^ (j9 >>> 32));
                    i89 i89VarL9 = p65Var11.l();
                    r28 r28VarR10 = gx1.R(p65Var11, r28VarD5);
                    p65Var11.c0();
                    if (p65Var11.S) {
                        p65Var11.k(ot2Var4);
                    } else {
                        p65Var11.m0();
                    }
                    tp7.B(p65Var11, cuVar13, zk7VarC8);
                    tp7.B(p65Var11, cuVar14, i89VarL9);
                    ka1.z(i11, p65Var11, cuVar15, p65Var11, fnVar4);
                    tp7.B(p65Var11, cuVar16, r28VarR10);
                    ymc ymcVar = new ymc();
                    jy8 jy8VarG = w2g.g(2, 4.0f);
                    boolean zF10 = p65Var11.f(e3eVar) | p65Var11.f(b3eVar2) | p65Var11.f(gx5Var2);
                    Object objM15 = p65Var11.M();
                    if (zF10 || objM15 == obj5) {
                        objM15 = new pi9(e3eVar, b3eVar2, gx5Var2, 18);
                        p65Var11.j0(objM15);
                    }
                    op8.t(ymcVar, null, pw6Var2, jy8VarG, null, null, false, null, (x45) objM15, p65Var11, 3072, 0, PhotoshopDirectory.TAG_BACKGROUND_COLOR);
                    p65Var11.p(true);
                    p65Var11.p(true);
                } else {
                    p65Var11.S();
                }
                return c1eVar;
            case 11:
                y3e y3eVar = (y3e) obj9;
                kv6 kv6Var6 = (kv6) obj8;
                s3e s3eVar = (s3e) obj7;
                obe obeVar = (obe) obj6;
                hy8 hy8Var8 = (hy8) obj;
                x12 x12Var11 = (x12) obj2;
                int iIntValue11 = ((Integer) obj3).intValue();
                hy8Var8.getClass();
                if ((iIntValue11 & 6) == 0) {
                    iIntValue11 |= ((p65) x12Var11).f(hy8Var8) ? 4 : 2;
                }
                p65 p65Var12 = (p65) x12Var11;
                if (p65Var12.P(iIntValue11 & 1, (iIntValue11 & 19) != 18)) {
                    r40.r(y3eVar, kv6Var6, s3eVar, obeVar, w2g.B(o28Var, hy8Var8).b(jfc.c), p65Var12, 0);
                } else {
                    p65Var12.S();
                }
                return c1eVar;
            case 12:
                akc akcVar = (akc) obj9;
                x9 x9Var = (x9) obj8;
                y9 y9Var = (y9) obj7;
                upc upcVar = (upc) obj6;
                hy8 hy8Var9 = (hy8) obj;
                x12 x12Var12 = (x12) obj2;
                int iIntValue12 = ((Integer) obj3).intValue();
                hy8Var9.getClass();
                if ((iIntValue12 & 6) == 0) {
                    iIntValue12 |= ((p65) x12Var12).f(hy8Var9) ? 4 : 2;
                }
                p65 p65Var13 = (p65) x12Var12;
                if (p65Var13.P(iIntValue12 & 1, (iIntValue12 & 19) != 18)) {
                    r28 r28VarB8 = w2g.B(o28Var, hy8Var9);
                    na naVar = (na) upcVar.getValue();
                    if (naVar instanceof ma) {
                        p65Var13.Y(353327979);
                        r40.c(r28VarB8, p65Var13, 0);
                        p65Var13.p(false);
                    } else if (naVar instanceof ka) {
                        p65Var13.Y(353331584);
                        r40.a((ka) naVar, akcVar, x9Var, y9Var, r28VarB8, p65Var13, 0);
                        p65Var13.p(false);
                    } else {
                        if (!(naVar instanceof la)) {
                            throw ho2.L(p65Var13, 353325700, false);
                        }
                        p65Var13.Y(353341624);
                        r40.b((la) naVar, x9Var, r28VarB8, p65Var13, 0);
                        p65Var13.p(false);
                    }
                } else {
                    p65Var13.S();
                }
                return c1eVar;
            case 13:
                return a(obj, obj2, obj3);
            case 14:
                return d(obj, obj2, obj3);
            case 15:
                return g(obj, obj2, obj3);
            case 16:
                return h(obj, obj2, obj3);
            case 17:
                return i(obj, obj2, obj3);
            case 18:
                return j(obj, obj2, obj3);
            case 19:
                return l(obj, obj2, obj3);
            case 20:
                return n(obj, obj2, obj3);
            case 21:
                return o(obj, obj2, obj3);
            case 22:
                ms0 ms0Var = (ms0) obj9;
                sb2 sb2Var = (sb2) obj8;
                v7c v7cVar = (v7c) obj7;
                js0 js0Var = (js0) obj6;
                x12 x12Var13 = (x12) obj2;
                int iIntValue13 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var14 = (p65) x12Var13;
                if (p65Var14.P(iIntValue13 & 1, (iIntValue13 & 17) != 16)) {
                    w2g.b(ms0Var, new ls0(sb2Var, v7cVar, js0Var), null, p65Var14, 0);
                } else {
                    p65Var14.S();
                }
                return c1eVar;
            case 23:
                return r(obj, obj2, obj3);
            case 24:
                return t(obj, obj2, obj3);
            case 25:
                return u(obj, obj2, obj3);
            case 26:
                return v(obj, obj2, obj3);
            case 27:
                return w(obj, obj2, obj3);
            default:
                mu1 mu1Var = (mu1) obj9;
                bo4 bo4Var = (bo4) obj8;
                hu1 hu1Var = (hu1) obj7;
                cs1 cs1Var = (cs1) obj6;
                x12 x12Var14 = (x12) obj2;
                int iIntValue14 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var15 = (p65) x12Var14;
                if (p65Var15.P(iIntValue14 & 1, (iIntValue14 & 17) != 16)) {
                    gx1.e(mu1Var, bo4Var, hu1Var, cs1Var, p65Var15, 0);
                } else {
                    p65Var15.S();
                }
                return c1eVar;
        }
    }

    public /* synthetic */ fd3(Object obj, Object obj2, Object obj3, Object obj4, int i) {
        this.a = i;
        this.c = obj;
        this.b = obj2;
        this.d = obj3;
        this.e = obj4;
    }
}
