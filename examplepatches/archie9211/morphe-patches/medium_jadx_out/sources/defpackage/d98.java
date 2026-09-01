package defpackage;

import com.medium.android.common.post.iframe.ParagraphEditIframeLayout;
import com.medium.android.core.navigation.NotificationFilterType;
import com.medium.android.core.navigation.PublicationStatsReference;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.graphql.fragment.IframeData;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class d98 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ d98(dr9 dr9Var, stc stcVar, y9 y9Var, r28 r28Var, hy8 hy8Var) {
        this.a = 29;
        this.c = dr9Var;
        this.d = stcVar;
        this.e = y9Var;
        this.b = r28Var;
        this.f = hy8Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        boolean z;
        Object next;
        int i = this.a;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.f;
        Object obj4 = this.b;
        Object obj5 = this.e;
        Object obj6 = this.d;
        Object obj7 = this.c;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                op8.g((tce) obj7, (kv6) obj6, (b98) obj5, (ye1) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 1:
                ((Integer) obj2).getClass();
                gsa.x((String) obj7, (String) obj6, (ek8) obj5, (r28) obj4, (tk8) obj3, (x12) obj, tr7.y(1));
                break;
            case 2:
                ((Integer) obj2).getClass();
                xk8.d((String) obj7, (ek8) obj6, (r28) obj4, (NotificationFilterType) obj5, (nl8) obj3, (x12) obj, tr7.y(1));
                break;
            case 3:
                ParagraphEditIframeLayout paragraphEditIframeLayout = (ParagraphEditIframeLayout) obj7;
                String str = (String) obj6;
                String str2 = (String) obj5;
                IframeData iframeData = (IframeData) obj3;
                upc upcVar = (upc) obj4;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                int i2 = ParagraphEditIframeLayout.n;
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    Object objM = p65Var.M();
                    if (objM == uobVar) {
                        objM = new p09(paragraphEditIframeLayout);
                        p65Var.j0(objM);
                    }
                    p09 p09Var = (p09) objM;
                    zk7 zk7VarC = dy0.c(z46.d, false);
                    long j = p65Var.T;
                    int i3 = (int) (j ^ (j >>> 32));
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
                    tp7.B(p65Var, q12.g, Integer.valueOf(i3));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    ((i03) paragraphEditIframeLayout.getMediumUris()).getClass();
                    o7f.e(new yv5(str, i03.b, str2, kyd.E(iframeData), true, ((Boolean) upcVar.getValue()).booleanValue()), p09Var, null, p65Var, 48);
                    if (((Boolean) upcVar.getValue()).booleanValue()) {
                        p65Var.Y(-636711513);
                        c09 c09VarJ = vn7.J(R.drawable.ic_close_16, 0, p65Var);
                        String strR = vo7.R(p65Var, R.string.common_close);
                        long j2 = uu1.d;
                        r28 r28VarC = w2g.C(flb.a0(iy0.a.a(o28Var, z46.f), ((zo7) p65Var.j(kt7.b)).e, rv8.r), 6.0f);
                        boolean zH = p65Var.h(paragraphEditIframeLayout);
                        Object objM2 = p65Var.M();
                        if (zH || objM2 == uobVar) {
                            objM2 = new m09(paragraphEditIframeLayout, 0);
                            p65Var.j0(objM2);
                        }
                        qv5.b(c09VarJ, strR, hlg.r(r28VarC, false, null, null, (m45) objM2, 15), j2, p65Var, 3080, 0);
                        z = false;
                    } else {
                        z = false;
                        p65Var.Y(-646075404);
                    }
                    p65Var.p(z);
                    p65Var.p(true);
                }
                break;
            case 4:
                q29 q29Var = (q29) obj7;
                az5 az5Var = (az5) obj6;
                ArrayList arrayList = (ArrayList) obj5;
                l09 l09Var = (l09) obj3;
                String str3 = (String) obj4;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    boolean zF = p65Var2.f(q29Var.c) | p65Var2.f(az5Var);
                    Object objM3 = p65Var2.M();
                    if (zF || objM3 == uobVar) {
                        objM3 = new p29(q29Var, arrayList);
                        p65Var2.j0(objM3);
                    }
                    jt7.a(false, pxf.E(1260848594, new d98(l09Var, az5Var, q29Var, (p29) objM3, str3, 5), p65Var2), p65Var2, 48, 1);
                }
                break;
            case 5:
                l09 l09Var2 = (l09) obj7;
                az5 az5Var2 = (az5) obj6;
                q29 q29Var2 = (q29) obj5;
                p29 p29Var = (p29) obj3;
                String str4 = (String) obj4;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    String text = l09Var2.b().getText();
                    if (text == null) {
                        text = "";
                    }
                    String str5 = text;
                    Iterator<E> it2 = y5d.getEntries().iterator();
                    while (true) {
                        if (it2.hasNext()) {
                            next = it2.next();
                            if (g76.L(((y5d) next).getLanguageName(), str4)) {
                            }
                        } else {
                            next = null;
                        }
                    }
                    y5d y5dVar = (y5d) next;
                    if (y5dVar == null) {
                        y5dVar = y5d.AUTO_DETECT;
                    }
                    ek7.v(new e6d(str5, az5Var2, false, y5dVar, false, q29Var2.d, q29Var2.e, 16), p29Var, null, p65Var3, 0);
                }
                break;
            case 6:
                r28 r28Var = (r28) obj4;
                l78 l78Var = (l78) obj7;
                mz1 mz1Var = (mz1) obj6;
                uo0 uo0Var = (uo0) obj5;
                m45 m45Var = (m45) obj3;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    Object objM4 = p65Var4.M();
                    if (objM4 == uobVar) {
                        objM4 = new ws(l78Var, 18);
                        p65Var4.j0(objM4);
                    }
                    r28 r28VarV = pwd.V(r28Var, (x45) objM4);
                    zk7 zk7VarC2 = dy0.c(z46.d, true);
                    long j3 = p65Var4.T;
                    int i4 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL2 = p65Var4.l();
                    r28 r28VarR2 = gx1.R(p65Var4, r28VarV);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var2);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, q12.f, zk7VarC2);
                    tp7.B(p65Var4, q12.e, i89VarL2);
                    tp7.B(p65Var4, q12.g, Integer.valueOf(i4));
                    tp7.y(p65Var4, q12.h);
                    tp7.B(p65Var4, q12.d, r28VarR2);
                    mz1Var.invoke(p65Var4, 0);
                    uo0Var.b(m45Var, p65Var4, 6);
                    p65Var4.p(true);
                }
                break;
            case 7:
                ((Integer) obj2).getClass();
                qo7.h((String) obj7, (String) obj6, (ap9) obj5, (r28) obj4, (wp9) obj3, (x12) obj, tr7.y(1));
                break;
            case 8:
                ((Integer) obj2).getClass();
                qo7.c((op9) obj7, (yrb) obj6, (fp9) obj5, (gp9) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 9:
                ((Integer) obj2).getClass();
                rx0.E((jx9) obj7, (bo4) obj6, (ex9) obj5, (md3) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 10:
                ((Integer) obj2).getClass();
                ht2.J((PublicationStatsReference) obj7, (String) obj6, (my6) obj5, (r28) obj4, (w9a) obj3, (x12) obj, tr7.y(1));
                break;
            case 11:
                ((Integer) obj2).getClass();
                vo7.j((String) obj7, (String) obj6, (pkf) obj5, (r28) obj4, (vaa) obj3, (x12) obj, tr7.y(1));
                break;
            case 12:
                ((Integer) obj2).getClass();
                vv2.p((String) obj7, (String) obj6, (my6) obj5, (r28) obj4, (dda) obj3, (x12) obj, tr7.y(1));
                break;
            case 13:
                ((Integer) obj2).getClass();
                xz5.u((uga) obj7, (wda) obj6, (x45) obj5, (x45) obj3, (x45) obj4, (x12) obj, tr7.y(1));
                break;
            case 14:
                tj9 tj9Var = (tj9) obj7;
                x45 x45Var = (x45) obj6;
                x45 x45Var2 = (x45) obj5;
                m45 m45Var2 = (m45) obj3;
                m45 m45Var3 = (m45) obj4;
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    p65Var5.S();
                } else {
                    wgd.w(-1003410150, 212064437, p65Var5, false);
                    m73 m73Var = (m73) p65Var5.j(z22.h);
                    Object objM5 = p65Var5.M();
                    if (objM5 == uobVar) {
                        objM5 = b09.t(m73Var, p65Var5);
                    }
                    hl7 hl7Var = (hl7) objM5;
                    Object objM6 = p65Var5.M();
                    if (objM6 == uobVar) {
                        objM6 = b09.r(p65Var5);
                    }
                    z52 z52Var = (z52) objM6;
                    Object objM7 = p65Var5.M();
                    if (objM7 == uobVar) {
                        objM7 = qo7.u(Boolean.FALSE);
                        p65Var5.j0(objM7);
                    }
                    l78 l78Var2 = (l78) objM7;
                    Object objM8 = p65Var5.M();
                    if (objM8 == uobVar) {
                        objM8 = b09.s(z52Var, p65Var5);
                    }
                    m62 m62Var = (m62) objM8;
                    Object objM9 = p65Var5.M();
                    if (objM9 == uobVar) {
                        objM9 = b09.v(c1eVar, y3b.h, p65Var5);
                    }
                    l78 l78Var3 = (l78) objM9;
                    boolean zH2 = p65Var5.h(hl7Var) | p65Var5.d(257);
                    Object objM10 = p65Var5.M();
                    if (zH2 || objM10 == uobVar) {
                        fr0 fr0Var = new fr0(l78Var3, hl7Var, m62Var, l78Var2, 24);
                        p65Var5.j0(fr0Var);
                        objM10 = fr0Var;
                    }
                    zk7 zk7Var = (zk7) objM10;
                    Object objM11 = p65Var5.M();
                    if (objM11 == uobVar) {
                        objM11 = new gr0(l78Var2, m62Var, 24);
                        p65Var5.j0(objM11);
                    }
                    m45 m45Var4 = (m45) objM11;
                    boolean zH3 = p65Var5.h(hl7Var);
                    Object objM12 = p65Var5.M();
                    if (zH3 || objM12 == uobVar) {
                        objM12 = new hr0(hl7Var, 24);
                        p65Var5.j0(objM12);
                    }
                    hlg.j(new l60((x45) objM12, false), pxf.E(1200550679, new zs7(l78Var3, z52Var, m45Var4, tj9Var, x45Var, x45Var2, m45Var2, m45Var3, 2), p65Var5), zk7Var, p65Var5, 48);
                    p65Var5.p(false);
                }
                break;
            case 15:
                ((Integer) obj2).getClass();
                f76.t((String) obj7, (String) obj6, (hha) obj5, (r28) obj4, (zha) obj3, (x12) obj, tr7.y(1));
                break;
            case 16:
                ((Integer) obj2).getClass();
                g76.y((String) obj7, (String) obj6, (my6) obj5, (r28) obj4, (rja) obj3, (x12) obj, tr7.y(1));
                break;
            case 17:
                ((Integer) obj2).getClass();
                g76.t((ija) obj7, (ip7) obj6, (qia) obj5, (md3) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 18:
                ((Integer) obj2).getClass();
                lk7.k((String) obj7, (String) obj6, (zm7) obj5, (r28) obj4, (pka) obj3, (x12) obj, tr7.y(1));
                break;
            case 19:
                ((Integer) obj2).getClass();
                lk7.g((gka) obj7, (xja) obj6, (my6) obj5, (sh9) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 20:
                ((Integer) obj2).getClass();
                nk7.O((String) obj7, (String) obj6, (my6) obj5, (r28) obj4, (eoa) obj3, (x12) obj, tr7.y(1));
                break;
            case 21:
                ((Integer) obj2).getClass();
                op8.x((eua) obj7, (kv6) obj6, (sh9) obj5, (vta) obj3, (r28) obj4, (x12) obj, tr7.y(24577));
                break;
            case 22:
                ((Integer) obj2).getClass();
                op8.D((iua) obj7, (kv6) obj6, (sh9) obj5, (vta) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 23:
                ((Integer) obj2).getClass();
                gsa.F((String) obj7, (String) obj6, (jab) obj5, (r28) obj4, (jbb) obj3, (x12) obj, tr7.y(1));
                break;
            case 24:
                ((Integer) obj2).getClass();
                pgb.d((zhb) obj7, (lgb) obj5, (ngb) obj3, (kv6) obj6, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 25:
                ((Integer) obj2).getClass();
                pgb.g((String) obj7, (ResponsesReference) obj6, (xfb) obj5, (r28) obj4, (nib) obj3, (x12) obj, tr7.y(1));
                break;
            case 26:
                ((Integer) obj2).getClass();
                dm2.p((vpc) obj7, (bo4) obj6, (vpc) obj5, (d2c) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 27:
                ((Integer) obj2).getClass();
                yi2.E((String) obj7, (String) obj6, (eoc) obj5, (r28) obj4, (uoc) obj3, (x12) obj, tr7.y(1));
                break;
            case 28:
                ((Integer) obj2).getClass();
                ok7.q((String) obj7, (String) obj6, (hsc) obj5, (r28) obj4, (zsc) obj3, (x12) obj, tr7.y(3073));
                break;
            default:
                dr9 dr9Var = (dr9) obj7;
                stc stcVar = (stc) obj6;
                y9 y9Var = (y9) obj5;
                r28 r28Var2 = (r28) obj4;
                hy8 hy8Var = (hy8) obj3;
                x12 x12Var6 = (x12) obj;
                int iIntValue6 = ((Integer) obj2).intValue();
                p65 p65Var6 = (p65) x12Var6;
                if (!p65Var6.P(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    p65Var6.S();
                } else {
                    il7.k(dr9Var, stcVar, y9Var, r28Var2, hy8Var, p65Var6, 0, 0);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ d98(r28 r28Var, l78 l78Var, mz1 mz1Var, uo0 uo0Var, m45 m45Var) {
        this.a = 6;
        this.b = r28Var;
        this.c = l78Var;
        this.d = mz1Var;
        this.e = uo0Var;
        this.f = m45Var;
    }

    public /* synthetic */ d98(zhb zhbVar, lgb lgbVar, ngb ngbVar, kv6 kv6Var, r28 r28Var, int i) {
        this.a = 24;
        this.c = zhbVar;
        this.e = lgbVar;
        this.f = ngbVar;
        this.d = kv6Var;
        this.b = r28Var;
    }

    public /* synthetic */ d98(Object obj, Object obj2, Object obj3, r28 r28Var, que queVar, int i, int i2) {
        this.a = i2;
        this.c = obj;
        this.d = obj2;
        this.e = obj3;
        this.b = r28Var;
        this.f = queVar;
    }

    public /* synthetic */ d98(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, int i) {
        this.a = i;
        this.c = obj;
        this.d = obj2;
        this.e = obj3;
        this.f = obj4;
        this.b = obj5;
    }

    public /* synthetic */ d98(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, int i, int i2) {
        this.a = i2;
        this.c = obj;
        this.d = obj2;
        this.e = obj3;
        this.f = obj4;
        this.b = obj5;
    }

    public /* synthetic */ d98(String str, ek8 ek8Var, r28 r28Var, NotificationFilterType notificationFilterType, nl8 nl8Var, int i) {
        this.a = 2;
        this.c = str;
        this.d = ek8Var;
        this.b = r28Var;
        this.e = notificationFilterType;
        this.f = nl8Var;
    }
}
