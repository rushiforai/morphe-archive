package defpackage;

import android.content.Context;
import android.content.res.Resources;
import com.medium.android.following.FollowingTab;
import com.medium.reader.R;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class j84 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    public /* synthetic */ j84(String str, String str2, FollowingTab followingTab, ay4 ay4Var, gz8 gz8Var, nhc nhcVar) {
        this.a = 1;
        this.b = str;
        this.d = str2;
        this.e = followingTab;
        this.f = ay4Var;
        this.g = gz8Var;
        this.c = nhcVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        o28 o28Var;
        int i;
        int i2 = this.a;
        uob uobVar = w12.a;
        o28 o28Var2 = o28.b;
        c1e c1eVar = c1e.a;
        boolean z = false;
        Object obj4 = this.g;
        Object obj5 = this.c;
        Object obj6 = this.f;
        Object obj7 = this.b;
        Object obj8 = this.e;
        Object obj9 = this.d;
        final int i3 = 1;
        switch (i2) {
            case 0:
                v4.c((Context) obj9, (Resources) obj8, (String) obj7, (sb2) obj6, (nhc) obj5, (l78) obj4, (xv1) obj, (x12) obj2, ((Integer) obj3).intValue());
                return c1eVar;
            case 1:
                String str = (String) obj7;
                String str2 = (String) obj9;
                FollowingTab followingTab = (FollowingTab) obj8;
                ay4 ay4Var = (ay4) obj6;
                gz8 gz8Var = (gz8) obj4;
                nhc nhcVar = (nhc) obj5;
                hy8 hy8Var = (hy8) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    f49.g(0, p65Var, ay4Var, w2g.B(o28Var2, hy8Var), gz8Var, nhcVar, followingTab, str, str2);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 2:
                String str3 = (String) obj7;
                String str4 = (String) obj9;
                String str5 = (String) obj8;
                m45 m45Var = (m45) obj6;
                String str6 = (String) obj5;
                m45 m45Var2 = (m45) obj4;
                xv1 xv1Var = (xv1) obj;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                xv1Var.getClass();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).f(xv1Var) ? 4 : 2;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    p65Var2.S();
                    return c1eVar;
                }
                o28 o28Var3 = o28.b;
                r28 r28VarG = w2g.G(o28Var3, 40.0f, 0.0f, 40.0f, 0.0f, 10);
                yq0 yq0Var = z46.q;
                r28 r28VarN = bgf.N(xv1.a(yq0Var, r28VarG), "title");
                jgd jgdVar = new jgd(3);
                sn3 sn3Var = jt7.c;
                jjd.b(str3, r28VarN, 0L, 0L, 0L, null, jgdVar, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).i, p65Var2, 0, 0, 130044);
                if (str4 != null) {
                    p65Var2.Y(-1442768748);
                    o28Var = o28Var3;
                    jjd.b(str4, bgf.N(xv1.a(yq0Var, w2g.G(o28Var3, 40.0f, 8.0f, 40.0f, 0.0f, 8)), "description"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).m, p65Var2, 0, 0, 130044);
                } else {
                    o28Var = o28Var3;
                    p65Var2.Y(-1451484615);
                }
                p65Var2.p(false);
                boolean z2 = (str5 == null || m45Var == null) ? false : true;
                boolean z3 = (str6 == null || m45Var2 == null) ? false : true;
                if (z2 || z3) {
                    km4.F(21.0f, -1442174075, p65Var2, p65Var2, o28Var);
                } else {
                    p65Var2.Y(-1451484615);
                }
                p65Var2.p(false);
                if (z2) {
                    p65Var2.Y(-1442070566);
                    if (str5 == null) {
                        ay0.e("Primary action button should not be shown without providing a text");
                    } else if (m45Var != null) {
                        fo7.i(m45Var, str5, xn7.L, bgf.N(xv1.a(yq0Var, jfc.d(jfc.q(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 0.0f, 246.0f, 1), 1.0f)), "primary_action"), false, p65Var2, 384, 16);
                    } else {
                        ay0.e("Primary action button should not be shown without providing a callback");
                    }
                    return null;
                }
                p65Var2.Y(-1451484615);
                p65Var2.p(false);
                if (z2 && z3) {
                    km4.F(6.0f, -1441339493, p65Var2, p65Var2, o28Var);
                } else {
                    p65Var2.Y(-1451484615);
                }
                p65Var2.p(false);
                if (z3) {
                    p65Var2.Y(-1441223894);
                    if (str6 == null) {
                        ay0.e("Secondary action button should not be shown without providing a text");
                    } else if (m45Var2 != null) {
                        fo7.j(m45Var2, str6, xn7.L, bgf.N(xv1.a(yq0Var, jfc.d(jfc.q(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 0.0f, 246.0f, 1), 1.0f)), "secondary_action"), false, null, p65Var2, 384, 48);
                        p65Var2.p(false);
                        i = -1451484615;
                    } else {
                        ay0.e("Secondary action button should not be shown without providing a callback");
                    }
                    return null;
                }
                i = -1451484615;
                p65Var2.Y(-1451484615);
                p65Var2.p(false);
                if (z2 || z3) {
                    km4.F(21.0f, -1440477414, p65Var2, p65Var2, o28Var);
                } else {
                    p65Var2.Y(i);
                }
                p65Var2.p(false);
                return c1eVar;
            case 3:
                String str7 = (String) obj7;
                final nba nbaVar = (nba) obj9;
                List list = (List) obj8;
                List<nma> list2 = (List) obj6;
                List<nma> list3 = (List) obj5;
                final l78 l78Var = (l78) obj4;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 17) != 16)) {
                    bq7 bq7Var = new bq7(vo7.R(p65Var3, R.string.publication_archive_all_topics), str7 == null, null, null, 28);
                    boolean zF = p65Var3.f(nbaVar);
                    Object objM = p65Var3.M();
                    Object obj10 = objM;
                    if (zF || objM == uobVar) {
                        jba jbaVar = new jba(nbaVar, l78Var, 1);
                        p65Var3.j0(jbaVar);
                        obj10 = jbaVar;
                    }
                    aq7.b(bq7Var, (m45) obj10, bgf.N(o28Var2, "publication_archive_tags_filter_all"), 0L, 0L, p65Var3, 0, 24);
                    if (list.isEmpty()) {
                        p65Var3.Y(-1801018116);
                    } else {
                        p65Var3.Y(-1776923924);
                        tp7.c(0.0f, 0, 7, 0L, p65Var3, null);
                    }
                    p65Var3.p(false);
                    p65Var3.Y(635419332);
                    for (final nma nmaVar : list2) {
                        boolean zF2 = p65Var3.f(nbaVar) | p65Var3.f(nmaVar);
                        Object objM2 = p65Var3.M();
                        if (zF2 || objM2 == uobVar) {
                            final boolean z4 = z ? 1 : 0;
                            objM2 = new m45() { // from class: kba
                                @Override // defpackage.m45
                                public final Object invoke() {
                                    int i4 = z4;
                                    c1e c1eVar2 = c1e.a;
                                    l78 l78Var2 = l78Var;
                                    nma nmaVar2 = nmaVar;
                                    nba nbaVar2 = nbaVar;
                                    switch (i4) {
                                        case 0:
                                            l78Var2.setValue(Boolean.FALSE);
                                            nbaVar2.b(nmaVar2.a);
                                            break;
                                        default:
                                            l78Var2.setValue(Boolean.FALSE);
                                            nbaVar2.b(nmaVar2.a);
                                            break;
                                    }
                                    return c1eVar2;
                                }
                            };
                            p65Var3.j0(objM2);
                        }
                        pba.h(nmaVar, str7, (m45) objM2, p65Var3, 0);
                    }
                    p65Var3.p(false);
                    if (list2.isEmpty() || list3.isEmpty()) {
                        p65Var3.Y(-1801018116);
                    } else {
                        p65Var3.Y(-1776420980);
                        tp7.c(0.0f, 0, 7, 0L, p65Var3, null);
                    }
                    p65Var3.p(false);
                    for (final nma nmaVar2 : list3) {
                        boolean zF3 = p65Var3.f(nbaVar) | p65Var3.f(nmaVar2);
                        Object objM3 = p65Var3.M();
                        if (zF3 || objM3 == uobVar) {
                            objM3 = new m45() { // from class: kba
                                @Override // defpackage.m45
                                public final Object invoke() {
                                    int i4 = i3;
                                    c1e c1eVar2 = c1e.a;
                                    l78 l78Var2 = l78Var;
                                    nma nmaVar22 = nmaVar2;
                                    nba nbaVar2 = nbaVar;
                                    switch (i4) {
                                        case 0:
                                            l78Var2.setValue(Boolean.FALSE);
                                            nbaVar2.b(nmaVar22.a);
                                            break;
                                        default:
                                            l78Var2.setValue(Boolean.FALSE);
                                            nbaVar2.b(nmaVar22.a);
                                            break;
                                    }
                                    return c1eVar2;
                                }
                            };
                            p65Var3.j0(objM3);
                        }
                        pba.h(nmaVar2, str7, (m45) objM3, p65Var3, 0);
                    }
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            default:
                ina inaVar = (ina) obj9;
                nla nlaVar = (nla) obj8;
                pkf pkfVar = (pkf) obj7;
                my6 my6Var = (my6) obj6;
                zm7 zm7Var = (zm7) obj5;
                l78 l78Var2 = (l78) obj4;
                hy8 hy8Var2 = (hy8) obj;
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                hy8Var2.getClass();
                if ((iIntValue4 & 6) == 0) {
                    iIntValue4 |= ((p65) x12Var4).f(hy8Var2) ? 4 : 2;
                }
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 19) != 18)) {
                    r28 r28VarB = w2g.B(o28Var2, hy8Var2);
                    if (inaVar instanceof gna) {
                        p65Var4.Y(795150433);
                        pla.c(r28VarB, p65Var4, 0);
                        p65Var4.p(false);
                    } else if (inaVar instanceof fna) {
                        p65Var4.Y(795154758);
                        pla.b((fna) inaVar, r28VarB, p65Var4, 0);
                        p65Var4.p(false);
                    } else {
                        if (!(inaVar instanceof hna)) {
                            throw ho2.L(p65Var4, 795148826, false);
                        }
                        p65Var4.Y(795160813);
                        hna hnaVar = (hna) inaVar;
                        Object objM4 = p65Var4.M();
                        if (objM4 == uobVar) {
                            objM4 = new ws(l78Var2, 21);
                            p65Var4.j0(objM4);
                        }
                        pla.a(hnaVar, (x45) objM4, nlaVar, pkfVar, my6Var, zm7Var, r28VarB, p65Var4, 48);
                        p65Var4.p(false);
                    }
                } else {
                    p65Var4.S();
                }
                return c1eVar;
        }
    }

    public /* synthetic */ j84(String str, Object obj, Object obj2, Object obj3, Object obj4, Object obj5, int i) {
        this.a = i;
        this.b = str;
        this.d = obj;
        this.e = obj2;
        this.f = obj3;
        this.c = obj4;
        this.g = obj5;
    }

    public /* synthetic */ j84(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, l78 l78Var, int i) {
        this.a = i;
        this.d = obj;
        this.e = obj2;
        this.b = obj3;
        this.f = obj4;
        this.c = obj5;
        this.g = l78Var;
    }
}
