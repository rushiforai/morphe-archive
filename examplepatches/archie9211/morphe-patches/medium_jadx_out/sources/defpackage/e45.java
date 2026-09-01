package defpackage;

import android.content.Context;
import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.medium.android.core.models.BillingPeriod;
import com.medium.android.core.navigation.CatalogDetailReference;
import com.medium.reader.R;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class e45 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ e45(pq9 pq9Var, rq9 rq9Var, String str, SourceParameter sourceParameter, r28 r28Var, int i) {
        this.a = 18;
        this.b = pq9Var;
        this.c = rq9Var;
        this.d = str;
        this.f = sourceParameter;
        this.e = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        Object gi4Var;
        g49 g49Var;
        m68 m68Var;
        cu cuVar;
        fn fnVar;
        cu cuVar2;
        i45 i45Var;
        final ub0 ub0Var;
        boolean z;
        boolean z2;
        boolean z3;
        int iV;
        hp1 hp1Var;
        long j;
        mx mxVar;
        l78 l78Var;
        l78 l78Var2;
        int i = this.a;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.f;
        Object obj4 = this.e;
        Object obj5 = this.d;
        Object obj6 = this.c;
        Object obj7 = this.b;
        switch (i) {
            case 0:
                ub0 ub0Var2 = (ub0) obj7;
                sw5 sw5Var = ub0Var2.c;
                i45 i45Var2 = (i45) obj6;
                i3c i3cVar = (i3c) obj5;
                g49 g49Var2 = (g49) obj4;
                SourceParameter sourceParameter = (SourceParameter) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                    return c1eVar;
                }
                o28 o28Var = o28.b;
                r28 r28VarC = jfc.c(o28Var, 0.11111111f);
                r28 r28VarA0 = flb.a0(o28Var, op8.l(4280887593L), rv8.r);
                rh4 rh4Var = jfc.c;
                dy0.a(r28VarA0.b(rh4Var), p65Var, 6);
                tb0 tb0Var = ub0Var2.e;
                tb0 tb0Var2 = ub0Var2.d;
                vc2.g(sw5Var, null, p65Var, 0);
                r28 r28VarX = rv8.X(rh4Var, rv8.u);
                wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
                long j2 = p65Var.T;
                int i2 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL = p65Var.l();
                r28 r28VarR = gx1.R(p65Var, r28VarX);
                r12.W.getClass();
                ot2 ot2Var = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                cu cuVar3 = q12.f;
                tp7.B(p65Var, cuVar3, wv1VarA);
                cu cuVar4 = q12.e;
                tp7.B(p65Var, cuVar4, i89VarL);
                Integer numValueOf = Integer.valueOf(i2);
                cu cuVar5 = q12.g;
                tp7.B(p65Var, cuVar5, numValueOf);
                fn fnVar2 = q12.h;
                tp7.y(p65Var, fnVar2);
                cu cuVar6 = q12.d;
                tp7.B(p65Var, cuVar6, r28VarR);
                r28 r28VarN = bgf.N(jfc.d(r28VarC, 1.0f), "drag_handle_wrapper");
                Object objM = p65Var.M();
                if (objM == uobVar) {
                    objM = ka1.k(p65Var);
                }
                m68 m68Var2 = (m68) objM;
                boolean zF = p65Var.f(i45Var2);
                Object objM2 = p65Var.M();
                if (zF || objM2 == uobVar) {
                    g49Var = g49Var2;
                    m68Var = m68Var2;
                    cuVar = cuVar6;
                    fnVar = fnVar2;
                    cuVar2 = cuVar5;
                    gi4Var = new gi4(0, i45Var2, i45.class, aJzfoQ.biORfy, "collapse()V", 0, 29);
                    i45Var = i45Var2;
                    p65Var.j0(gi4Var);
                } else {
                    g49Var = g49Var2;
                    m68Var = m68Var2;
                    cuVar = cuVar6;
                    i45Var = i45Var2;
                    fnVar = fnVar2;
                    gi4Var = objM2;
                    cuVar2 = cuVar5;
                }
                r28 r28VarP = hlg.p(r28VarN, m68Var, null, false, null, (m45) ((qh6) gi4Var), 28);
                final i45 i45Var3 = i45Var;
                zk7 zk7VarC = dy0.c(z46.e, false);
                long j3 = p65Var.T;
                int i3 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarP);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar3, zk7VarC);
                tp7.B(p65Var, cuVar4, i89VarL2);
                ka1.z(i3, p65Var, cuVar2, p65Var, fnVar);
                tp7.B(p65Var, cuVar, r28VarR2);
                vc2.s(w2g.G(o28Var, 0.0f, 8.0f, 0.0f, 0.0f, 13), p65Var, 6);
                p65Var.p(true);
                vc2.c(sw5Var, w2g.C(new sq6(1.0f, true), 40.0f), p65Var, 0);
                hp7.t(p65Var, r28VarC);
                if (tb0Var2 == null && tb0Var == null) {
                    p65Var.Y(761433121);
                    p65Var.p(false);
                    z3 = false;
                    ub0Var = ub0Var2;
                } else {
                    p65Var.Y(769042567);
                    long j4 = uu1.d;
                    skc skcVar = new skc(j4, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61438);
                    wjd wjdVar = new wjd(skcVar, skcVar, skcVar, skcVar);
                    kx kxVarW = ho2.w(p65Var, -1776293646);
                    if (tb0Var2 != null) {
                        p65Var.Y(-144731566);
                        ub0Var = ub0Var2;
                        boolean zF2 = p65Var.f(i45Var3) | p65Var.f(ub0Var);
                        Object objM3 = p65Var.M();
                        if (zF2 || objM3 == uobVar) {
                            final int i4 = 1;
                            objM3 = new e07() { // from class: v35
                                @Override // defpackage.e07
                                public final void a(d07 d07Var) {
                                    int i5 = i4;
                                    ub0 ub0Var3 = ub0Var;
                                    i45 i45Var4 = i45Var3;
                                    switch (i5) {
                                        case 0:
                                            d07Var.getClass();
                                            i45Var4.v(ub0Var3.e.a);
                                            i45Var4.l();
                                            break;
                                        default:
                                            d07Var.getClass();
                                            i45Var4.y(ub0Var3.d.a);
                                            i45Var4.l();
                                            break;
                                    }
                                }
                            };
                            p65Var.j0(objM3);
                        }
                        iV = ho2.v("author_link", wjdVar, (e07) objM3, kxVarW);
                        try {
                            kxVarW.d(tb0Var2.b);
                            kxVarW.f(iV);
                            z = false;
                        } finally {
                        }
                    } else {
                        ub0Var = ub0Var2;
                        z = false;
                        p65Var.Y(-152809391);
                    }
                    p65Var.p(z);
                    if (tb0Var2 == null || tb0Var == null) {
                        p65Var.Y(-152809391);
                    } else {
                        p65Var.Y(-144068693);
                        kxVarW.d(vo7.R(p65Var, R.string.author_in_publication));
                    }
                    p65Var.p(z);
                    if (tb0Var != null) {
                        p65Var.Y(-143898658);
                        boolean zF3 = p65Var.f(i45Var3) | p65Var.f(ub0Var);
                        Object objM4 = p65Var.M();
                        if (zF3 || objM4 == uobVar) {
                            final int i5 = 0;
                            objM4 = new e07() { // from class: v35
                                @Override // defpackage.e07
                                public final void a(d07 d07Var) {
                                    int i52 = i5;
                                    ub0 ub0Var3 = ub0Var;
                                    i45 i45Var4 = i45Var3;
                                    switch (i52) {
                                        case 0:
                                            d07Var.getClass();
                                            i45Var4.v(ub0Var3.e.a);
                                            i45Var4.l();
                                            break;
                                        default:
                                            d07Var.getClass();
                                            i45Var4.y(ub0Var3.d.a);
                                            i45Var4.l();
                                            break;
                                    }
                                }
                            };
                            p65Var.j0(objM4);
                        }
                        iV = ho2.v("publication_link", wjdVar, (e07) objM4, kxVarW);
                        try {
                            kxVarW.d(tb0Var.b);
                            kxVarW.f(iV);
                            z2 = false;
                        } finally {
                        }
                    } else {
                        z2 = false;
                        p65Var.Y(-152809391);
                    }
                    p65Var.p(z2);
                    mx mxVarI = kxVarW.i();
                    p65Var.p(z2);
                    jjd.c(mxVarI, bgf.N(o28Var, "author_publication"), 0L, 0L, 0L, null, 0L, 2, false, 1, 0, null, null, mkd.a(((bu7) p65Var.j(jt7.c)).m, j4, 0L, null, null, null, 0L, 0L, i3cVar, 0, 0L, null, null, 16769022), p65Var, 48, 24960, 241660);
                    z3 = false;
                    p65Var.p(false);
                }
                hp7.t(p65Var, jfc.e(o28Var, 8.0f));
                String strW = ub0Var.f;
                if (strW == null) {
                    strW = km4.w(p65Var, -1776230577, R.string.common_untitled_story, p65Var, z3);
                } else {
                    p65Var.Y(-1776231166);
                    p65Var.p(z3);
                }
                r28 r28VarN2 = bgf.N(w2g.E(o28Var, 40.0f, 0.0f, 2), "post_title");
                boolean zF4 = p65Var.f(i45Var3) | p65Var.f(ub0Var);
                Object objM5 = p65Var.M();
                if (zF4 || objM5 == uobVar) {
                    objM5 = new gd3(i45Var3, 20, ub0Var);
                    p65Var.j0(objM5);
                }
                r28 r28VarR3 = hlg.r(r28VarN2, false, null, null, (m45) objM5, 15);
                mkd mkdVar = ((bu7) p65Var.j(jt7.c)).c;
                long j5 = uu1.d;
                pxf.f(strW, r28VarR3, mkd.a(mkdVar, j5, 0L, null, null, null, 0L, 0L, i3cVar, 0, 0L, null, null, 16769022), 0.0f, p65Var, 0);
                hp7.t(p65Var, jfc.e(o28Var, 40.0f));
                float fG = g49Var.g();
                g49 g49Var3 = g49Var;
                boolean zF5 = p65Var.f(g49Var3);
                Object objM6 = p65Var.M();
                if (zF5 || objM6 == uobVar) {
                    objM6 = new w35(g49Var3, 0);
                    p65Var.j0(objM6);
                }
                x45 x45Var = (x45) objM6;
                r28 r28VarE = w2g.E(o28Var, 40.0f, 0.0f, 2);
                float f = ub0Var.h - 1.0f;
                if (f < 0.0f) {
                    f = 0.0f;
                }
                hp1 hp1Var2 = new hp1(0.0f, f);
                boolean zF6 = p65Var.f(i45Var3) | p65Var.f(g49Var3);
                Object objM7 = p65Var.M();
                if (zF6 || objM7 == uobVar) {
                    objM7 = new gd3(i45Var3, 21, g49Var3);
                    p65Var.j0(objM7);
                }
                m45 m45Var = (m45) objM7;
                ufc ufcVar = ufc.a;
                long j6 = xo7.i;
                long jB = uu1.b(0.15f, j5);
                long j7 = uu1.h;
                if ((980 & 32) != 0) {
                    j6 = j7;
                }
                qfc qfcVarE = ufc.e((fv1) p65Var.j(iv1.a));
                if (j5 != 16) {
                    hp1Var = hp1Var2;
                    j = j5;
                } else {
                    hp1Var = hp1Var2;
                    j = qfcVarE.a;
                }
                long j8 = j5 != 16 ? j5 : qfcVarE.b;
                long j9 = j7 != 16 ? j7 : qfcVarE.c;
                long j10 = jB != 16 ? jB : qfcVarE.d;
                long j11 = j7 != 16 ? j7 : qfcVarE.e;
                if (j6 == 16) {
                    j6 = qfcVarE.f;
                }
                zr7.a(fG, x45Var, r28VarE, false, hp1Var, m45Var, new qfc(j, j8, j9, j10, j11, j6, j7 != 16 ? j7 : qfcVarE.g, j7 != 16 ? j7 : qfcVarE.h, j7 != 16 ? j7 : qfcVarE.i, j7 != 16 ? j7 : qfcVarE.j), p65Var, 384);
                hp7.t(p65Var, jfc.e(o28Var, 24.0f));
                ub0 ub0Var3 = ub0Var;
                vc2.r(ub0Var3, sourceParameter, i3cVar, i45Var3, w2g.E(o28Var, 40.0f, 0.0f, 2), p65Var, 196608);
                hp7.t(p65Var, r28VarC);
                vc2.j(ub0Var3, sourceParameter, i3cVar, i45Var3, w2g.E(o28Var, 40.0f, 0.0f, 2), p65Var, 196608);
                hp7.t(p65Var, jfc.e(o28Var, 20.0f));
                p65Var.p(true);
                return c1eVar;
            case 1:
                ((Integer) obj2).getClass();
                r40.a((ka) obj7, (akc) obj6, (x9) obj5, (y9) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 2:
                ((Integer) obj2).getClass();
                r40.d((vpc) obj7, (bo4) obj6, (x9) obj5, (y9) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 3:
                ((Integer) obj2).getClass();
                t40.b((hu7) obj7, (m45) obj6, (String) obj5, (r28) obj4, (wb) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 4:
                ((Integer) obj2).getClass();
                rx0.i((ue) obj7, (m45) obj6, (m45) obj5, (cs1) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 5:
                ((Integer) obj2).getClass();
                f49.b((String) obj7, (String) obj6, (ab0) obj5, (r28) obj4, (lb0) obj3, (x12) obj, tr7.y(3073));
                return c1eVar;
            case 6:
                r28 r28Var = (r28) obj5;
                ((Integer) obj2).getClass();
                kr0.a(tr7.y(1), (x12) obj, (x45) obj3, (aw7) obj4, r28Var, (BillingPeriod) obj7, (String) obj6);
                return c1eVar;
            case 7:
                ((Integer) obj2).getClass();
                kyd.p((zu0) obj7, (String) obj6, (g08) obj5, (pu0) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 8:
                ((Integer) obj2).getClass();
                y91.d((gc1) obj7, (dc1) obj6, (sh9) obj5, (y81) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 9:
                ((Integer) obj2).getClass();
                y91.h((CatalogDetailReference) obj7, (String) obj6, (z81) obj5, (r28) obj4, (id1) obj3, (x12) obj, tr7.y(385));
                return c1eVar;
            case 10:
                Context context = (Context) obj7;
                sw5 sw5Var2 = (sw5) obj6;
                cfc cfcVar = (cfc) obj5;
                r28 r28Var2 = (r28) obj4;
                c09 c09Var = (c09) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    nx5 nx5Var = new nx5(context);
                    nx5Var.c = sw5Var2 == null ? context.getDrawable(R.drawable.list_preview_placeholder) : sw5Var2;
                    nx5Var.r = dqb.FILL;
                    nx5Var.c(cfcVar);
                    ur7.b(nx5Var.a(), sw5Var2 != null ? sw5Var2.getAlt() : null, r28Var2, c09Var, c09Var, c09Var, null, null, null, sw5Var2 != null ? z46.h : z46.i, p65Var2, 299008, 6, 31168);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 11:
                ((Integer) obj2).getClass();
                sgg.e((fj1) obj7, (bo4) obj6, (si1) obj5, (ye1) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 12:
                ((Integer) obj2).getClass();
                gx1.i((mu1) obj7, (bo4) obj6, (hu1) obj5, (cs1) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 13:
                b55 b55Var = (b55) obj7;
                sr4 sr4Var = (sr4) obj6;
                l78 l78Var3 = (l78) obj5;
                l78 l78Var4 = (l78) obj4;
                l78 l78Var5 = (l78) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    wv1 wv1VarA2 = uv1.a(qb8.c, z46.p, p65Var3, 0);
                    long j12 = p65Var3.T;
                    int i6 = (int) (j12 ^ (j12 >>> 32));
                    i89 i89VarL3 = p65Var3.l();
                    o28 o28Var2 = o28.b;
                    r28 r28VarR4 = gx1.R(p65Var3, o28Var2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var2);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, q12.f, wv1VarA2);
                    tp7.B(p65Var3, q12.e, i89VarL3);
                    tp7.B(p65Var3, q12.g, Integer.valueOf(i6));
                    tp7.y(p65Var3, q12.h);
                    tp7.B(p65Var3, q12.d, r28VarR4);
                    uid uidVar = (uid) l78Var3.getValue();
                    sk6 sk6Var = new sk6(3, Boolean.TRUE, 1, 6, 80);
                    Object objM8 = p65Var3.M();
                    if (objM8 == uobVar) {
                        objM8 = new w8(sr4Var, 2);
                        p65Var3.j0(objM8);
                    }
                    pk6 pk6Var = new pk6(null, (x45) objM8, null, 59);
                    String strR = vo7.R(p65Var3, R.string.add_link_dialog_label_text);
                    Object objM9 = p65Var3.M();
                    if (objM9 == uobVar) {
                        objM9 = new ws(l78Var3, 5);
                        p65Var3.j0(objM9);
                    }
                    d46.m(uidVar, (x45) objM9, null, false, true, null, 1, sk6Var, pk6Var, strR, null, null, null, null, null, null, 0, p65Var3, 12779568, 0, 260188);
                    hp7.t(p65Var3, jfc.e(o28Var2, 16.0f));
                    uid uidVar2 = (uid) l78Var4.getValue();
                    String strR2 = vo7.R(p65Var3, R.string.edit_post_link_input_hint);
                    if (((gt7) l78Var5.getValue()) == gt7.ERROR) {
                        p65Var3.Y(995945044);
                        mx mxVar2 = new mx(vo7.R(p65Var3, R.string.add_link_dialog_invalid_url));
                        p65Var3.p(false);
                        mxVar = mxVar2;
                    } else {
                        p65Var3.Y(996065045);
                        p65Var3.p(false);
                        mxVar = null;
                    }
                    sk6 sk6Var2 = new sk6(0, Boolean.FALSE, 5, 7, 80);
                    boolean zF7 = p65Var3.f(b55Var);
                    Object objM10 = p65Var3.M();
                    if (zF7 || objM10 == uobVar) {
                        iu iuVar = new iu(b55Var, l78Var3, l78Var4, l78Var5, 3);
                        l78Var = l78Var4;
                        l78Var2 = l78Var5;
                        p65Var3.j0(iuVar);
                        objM10 = iuVar;
                    } else {
                        l78Var = l78Var4;
                        l78Var2 = l78Var5;
                    }
                    pk6 pk6Var2 = new pk6((x45) objM10, null, null, 62);
                    gt7 gt7Var = (gt7) l78Var2.getValue();
                    String strR3 = vo7.R(p65Var3, R.string.add_link_dialog_label_link);
                    r28 r28VarF = t40.F(o28Var2, sr4Var);
                    Object objM11 = p65Var3.M();
                    if (objM11 == uobVar) {
                        objM11 = new mf2(l78Var, l78Var2, 0);
                        p65Var3.j0(objM11);
                    }
                    d46.m(uidVar2, (x45) objM11, r28VarF, false, true, gt7Var, 1, sk6Var2, pk6Var2, strR3, mxVar, strR2, null, null, null, null, 0, p65Var3, 12779568, 0, 253976);
                    p65Var3.p(true);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 14:
                ((Integer) obj2).getClass();
                nk7.n((String) obj7, (String) obj6, (bo4) obj5, (uef) obj4, (r28) obj3, (x12) obj, tr7.y(24577));
                return c1eVar;
            case 15:
                ((Integer) obj2).getClass();
                nk7.g((ie3) obj7, (kv6) obj6, (ld3) obj5, (sh9) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 16:
                ((Integer) obj2).getClass();
                vx0.e((String) obj7, (rz2) obj6, (zz) obj5, (r28) obj4, (ju3) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 17:
                ((Integer) obj2).getClass();
                hlg.f((String) obj7, (bo4) obj6, (b64) obj5, (r28) obj4, (f74) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 18:
                ((Integer) obj2).getClass();
                m40.z((pq9) obj7, (rq9) obj6, (String) obj5, (SourceParameter) obj3, (r28) obj4, (x12) obj, tr7.y(24577));
                return c1eVar;
            case 19:
                ((Integer) obj2).getClass();
                n01.u((String) obj7, (String) obj6, (rz2) obj5, (r28) obj4, (uc4) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 20:
                ((Integer) obj2).getClass();
                rx0.g((ov4) obj7, (kv6) obj6, (iv4) obj5, (ye1) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 21:
                ((Integer) obj2).getClass();
                vx0.m((String) obj7, (String) obj6, (rz2) obj5, (r28) obj4, (ax4) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 22:
                ((Integer) obj2).getClass();
                n01.D((String) obj7, (uza) obj6, (nhc) obj5, (r28) obj4, (sza) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 23:
                ((Integer) obj2).getClass();
                nk7.I((uo5) obj7, (kv6) obj6, (bo4) obj5, (no5) obj4, (md3) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 24:
                ((Integer) obj2).getClass();
                qb8.j((wp5) obj7, (kv6) obj6, (jp5) obj5, (md3) obj4, (k8b) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 25:
                ((Integer) obj2).getClass();
                op8.q((vq5) obj7, (nhc) obj6, (bo4) obj5, (rq5) obj4, (r28) obj3, (x12) obj, tr7.y(49));
                return c1eVar;
            case 26:
                ((Integer) obj2).getClass();
                op8.s((String) obj7, (bo4) obj6, (gq5) obj5, (r28) obj4, (ar5) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 27:
                ((Integer) obj2).getClass();
                k40.v((rg1) obj7, (ye1) obj6, (qi1) obj5, (tg1) obj4, (r28) obj3, (x12) obj, tr7.y(4609));
                return c1eVar;
            case 28:
                ((Integer) obj2).getClass();
                rr7.e((q38) obj7, (b55) obj6, (m45) obj5, (m45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            default:
                ((Integer) obj2).getClass();
                nk7.G((String) obj7, (uza) obj6, (nhc) obj5, (r28) obj4, (x88) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
        }
    }

    public /* synthetic */ e45(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
        this.f = obj5;
    }

    public /* synthetic */ e45(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, int i, int i2) {
        this.a = i2;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
        this.f = obj5;
    }
}
