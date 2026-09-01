package defpackage;

import android.content.Context;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.medium.android.catalogs.createCatalog.CreateCatalogBottomSheetDialogFragment;
import com.medium.android.catalogs.deleteCatalog.DeleteCatalogDialogFragment;
import com.medium.android.digest.ui.digesthistory.DigestHistoryDialogFragment;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.android.settings.ui.customappicon.CustomAppIconFragment;
import com.medium.reader.R;
import defpackage.as7;
import defpackage.c1e;
import defpackage.hl0;
import defpackage.lv8;
import defpackage.o28;
import defpackage.p65;
import defpackage.u36;
import defpackage.vj3;
import defpackage.vpc;
import defpackage.w2g;
import defpackage.x12;
import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ag1 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ ag1(Object obj, int i, Object obj2) {
        this.a = i;
        this.c = obj;
        this.b = obj2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        o28 o28Var = o28.b;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.b;
        Object obj4 = this.c;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                bg1.a((yf1) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 1:
                ((Integer) obj2).getClass();
                nk7.b((cg1) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 2:
                ((Integer) obj2).getClass();
                n01.h((gr1) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 3:
                pya pyaVar = (pya) obj3;
                gb2 gb2Var = (gb2) obj2;
                ((c1e) obj).getClass();
                gb2Var.getClass();
                int i2 = pyaVar.a;
                pyaVar.a = i2 + 1;
                ((ib2[]) obj4)[i2] = gb2Var;
                return c1eVar;
            case 4:
                ((Integer) obj2).getClass();
                ((g92) obj4).a((f92) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 5:
                we2 we2Var = (we2) obj4;
                CreateCatalogBottomSheetDialogFragment createCatalogBottomSheetDialogFragment = (CreateCatalogBottomSheetDialogFragment) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    ht2.v(we2Var.l, we2Var.j, new xd2(createCatalogBottomSheetDialogFragment, we2Var), null, p65Var, 0);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 6:
                final CustomAppIconFragment customAppIconFragment = (CustomAppIconFragment) obj4;
                final jl2 jl2Var = (jl2) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    jt7.a(false, pxf.E(-1784469596, new b55() { // from class: com.medium.android.settings.ui.customappicon.b
                        @Override // defpackage.b55
                        public final Object invoke(Object obj5, Object obj6) {
                            x12 x12Var3 = (x12) obj5;
                            int iIntValue3 = ((Integer) obj6).intValue();
                            p65 p65Var3 = (p65) x12Var3;
                            if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                                CustomAppIconFragment customAppIconFragment2 = customAppIconFragment;
                                vpc vpcVarS = ((MainActivity) customAppIconFragment2.Q()).s();
                                hl0 hl0Var = as7.a;
                                u36.c(((CustomAppIconFragment.BundleInfo) customAppIconFragment2.u0.getValue()).getReferrerSource(), jl2Var, w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) lv8.k(56.0f, vpcVarS, p65Var3, 0).getValue()).a, 7), null, p65Var3, 0);
                            } else {
                                p65Var3.S();
                            }
                            return c1e.a;
                        }
                    }, p65Var2), p65Var2, 48, 1);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 7:
                ((Integer) obj2).getClass();
                u36.d((jl2) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 8:
                ((Integer) obj2).getClass();
                ((gx2) obj4).a((n0c) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 9:
                ((Integer) obj2).getClass();
                ((j03) obj4).a((gc8) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 10:
                ((Integer) obj2).getClass();
                ((z13) obj4).a((sec) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 11:
                ygd ygdVar = (ygd) obj4;
                khd khdVar = (khd) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    boolean zF = p65Var3.f(ygdVar);
                    Object objM = p65Var3.M();
                    if (zF || objM == uobVar) {
                        objM = bjc.b(new gu1(0, ygdVar, ygd.class, "data", "data()Landroidx/compose/foundation/text/contextmenu/data/TextContextMenuData;", 0, 7));
                        p65Var3.j0(objM);
                    }
                    n23.a(khdVar, (xgd) ((upc) objM).getValue(), p65Var3, 0);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 12:
                ((Integer) obj2).getClass();
                n23.a((khd) obj4, (xgd) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 13:
                ((Integer) obj2).getClass();
                ((c33) obj4).a((gud) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 14:
                j53 j53Var = (j53) obj4;
                DeleteCatalogDialogFragment deleteCatalogDialogFragment = (DeleteCatalogDialogFragment) obj3;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    pwd.h(j53Var.j, j53Var.h, new u43(deleteCatalogDialogFragment, j53Var), null, p65Var4, 0);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 15:
                x45 x45Var = (x45) obj4;
                q53 q53Var = (q53) obj3;
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    boolean zF2 = p65Var5.f(x45Var) | p65Var5.f(q53Var);
                    Object objM2 = p65Var5.M();
                    if (zF2 || objM2 == uobVar) {
                        objM2 = new gf2(x45Var, 25, q53Var);
                        p65Var5.j0(objM2);
                    }
                    f76.w((m45) objM2, null, false, null, null, null, nk7.c, p65Var5, 805306368, 510);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 16:
                ((Integer) obj2).getClass();
                t40.n((List) obj4, (Collection) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 17:
                vq6 vq6Var = ((DigestHistoryDialogFragment) obj4).H0;
                rz2 rz2Var = (rz2) obj3;
                x12 x12Var6 = (x12) obj;
                int iIntValue6 = ((Integer) obj2).intValue();
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    rx0.n(((DigestHistoryDialogFragment.BundleInfo) vq6Var.getValue()).getSelectedDigestId(), ((DigestHistoryDialogFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), ((DigestHistoryDialogFragment.BundleInfo) vq6Var.getValue()).getSource(), ((DigestHistoryDialogFragment.BundleInfo) vq6Var.getValue()).getLocation(), rz2Var, null, null, p65Var6, 0);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 18:
                ((Integer) obj2).getClass();
                rx0.k((sc3) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 19:
                ((Integer) obj2).getClass();
                xz5.h((qf3) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 20:
                ph3 ph3Var = (ph3) obj4;
                ah3 ah3Var = (ah3) obj3;
                x12 x12Var7 = (x12) obj;
                int iIntValue7 = ((Integer) obj2).intValue();
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                    rv8.h(ph3Var.g, ph3Var.i, ah3Var, p65Var7, 0);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 21:
                fq3 fq3Var = (fq3) obj4;
                upc upcVar = (upc) obj3;
                x12 x12Var8 = (x12) obj;
                int iIntValue8 = ((Integer) obj2).intValue();
                int i3 = EditPostFragment.Q0;
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 3) != 2)) {
                    r40.j((rr3) upcVar.getValue(), fq3Var, rv8.X(o28Var, rv8.u), p65Var8, 0, 0);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 22:
                EditPostFragment editPostFragment = (EditPostFragment) obj4;
                rg1 rg1Var = (rg1) obj3;
                x12 x12Var9 = (x12) obj;
                int iIntValue9 = ((Integer) obj2).intValue();
                int i4 = EditPostFragment.Q0;
                p65 p65Var9 = (p65) x12Var9;
                if (p65Var9.P(iIntValue9 & 1, (iIntValue9 & 3) != 2)) {
                    nhc nhcVarF = mk7.F(p65Var9);
                    jt7.a(false, pxf.E(1605705820, new wp3(editPostFragment, rg1Var, nhcVarF, z ? 1 : 0), p65Var9), p65Var9, 48, 1);
                    Resources resources = (Resources) p65Var9.j(eo.c);
                    Object objM3 = p65Var9.M();
                    if (objM3 == uobVar) {
                        objM3 = kyd.M(p65Var9);
                        p65Var9.j0(objM3);
                    }
                    sb2 sb2Var = (sb2) objM3;
                    boolean zH = p65Var9.h(editPostFragment) | p65Var9.f(nhcVarF) | p65Var9.h(sb2Var) | p65Var9.h(resources);
                    Object objM4 = p65Var9.M();
                    if (zH || objM4 == uobVar) {
                        fl2 fl2Var = new fl2(editPostFragment, nhcVarF, sb2Var, resources, null, 6);
                        p65Var9.j0(fl2Var);
                        objM4 = fl2Var;
                    }
                    kyd.k(p65Var9, (b55) objM4, c1eVar);
                } else {
                    p65Var9.S();
                }
                return c1eVar;
            case 23:
                l64 l64Var = (l64) obj4;
                x64 x64Var = (x64) obj3;
                x12 x12Var10 = (x12) obj;
                int iIntValue10 = ((Integer) obj2).intValue();
                p65 p65Var10 = (p65) x12Var10;
                if (p65Var10.P(iIntValue10 & 1, (iIntValue10 & 3) != 2)) {
                    boolean zH2 = p65Var10.h(l64Var) | p65Var10.f(x64Var);
                    Object objM5 = p65Var10.M();
                    if (zH2 || objM5 == uobVar) {
                        objM5 = new i64(l64Var, x64Var, z ? 1 : 0);
                        p65Var10.j0(objM5);
                    }
                    mq7.s((m45) objM5, null, null, 0L, 0L, null, p65Var10, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                } else {
                    p65Var10.S();
                }
                return c1eVar;
            case 24:
                ResolveInfo resolveInfo = (ResolveInfo) obj4;
                Context context = (Context) obj3;
                x12 x12Var11 = (x12) obj;
                int iIntValue11 = ((Integer) obj2).intValue();
                p65 p65Var11 = (p65) x12Var11;
                if (p65Var11.P(iIntValue11 & 1, (iIntValue11 & 3) != 2)) {
                    jjd.b(vo7.Q(R.string.external_web_open_in_browser, new Object[]{qo7.m(resolveInfo.loadLabel(context.getPackageManager()).toString(), ka9.a.f().d())}, p65Var11), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var11, 0, 0, 262142);
                } else {
                    p65Var11.S();
                }
                return c1eVar;
            case 25:
                ((Integer) obj2).getClass();
                n01.q((kc4) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 26:
                nc4 nc4Var = (nc4) obj4;
                xb4 xb4Var = (xb4) obj3;
                x12 x12Var12 = (x12) obj;
                int iIntValue12 = ((Integer) obj2).intValue();
                p65 p65Var12 = (p65) x12Var12;
                if (p65Var12.P(iIntValue12 & 1, (iIntValue12 & 3) != 2)) {
                    n01.n(nc4Var, xb4Var, null, p65Var12, 0);
                } else {
                    p65Var12.S();
                }
                return c1eVar;
            case 27:
                xi4 xi4Var = (xi4) obj4;
                hi4 hi4Var = (hi4) obj3;
                x12 x12Var13 = (x12) obj;
                int iIntValue13 = ((Integer) obj2).intValue();
                p65 p65Var13 = (p65) x12Var13;
                if (p65Var13.P(iIntValue13 & 1, (iIntValue13 & 3) != 2)) {
                    gx1.u(xi4Var, hi4Var, null, p65Var13, 0);
                } else {
                    p65Var13.S();
                }
                return c1eVar;
            case 28:
                ((Integer) obj2).getClass();
                gx1.r((hi4) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            default:
                m45 m45Var = (m45) obj4;
                m45 m45Var2 = (m45) obj3;
                x12 x12Var14 = (x12) obj;
                int iIntValue14 = ((Integer) obj2).intValue();
                p65 p65Var14 = (p65) x12Var14;
                if (p65Var14.P(iIntValue14 & 1, (iIntValue14 & 3) != 2)) {
                    r28 r28VarF = w2g.F(o28Var, 24.0f, 16.0f, 8.0f, 16.0f);
                    omb ombVarA = nmb.a(qb8.a, z46.n, p65Var14, 48);
                    long j = p65Var14.T;
                    int i5 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var14.l();
                    r28 r28VarR = gx1.R(p65Var14, r28VarF);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var14.c0();
                    if (p65Var14.S) {
                        p65Var14.k(ot2Var);
                    } else {
                        p65Var14.m0();
                    }
                    tp7.B(p65Var14, q12.f, ombVarA);
                    tp7.B(p65Var14, q12.e, i89VarL);
                    tp7.B(p65Var14, q12.g, Integer.valueOf(i5));
                    tp7.y(p65Var14, q12.h);
                    tp7.B(p65Var14, q12.d, r28VarR);
                    p65Var14.Y(1552881405);
                    kx kxVar = new kx();
                    kxVar.d(vo7.R(p65Var14, R.string.post_page_first_repost_success_snackbar_lead));
                    p65Var14.Y(1552885514);
                    wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, 14);
                    boolean zF3 = p65Var14.f(m45Var2);
                    Object objM6 = p65Var14.M();
                    if (zF3 || objM6 == uobVar) {
                        objM6 = new al4(0, m45Var2);
                        p65Var14.j0(objM6);
                    }
                    int iV = ho2.v("activity_tab", wjdVar, (e07) objM6, kxVar);
                    try {
                        kxVar.d(vo7.R(p65Var14, R.string.post_page_first_repost_success_snackbar_reposts_tab));
                        kxVar.f(iV);
                        p65Var14.p(false);
                        mx mxVarI = kxVar.i();
                        p65Var14.p(false);
                        jjd.c(mxVarI, bgf.N(new sq6(1.0f, true), "post_page_first_repost_success_banner_text"), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, mkd.a(((bu7) p65Var14.j(jt7.c)).m, ((zo7) p65Var14.j(kt7.b)).p, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var14, 0, 0, 262140);
                        hp7.t(p65Var14, jfc.l(o28Var, 8.0f));
                        f49.l(m45Var, bgf.N(o28Var, "post_page_first_repost_success_dismiss"), false, null, null, pwd.a, p65Var14, 1572912, 60);
                        p65Var14.p(true);
                    } catch (Throwable th) {
                        kxVar.f(iV);
                        throw th;
                    }
                } else {
                    p65Var14.S();
                }
                return c1eVar;
        }
    }

    public /* synthetic */ ag1(Object obj, Object obj2, int i, int i2) {
        this.a = i2;
        this.c = obj;
        this.b = obj2;
    }
}
