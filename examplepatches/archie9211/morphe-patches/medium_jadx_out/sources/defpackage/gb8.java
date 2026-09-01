package defpackage;

import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.reader.R;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class gb8 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    public /* synthetic */ gb8(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
        this.f = obj5;
        this.g = obj6;
        this.h = obj7;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        float f;
        xu6 xu6Var;
        obe obeVar;
        cs1 cs1Var;
        ip7 ip7Var;
        boolean z;
        lbd lbdVar;
        final String str;
        vcd vcdVar;
        List list;
        sh9 sh9Var;
        final int i;
        obe obeVar2;
        cs1 cs1Var2;
        ip7 ip7Var2;
        lbd lbdVar2;
        String str2;
        vcd vcdVar2;
        List list2;
        xu6 xu6Var2;
        sh9 sh9Var2;
        ip7 ip7Var3;
        boolean z2;
        int i2 = this.a;
        Object obj2 = this.h;
        Object obj3 = this.g;
        Object obj4 = this.f;
        Object obj5 = this.e;
        Object obj6 = this.d;
        Object obj7 = this.c;
        Object obj8 = this.b;
        switch (i2) {
            case 0:
                s68 s68Var = (s68) obj8;
                d12 d12Var = (d12) obj7;
                x45 x45Var = (x45) obj6;
                x45 x45Var2 = (x45) obj5;
                x45 x45Var3 = (x45) obj4;
                l78 l78Var = (l78) obj2;
                ov ovVar = (ov) obj;
                if (!((List) ((upc) obj3).getValue()).contains(ovVar.a())) {
                    return ht2.G0(zz3.b, k54.b);
                }
                String str3 = ((ba8) ovVar.a()).f;
                int iB = s68Var.b(str3);
                if (iB >= 0) {
                    f = s68Var.c[iB];
                } else {
                    s68Var.d(0.0f, str3);
                    f = 0.0f;
                }
                if (!((ba8) ovVar.c()).f.equals(((ba8) ovVar.a()).f)) {
                    f = (((Boolean) d12Var.c.getValue()).booleanValue() || ((Boolean) l78Var.getValue()).booleanValue()) ? f - 1.0f : f + 1.0f;
                }
                s68Var.d(f, ((ba8) ovVar.c()).f);
                return new x82((zz3) x45Var.invoke(ovVar), (k54) x45Var2.invoke(ovVar), f, (mfc) x45Var3.invoke(ovVar));
            default:
                final ycd ycdVar = (ycd) obj8;
                ip7 ip7Var4 = (ip7) obj7;
                final d9d d9dVar = (d9d) obj6;
                final lbd lbdVar3 = (lbd) obj5;
                cs1 cs1Var3 = (cs1) obj4;
                sh9 sh9Var3 = (sh9) obj3;
                obe obeVar3 = (obe) obj2;
                xu6 xu6Var3 = (xu6) obj;
                xu6Var3.getClass();
                final int i3 = 0;
                final int i4 = 1;
                ev6.j(xu6Var3, "related_tags", new mz1(new c55() { // from class: zad
                    @Override // defpackage.c55
                    public final Object f(Object obj9, Object obj10, Object obj11) {
                        int i5 = i3;
                        c1e c1eVar = c1e.a;
                        lbd lbdVar4 = lbdVar3;
                        ycd ycdVar2 = ycdVar;
                        xr6 xr6Var = (xr6) obj9;
                        x12 x12Var = (x12) obj10;
                        int iIntValue = ((Integer) obj11).intValue();
                        switch (i5) {
                            case 0:
                                xr6Var.getClass();
                                p65 p65Var = (p65) x12Var;
                                if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                                    p65Var.S();
                                } else {
                                    guc.f(ycdVar2.a, lbdVar4, p65Var, 0);
                                }
                                break;
                            default:
                                xr6Var.getClass();
                                p65 p65Var2 = (p65) x12Var;
                                if (!p65Var2.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                                    p65Var2.S();
                                } else {
                                    guc.h(ycdVar2.b, lbdVar4, p65Var2, 0);
                                }
                                break;
                        }
                        return c1eVar;
                    }
                }, true, -1242100643), 2);
                ev6.j(xu6Var3, "tag_detail", new mz1(new c55() { // from class: zad
                    @Override // defpackage.c55
                    public final Object f(Object obj9, Object obj10, Object obj11) {
                        int i5 = i4;
                        c1e c1eVar = c1e.a;
                        lbd lbdVar4 = lbdVar3;
                        ycd ycdVar2 = ycdVar;
                        xr6 xr6Var = (xr6) obj9;
                        x12 x12Var = (x12) obj10;
                        int iIntValue = ((Integer) obj11).intValue();
                        switch (i5) {
                            case 0:
                                xr6Var.getClass();
                                p65 p65Var = (p65) x12Var;
                                if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                                    p65Var.S();
                                } else {
                                    guc.f(ycdVar2.a, lbdVar4, p65Var, 0);
                                }
                                break;
                            default:
                                xr6Var.getClass();
                                p65 p65Var2 = (p65) x12Var;
                                if (!p65Var2.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                                    p65Var2.S();
                                } else {
                                    guc.h(ycdVar2.b, lbdVar4, p65Var2, 0);
                                }
                                break;
                        }
                        return c1eVar;
                    }
                }, true, -1617761594), 2);
                xcd xcdVar = ycdVar.c;
                if (xcdVar instanceof wcd) {
                    wcd wcdVar = (wcd) xcdVar;
                    final String str4 = wcdVar.f;
                    String str5 = wcdVar.e;
                    vcd vcdVar3 = wcdVar.a;
                    List list3 = vcdVar3.a;
                    boolean zIsEmpty = list3.isEmpty();
                    o28 o28Var = o28.b;
                    if (zIsEmpty) {
                        xu6Var = xu6Var3;
                        obeVar = obeVar3;
                        cs1Var = cs1Var3;
                        ip7Var = ip7Var4;
                        lbdVar = lbdVar3;
                        str = str5;
                        sh9Var = sh9Var3;
                        i = 0;
                    } else {
                        guc.X(xu6Var3, "recommended_stories_title", R.string.recommended_stories_title, ip7Var4);
                        boolean z3 = ip7Var4 == ip7.COMPACT;
                        if (z3) {
                            List list4 = list3;
                            int i5 = 0;
                            for (Object obj9 : bu1.g1(list3, 5)) {
                                int i6 = i5 + 1;
                                if (i5 < 0) {
                                    d46.i0();
                                    throw null;
                                }
                                dr9 dr9Var = (dr9) obj9;
                                boolean z4 = z3;
                                if (i5 <= 1) {
                                    lbdVar2 = lbdVar3;
                                    vcd vcdVar4 = vcdVar3;
                                    sh9Var2 = sh9Var3;
                                    cs1Var2 = cs1Var3;
                                    ip7Var2 = ip7Var4;
                                    list2 = list4;
                                    obeVar2 = obeVar3;
                                    vcdVar2 = vcdVar4;
                                    str2 = str5;
                                    xu6Var3.k0("grid_post_item_".concat(dr9Var.a), "grid_post_item", new mz1(new vla(o28Var, dr9Var, sh9Var2, i5, 3), true, 1385943391));
                                    xu6Var2 = xu6Var3;
                                } else {
                                    obeVar2 = obeVar3;
                                    cs1Var2 = cs1Var3;
                                    ip7Var2 = ip7Var4;
                                    lbdVar2 = lbdVar3;
                                    str2 = str5;
                                    sh9 sh9Var4 = sh9Var3;
                                    vcdVar2 = vcdVar3;
                                    list2 = list4;
                                    xu6Var2 = xu6Var3;
                                    guc.V(xu6Var2, dr9Var, sh9Var4, stc.M, i5, KLTXZbnQvj.XkxWPkkFITG);
                                    sh9Var2 = sh9Var4;
                                }
                                list4 = list2;
                                str5 = str2;
                                xu6Var3 = xu6Var2;
                                sh9Var3 = sh9Var2;
                                z3 = z4;
                                i5 = i6;
                                lbdVar3 = lbdVar2;
                                cs1Var3 = cs1Var2;
                                ip7Var4 = ip7Var2;
                                vcdVar3 = vcdVar2;
                                obeVar3 = obeVar2;
                            }
                            xu6Var = xu6Var3;
                            obeVar = obeVar3;
                            cs1Var = cs1Var3;
                            ip7Var = ip7Var4;
                            z = z3;
                            lbdVar = lbdVar3;
                            str = str5;
                            vcdVar = vcdVar3;
                            list = list4;
                            sh9Var = sh9Var3;
                        } else {
                            xu6Var = xu6Var3;
                            obeVar = obeVar3;
                            cs1Var = cs1Var3;
                            ip7Var = ip7Var4;
                            z = z3;
                            lbdVar = lbdVar3;
                            str = str5;
                            vcdVar = vcdVar3;
                            list = list3;
                            sh9Var = sh9Var3;
                            int i7 = 0;
                            for (Iterator it2 = bu1.r1(list, 2, 2).iterator(); it2.hasNext(); it2 = it2) {
                                Object next = it2.next();
                                int i8 = i7 + 1;
                                if (i7 < 0) {
                                    d46.i0();
                                    throw null;
                                }
                                List list5 = (List) next;
                                xu6Var.k0("section_recommended_stories_row_".concat(bu1.F0(list5, null, null, null, pbd.b, 31)), "section_recommended_stories_row", new mz1(new wla(list5, i7, sh9Var, 4), true, -1223998702));
                                i7 = i8;
                            }
                        }
                        if (vcdVar.b || (z && list.size() > 5)) {
                            i = 0;
                            vla vlaVar = new vla(R.string.recommended_stories_see_more, 2, o28Var, "recommended_stories_see_more", new m45() { // from class: abd
                                @Override // defpackage.m45
                                public final Object invoke() {
                                    int i9 = i;
                                    c1e c1eVar = c1e.a;
                                    String str6 = str4;
                                    String str7 = str;
                                    d9d d9dVar2 = d9dVar;
                                    switch (i9) {
                                        case 0:
                                            d9dVar2.d(str7, str6);
                                            break;
                                        default:
                                            d9dVar2.c(str7, str6);
                                            break;
                                    }
                                    return c1eVar;
                                }
                            });
                            o28Var = o28Var;
                            xu6Var.k0("recommended_stories_see_more", "see_more_button", new mz1(vlaVar, true, 316165265));
                        } else {
                            i = 0;
                        }
                        xu6Var.k0("recommended_stories_divider", "large_divider", t02.c);
                    }
                    ucd ucdVar = wcdVar.c;
                    if (ucdVar != null) {
                        ip7Var3 = ip7Var;
                        xu6Var.k0("curated_list_title", "section_title", new mz1(new ov2(w2g.G(o28Var, 0.0f, 0.0f, 0.0f, 2.0f, 7), new h9b(22, ucdVar), ip7Var3, "curated_list_title"), true, 777652053));
                        ev6.j(xu6Var, "curated_list_author", new mz1(new ebd(ucdVar, d9dVar), true, -1681222467), 2);
                        ev6.j(xu6Var, "curated_list_posts", new mz1(new dyc(ucdVar, 4, sh9Var), true, -198393178), 2);
                        xu6Var.k0("curated_list_see_full_list", "see_more_button", new mz1(new ebd(d9dVar, ucdVar), true, -591392123));
                        xu6Var.k0("curated_list_divider", "large_divider", t02.d);
                    } else {
                        ip7Var3 = ip7Var;
                    }
                    vcd vcdVar5 = wcdVar.d;
                    if (!vcdVar5.a.isEmpty()) {
                        guc.X(xu6Var, "who_to_follow_title", R.string.who_to_follow_title, ip7Var3);
                        final int i9 = 1;
                        ev6.j(xu6Var, "who_to_follow_items", new mz1(new gab(vcdVar5, cs1Var, obeVar, 8), true, 1387148260), 2);
                        o28 o28Var2 = o28Var;
                        o28Var = o28Var2;
                        xu6Var.k0("who_to_follow_lists_see_more", "see_more_button", new mz1(new vla(R.string.common_see_more, 2, o28Var2, "who_to_follow_lists_see_more", new m45() { // from class: abd
                            @Override // defpackage.m45
                            public final Object invoke() {
                                int i92 = i9;
                                c1e c1eVar = c1e.a;
                                String str6 = str4;
                                String str7 = str;
                                d9d d9dVar2 = d9dVar;
                                switch (i92) {
                                    case 0:
                                        d9dVar2.d(str7, str6);
                                        break;
                                    default:
                                        d9dVar2.c(str7, str6);
                                        break;
                                }
                                return c1eVar;
                            }
                        }), true, 316165265));
                        xu6Var.k0("who_to_follow_lists_divider", "large_divider", t02.e);
                    }
                    vcd vcdVar6 = wcdVar.b;
                    List list6 = vcdVar6.a;
                    boolean z5 = vcdVar6.c;
                    if (!list6.isEmpty()) {
                        guc.X(xu6Var, "latest_stories_title", R.string.latest_stories_title, ip7Var3);
                        stc stcVar = ip7Var3 == ip7.COMPACT ? stc.M : stc.L;
                        int i10 = i;
                        for (Object obj10 : list6) {
                            int i11 = i10 + 1;
                            if (i10 < 0) {
                                d46.i0();
                                throw null;
                            }
                            sh9 sh9Var5 = sh9Var;
                            guc.V(xu6Var, (dr9) obj10, sh9Var5, stcVar, i10, "latest_stories");
                            i10 = i11;
                            sh9Var = sh9Var5;
                        }
                        xu6 xu6Var4 = xu6Var;
                        if (z5) {
                            z2 = true;
                            xu6Var4.k0("tag_latest_stories_loading_more", "loading_more_stream_post_item", new mz1(new dx9(stcVar, 3), true, -1662673128));
                        } else {
                            z2 = true;
                        }
                        if (vcdVar6.b && !z5) {
                            xu6Var4.k0("latest_stories_see_more", "see_more_button", new mz1(new vla(R.string.latest_stories_see_more, 2, w2g.G(o28Var, 0.0f, 0.0f, 0.0f, 16.0f, 7), "latest_stories_see_more", new ibd(0, lbdVar, lbd.class, "onLatestSeeMoreButtonClicked", "onLatestSeeMoreButtonClicked()V", 0, 2)), z2, 316165265));
                        }
                    }
                } else if (!(xcdVar instanceof scd)) {
                    if (!g76.L(xcdVar, tcd.a)) {
                        ygf.a();
                        return null;
                    }
                    ev6.j(xu6Var3, "tag_sections_loading", new mz1(new nra(9, ip7Var4), true, -93239167), 2);
                }
                return c1e.a;
        }
    }
}
