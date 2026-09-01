package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.core.navigation.NotificationFilterType;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.following.FollowingTab;
import com.medium.android.profile.ui.view.UserProfileTab;
import com.medium.reader.R;
import com.medium.refinerecommendations.RefineRecommendationsFilter;
import com.medium.refinerecommendations.RefineRecommendationsTab;
import com.medium.stats.ui.user.UserStatsTab;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vx4 implements d55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ vx4(UserProfileTab userProfileTab, jje jjeVar, String str, ihe iheVar) {
        this.a = 9;
        this.c = userProfileTab;
        this.d = jjeVar;
        this.b = str;
        this.e = iheVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v132 */
    /* JADX WARN: Type inference failed for: r0v133, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r0v136 */
    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        boolean z;
        boolean z2;
        p65 p65Var;
        boolean z3;
        p65 p65Var2;
        ?? r0;
        int i;
        int i2 = this.a;
        int i3 = 13;
        uob uobVar = w12.a;
        boolean z4 = false;
        boolean z5 = true;
        c1e c1eVar = c1e.a;
        Object obj5 = this.e;
        Object obj6 = this.b;
        Object obj7 = this.d;
        Object obj8 = this.c;
        switch (i2) {
            case 0:
                String str = (String) obj6;
                String str2 = (String) obj8;
                nhc nhcVar = (nhc) obj7;
                ay4 ay4Var = (ay4) obj5;
                int iIntValue = ((Integer) obj2).intValue();
                x12 x12Var = (x12) obj3;
                ((Integer) obj4).getClass();
                ((zy8) obj).getClass();
                rh4 rh4Var = jfc.c;
                zk7 zk7VarC = dy0.c(z46.d, false);
                p65 p65Var3 = (p65) x12Var;
                long j = p65Var3.T;
                int i4 = (int) (j ^ (j >>> 32));
                i89 i89VarL = p65Var3.l();
                r28 r28VarR = gx1.R(x12Var, rh4Var);
                r12.W.getClass();
                ot2 ot2Var = q12.b;
                p65 p65Var4 = (p65) x12Var;
                p65Var4.c0();
                if (p65Var4.S) {
                    p65Var4.k(ot2Var);
                } else {
                    p65Var4.m0();
                }
                tp7.B(x12Var, q12.f, zk7VarC);
                tp7.B(x12Var, q12.e, i89VarL);
                tp7.B(x12Var, q12.g, Integer.valueOf(i4));
                tp7.y(x12Var, q12.h);
                tp7.B(x12Var, q12.d, r28VarR);
                p65Var4.Y(-10583220);
                if (((Boolean) p65Var4.j(l36.a)).booleanValue()) {
                    p65Var4.p(false);
                } else {
                    if (iIntValue == FollowingTab.USERS.ordinal()) {
                        p65Var4.Y(-10467777);
                        s42.t(str, str2, new olb(13, ay4Var), nhcVar, null, null, x12Var, 0);
                        z = false;
                        p65Var4.p(false);
                    } else {
                        if (iIntValue != FollowingTab.PUBLICATIONS.ordinal()) {
                            p65Var4.Y(1385188019);
                            p65Var4.p(false);
                            ay0.e(b09.w(iIntValue, "Invalid page "));
                            return null;
                        }
                        p65Var4.Y(-9597173);
                        g01.m(str, str2, new rz2(14, ay4Var), nhcVar, null, null, x12Var, 0);
                        z = false;
                        p65Var4.p(false);
                    }
                    p65Var4.p(z);
                }
                p65Var4.p(true);
                return c1eVar;
            case 1:
                hna hnaVar = (hna) obj6;
                pkf pkfVar = (pkf) obj8;
                my6 my6Var = (my6) obj7;
                zm7 zm7Var = (zm7) obj5;
                int iIntValue2 = ((Integer) obj2).intValue();
                ((Integer) obj4).getClass();
                ((zy8) obj).getClass();
                p65 p65Var5 = (p65) ((x12) obj3);
                if (!((Boolean) p65Var5.j(l36.a)).booleanValue()) {
                    Object obj9 = (PublicationTab) bu1.A0(iIntValue2, hnaVar.d);
                    if (obj9 == null) {
                        obj9 = PublicationTab.Home.INSTANCE;
                    }
                    rh4 rh4Var2 = jfc.c;
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var5.T;
                    int i5 = (int) ((j2 >>> 32) ^ j2);
                    i89 i89VarL2 = p65Var5.l();
                    r28 r28VarR2 = gx1.R(p65Var5, rh4Var2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var2);
                    } else {
                        p65Var5.m0();
                    }
                    tp7.B(p65Var5, q12.f, zk7VarC2);
                    tp7.B(p65Var5, q12.e, i89VarL2);
                    tp7.B(p65Var5, q12.g, Integer.valueOf(i5));
                    tp7.y(p65Var5, q12.h);
                    tp7.B(p65Var5, q12.d, r28VarR2);
                    if (g76.L(obj9, PublicationTab.About.INSTANCE)) {
                        p65Var5.Y(-1101838892);
                        vo7.j(hnaVar.a, hnaVar.f, pkfVar, null, null, p65Var5, 0);
                        p65Var5.p(false);
                    } else if (g76.L(obj9, PublicationTab.Home.INSTANCE)) {
                        p65Var5.Y(-1101828687);
                        g76.y(hnaVar.a, hnaVar.f, my6Var, null, null, p65Var5, 0);
                        p65Var5.p(false);
                    } else {
                        if (!g76.L(obj9, PublicationTab.Newsletter.INSTANCE)) {
                            throw ho2.L(p65Var5, -1101840446, false);
                        }
                        p65Var5.Y(-1101818365);
                        lk7.k(hnaVar.a, hnaVar.f, zm7Var, null, null, p65Var5, 0);
                        p65Var5.p(false);
                    }
                    p65Var5.p(true);
                }
                return c1eVar;
            case 2:
                String str3 = (String) obj6;
                uza uzaVar = (uza) obj8;
                nhc nhcVar2 = (nhc) obj7;
                RefineRecommendationsFilter refineRecommendationsFilter = (RefineRecommendationsFilter) obj5;
                int iIntValue3 = ((Integer) obj2).intValue();
                x12 x12Var2 = (x12) obj3;
                ((Integer) obj4).getClass();
                ((zy8) obj).getClass();
                rh4 rh4Var3 = jfc.c;
                zk7 zk7VarC3 = dy0.c(z46.d, false);
                p65 p65Var6 = (p65) x12Var2;
                long j3 = p65Var6.T;
                int i6 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL3 = p65Var6.l();
                r28 r28VarR3 = gx1.R(x12Var2, rh4Var3);
                r12.W.getClass();
                ot2 ot2Var3 = q12.b;
                p65 p65Var7 = (p65) x12Var2;
                p65Var7.c0();
                if (p65Var7.S) {
                    p65Var7.k(ot2Var3);
                } else {
                    p65Var7.m0();
                }
                tp7.B(x12Var2, q12.f, zk7VarC3);
                tp7.B(x12Var2, q12.e, i89VarL3);
                tp7.B(x12Var2, q12.g, Integer.valueOf(i6));
                tp7.y(x12Var2, q12.h);
                tp7.B(x12Var2, q12.d, r28VarR3);
                p65Var7.Y(-1866435644);
                if (((Boolean) p65Var7.j(l36.a)).booleanValue()) {
                    p65Var7.p(false);
                } else {
                    boolean z6 = false;
                    if (iIntValue3 == RefineRecommendationsTab.Following.ordinal()) {
                        p65Var7.Y(-1866377613);
                        n01.D(str3, uzaVar, nhcVar2, null, null, x12Var2, 0);
                        p65Var7.p(false);
                    } else if (iIntValue3 == RefineRecommendationsTab.ReadingHistory.ordinal()) {
                        p65Var7.Y(-1866065877);
                        mk7.f(str3, uzaVar, nhcVar2, x12Var2, 0);
                        p65Var7.p(false);
                    } else if (iIntValue3 == RefineRecommendationsTab.Muted.ordinal()) {
                        p65Var7.Y(-1865696233);
                        nk7.G(str3, uzaVar, nhcVar2, null, null, x12Var2, 0);
                        p65Var7.p(false);
                    } else {
                        if (iIntValue3 == RefineRecommendationsTab.Suggestions.ordinal()) {
                            p65Var7.Y(-1865334370);
                            qb8.v(refineRecommendationsFilter, str3, nhcVar2, new pkf(uzaVar), null, null, x12Var2, 0);
                            z6 = false;
                        } else {
                            z6 = false;
                            p65Var7.Y(-1874946106);
                        }
                        p65Var7.p(z6);
                    }
                    p65Var7.p(z6);
                }
                p65Var7.p(true);
                return c1eVar;
            case 3:
                jje jjeVar = (jje) obj6;
                ihe iheVar = (ihe) obj8;
                j78 j78Var = (j78) obj7;
                j78 j78Var2 = (j78) obj5;
                int iIntValue4 = ((Integer) obj2).intValue();
                x12 x12Var3 = (x12) obj3;
                ((Integer) obj4).getClass();
                ((zy8) obj).getClass();
                rh4 rh4Var4 = jfc.c;
                UserProfileTab userProfileTab = (UserProfileTab) jjeVar.a.get(iIntValue4);
                SourceParameter sourceParameter = jjeVar.r;
                if (userProfileTab instanceof UserProfileTab.About) {
                    p65 p65Var8 = (p65) x12Var3;
                    p65Var8.Y(-182684668);
                    s42.G(jjeVar.c, gp7.u(sourceParameter), iheVar, j78Var, rh4Var4, 0.0f, null, p65Var8, 24576, 96);
                    p65Var8.p(false);
                } else if (userProfileTab instanceof UserProfileTab.Books) {
                    p65 p65Var9 = (p65) x12Var3;
                    p65Var9.Y(-182288860);
                    sfe.g(jjeVar.c, gp7.u(sourceParameter), iheVar, j78Var, rh4Var4, 0.0f, null, p65Var9, 24576, 96);
                    p65Var9.p(false);
                } else if (userProfileTab instanceof UserProfileTab.Catalogs) {
                    p65 p65Var10 = (p65) x12Var3;
                    p65Var10.Y(-181888898);
                    n01.Q(gp7.u(sourceParameter), jjeVar.c, iheVar, rh4Var4, j78Var2, false, 0.0f, p65Var10, 199680, 64);
                    p65Var10.p(false);
                } else if (userProfileTab instanceof UserProfileTab.Posts) {
                    p65 p65Var11 = (p65) x12Var3;
                    p65Var11.Y(-181456572);
                    vc2.A(jjeVar.c, gp7.u(sourceParameter), iheVar, j78Var, rh4Var4, null, p65Var11, 24576);
                    p65Var11.p(false);
                } else if (userProfileTab instanceof UserProfileTab.Activity) {
                    p65 p65Var12 = (p65) x12Var3;
                    p65Var12.Y(-181057850);
                    k50.T(jjeVar.c, gp7.u(sourceParameter), j78Var, iheVar, rh4Var4, null, p65Var12, 24576);
                    p65Var12.p(false);
                } else {
                    if (!(userProfileTab instanceof UserProfileTab.Reposts)) {
                        throw ho2.L((p65) x12Var3, -144440907, false);
                    }
                    p65 p65Var13 = (p65) x12Var3;
                    p65Var13.Y(-180662135);
                    yi2.I(jjeVar.c, gp7.u(sourceParameter), j78Var, iheVar, rh4Var4, null, p65Var13, 24576);
                    p65Var13.p(false);
                }
                return c1eVar;
            case 4:
                String str4 = (String) obj6;
                String str5 = (String) obj8;
                hsc hscVar = (hsc) obj7;
                ab0 ab0Var = (ab0) obj5;
                int iIntValue5 = ((Integer) obj2).intValue();
                x12 x12Var4 = (x12) obj3;
                ((Integer) obj4).getClass();
                ((zy8) obj).getClass();
                rh4 rh4Var5 = jfc.c;
                zk7 zk7VarC4 = dy0.c(z46.d, false);
                p65 p65Var14 = (p65) x12Var4;
                long j4 = p65Var14.T;
                int i7 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL4 = p65Var14.l();
                r28 r28VarR4 = gx1.R(x12Var4, rh4Var5);
                r12.W.getClass();
                ot2 ot2Var4 = q12.b;
                p65 p65Var15 = (p65) x12Var4;
                p65Var15.c0();
                if (p65Var15.S) {
                    p65Var15.k(ot2Var4);
                } else {
                    p65Var15.m0();
                }
                tp7.B(x12Var4, q12.f, zk7VarC4);
                tp7.B(x12Var4, q12.e, i89VarL4);
                tp7.B(x12Var4, q12.g, Integer.valueOf(i7));
                tp7.y(x12Var4, q12.h);
                tp7.B(x12Var4, q12.d, r28VarR4);
                p65Var15.Y(237927502);
                if (((Boolean) p65Var15.j(l36.a)).booleanValue()) {
                    p65Var15.p(false);
                } else {
                    if (iIntValue5 == UserStatsTab.STORIES.ordinal()) {
                        p65Var15.Y(423322850);
                        ok7.q(str4, str5, hscVar, rh4Var5, null, x12Var4, 3072);
                        p65Var15.p(false);
                    } else {
                        if (iIntValue5 != UserStatsTab.AUDIENCE.ordinal()) {
                            p65Var15.Y(423342413);
                            p65Var15.p(false);
                            ay0.e(b09.w(iIntValue5, "Invalid page "));
                            return null;
                        }
                        p65Var15.Y(423333213);
                        f49.b(str4, str5, ab0Var, rh4Var5, null, x12Var4, 3072);
                        p65Var15.p(false);
                    }
                    p65Var15.p(false);
                }
                p65Var15.p(true);
                return c1eVar;
            case 5:
                p38 p38Var = (p38) obj6;
                l78 l78Var = (l78) obj8;
                l78 l78Var2 = (l78) obj7;
                l78 l78Var3 = (l78) obj5;
                r28 r28Var = (r28) obj2;
                x12 x12Var5 = (x12) obj3;
                int iIntValue6 = ((Integer) obj4).intValue();
                ((gq4) obj).getClass();
                r28Var.getClass();
                if ((iIntValue6 & 48) == 0) {
                    iIntValue6 |= ((p65) x12Var5).f(r28Var) ? 32 : 16;
                }
                p65 p65Var16 = (p65) x12Var5;
                if (p65Var16.P(iIntValue6 & 1, (iIntValue6 & 145) != 144)) {
                    int i8 = (iIntValue6 << 3) & 896;
                    rr7.c(String.valueOf(p38Var.g), vo7.R(p65Var16, R.string.post_stats_monthly_stats_total_reads), r28Var, null, p65Var16, i8, 8);
                    Long l = (Long) l78Var.getValue();
                    rr7.c(vo7.Q(R.string.stats_percentage, new Object[]{String.valueOf(l != null ? l.longValue() : p38Var.j)}, p65Var16), vo7.R(p65Var16, R.string.post_stats_monthly_stats_member_reads_ratio), r28Var, vo7.R(p65Var16, R.string.post_stats_monthly_stats_reads_ratio_info), p65Var16, i8, 0);
                    Integer num = (Integer) l78Var2.getValue();
                    rr7.c(dq1.g(Integer.valueOf(num != null ? num.intValue() : (int) p38Var.h)), vo7.R(p65Var16, R.string.post_stats_monthly_stats_member_reads), r28Var, null, p65Var16, i8, 8);
                    Integer num2 = (Integer) l78Var3.getValue();
                    rr7.c(dq1.g(Integer.valueOf(num2 != null ? num2.intValue() : (int) p38Var.i)), vo7.R(p65Var16, R.string.post_stats_monthly_stats_non_member_reads), r28Var, null, p65Var16, i8, 8);
                } else {
                    p65Var16.S();
                }
                return c1eVar;
            case 6:
                gl8 gl8Var = (gl8) obj6;
                vk8 vk8Var = (vk8) obj8;
                int iIntValue7 = ((Integer) obj2).intValue();
                x12 x12Var6 = (x12) obj3;
                ((Integer) obj4).getClass();
                ((zy8) obj).getClass();
                NotificationFilterType notificationFilterType = (NotificationFilterType) ((i04) NotificationFilterType.getEntries()).get(iIntValue7);
                kv6 kv6VarA = pv6.a(x12Var6);
                xk8.a((fl8) ei7.N(notificationFilterType, gl8Var.b), notificationFilterType, kv6VarA, vk8Var, (ek8) obj7, (obe) obj5, null, x12Var6, 0);
                if (iIntValue7 == gl8Var.a.ordinal()) {
                    p65Var = (p65) x12Var6;
                    p65Var.Y(-198284030);
                    boolean zF = p65Var.f(kv6VarA) | p65Var.f(vk8Var);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        objM = new kd7(kv6VarA, vk8Var, z4 ? 1 : 0, i3);
                        p65Var.j0(objM);
                    }
                    kyd.k(p65Var, (b55) objM, kv6VarA);
                    z2 = false;
                } else {
                    z2 = false;
                    p65Var = (p65) x12Var6;
                    p65Var.Y(-208256606);
                }
                p65Var.p(z2);
                return c1eVar;
            case 7:
                eb8 eb8Var = (eb8) obj8;
                m45 m45Var = (m45) obj7;
                ui9 ui9Var = (ui9) obj5;
                x12 x12Var7 = (x12) obj3;
                ((Integer) obj4).getClass();
                ((iv) obj).getClass();
                ((ba8) obj2).getClass();
                vga vgaVar = (vga) guc.z(((fha) obj6).v, x12Var7, 0).getValue();
                uga ugaVar = vgaVar instanceof uga ? (uga) vgaVar : null;
                if (ugaVar == null) {
                    p65Var2 = (p65) x12Var7;
                    p65Var2.Y(2019280011);
                    z3 = false;
                } else {
                    z3 = false;
                    p65Var2 = (p65) x12Var7;
                    p65Var2.Y(2019280012);
                    iq7.h(ugaVar, eb8Var, m45Var, ui9Var, p65Var2, 0);
                }
                p65Var2.p(z3);
                return c1eVar;
            case 8:
                r28 r28Var2 = (r28) obj6;
                gz8 gz8Var = (gz8) obj8;
                of5 of5Var = (of5) obj7;
                h6c h6cVar = (h6c) obj5;
                Integer num3 = (Integer) obj2;
                int iIntValue8 = num3.intValue();
                ((Integer) obj4).getClass();
                ((zy8) obj).getClass();
                p65 p65Var17 = (p65) ((x12) obj3);
                p65Var17.W(112281947, num3);
                r28 r28VarC = o28.b;
                r28 r28VarD = jfc.d(r28VarC, 1.0f);
                zk7 zk7VarC5 = dy0.c(z46.d, false);
                long j5 = p65Var17.T;
                int i9 = (int) (j5 ^ (j5 >>> 32));
                i89 i89VarL5 = p65Var17.l();
                r28 r28VarR5 = gx1.R(p65Var17, r28VarD);
                r12.W.getClass();
                ot2 ot2Var5 = q12.b;
                p65Var17.c0();
                if (p65Var17.S) {
                    p65Var17.k(ot2Var5);
                } else {
                    p65Var17.m0();
                }
                tp7.B(p65Var17, q12.f, zk7VarC5);
                tp7.B(p65Var17, q12.e, i89VarL5);
                tp7.B(p65Var17, q12.g, Integer.valueOf(i9));
                tp7.y(p65Var17, q12.h);
                tp7.B(p65Var17, q12.d, r28VarR5);
                r28 r28VarK = op8.K(0.5625f, iy0.a.a(r28Var2, z46.h), true);
                if (iIntValue8 == ((Number) gz8Var.s.getValue()).intValue()) {
                    p65Var17.Y(1840888966);
                    boolean zH = p65Var17.h(of5Var);
                    Object objM2 = p65Var17.M();
                    Object obj10 = objM2;
                    if (zH || objM2 == uobVar) {
                        x5c x5cVar = new x5c(of5Var, z5 ? 1 : 0);
                        p65Var17.j0(x5cVar);
                        obj10 = x5cVar;
                    }
                    r28VarC = guc.C(r28VarC, (x45) obj10);
                    r0 = 0;
                    p65Var17.p(false);
                } else {
                    r0 = 0;
                    p65Var17.Y(1841348851);
                    p65Var17.p(false);
                }
                r28 r28VarB = r28VarK.b(r28VarC);
                if (iIntValue8 == 0) {
                    p65Var17.Y(1841553079);
                    ep7.m(h6cVar.b, r28VarB, p65Var17, r0);
                    p65Var17.p(r0);
                } else {
                    p65Var17.Y(1841849284);
                    bo.s((c5c) h6cVar.c.get(iIntValue8 - 1), r28VarB, p65Var17, r0);
                    p65Var17.p(r0);
                }
                p65Var17.p(true);
                p65Var17.p(r0);
                return c1eVar;
            default:
                UserProfileTab userProfileTab2 = (UserProfileTab) obj8;
                jje jjeVar2 = (jje) obj7;
                String str6 = (String) obj6;
                ihe iheVar2 = (ihe) obj5;
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                x45 x45Var = (x45) obj2;
                x12 x12Var8 = (x12) obj3;
                int iIntValue9 = ((Integer) obj4).intValue();
                x45Var.getClass();
                int i10 = 4;
                if ((iIntValue9 & 6) == 0) {
                    i = (((p65) x12Var8).g(zBooleanValue) ? 4 : 2) | iIntValue9;
                } else {
                    i = iIntValue9;
                }
                if ((iIntValue9 & 48) == 0) {
                    i |= ((p65) x12Var8).h(x45Var) ? 32 : 16;
                }
                p65 p65Var18 = (p65) x12Var8;
                if (!p65Var18.P(i & 1, (i & 147) != 146)) {
                    p65Var18.S();
                } else if (g76.L(userProfileTab2, UserProfileTab.Activity.INSTANCE)) {
                    p65Var18.Y(976880753);
                    ok7.b(jjeVar2.t, null, null, null, 0.0f, null, pxf.E(1021811748, new pr3(str6, zBooleanValue, x45Var, 5), p65Var18), pxf.E(-1855925554, new f4e(i10, iheVar2), p65Var18), p65Var18, 14155776, 62);
                    p65Var18.p(false);
                } else {
                    p65Var18.Y(978269491);
                    lk7.c((i << 3) & PhotoshopDirectory.TAG_CAPTION, p65Var18, x45Var, null, str6, zBooleanValue);
                    p65Var18.p(false);
                }
                return c1eVar;
        }
    }

    public /* synthetic */ vx4(Object obj, Object obj2, Object obj3, Object obj4, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
    }
}
