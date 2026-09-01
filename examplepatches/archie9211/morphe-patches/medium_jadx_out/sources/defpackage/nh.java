package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.medium.android.core.navigation.s;
import com.medium.android.core.share.PostShareData;
import com.medium.android.digest.ui.settings.DigestSettingsFragment;
import com.medium.reader.R;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class nh implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ nh(Object obj, Object obj2, obe obeVar, int i) {
        this.a = i;
        this.b = obj;
        this.d = obj2;
        this.c = obeVar;
    }

    private final Object a(Object obj, Object obj2, Object obj3) {
        nj njVar = (nj) this.b;
        obe obeVar = (obe) this.c;
        fj fjVar = (fj) this.d;
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
            if (njVar instanceof kj) {
                p65Var.Y(1052308792);
                bgf.j((kj) njVar, obeVar, fjVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (njVar instanceof lj) {
                p65Var.Y(1280879536);
                bgf.c((lj) njVar, fjVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(njVar instanceof mj)) {
                    throw ho2.L(p65Var, 1280869255, false);
                }
                p65Var.Y(1280886822);
                bgf.d(r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object d(Object obj, Object obj2, Object obj3) {
        double d;
        b55 b55Var = (b55) this.b;
        mz1 mz1Var = (mz1) this.c;
        c55 c55Var = (c55) this.d;
        pmb pmbVar = (pmb) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        fa4 fa4Var = qb8.a;
        zq0 zq0Var = z46.n;
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(pmbVar) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            if (b55Var == null) {
                p65Var.Y(-1394361313);
                hp7.t(p65Var, b10.a);
                p65Var.p(false);
                d = 0.5d;
            } else {
                p65Var.Y(-1394295686);
                r28 r28Var = b10.b;
                d = 0.5d;
                omb ombVarA = nmb.a(fa4Var, zq0Var, p65Var, 48);
                int iS = w2g.s(p65Var);
                i89 i89VarL = p65Var.l();
                r28 r28VarR = gx1.R(p65Var, r28Var);
                r12.W.getClass();
                ot2 ot2Var = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, q12.f, ombVarA);
                tp7.B(p65Var, q12.e, i89VarL);
                cu cuVar = q12.g;
                if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                    lv8.w(iS, p65Var, iS, cuVar);
                }
                tp7.B(p65Var, q12.d, r28VarR);
                sn3 sn3Var = w72.a;
                long j = ((uu1) p65Var.j(d82.a)).a;
                k40.c(sn3Var.a(Float.valueOf((!((sv1) p65Var.j(tv1.a)).f() ? ((double) op8.f0(j)) < 0.5d : ((double) op8.f0(j)) > 0.5d) ? 0.87f : 1.0f)), b55Var, p65Var, 8);
                p65Var.p(true);
                p65Var.p(false);
            }
            r28 r28VarA = pmbVar.a(1.0f, jfc.c(o28.b, 1.0f), true);
            omb ombVarA2 = nmb.a(fa4Var, zq0Var, p65Var, 48);
            int iS2 = w2g.s(p65Var);
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarA);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA2);
            tp7.B(p65Var, q12.e, i89VarL2);
            cu cuVar2 = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS2))) {
                lv8.w(iS2, p65Var, iS2, cuVar2);
            }
            tp7.B(p65Var, q12.d, r28VarR2);
            kjd.a(((myd) p65Var.j(qyd.b)).f, pxf.E(1206983395, new dd(mz1Var, 2), p65Var), p65Var, 48);
            p65Var.p(true);
            sn3 sn3Var2 = w72.a;
            long j2 = ((uu1) p65Var.j(d82.a)).a;
            k40.c(sn3Var2.a(Float.valueOf((!((sv1) p65Var.j(tv1.a)).f() ? ((double) op8.f0(j2)) < d : ((double) op8.f0(j2)) > d) ? 0.6f : 0.74f)), pxf.E(-1033635954, new k6c(18, c55Var), p65Var), p65Var, 56);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object g(Object obj, Object obj2, Object obj3) {
        uob uobVar;
        int i;
        int i2;
        final ga1 ga1Var = (ga1) this.b;
        final y81 y81Var = (y81) this.c;
        final l78 l78Var = (l78) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        final int i3 = 1;
        final int i4 = 0;
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean z = ga1Var.d;
            o28 o28Var = o28.b;
            uob uobVar2 = w12.a;
            if (z) {
                p65Var.Y(-1922151006);
                bq7 bq7Var = new bq7(vo7.R(p65Var, R.string.common_edit_catalog_info), false, null, null, 30);
                boolean zF = p65Var.f(y81Var);
                Object objM = p65Var.M();
                if (zF || objM == uobVar2) {
                    objM = new m45() { // from class: ca1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i5 = i4;
                            c1e c1eVar = c1e.a;
                            l78 l78Var2 = l78Var;
                            y81 y81Var2 = y81Var;
                            switch (i5) {
                                case 0:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.edit();
                                    break;
                                case 1:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.B();
                                    break;
                                case 2:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.J();
                                    break;
                                default:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.C();
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                uobVar = uobVar2;
                aq7.b(bq7Var, (m45) objM, bgf.N(o28Var, "edit"), 0L, 0L, p65Var, 384, 24);
            } else {
                uobVar = uobVar2;
                p65Var.Y(-1927355379);
            }
            p65Var.p(false);
            if (ga1Var.h) {
                p65Var.Y(-1921709628);
                if (ga1Var.i) {
                    i = -1921586806;
                    i2 = R.string.common_make_catalog_public;
                } else {
                    i = -1921482615;
                    i2 = R.string.common_make_catalog_private;
                }
                bq7 bq7Var2 = new bq7(km4.w(p65Var, i, i2, p65Var, false), false, null, null, 30);
                boolean zF2 = p65Var.f(y81Var) | p65Var.f(ga1Var);
                Object objM2 = p65Var.M();
                if (zF2 || objM2 == uobVar) {
                    objM2 = new m45() { // from class: da1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i5 = i4;
                            c1e c1eVar = c1e.a;
                            l78 l78Var2 = l78Var;
                            ga1 ga1Var2 = ga1Var;
                            y81 y81Var2 = y81Var;
                            switch (i5) {
                                case 0:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.F(!ga1Var2.i);
                                    break;
                                default:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.s(ga1Var2.l.b());
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                aq7.b(bq7Var2, (m45) objM2, bgf.N(o28Var, "toggle_visibility"), 0L, 0L, p65Var, 384, 24);
            } else {
                p65Var.Y(-1927355379);
            }
            p65Var.p(false);
            if (ga1Var.f) {
                p65Var.Y(-1921070098);
                bq7 bq7Var3 = new bq7(vo7.R(p65Var, R.string.catalog_detail_menu_reorder_items), false, null, null, 30);
                boolean zF3 = p65Var.f(y81Var);
                Object objM3 = p65Var.M();
                if (zF3 || objM3 == uobVar) {
                    objM3 = new m45() { // from class: ca1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i5 = i3;
                            c1e c1eVar = c1e.a;
                            l78 l78Var2 = l78Var;
                            y81 y81Var2 = y81Var;
                            switch (i5) {
                                case 0:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.edit();
                                    break;
                                case 1:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.B();
                                    break;
                                case 2:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.J();
                                    break;
                                default:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.C();
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM3);
                }
                aq7.b(bq7Var3, (m45) objM3, bgf.N(o28Var, "reorder"), 0L, 0L, p65Var, 384, 24);
            } else {
                p65Var.Y(-1927355379);
            }
            p65Var.p(false);
            if (ga1Var.g) {
                p65Var.Y(-1920626271);
                bq7 bq7Var4 = new bq7(vo7.R(p65Var, R.string.common_delete_catalog), false, null, null, 30);
                boolean zF4 = p65Var.f(y81Var);
                Object objM4 = p65Var.M();
                if (zF4 || objM4 == uobVar) {
                    final int i5 = 2;
                    objM4 = new m45() { // from class: ca1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i52 = i5;
                            c1e c1eVar = c1e.a;
                            l78 l78Var2 = l78Var;
                            y81 y81Var2 = y81Var;
                            switch (i52) {
                                case 0:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.edit();
                                    break;
                                case 1:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.B();
                                    break;
                                case 2:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.J();
                                    break;
                                default:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.C();
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM4);
                }
                aq7.b(bq7Var4, (m45) objM4, bgf.N(o28Var, "delete"), 0L, 0L, p65Var, 384, 24);
            } else {
                p65Var.Y(-1927355379);
            }
            p65Var.p(false);
            if (ga1Var.c) {
                p65Var.Y(-1920195929);
                bq7 bq7Var5 = new bq7(vo7.R(p65Var, R.string.catalog_detail_menu_common_unclap), false, null, null, 30);
                boolean zF5 = p65Var.f(y81Var) | p65Var.f(ga1Var);
                Object objM5 = p65Var.M();
                if (zF5 || objM5 == uobVar) {
                    objM5 = new m45() { // from class: da1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i52 = i3;
                            c1e c1eVar = c1e.a;
                            l78 l78Var2 = l78Var;
                            ga1 ga1Var2 = ga1Var;
                            y81 y81Var2 = y81Var;
                            switch (i52) {
                                case 0:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.F(!ga1Var2.i);
                                    break;
                                default:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.s(ga1Var2.l.b());
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM5);
                }
                aq7.b(bq7Var5, (m45) objM5, bgf.N(o28Var, "undo_claps"), 0L, 0L, p65Var, 384, 24);
            } else {
                p65Var.Y(-1927355379);
            }
            p65Var.p(false);
            if (ga1Var.e) {
                p65Var.Y(-1919714623);
                bq7 bq7Var6 = new bq7(vo7.R(p65Var, R.string.common_report_catalog), false, null, null, 30);
                boolean zF6 = p65Var.f(y81Var);
                Object objM6 = p65Var.M();
                if (zF6 || objM6 == uobVar) {
                    final int i6 = 3;
                    objM6 = new m45() { // from class: ca1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i52 = i6;
                            c1e c1eVar = c1e.a;
                            l78 l78Var2 = l78Var;
                            y81 y81Var2 = y81Var;
                            switch (i52) {
                                case 0:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.edit();
                                    break;
                                case 1:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.B();
                                    break;
                                case 2:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.J();
                                    break;
                                default:
                                    l78Var2.setValue(Boolean.FALSE);
                                    y81Var2.C();
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM6);
                }
                aq7.b(bq7Var6, (m45) objM6, bgf.N(o28Var, "report"), 0L, 0L, p65Var, 384, 24);
            } else {
                p65Var.Y(-1927355379);
            }
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object h(Object obj, Object obj2, Object obj3) {
        rg1 rg1Var = (rg1) this.b;
        oe1 oe1Var = (oe1) this.c;
        ye1 ye1Var = (ye1) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        boolean zP = p65Var.P(iIntValue & 1, (iIntValue & 17) != 16);
        c1e c1eVar = c1e.a;
        if (!zP) {
            p65Var.S();
            return c1eVar;
        }
        r28 r28VarF = jfc.f(jfc.d(o28.b, 1.0f), 148.0f, 0.0f, 2);
        wgd.w(-1003410150, 212064437, p65Var, false);
        m73 m73Var = (m73) p65Var.j(z22.h);
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = b09.t(m73Var, p65Var);
        }
        hl7 hl7Var = (hl7) objM;
        Object objM2 = p65Var.M();
        if (objM2 == uobVar) {
            objM2 = b09.r(p65Var);
        }
        z52 z52Var = (z52) objM2;
        Object objM3 = p65Var.M();
        if (objM3 == uobVar) {
            objM3 = qo7.u(Boolean.FALSE);
            p65Var.j0(objM3);
        }
        l78 l78Var = (l78) objM3;
        Object objM4 = p65Var.M();
        if (objM4 == uobVar) {
            objM4 = b09.s(z52Var, p65Var);
        }
        m62 m62Var = (m62) objM4;
        Object objM5 = p65Var.M();
        if (objM5 == uobVar) {
            objM5 = b09.v(c1eVar, y3b.h, p65Var);
        }
        l78 l78Var2 = (l78) objM5;
        boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
        Object objM6 = p65Var.M();
        if (zH || objM6 == uobVar) {
            fr0 fr0Var = new fr0(l78Var2, hl7Var, m62Var, l78Var, 5);
            p65Var.j0(fr0Var);
            objM6 = fr0Var;
        }
        zk7 zk7Var = (zk7) objM6;
        Object objM7 = p65Var.M();
        if (objM7 == uobVar) {
            objM7 = new gr0(l78Var, m62Var, 5);
            p65Var.j0(objM7);
        }
        m45 m45Var = (m45) objM7;
        boolean zH2 = p65Var.h(hl7Var);
        Object objM8 = p65Var.M();
        if (zH2 || objM8 == uobVar) {
            objM8 = new hr0(hl7Var, 5);
            p65Var.j0(objM8);
        }
        hlg.j(wxb.a(r28VarF, false, (x45) objM8), pxf.E(1200550679, new bv(l78Var2, z52Var, m45Var, rg1Var, oe1Var, ye1Var), p65Var), zk7Var, p65Var, 48);
        p65Var.p(false);
        return c1eVar;
    }

    private final Object i(Object obj, Object obj2, Object obj3) {
        p65 p65Var;
        int i;
        uob uobVar;
        o28 o28Var;
        p65 p65Var2;
        final String str;
        final String str2;
        qg1 qg1Var;
        p65 p65Var3;
        Object obj4;
        rg1 rg1Var = (rg1) this.b;
        final ye1 ye1Var = (ye1) this.c;
        final l78 l78Var = (l78) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        int i2 = 1;
        int i3 = 0;
        p65 p65Var4 = (p65) x12Var;
        if (p65Var4.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            String str3 = rg1Var.a;
            qg1 qg1Var2 = rg1Var.m;
            String str4 = rg1Var.n;
            eg1 eg1Var = qg1Var2.e;
            uob uobVar2 = w12.a;
            o28 o28Var2 = o28.b;
            if (eg1Var != null) {
                p65Var4.Y(-874616475);
                r28 r28VarN = bgf.N(o28Var2, "share");
                boolean zF = p65Var4.f(ye1Var) | p65Var4.f(rg1Var) | p65Var4.f(str4);
                Object objM = p65Var4.M();
                if (zF || objM == uobVar2) {
                    hu0 hu0Var = new hu0(ye1Var, rg1Var, str4, l78Var, 2);
                    ye1Var = ye1Var;
                    p65Var4.j0(hu0Var);
                    objM = hu0Var;
                }
                m45 m45Var = (m45) objM;
                i = -886731833;
                uobVar = uobVar2;
                o28Var = o28Var2;
                oq.b(sz1.a, m45Var, r28VarN, null, null, false, null, null, p65Var4, 390, 504);
                p65Var = p65Var4;
            } else {
                p65Var = p65Var4;
                i = -886731833;
                uobVar = uobVar2;
                o28Var = o28Var2;
                p65Var.Y(-886731833);
            }
            p65Var.p(false);
            if (qg1Var2.a) {
                p65Var.Y(-874059715);
                r28 r28VarN2 = bgf.N(o28Var, "edit_info");
                boolean zF2 = p65Var.f(ye1Var) | p65Var.f(rg1Var);
                Object objM2 = p65Var.M();
                if (zF2 || objM2 == uobVar) {
                    objM2 = new ce1(ye1Var, rg1Var, l78Var, i3);
                    p65Var.j0(objM2);
                }
                oq.b(sz1.b, (m45) objM2, r28VarN2, null, null, false, null, null, p65Var, 390, 504);
            } else {
                p65Var.Y(i);
            }
            p65Var.p(false);
            Boolean bool = qg1Var2.b;
            if (g76.L(bool, Boolean.TRUE)) {
                p65Var.Y(-873577076);
                r28 r28VarN3 = bgf.N(o28Var, "update_visibility");
                boolean zF3 = p65Var.f(ye1Var) | p65Var.f(rg1Var);
                Object objM3 = p65Var.M();
                if (zF3 || objM3 == uobVar) {
                    objM3 = new ce1(ye1Var, rg1Var, l78Var, i2);
                    p65Var.j0(objM3);
                }
                oq.b(sz1.c, (m45) objM3, r28VarN3, null, null, false, null, null, p65Var, 390, 504);
                p65Var.p(false);
                p65Var2 = p65Var;
            } else if (g76.L(bool, Boolean.FALSE)) {
                p65Var.Y(-872975986);
                r28 r28VarN4 = bgf.N(o28Var, "update_visibility");
                boolean zF4 = p65Var.f(ye1Var) | p65Var.f(rg1Var);
                Object objM4 = p65Var.M();
                if (zF4 || objM4 == uobVar) {
                    objM4 = new ce1(ye1Var, rg1Var, l78Var, 2);
                    p65Var.j0(objM4);
                }
                p65 p65Var5 = p65Var;
                oq.b(sz1.d, (m45) objM4, r28VarN4, null, null, false, null, null, p65Var5, 390, 504);
                p65Var2 = p65Var5;
                p65Var2.p(false);
            } else {
                p65Var2 = p65Var;
                p65Var2.Y(-305237121);
                p65Var2.p(false);
            }
            if (qg1Var2.c) {
                p65Var2.Y(-872314012);
                r28 r28VarN5 = bgf.N(o28Var, "report");
                boolean zF5 = p65Var2.f(ye1Var) | p65Var2.f(str3) | p65Var2.f(str4);
                Object objM5 = p65Var2.M();
                if (zF5 || objM5 == uobVar) {
                    str2 = str4;
                    final int i4 = 0;
                    str = str3;
                    qg1Var = qg1Var2;
                    obj4 = new m45() { // from class: ee1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i5 = i4;
                            c1e c1eVar = c1e.a;
                            l78 l78Var2 = l78Var;
                            String str5 = str2;
                            String str6 = str;
                            ye1 ye1Var2 = ye1Var;
                            switch (i5) {
                                case 0:
                                    l78Var2.setValue(Boolean.FALSE);
                                    ye1Var2.g(str6, str5);
                                    break;
                                default:
                                    l78Var2.setValue(Boolean.FALSE);
                                    ye1Var2.s(str6, str5);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var2.j0(obj4);
                } else {
                    str2 = str4;
                    obj4 = objM5;
                    str = str3;
                    qg1Var = qg1Var2;
                }
                oq.b(sz1.e, (m45) obj4, r28VarN5, null, null, false, null, null, p65Var2, 390, 504);
            } else {
                str = str3;
                str2 = str4;
                qg1Var = qg1Var2;
                p65Var2.Y(i);
            }
            p65Var2.p(false);
            if (qg1Var.d) {
                p65Var2.Y(-871783292);
                r28 r28VarN6 = bgf.N(o28Var, "delete");
                boolean zF6 = p65Var2.f(ye1Var) | p65Var2.f(str) | p65Var2.f(str2);
                Object objM6 = p65Var2.M();
                if (zF6 || objM6 == uobVar) {
                    final int i5 = 1;
                    m45 m45Var2 = new m45() { // from class: ee1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i52 = i5;
                            c1e c1eVar = c1e.a;
                            l78 l78Var2 = l78Var;
                            String str5 = str2;
                            String str6 = str;
                            ye1 ye1Var2 = ye1Var;
                            switch (i52) {
                                case 0:
                                    l78Var2.setValue(Boolean.FALSE);
                                    ye1Var2.g(str6, str5);
                                    break;
                                default:
                                    l78Var2.setValue(Boolean.FALSE);
                                    ye1Var2.s(str6, str5);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var2.j0(m45Var2);
                    objM6 = m45Var2;
                }
                p65 p65Var6 = p65Var2;
                oq.b(sz1.f, (m45) objM6, r28VarN6, null, null, false, null, null, p65Var6, 390, 504);
                p65Var3 = p65Var6;
            } else {
                p65Var3 = p65Var2;
                p65Var3.Y(i);
            }
            p65Var3.p(false);
        } else {
            p65Var4.S();
        }
        return c1e.a;
    }

    private final Object j(Object obj, Object obj2, Object obj3) {
        akc akcVar = (akc) this.b;
        xd2 xd2Var = (xd2) this.c;
        upc upcVar = (upc) this.d;
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
            ue2 ue2Var = (ue2) upcVar.getValue();
            if (ue2Var instanceof te2) {
                p65Var.Y(1777364575);
                ht2.u(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(ue2Var instanceof se2)) {
                    throw ho2.L(p65Var, 1777362153, false);
                }
                p65Var.Y(1777367847);
                ht2.t((se2) ue2Var, akcVar, xd2Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object l(Object obj, Object obj2, Object obj3) {
        o28 o28Var;
        pl2 pl2Var = (pl2) this.b;
        x45 x45Var = (x45) this.c;
        l78 l78Var = (l78) this.d;
        gq4 gq4Var = (gq4) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        gq4Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(gq4Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            p65Var.Y(-1416372115);
            ol2 ol2Var = (ol2) pl2Var;
            Iterator it2 = ol2Var.a.iterator();
            while (true) {
                boolean zHasNext = it2.hasNext();
                o28Var = o28.b;
                if (!zHasNext) {
                    break;
                }
                ml2 ml2Var = (ml2) it2.next();
                boolean zL = g76.L((ml2) l78Var.getValue(), ml2Var);
                boolean z = ol2Var.b || ml2Var.e;
                ((jp7) p65Var.j(kt7.a)).getClass();
                u36.e(ml2Var, zL, z, x45Var, jp7.a(p65Var) == ip7.COMPACT ? gq4Var.a(0.5f, o28Var, true) : jfc.p(o28Var, 138.0f), p65Var, 0);
            }
            p65Var.p(false);
            ((jp7) p65Var.j(kt7.a)).getClass();
            if (jp7.a(p65Var) != ip7.COMPACT || ol2Var.a.size() % 2 == 0) {
                p65Var.Y(-964739705);
            } else {
                p65Var.Y(-957055766);
                dy0.a(gq4Var.a(0.5f, o28Var, true), p65Var, 0);
            }
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object n(Object obj, Object obj2, Object obj3) {
        lh3 lh3Var = (lh3) this.b;
        ah3 ah3Var = (ah3) this.c;
        l78 l78Var = (l78) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            for (zy4 zy4Var : zy4.getEntries()) {
                r28 r28VarN = bgf.N(o28.b, "font_family_selector_" + zy4Var);
                bq7 bq7Var = new bq7(rv8.Q(zy4Var, p65Var), zy4Var == lh3Var.d, null, null, 28);
                boolean zF = p65Var.f(ah3Var) | p65Var.d(zy4Var.ordinal());
                Object objM = p65Var.M();
                if (zF || objM == w12.a) {
                    objM = new le0(ah3Var, zy4Var, l78Var, 17);
                    p65Var.j0(objM);
                }
                aq7.b(bq7Var, (m45) objM, r28VarN, 0L, 0L, p65Var, 0, 24);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object o(Object obj, Object obj2, Object obj3) {
        u64 u64Var = (u64) this.b;
        cs1 cs1Var = (cs1) this.d;
        obe obeVar = (obe) this.c;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
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
            Integer numValueOf = Integer.valueOf(i);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i2 = (int) (j2 ^ (j2 >>> 32));
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
            ka1.z(i2, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            h70 h70Var = new h70(24.0f, true, new z10(21));
            jy8 jy8VarH = w2g.h(24.0f, 0.0f, 24.0f, 0.0f, 10);
            r28 r28VarD2 = jfc.d(o28Var, 1.0f);
            boolean zF = p65Var.f(u64Var) | p65Var.f(cs1Var) | p65Var.f(obeVar);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new o8(u64Var, cs1Var, obeVar, 16);
                p65Var.j0(objM);
            }
            k40.u(r28VarD2, null, jy8VarH, h70Var, null, null, false, null, (x45) objM, p65Var, 24966, 490);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object r(Object obj, Object obj2, Object obj3) {
        o28 o28Var;
        sb4 sb4Var = (sb4) this.b;
        s26 s26Var = (s26) this.c;
        l78 l78Var = (l78) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            PostShareData postShareData = sb4Var.g;
            o28 o28Var2 = o28.b;
            uob uobVar = w12.a;
            if (postShareData != null) {
                p65Var.Y(-275249133);
                bq7 bq7Var = new bq7(vo7.R(p65Var, R.string.common_share), false, Integer.valueOf(R.drawable.ic_share_24), null, 26);
                boolean zH = p65Var.h(s26Var) | p65Var.f(postShareData) | p65Var.f(sb4Var);
                Object objM = p65Var.M();
                if (zH || objM == uobVar) {
                    hu0 hu0Var = new hu0(s26Var, postShareData, sb4Var, l78Var, 4);
                    p65Var.j0(hu0Var);
                    objM = hu0Var;
                }
                aq7.b(bq7Var, (m45) objM, bgf.N(o28Var2, "action_share"), 0L, 0L, p65Var, 384, 24);
                p65Var = p65Var;
                o28Var = o28Var2;
                tp7.c(0.0f, 6, 6, 0L, p65Var, w2g.G(o28Var2, 0.0f, 8.0f, 0.0f, 8.0f, 5));
            } else {
                o28Var = o28Var2;
                p65Var.Y(-281629522);
            }
            p65Var.p(false);
            bq7 bq7Var2 = new bq7(vo7.R(p65Var, R.string.featured_post_stop_featuring_story), false, null, null, 30);
            boolean zH2 = p65Var.h(s26Var) | p65Var.f(sb4Var);
            Object objM2 = p65Var.M();
            if (zH2 || objM2 == uobVar) {
                objM2 = new le0(s26Var, sb4Var, l78Var, 20);
                p65Var.j0(objM2);
            }
            aq7.b(bq7Var2, (m45) objM2, bgf.N(o28Var, "action_stop_featuring_post"), 0L, 0L, p65Var, 384, 24);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object t(Object obj, Object obj2, Object obj3) {
        nc4 nc4Var = (nc4) this.b;
        xb4 xb4Var = (xb4) this.c;
        s26 s26Var = (s26) this.d;
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
            if (g76.L(nc4Var, mc4.a)) {
                p65Var.Y(-1916785114);
                n01.s(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (g76.L(nc4Var, lc4.a)) {
                p65Var.Y(-1916611576);
                n01.p(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(nc4Var instanceof kc4)) {
                    throw ho2.L(p65Var, 2016376391, false);
                }
                p65Var.Y(-1916430319);
                n01.o((kc4) nc4Var, xb4Var, s26Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object u(Object obj, Object obj2, Object obj3) {
        int i;
        int i2;
        kc4 kc4Var = (kc4) this.b;
        xb4 xb4Var = (xb4) this.c;
        l78 l78Var = (l78) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            for (ec4 ec4Var : ec4.getEntries()) {
                r28 r28VarN = bgf.N(o28.b, "featured_posts_sort_filter_" + ec4Var);
                int i3 = yb4.a[ec4Var.ordinal()];
                if (i3 == 1) {
                    i = -369348633;
                    i2 = R.string.common_sort_latest;
                } else {
                    if (i3 != 2) {
                        throw ho2.L(p65Var, -369351367, false);
                    }
                    i = -369344697;
                    i2 = R.string.common_sort_oldest;
                }
                bq7 bq7Var = new bq7(km4.w(p65Var, i, i2, p65Var, false), kc4Var.g == ec4Var, null, null, 28);
                boolean zH = p65Var.h(xb4Var) | p65Var.d(ec4Var.ordinal());
                Object objM = p65Var.M();
                if (zH || objM == w12.a) {
                    objM = new le0(xb4Var, ec4Var, l78Var, 21);
                    p65Var.j0(objM);
                }
                aq7.b(bq7Var, (m45) objM, r28VarN, 0L, 0L, p65Var, 0, 24);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object v(Object obj, Object obj2, Object obj3) {
        xi4 xi4Var = (xi4) this.b;
        hi4 hi4Var = (hi4) this.d;
        obe obeVar = (obe) this.c;
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
            if (xi4Var instanceof pi4) {
                p65Var.Y(-336514860);
                gx1.o(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (xi4Var instanceof ui4) {
                p65Var.Y(-336511362);
                gx1.q(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (xi4Var instanceof wi4) {
                p65Var.Y(-336507467);
                gx1.r(hi4Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (xi4Var instanceof ti4) {
                p65Var.Y(-336500857);
                gx1.p((ti4) xi4Var, hi4Var, obeVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (xi4Var instanceof vi4) {
                p65Var.Y(-336491822);
                gx1.l(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(xi4Var instanceof oi4)) {
                    throw ho2.L(p65Var, -336516267, false);
                }
                p65Var.Y(-336488656);
                gx1.m((oi4) xi4Var, hi4Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object w(Object obj, Object obj2, Object obj3) {
        upc upcVar = (upc) this.b;
        l78 l78Var = (l78) this.c;
        hi4 hi4Var = (hi4) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((pmb) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            if (((Boolean) upcVar.getValue()).booleanValue()) {
                p65Var.Y(-1847480625);
                zk7 zk7VarC = dy0.c(z46.d, false);
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
                tp7.B(p65Var, q12.f, zk7VarC);
                tp7.B(p65Var, q12.e, i89VarL);
                tp7.B(p65Var, q12.g, Integer.valueOf(i));
                tp7.y(p65Var, q12.h);
                tp7.B(p65Var, q12.d, r28VarR);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (objM == uobVar) {
                    objM = new ei4(l78Var, 0);
                    p65Var.j0(objM);
                }
                f49.l((m45) objM, bgf.N(o28Var, "find_friends_more_options"), false, null, null, guc.c, p65Var, 1572918, 60);
                boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
                Object objM2 = p65Var.M();
                if (objM2 == uobVar) {
                    objM2 = new ei4(l78Var, 1);
                    p65Var.j0(objM2);
                }
                xp7.b(zBooleanValue, (m45) objM2, null, 0L, null, null, null, 0L, 0.0f, pxf.E(1519404759, new g64(hi4Var, 7, l78Var), p65Var), p65Var, 48, 2044);
                p65Var = p65Var;
                p65Var.p(true);
            } else {
                p65Var.Y(-1859786385);
            }
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object x(Object obj, Object obj2, Object obj3) {
        ov4 ov4Var = (ov4) this.b;
        kv6 kv6Var = (kv6) this.c;
        ye1 ye1Var = (ye1) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            rx0.f(ov4Var, kv6Var, ye1Var, null, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object y(Object obj, Object obj2, Object obj3) {
        vw4 vw4Var = (vw4) this.b;
        kv6 kv6Var = (kv6) this.c;
        lw4 lw4Var = (lw4) this.d;
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
            if (vw4Var instanceof uw4) {
                p65Var.Y(-531142847);
                vx0.k(kv6Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (vw4Var instanceof rw4) {
                p65Var.Y(-531139337);
                vx0.h((rw4) vw4Var, lw4Var, kv6Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (vw4Var instanceof sw4) {
                p65Var.Y(-531131408);
                vx0.i(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(vw4Var instanceof tw4)) {
                    throw ho2.L(p65Var, -531144586, false);
                }
                p65Var.Y(-531128538);
                vx0.j((tw4) vw4Var, lw4Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        o28 o28Var;
        final zm7 zm7Var;
        boolean z;
        boolean z2;
        vj3 vj3Var;
        int i = this.a;
        int i2 = 16;
        uob uobVar = w12.a;
        o28 o28Var2 = o28.b;
        c1e c1eVar = c1e.a;
        Object obj4 = this.d;
        Object obj5 = this.c;
        Object obj6 = this.b;
        switch (i) {
            case 0:
                uh uhVar = (uh) obj6;
                obe obeVar = (obe) obj5;
                oh ohVar = (oh) obj4;
                hy8 hy8Var = (hy8) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    r28 r28VarB = w2g.B(o28Var2, hy8Var).b(jfc.c);
                    if (uhVar instanceof rh) {
                        p65Var.Y(-1484240455);
                        op8.n((rh) uhVar, obeVar, ohVar, r28VarB, p65Var, 0);
                        p65Var.p(false);
                    } else if (uhVar instanceof sh) {
                        p65Var.Y(1476150031);
                        op8.c((sh) uhVar, ohVar, r28VarB, p65Var, 0);
                        p65Var.p(false);
                    } else {
                        if (!(uhVar instanceof th)) {
                            throw ho2.L(p65Var, 1476139750, false);
                        }
                        p65Var.Y(1476157317);
                        op8.d(r28VarB, p65Var, 0);
                        p65Var.p(false);
                    }
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                pl2 pl2Var = (pl2) obj6;
                jl2 jl2Var = (jl2) obj5;
                x45 x45Var = (x45) obj4;
                hy8 hy8Var2 = (hy8) obj;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                hy8Var2.getClass();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).f(hy8Var2) ? 4 : 2;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    o28 o28Var3 = o28.b;
                    r28 r28VarX = ho2.x((jp7) p65Var2.j(kt7.a), w2g.B(o28Var3, hy8Var2), 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var2.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, r28VarX);
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
                    Integer numValueOf = Integer.valueOf(i3);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var2, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var2, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var2, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var2.T;
                    int i4 = (int) (j2 ^ (j2 >>> 32));
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
                    ka1.z(i4, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR2);
                    u36.a(pl2Var, jl2Var, x45Var, bgf.N(jfc.c, "custom_app_icon_content"), p65Var2, 3072);
                    p65Var2.p(true);
                    p65Var2.p(true);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                final be3 be3Var = (be3) obj6;
                x45 x45Var2 = (x45) obj5;
                zm7 zm7Var2 = (zm7) obj4;
                hy8 hy8Var3 = (hy8) obj;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                yq0 yq0Var = z46.p;
                rz5 rz5Var = qb8.c;
                hy8Var3.getClass();
                if ((iIntValue3 & 6) == 0) {
                    iIntValue3 |= ((p65) x12Var3).f(hy8Var3) ? 4 : 2;
                }
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 19) != 18)) {
                    r28 r28VarB2 = w2g.B(jfc.c, hy8Var3);
                    jp7 jp7Var = (jp7) p65Var3.j(kt7.a);
                    o28 o28Var4 = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var4, 3, 1.0f);
                    zk7 zk7VarC3 = dy0.c(z46.h, false);
                    long j3 = p65Var3.T;
                    int i5 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var3.l();
                    r28 r28VarR3 = gx1.R(p65Var3, r28VarJ);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var2);
                    } else {
                        p65Var3.m0();
                    }
                    cu cuVar5 = q12.f;
                    tp7.B(p65Var3, cuVar5, zk7VarC3);
                    cu cuVar6 = q12.e;
                    tp7.B(p65Var3, cuVar6, i89VarL3);
                    Integer numValueOf2 = Integer.valueOf(i5);
                    cu cuVar7 = q12.g;
                    tp7.B(p65Var3, cuVar7, numValueOf2);
                    fn fnVar2 = q12.h;
                    tp7.y(p65Var3, fnVar2);
                    cu cuVar8 = q12.d;
                    tp7.B(p65Var3, cuVar8, r28VarR3);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC4 = dy0.c(z46.d, false);
                    long j4 = p65Var3.T;
                    int i6 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL4 = p65Var3.l();
                    r28 r28VarR4 = gx1.R(p65Var3, r28VarD2);
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var2);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, cuVar5, zk7VarC4);
                    tp7.B(p65Var3, cuVar6, i89VarL4);
                    ka1.z(i6, p65Var3, cuVar7, p65Var3, fnVar2);
                    tp7.B(p65Var3, cuVar8, r28VarR4);
                    if (be3Var instanceof yd3) {
                        p65Var3.Y(22902173);
                        iq7.b(r28VarB2, null, null, null, null, null, null, p65Var3, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                        p65Var3.p(false);
                        z2 = true;
                    } else if (g76.L(be3Var, zd3.a)) {
                        p65Var3.Y(23041890);
                        r28 r28VarV = m40.V(r28VarB2, p65Var3, 0);
                        wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var3, 0);
                        long j5 = p65Var3.T;
                        int i7 = (int) (j5 ^ (j5 >>> 32));
                        i89 i89VarL5 = p65Var3.l();
                        r28 r28VarR5 = gx1.R(p65Var3, r28VarV);
                        p65Var3.c0();
                        if (p65Var3.S) {
                            p65Var3.k(ot2Var2);
                        } else {
                            p65Var3.m0();
                        }
                        tp7.B(p65Var3, cuVar5, wv1VarA);
                        tp7.B(p65Var3, cuVar6, i89VarL5);
                        ka1.z(i7, p65Var3, cuVar7, p65Var3, fnVar2);
                        tp7.B(p65Var3, cuVar8, r28VarR5);
                        p65Var3.Y(1514114033);
                        for (int i8 = 0; i8 < 3; i8++) {
                            n01.F(i8, 0, p65Var3, null);
                            tp7.c(0.0f, 0, 7, 0L, p65Var3, null);
                        }
                        z2 = true;
                        b09.H(p65Var3, false, true, false);
                    } else {
                        if (!(be3Var instanceof ae3)) {
                            throw ho2.L(p65Var3, 1386211449, false);
                        }
                        p65Var3.Y(23401428);
                        wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var3, 0);
                        long j6 = p65Var3.T;
                        int i9 = (int) (j6 ^ (j6 >>> 32));
                        i89 i89VarL6 = p65Var3.l();
                        r28 r28VarR6 = gx1.R(p65Var3, r28VarB2);
                        p65Var3.c0();
                        if (p65Var3.S) {
                            p65Var3.k(ot2Var2);
                        } else {
                            p65Var3.m0();
                        }
                        tp7.B(p65Var3, cuVar5, wv1VarA2);
                        tp7.B(p65Var3, cuVar6, i89VarL6);
                        ka1.z(i9, p65Var3, cuVar7, p65Var3, fnVar2);
                        tp7.B(p65Var3, cuVar8, r28VarR6);
                        ae3 ae3Var = (ae3) be3Var;
                        n01.E(ae3Var.a, ae3Var.b, x45Var2, null, p65Var3, 0);
                        p65Var3 = p65Var3;
                        if (Build.VERSION.SDK_INT >= 26) {
                            p65Var3.Y(564033591);
                            tp7.c(0.0f, 0, 7, 0L, p65Var3, null);
                            zm7Var = zm7Var2;
                            boolean zF = p65Var3.f(zm7Var) | p65Var3.f(be3Var);
                            Object objM = p65Var3.M();
                            if (zF || objM == uobVar) {
                                z = false;
                                final boolean z3 = false ? 1 : 0;
                                objM = new m45() { // from class: ud3
                                    @Override // defpackage.m45
                                    public final Object invoke() throws PendingIntent.CanceledException {
                                        int i10 = z3;
                                        c1e c1eVar2 = c1e.a;
                                        be3 be3Var2 = be3Var;
                                        zm7 zm7Var3 = zm7Var;
                                        switch (i10) {
                                            case 0:
                                                String strU = gp7.u(((ae3) be3Var2).c);
                                                DigestSettingsFragment digestSettingsFragment = (DigestSettingsFragment) zm7Var3.b;
                                                ((p13) digestSettingsFragment.Z()).A(digestSettingsFragment.S(), strU);
                                                return c1eVar2;
                                            default:
                                                String strU2 = gp7.u(((ae3) be3Var2).c);
                                                DigestSettingsFragment digestSettingsFragment2 = (DigestSettingsFragment) zm7Var3.b;
                                                s sVarZ = digestSettingsFragment2.Z();
                                                Context contextS = digestSettingsFragment2.S();
                                                if (digestSettingsFragment2.u0 == null) {
                                                    g76.g0("mediumUris");
                                                    throw null;
                                                }
                                                ((p13) sVarZ).f(contextS, Uri.parse(i03.l), strU2);
                                                return c1eVar2;
                                        }
                                    }
                                };
                                p65Var3.j0(objM);
                            } else {
                                z = false;
                            }
                            o28Var = o28Var4;
                            n01.N(w2g.D(hlg.r(o28Var4, false, null, null, (m45) objM, 15), 24.0f, 16.0f), p65Var3, z ? 1 : 0);
                        } else {
                            o28Var = o28Var4;
                            zm7Var = zm7Var2;
                            z = false;
                            p65Var3.Y(560217243);
                        }
                        p65Var3.p(z);
                        tp7.c(0.0f, 0, 7, 0L, p65Var3, null);
                        boolean zF2 = p65Var3.f(zm7Var) | p65Var3.f(be3Var);
                        Object objM2 = p65Var3.M();
                        if (zF2 || objM2 == uobVar) {
                            final int i10 = 1;
                            objM2 = new m45() { // from class: ud3
                                @Override // defpackage.m45
                                public final Object invoke() throws PendingIntent.CanceledException {
                                    int i102 = i10;
                                    c1e c1eVar2 = c1e.a;
                                    be3 be3Var2 = be3Var;
                                    zm7 zm7Var3 = zm7Var;
                                    switch (i102) {
                                        case 0:
                                            String strU = gp7.u(((ae3) be3Var2).c);
                                            DigestSettingsFragment digestSettingsFragment = (DigestSettingsFragment) zm7Var3.b;
                                            ((p13) digestSettingsFragment.Z()).A(digestSettingsFragment.S(), strU);
                                            return c1eVar2;
                                        default:
                                            String strU2 = gp7.u(((ae3) be3Var2).c);
                                            DigestSettingsFragment digestSettingsFragment2 = (DigestSettingsFragment) zm7Var3.b;
                                            s sVarZ = digestSettingsFragment2.Z();
                                            Context contextS = digestSettingsFragment2.S();
                                            if (digestSettingsFragment2.u0 == null) {
                                                g76.g0("mediumUris");
                                                throw null;
                                            }
                                            ((p13) sVarZ).f(contextS, Uri.parse(i03.l), strU2);
                                            return c1eVar2;
                                    }
                                }
                            };
                            p65Var3.j0(objM2);
                        }
                        n01.l(w2g.D(hlg.r(o28Var, false, null, null, (m45) objM2, 15), 24.0f, 16.0f), p65Var3, 0);
                        tp7.c(0.0f, 0, 7, 0L, p65Var3, null);
                        z2 = true;
                        p65Var3.p(true);
                        p65Var3.p(false);
                    }
                    p65Var3.p(z2);
                    p65Var3.p(z2);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 3:
                kv6 kv6Var = (kv6) obj6;
                yl5 yl5Var = (yl5) obj5;
                sl5 sl5Var = (sl5) obj4;
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 17) != 16)) {
                    rh4 rh4Var = jfc.c;
                    boolean zF3 = p65Var4.f(yl5Var) | p65Var4.f(sl5Var);
                    Object objM3 = p65Var4.M();
                    if (zF3 || objM3 == uobVar) {
                        objM3 = new si3(yl5Var, i2, sl5Var);
                        p65Var4.j0(objM3);
                    }
                    k40.t(rh4Var, kv6Var, null, null, null, null, false, null, (x45) objM3, p65Var4, 6, 508);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                am5 am5Var = (am5) obj6;
                sl5 sl5Var2 = (sl5) obj5;
                kv6 kv6Var2 = (kv6) obj4;
                hy8 hy8Var4 = (hy8) obj;
                x12 x12Var5 = (x12) obj2;
                int iIntValue5 = ((Integer) obj3).intValue();
                hy8Var4.getClass();
                if ((iIntValue5 & 6) == 0) {
                    iIntValue5 |= ((p65) x12Var5).f(hy8Var4) ? 4 : 2;
                }
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 19) != 18)) {
                    r28 r28VarB3 = w2g.B(o28Var2, hy8Var4).b(jfc.c);
                    if (am5Var instanceof zl5) {
                        p65Var5.Y(665049392);
                        g76.p(r28VarB3, p65Var5, 0);
                        p65Var5.p(false);
                    } else if (am5Var instanceof wl5) {
                        p65Var5.Y(665052398);
                        g76.m(r28VarB3, p65Var5, 0);
                        p65Var5.p(false);
                    } else if (am5Var instanceof xl5) {
                        p65Var5.Y(665055460);
                        g76.n((xl5) am5Var, sl5Var2, r28VarB3, p65Var5, 0);
                        p65Var5.p(false);
                    } else {
                        if (!(am5Var instanceof yl5)) {
                            throw ho2.L(p65Var5, 665047637, false);
                        }
                        p65Var5.Y(665062259);
                        g76.o((yl5) am5Var, kv6Var2, sl5Var2, r28VarB3, p65Var5, 0);
                        p65Var5.p(false);
                    }
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 5:
                ui9 ui9Var = (ui9) obj6;
                uga ugaVar = (uga) obj5;
                eb8 eb8Var = (eb8) obj4;
                hy8 hy8Var5 = (hy8) obj;
                x12 x12Var6 = (x12) obj2;
                int iIntValue6 = ((Integer) obj3).intValue();
                hy8Var5.getClass();
                if ((iIntValue6 & 6) == 0) {
                    iIntValue6 |= ((p65) x12Var6).f(hy8Var5) ? 4 : 2;
                }
                p65 p65Var6 = (p65) x12Var6;
                if (!p65Var6.P(iIntValue6 & 1, (iIntValue6 & 19) != 18)) {
                    p65Var6.S();
                    return c1eVar;
                }
                o28 o28Var5 = o28.b;
                r28 r28VarB4 = w2g.B(o28Var5, hy8Var5);
                rh4 rh4Var2 = jfc.c;
                r28 r28VarX2 = ho2.x((jp7) p65Var6.j(kt7.a), w2g.G(r28VarB4.b(rh4Var2), 24.0f, 12.0f, 24.0f, 0.0f, 8), 3, 1.0f);
                zk7 zk7VarC5 = dy0.c(z46.h, false);
                long j7 = p65Var6.T;
                int i11 = (int) (j7 ^ (j7 >>> 32));
                i89 i89VarL7 = p65Var6.l();
                r28 r28VarR7 = gx1.R(p65Var6, r28VarX2);
                r12.W.getClass();
                ot2 ot2Var3 = q12.b;
                p65Var6.c0();
                if (p65Var6.S) {
                    p65Var6.k(ot2Var3);
                } else {
                    p65Var6.m0();
                }
                cu cuVar9 = q12.f;
                tp7.B(p65Var6, cuVar9, zk7VarC5);
                cu cuVar10 = q12.e;
                tp7.B(p65Var6, cuVar10, i89VarL7);
                Integer numValueOf3 = Integer.valueOf(i11);
                cu cuVar11 = q12.g;
                tp7.B(p65Var6, cuVar11, numValueOf3);
                fn fnVar3 = q12.h;
                tp7.y(p65Var6, fnVar3);
                cu cuVar12 = q12.d;
                tp7.B(p65Var6, cuVar12, r28VarR7);
                r28 r28VarD3 = jfc.d(jfc.o(o28Var5, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC6 = dy0.c(z46.d, false);
                long j8 = p65Var6.T;
                int i12 = (int) (j8 ^ (j8 >>> 32));
                i89 i89VarL8 = p65Var6.l();
                r28 r28VarR8 = gx1.R(p65Var6, r28VarD3);
                p65Var6.c0();
                if (p65Var6.S) {
                    p65Var6.k(ot2Var3);
                } else {
                    p65Var6.m0();
                }
                tp7.B(p65Var6, cuVar9, zk7VarC6);
                tp7.B(p65Var6, cuVar10, i89VarL8);
                ka1.z(i12, p65Var6, cuVar11, p65Var6, fnVar3);
                tp7.B(p65Var6, cuVar12, r28VarR8);
                wv1 wv1VarA3 = uv1.a(qb8.c, z46.p, p65Var6, 0);
                long j9 = p65Var6.T;
                int i13 = (int) (j9 ^ (j9 >>> 32));
                i89 i89VarL9 = p65Var6.l();
                r28 r28VarR9 = gx1.R(p65Var6, o28Var5);
                p65Var6.c0();
                if (p65Var6.S) {
                    p65Var6.k(ot2Var3);
                } else {
                    p65Var6.m0();
                }
                tp7.B(p65Var6, cuVar9, wv1VarA3);
                tp7.B(p65Var6, cuVar10, i89VarL9);
                ka1.z(i13, p65Var6, cuVar11, p65Var6, fnVar3);
                tp7.B(p65Var6, cuVar12, r28VarR9);
                String strR = vo7.R(p65Var6, R.string.select_an_image);
                sn3 sn3Var = kt7.c;
                kjd.b(strR, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var6.j(sn3Var)).g, p65Var6, 0, 0, 65534);
                kjd.b(vo7.R(p65Var6, R.string.select_an_image_description), w2g.G(o28Var5, 0.0f, 12.0f, 0.0f, 0.0f, 13), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var6.j(sn3Var)).m, p65Var6, 48, 0, 65532);
                ag5 ag5Var = new ag5();
                r28 r28VarG = w2g.G(rh4Var2, 0.0f, 40.0f, 0.0f, 0.0f, 13);
                h70 h70Var = new h70(8.0f, true, new z10(21));
                h70 h70Var2 = new h70(8.0f, true, new z10(21));
                boolean zF4 = p65Var6.f(ugaVar) | p65Var6.f(eb8Var);
                Object objM4 = p65Var6.M();
                if (zF4 || objM4 == uobVar) {
                    objM4 = new q58(ugaVar, 29, eb8Var);
                    p65Var6.j0(objM4);
                }
                m40.s(ag5Var, r28VarG, null, null, h70Var, h70Var2, null, false, null, (x45) objM4, p65Var6, 1769520);
                p65Var6.p(true);
                r28 r28VarG2 = w2g.G(iy0.a.a(jfc.d(jfc.o(o28Var5, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f), z46.k), 0.0f, 0.0f, 0.0f, 20.0f, 7);
                String strR2 = vo7.R(p65Var6, R.string.common_save);
                yn7 yn7Var = yn7.M;
                boolean zF5 = p65Var6.f(ui9Var);
                Object objM5 = p65Var6.M();
                if (zF5 || objM5 == uobVar) {
                    objM5 = new yj8(19, ui9Var);
                    p65Var6.j0(objM5);
                }
                mo7.k((m45) objM5, strR2, yn7Var, r28VarG2, false, p65Var6, 384, 16);
                p65Var6.p(true);
                p65Var6.p(true);
                return c1eVar;
            case 6:
                final jxc jxcVar = (jxc) obj6;
                m73 m73Var = (m73) obj5;
                final gxc gxcVar = (gxc) obj4;
                jy0 jy0Var = (jy0) obj;
                x12 x12Var7 = (x12) obj2;
                int iIntValue7 = ((Integer) obj3).intValue();
                jy0Var.getClass();
                if ((iIntValue7 & 6) == 0) {
                    iIntValue7 |= ((p65) x12Var7).f(jy0Var) ? 4 : 2;
                }
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 19) != 18)) {
                    kv6 kv6VarA = pv6.a(p65Var7);
                    final yrb yrbVarK = wgf.K(p65Var7);
                    xjd xjdVarK = ek7.K(p65Var7);
                    final long j10 = ((zo7) p65Var7.j(kt7.b)).z;
                    final mkd mkdVar = ((bu7) p65Var7.j(jt7.c)).m;
                    final hl0 hl0Var = hl0.XXXS;
                    final int size = jxcVar.e.size();
                    final float fN = m73Var.N((int) (xjd.a(xjdVarK, vo7.R(p65Var7, R.string.subscribers_list_table_title_date), mkdVar, 0, 0L, 1020).c >> 32)) + 32.0f;
                    final oya oyaVar = new oya();
                    Iterator it2 = jxcVar.e.iterator();
                    if (it2.hasNext()) {
                        vj3Var = new vj3(m73Var.N((int) (xjd.a(xjdVarK, ((ixc) it2.next()).b, mkdVar, 0, 0L, 1020).c >> 32)));
                        while (it2.hasNext()) {
                            vj3 vj3Var2 = new vj3(m73Var.N((int) (xjd.a(xjdVarK, ((ixc) it2.next()).b, mkdVar, 0, 0L, 1020).c >> 32)));
                            if (vj3Var.compareTo(vj3Var2) < 0) {
                                vj3Var = vj3Var2;
                            }
                        }
                    } else {
                        vj3Var = null;
                    }
                    float fM114getSizeD9Ej5fM = hl0Var.m114getSizeD9Ej5fM() + (vj3Var != null ? vj3Var.a : 0.0f) + 32.0f + 8.0f;
                    oyaVar.a = fM114getSizeD9Ej5fM;
                    float f = fN + fM114getSizeD9Ej5fM;
                    final boolean z4 = vj3.a(f, jy0Var.b()) > 0;
                    if (vj3.a(f, jy0Var.b()) <= 0) {
                        oyaVar.a = jy0Var.b() - fN;
                    }
                    k40.t(jfc.c, kv6VarA, w2g.h(24.0f, 32.0f, 24.0f, 0.0f, 8), null, null, null, false, null, new x45() { // from class: cxc
                        @Override // defpackage.x45
                        public final Object invoke(Object obj7) {
                            xu6 xu6Var = (xu6) obj7;
                            xu6Var.getClass();
                            jxc jxcVar2 = jxcVar;
                            ev6.j(xu6Var, "header", new mz1(new nra(6, jxcVar2), true, -465950797), 2);
                            final yrb yrbVar = yrbVarK;
                            final boolean z5 = z4;
                            final float f2 = fN;
                            final long j11 = j10;
                            final mkd mkdVar2 = mkdVar;
                            final oya oyaVar2 = oyaVar;
                            ev6.J(xu6Var, "subscribers_list_header", new mz1(new d55() { // from class: dxc
                                @Override // defpackage.d55
                                public final Object k(Object obj8, Object obj9, Object obj10, Object obj11) {
                                    ((Integer) obj9).getClass();
                                    x12 x12Var8 = (x12) obj10;
                                    int iIntValue8 = ((Integer) obj11).intValue();
                                    ((xr6) obj8).getClass();
                                    p65 p65Var8 = (p65) x12Var8;
                                    if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 129) != 128)) {
                                        o28 o28Var6 = o28.b;
                                        r28 r28VarA0 = flb.a0(jfc.d(o28Var6, 1.0f), ((zo7) p65Var8.j(kt7.b)).a, rv8.r);
                                        yrb yrbVar2 = yrbVar;
                                        boolean z6 = z5;
                                        r28 r28VarZ = er7.z(wgf.w(r28VarA0, yrbVar2, z6), yrbVar2, 24.0f, z6);
                                        omb ombVarA = nmb.a(qb8.a, z46.n, p65Var8, 48);
                                        long j12 = p65Var8.T;
                                        int i14 = (int) (j12 ^ (j12 >>> 32));
                                        i89 i89VarL10 = p65Var8.l();
                                        r28 r28VarR10 = gx1.R(p65Var8, r28VarZ);
                                        r12.W.getClass();
                                        ot2 ot2Var4 = q12.b;
                                        p65Var8.c0();
                                        if (p65Var8.S) {
                                            p65Var8.k(ot2Var4);
                                        } else {
                                            p65Var8.m0();
                                        }
                                        tp7.B(p65Var8, q12.f, ombVarA);
                                        tp7.B(p65Var8, q12.e, i89VarL10);
                                        tp7.B(p65Var8, q12.g, Integer.valueOf(i14));
                                        tp7.y(p65Var8, q12.h);
                                        tp7.B(p65Var8, q12.d, r28VarR10);
                                        String strR3 = vo7.R(p65Var8, R.string.subscribers_list_table_title_date);
                                        r28 r28VarP = jfc.p(o28Var6, f2);
                                        r28VarP.getClass();
                                        long j13 = j11;
                                        r28 r28VarA = guc.A(r28VarP, new ro(6, j13));
                                        r28VarA.getClass();
                                        r28 r28VarN = bgf.N(w2g.C(guc.A(r28VarA, new ro(5, j13)), 16.0f), "subscribers_list_table_title_date");
                                        mkd mkdVar3 = mkdVar2;
                                        jjd.b(strR3, r28VarN, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar3, p65Var8, 0, 0, 131068);
                                        String strR4 = vo7.R(p65Var8, R.string.subscribers_list_table_title_name);
                                        r28 r28VarP2 = jfc.p(o28Var6, oyaVar2.a);
                                        r28VarP2.getClass();
                                        jjd.b(strR4, bgf.N(w2g.C(guc.A(r28VarP2, new ro(6, j13)), 16.0f), "subscribers_list_table_title_name"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar3, p65Var8, 0, 0, 131068);
                                        p65Var8.p(true);
                                    } else {
                                        p65Var8.S();
                                    }
                                    return c1e.a;
                                }
                            }, true, 920123687));
                            List list = jxcVar2.e;
                            xu6Var.l0(list.size(), new vja(new n2c(4), 13, list), new lba(list, 12), new mz1(new hxc(list, size, j11, yrbVar, z5, f2, mkdVar2, gxcVar, jxcVar2, oyaVar2, hl0Var), true, 2039820996));
                            if (jxcVar2.f) {
                                ev6.j(xu6Var, "loading_more", flb.f, 2);
                            }
                            return c1e.a;
                        }
                    }, p65Var7, 6, 504);
                    boolean zF6 = p65Var7.f(kv6VarA) | p65Var7.h(gxcVar);
                    Object objM6 = p65Var7.M();
                    Object obj7 = objM6;
                    if (zF6 || objM6 == uobVar) {
                        eub eubVar = new eub(kv6VarA, gxcVar, null, 23);
                        p65Var7.j0(eubVar);
                        obj7 = eubVar;
                    }
                    kyd.k(p65Var7, (b55) obj7, kv6VarA);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 7:
                kv6 kv6Var3 = (kv6) obj6;
                ue ueVar = (ue) obj5;
                cs1 cs1Var = (cs1) obj4;
                x12 x12Var8 = (x12) obj2;
                int iIntValue8 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 17) != 16)) {
                    boolean zF7 = p65Var8.f(ueVar) | p65Var8.f(cs1Var);
                    Object objM7 = p65Var8.M();
                    if (zF7 || objM7 == uobVar) {
                        objM7 = new i0(ueVar, i, cs1Var);
                        p65Var8.j0(objM7);
                    }
                    k40.t(null, kv6Var3, null, null, null, null, false, null, (x45) objM7, p65Var8, 0, 509);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 8:
                bg bgVar = (bg) obj6;
                tf tfVar = (tf) obj4;
                obe obeVar2 = (obe) obj5;
                hy8 hy8Var6 = (hy8) obj;
                x12 x12Var9 = (x12) obj2;
                int iIntValue9 = ((Integer) obj3).intValue();
                hy8Var6.getClass();
                if ((iIntValue9 & 6) == 0) {
                    iIntValue9 |= ((p65) x12Var9).f(hy8Var6) ? 4 : 2;
                }
                p65 p65Var9 = (p65) x12Var9;
                if (p65Var9.P(iIntValue9 & 1, (iIntValue9 & 19) != 18)) {
                    r28 r28VarB5 = w2g.B(o28Var2, hy8Var6);
                    if (bgVar instanceof yf) {
                        p65Var9.Y(618907339);
                        yi2.q((yf) bgVar, tfVar, obeVar2, r28VarB5, p65Var9, 0);
                        p65Var9.p(false);
                    } else if (bgVar instanceof zf) {
                        p65Var9.Y(619190028);
                        yi2.f((zf) bgVar, tfVar, r28VarB5, p65Var9, 0);
                        p65Var9.p(false);
                    } else {
                        if (!(bgVar instanceof ag)) {
                            throw ho2.L(p65Var9, -1919700501, false);
                        }
                        p65Var9.Y(619455760);
                        yi2.g(r28VarB5, p65Var9, 0);
                        p65Var9.p(false);
                    }
                } else {
                    p65Var9.S();
                }
                return c1eVar;
            case 9:
                qg qgVar = (qg) obj6;
                cs1 cs1Var2 = (cs1) obj5;
                ig igVar = (ig) obj4;
                hy8 hy8Var7 = (hy8) obj;
                x12 x12Var10 = (x12) obj2;
                int iIntValue10 = ((Integer) obj3).intValue();
                hy8Var7.getClass();
                if ((iIntValue10 & 6) == 0) {
                    iIntValue10 |= ((p65) x12Var10).f(hy8Var7) ? 4 : 2;
                }
                p65 p65Var10 = (p65) x12Var10;
                if (p65Var10.P(iIntValue10 & 1, (iIntValue10 & 19) != 18)) {
                    r28 r28VarB6 = w2g.B(o28Var2, hy8Var7);
                    if (qgVar instanceof ng) {
                        p65Var10.Y(1962846414);
                        xz5.f((ng) qgVar, cs1Var2, igVar, r28VarB6, p65Var10, 0);
                        p65Var10.p(false);
                    } else if (qgVar instanceof og) {
                        p65Var10.Y(1963158522);
                        xz5.b((og) qgVar, igVar, r28VarB6, p65Var10, 0);
                        p65Var10.p(false);
                    } else {
                        if (!(qgVar instanceof pg)) {
                            throw ho2.L(p65Var10, 2002978188, false);
                        }
                        p65Var10.Y(1963426207);
                        xz5.a(r28VarB6, p65Var10, 0);
                        p65Var10.p(false);
                    }
                } else {
                    p65Var10.S();
                }
                return c1eVar;
            case 10:
                eh ehVar = (eh) obj6;
                wg wgVar = (wg) obj4;
                obe obeVar3 = (obe) obj5;
                hy8 hy8Var8 = (hy8) obj;
                x12 x12Var11 = (x12) obj2;
                int iIntValue11 = ((Integer) obj3).intValue();
                hy8Var8.getClass();
                if ((iIntValue11 & 6) == 0) {
                    iIntValue11 |= ((p65) x12Var11).f(hy8Var8) ? 4 : 2;
                }
                p65 p65Var11 = (p65) x12Var11;
                if (p65Var11.P(iIntValue11 & 1, (iIntValue11 & 19) != 18)) {
                    r28 r28VarB7 = w2g.B(o28Var2, hy8Var8);
                    if (ehVar instanceof bh) {
                        p65Var11.Y(234166532);
                        g76.h((bh) ehVar, wgVar, obeVar3, r28VarB7, p65Var11, 0);
                        p65Var11.p(false);
                    } else if (ehVar instanceof ch) {
                        p65Var11.Y(234463016);
                        g76.c((ch) ehVar, wgVar, r28VarB7, p65Var11, 0);
                        p65Var11.p(false);
                    } else {
                        if (!(ehVar instanceof dh)) {
                            throw ho2.L(p65Var11, -1100826866, false);
                        }
                        p65Var11.Y(234723137);
                        g76.d(r28VarB7, p65Var11, 0);
                        p65Var11.p(false);
                    }
                } else {
                    p65Var11.S();
                }
                return c1eVar;
            case 11:
                oi oiVar = (oi) obj6;
                hi hiVar = (hi) obj5;
                cs1 cs1Var3 = (cs1) obj4;
                hy8 hy8Var9 = (hy8) obj;
                x12 x12Var12 = (x12) obj2;
                int iIntValue12 = ((Integer) obj3).intValue();
                hy8Var9.getClass();
                if ((iIntValue12 & 6) == 0) {
                    iIntValue12 |= ((p65) x12Var12).f(hy8Var9) ? 4 : 2;
                }
                p65 p65Var12 = (p65) x12Var12;
                if (p65Var12.P(iIntValue12 & 1, (iIntValue12 & 19) != 18)) {
                    r28 r28VarB8 = w2g.B(o28Var2, hy8Var9);
                    if (oiVar instanceof li) {
                        p65Var12.Y(1528837989);
                        gsa.k((li) oiVar, hiVar, cs1Var3, r28VarB8, p65Var12, 0);
                        p65Var12.p(false);
                    } else if (oiVar instanceof mi) {
                        p65Var12.Y(1528846774);
                        gsa.p(((mi) oiVar).a, hiVar, r28VarB8, p65Var12, 0);
                        p65Var12.p(false);
                    } else {
                        if (!(oiVar instanceof ni)) {
                            throw ho2.L(p65Var12, 1528835552, false);
                        }
                        p65Var12.Y(1528854080);
                        gsa.t(r28VarB8, p65Var12, 0);
                        p65Var12.p(false);
                    }
                } else {
                    p65Var12.S();
                }
                return c1eVar;
            case 12:
                bj bjVar = (bj) obj6;
                ti tiVar = (ti) obj5;
                e9d e9dVar = (e9d) obj4;
                hy8 hy8Var10 = (hy8) obj;
                x12 x12Var13 = (x12) obj2;
                int iIntValue13 = ((Integer) obj3).intValue();
                hy8Var10.getClass();
                if ((iIntValue13 & 6) == 0) {
                    iIntValue13 |= ((p65) x12Var13).f(hy8Var10) ? 4 : 2;
                }
                p65 p65Var13 = (p65) x12Var13;
                if (p65Var13.P(iIntValue13 & 1, (iIntValue13 & 19) != 18)) {
                    r28 r28VarB9 = w2g.B(o28Var2, hy8Var10);
                    if (bjVar instanceof yi) {
                        p65Var13.Y(-974703049);
                        pwd.f((yi) bjVar, tiVar, e9dVar, r28VarB9, p65Var13, 0);
                        p65Var13.p(false);
                    } else if (bjVar instanceof zi) {
                        p65Var13.Y(-974405418);
                        pwd.c((zi) bjVar, tiVar, r28VarB9, p65Var13, 0);
                        p65Var13.p(false);
                    } else {
                        if (!(bjVar instanceof aj)) {
                            throw ho2.L(p65Var13, 938387242, false);
                        }
                        p65Var13.Y(-974139345);
                        pwd.d(r28VarB9, p65Var13, 0);
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
                return r(obj, obj2, obj3);
            case 23:
                return t(obj, obj2, obj3);
            case 24:
                return u(obj, obj2, obj3);
            case 25:
                return v(obj, obj2, obj3);
            case 26:
                return w(obj, obj2, obj3);
            case 27:
                return x(obj, obj2, obj3);
            case 28:
                return y(obj, obj2, obj3);
            default:
                kv6 kv6Var4 = (kv6) obj6;
                rw4 rw4Var = (rw4) obj5;
                lw4 lw4Var = (lw4) obj4;
                x12 x12Var14 = (x12) obj2;
                int iIntValue14 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var14 = (p65) x12Var14;
                if (p65Var14.P(iIntValue14 & 1, (iIntValue14 & 17) != 16)) {
                    r28 r28VarN = bgf.N(o28Var2, "followers_list");
                    boolean zF8 = p65Var14.f(rw4Var) | p65Var14.f(lw4Var);
                    Object objM8 = p65Var14.M();
                    if (zF8 || objM8 == uobVar) {
                        objM8 = new si3(rw4Var, 11, lw4Var);
                        p65Var14.j0(objM8);
                    }
                    k40.t(r28VarN, kv6Var4, null, null, null, null, false, null, (x45) objM8, p65Var14, 6, 508);
                } else {
                    p65Var14.S();
                }
                return c1eVar;
        }
    }

    public /* synthetic */ nh(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }
}
