package defpackage;

import android.webkit.CookieManager;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.profile.ui.you.i;
import com.medium.android.upvoters.ui.d;
import com.medium.proto.event.FindYourFriendsPresented;
import com.medium.proto.event.OnboardingFollowPageViewed;
import com.medium.proto.event.ReactivateMembershipPresented;
import com.medium.proto.event.SearchOpened;
import com.medium.proto.event.SignUpSignInUnrecognizedEmailViewed;
import com.medium.proto.event.TagRecommendedStoriesViewed;
import com.medium.proto.event.TopicDirectoryViewed;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class obb extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ obb(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = obj;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                return new obb((bf7) obj2, n92Var, 0);
            case 1:
                return new obb((pq5) obj2, n92Var, 1);
            case 2:
                return new obb((gvb) obj2, n92Var, 2);
            case 3:
                return new obb((q0c) obj2, n92Var, 3);
            case 4:
                return new obb((d2c) obj2, n92Var, 4);
            case 5:
                return new obb((eac) obj2, n92Var, 5);
            case 6:
                return new obb((cbc) obj2, n92Var, 6);
            case 7:
                return new obb((omc) obj2, n92Var, 7);
            case 8:
                return new obb((uoc) obj2, n92Var, 8);
            case 9:
                return new obb((cpc) obj2, n92Var, 9);
            case 10:
                return new obb((zsc) obj2, n92Var, 10);
            case 11:
                return new obb((gxc) obj2, n92Var, 11);
            case 12:
                return new obb((q1d) obj2, n92Var, 12);
            case 13:
                return new obb((e4d) obj2, n92Var, 13);
            case 14:
                return new obb((h8d) obj2, n92Var, 14);
            case 15:
                return new obb((t9d) obj2, n92Var, 15);
            case 16:
                return new obb((lbd) obj2, n92Var, 16);
            case 17:
                return new obb((l78) obj2, n92Var, 17);
            case 18:
                return new obb((aed) obj2, n92Var, 18);
            case 19:
                return new obb((mpd) obj2, n92Var, 19);
            case 20:
                return new obb((e2e) obj2, n92Var, 20);
            case 21:
                return new obb((s3e) obj2, n92Var, 21);
            case 22:
                return new obb((lae) obj2, n92Var, 22);
            case 23:
                return new obb((cie) obj2, n92Var, 23);
            case 24:
                return new obb((ihe) obj2, n92Var, 24);
            case 25:
                return new obb((wve) obj2, n92Var, 25);
            case 26:
                return new obb((j2f) obj2, n92Var, 26);
            case 27:
                return new obb((t2f) obj2, n92Var, 27);
            case 28:
                return new obb((d2f) obj2, n92Var, 28);
            default:
                return new obb((sff) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 1:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 2:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 3:
                break;
            case 4:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 5:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 6:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 7:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 8:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 9:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 10:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 11:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 12:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 13:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 14:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 15:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 16:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 17:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 18:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 19:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 20:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 21:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 22:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 23:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 24:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 25:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 26:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 27:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 28:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            default:
                ((obb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        int i2 = 3;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        Object[] objArr4 = 0;
        c1e c1eVar = c1e.a;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                MainActivity mainActivity = ((bf7) obj2).a;
                int i3 = MainActivity.H;
                sg7 sg7VarV = mainActivity.v();
                if (!sg7VarV.C) {
                    sg7VarV.C = true;
                    km4.I(wld.a, null, "Find your friends presented", new Object[0], "Find your friends presented");
                    cx2 cx2Var = sg7VarV.t;
                    String string = Locale.getDefault().toString();
                    string.getClass();
                    String str = sg7VarV.B;
                    String str2 = sg7VarV.z;
                    cx2Var.getClass();
                    str.getClass();
                    str2.getClass();
                    rqd.a(cx2Var.a, new FindYourFriendsPresented(null, string, null, 5, null), "", str, false, null, str2, 24);
                }
                break;
            case 1:
                br7.v(obj);
                ar5 ar5Var = ((pq5) obj2).a.a;
                yx2 yx2Var = ar5Var.d;
                String str3 = ar5Var.b;
                String strU = gp7.u(ar5Var.m);
                String str4 = ar5Var.l;
                yx2Var.getClass();
                str3.getClass();
                str4.getClass();
                rqd.a(yx2Var.a, new ReactivateMembershipPresented(null, null, null, 7, null), str3, strU, false, null, str4, 24);
                break;
            case 2:
                br7.v(obj);
                gvb gvbVar = (gvb) obj2;
                if (!gvbVar.n) {
                    gvbVar.n = true;
                    cx2 cx2Var2 = gvbVar.d;
                    String str5 = gvbVar.b;
                    String strU2 = gp7.u(gvbVar.m);
                    String str6 = gvbVar.l;
                    cx2Var2.getClass();
                    str5.getClass();
                    str6.getClass();
                    rqd.a(cx2Var2.a, new SearchOpened(objArr3 == true ? 1 : 0, objArr2 == true ? 1 : 0, i2, objArr == true ? 1 : 0), str5, strU2, false, null, str6, 24);
                }
                break;
            case 3:
                br7.v(obj);
                break;
            case 4:
                br7.v(obj);
                f3c f3cVarJ1 = ((d2c) obj2).a.j1();
                if (!f3cVarJ1.v) {
                    f3cVarJ1.v = true;
                    f3cVarJ1.q.j(f3cVarJ1.b, f3cVarJ1.A, f3cVarJ1.y);
                    slc slcVar = f3cVarJ1.r;
                    slcVar.getClass();
                    slcVar.a("user.settingsViewed", nl4.ENABLE_SPRIG_EVENT_USER_SETTINGS_VIEWED, fy3.a);
                }
                break;
            case 5:
                br7.v(obj);
                wac wacVar = ((eac) obj2).b;
                wacVar.f.c(wacVar.k, wacVar.i, wacVar.j, wacVar.c);
                break;
            case 6:
                br7.v(obj);
                sdc sdcVar = ((cbc) obj2).b;
                sdcVar.g.c(sdcVar.m, sdcVar.k, sdcVar.l, sdcVar.d);
                break;
            case 7:
                br7.v(obj);
                xmc xmcVar = ((omc) obj2).a;
                if (!xmcVar.g) {
                    xmcVar.g = true;
                    xmcVar.d.j(xmcVar.b, xmcVar.e, xmcVar.f);
                }
                break;
            case 8:
                br7.v(obj);
                uoc uocVar = (uoc) obj2;
                if (!uocVar.t) {
                    uocVar.t = true;
                    uocVar.j.j(uocVar.c, gp7.u(uocVar.o), uocVar.n);
                }
                if (!uocVar.l.a) {
                    xpc xpcVar = uocVar.u;
                    xpcVar.getClass();
                    xpcVar.m(null, loc.a);
                }
                break;
            case 9:
                br7.v(obj);
                jpc jpcVar = ((cpc) obj2).b;
                String str7 = jpcVar.b;
                String str8 = jpcVar.j;
                String str9 = jpcVar.i;
                if (!jpcVar.h) {
                    jpcVar.h = true;
                    a13 a13Var = jpcVar.g;
                    a13Var.getClass();
                    str9.getClass();
                    str8.getClass();
                    str7.getClass();
                    rqd.a(a13Var.a, new OnboardingFollowPageViewed(null, "onboarding_starter_packs_categories", a13Var.b.n(), "app", null, 17, null), str7, str8, false, null, str9, 24);
                    jpcVar.f.j(str7, str8, str9);
                }
                break;
            case 10:
                br7.v(obj);
                zsc zscVar = (zsc) obj2;
                if (!zscVar.k) {
                    zscVar.k = true;
                    zscVar.g.j(zscVar.c, gp7.u(zscVar.j), zscVar.i);
                    slc slcVar2 = zscVar.h;
                    slcVar2.getClass();
                    nl4 nl4Var = nl4.ENABLE_SPRIG_EVENT_WRITER_STATS_VIEWED;
                    Map mapSingletonMap = Collections.singletonMap("writerStats.surface", "user");
                    mapSingletonMap.getClass();
                    slcVar2.a("writer.statsViewed", nl4Var, mapSingletonMap);
                }
                break;
            case 11:
                br7.v(obj);
                qxc qxcVar = ((gxc) obj2).b;
                if (!qxcVar.h) {
                    qxcVar.h = true;
                    qxcVar.e.j(qxcVar.b, gp7.u(qxcVar.g), qxcVar.f);
                }
                break;
            case 12:
                br7.v(obj);
                j2d j2dVar = ((q1d) obj2).a;
                if (!j2dVar.r) {
                    j2dVar.r = true;
                    j2dVar.n.j(j2dVar.b, gp7.u(j2dVar.p), j2dVar.o);
                }
                break;
            case 13:
                br7.v(obj);
                j4d j4dVar = ((e4d) obj2).b;
                if (!j4dVar.g) {
                    j4dVar.g = true;
                    j4dVar.c.j(j4dVar.b, j4dVar.f, j4dVar.e);
                }
                break;
            case 14:
                br7.v(obj);
                p8d p8dVar = ((h8d) obj2).a;
                String str10 = p8dVar.b;
                String str11 = p8dVar.c;
                if (!p8dVar.i) {
                    p8dVar.i = true;
                    p8dVar.g.j(str11, p8dVar.e(), "topic_explore/" + str10);
                    ax2 ax2Var = p8dVar.f;
                    ax2Var.getClass();
                    str10.getClass();
                    rqd.a(ax2Var.b, new TopicDirectoryViewed(null, str10, null, 5, null), str11, p8dVar.e(), false, null, "topic_explore/" + str10, 24);
                }
                break;
            case 15:
                br7.v(obj);
                had hadVar = ((t9d) obj2).a;
                String str12 = hadVar.o;
                String str13 = hadVar.c;
                if (!hadVar.r) {
                    hadVar.r = true;
                    ax2 ax2Var2 = hadVar.i;
                    String str14 = hadVar.b;
                    String str15 = hadVar.q;
                    ax2Var2.getClass();
                    str14.getClass();
                    str13.getClass();
                    str15.getClass();
                    str12.getClass();
                    rqd.a(ax2Var2.b, new TagRecommendedStoriesViewed(null, null, str14, null, Boolean.TRUE, null, 43, null), str13, str15, false, null, str12, 24);
                    hadVar.j.j(str13, gp7.u(hadVar.p), str12);
                }
                break;
            case 16:
                br7.v(obj);
                odd oddVar = ((lbd) obj2).a;
                if (!oddVar.Q) {
                    oddVar.Q = true;
                    oddVar.A.j(oddVar.c, oddVar.e(), oddVar.P);
                }
                break;
            case 17:
                br7.v(obj);
                ((l78) obj2).setValue(Boolean.FALSE);
                break;
            case 18:
                br7.v(obj);
                qed qedVar = ((aed) obj2).a;
                if (!qedVar.r) {
                    qedVar.r = true;
                    qedVar.l.j(qedVar.c, gp7.u(qedVar.q), qedVar.p);
                }
                break;
            case 19:
                br7.v(obj);
                fqd fqdVar = ((mpd) obj2).b;
                String str16 = fqdVar.b;
                String str17 = fqdVar.p;
                String str18 = fqdVar.n;
                if (!fqdVar.m) {
                    fqdVar.m = true;
                    a13 a13Var2 = fqdVar.g;
                    a13Var2.getClass();
                    str18.getClass();
                    str17.getClass();
                    str16.getClass();
                    rqd.a(a13Var2.a, new OnboardingFollowPageViewed(null, "topic", a13Var2.b.n(), "app", null, 17, null), str16, str17, false, null, str18, 24);
                    fqdVar.h.j(str16, str17, str18);
                }
                break;
            case 20:
                br7.v(obj);
                e2e e2eVar = (e2e) obj2;
                if (!e2eVar.m) {
                    e2eVar.m = true;
                    a13 a13Var3 = e2eVar.f;
                    String str19 = e2eVar.j;
                    String str20 = e2eVar.b;
                    String strU3 = gp7.u(e2eVar.k);
                    l3d l3dVar = l3d.MEDIUM;
                    SusiOperation susiOperation = e2eVar.l;
                    a13Var3.getClass();
                    susiOperation.getClass();
                    str19.getClass();
                    str20.getClass();
                    rqd.a(a13Var3.a, new SignUpSignInUnrecognizedEmailViewed(null, "app", susiOperation.getValue(), a13Var3.b.p(), l3dVar != null ? l3dVar.getValue() : null, null, 33, null), str20, strU3, false, null, str19, 24);
                }
                break;
            case 21:
                br7.v(obj);
                d dVar = ((s3e) obj2).b;
                if (!dVar.m) {
                    dVar.m = true;
                    dVar.i.j(dVar.c, gp7.u(dVar.l), dVar.k);
                }
                break;
            case 22:
                br7.v(obj);
                sae saeVar = ((lae) obj2).a;
                if (!saeVar.g) {
                    saeVar.g = true;
                    saeVar.d.j(saeVar.b, saeVar.e, saeVar.f);
                }
                break;
            case 23:
                br7.v(obj);
                ((cie) obj2).o.l(null);
                break;
            case 24:
                br7.v(obj);
                ((ihe) obj2).h();
                break;
            case 25:
                br7.v(obj);
                wve wveVar = (wve) obj2;
                vve vveVar = wveVar.c;
                if (vveVar != null) {
                    vveVar.d();
                }
                wveVar.c = null;
                break;
            case 26:
                br7.v(obj);
                j2f j2fVar = (j2f) obj2;
                CookieManager cookieManager = (CookieManager) j2fVar.b.getValue();
                if (cookieManager != null) {
                    for (aa2 aa2Var : j2fVar.c.b()) {
                        cookieManager.setCookie(j2f.a(aa2Var), aa2Var.toString());
                    }
                }
                break;
            case 27:
                br7.v(obj);
                t2f t2fVar = (t2f) obj2;
                if (!t2fVar.h) {
                    t2fVar.h = true;
                    vx0.c0(f76.F(t2fVar), null, null, new ood(t2fVar, objArr4 == true ? 1 : 0, 6), 3);
                }
                break;
            case 28:
                br7.v(obj);
                i iVar = (i) ((d2f) obj2).c;
                String str21 = iVar.c;
                String str22 = iVar.i;
                if (!iVar.j) {
                    iVar.j = true;
                    String strU4 = gp7.u(iVar.e());
                    iVar.d.k(iVar.g, str21, strU4, str22);
                    iVar.e.j(str21, strU4, str22);
                }
                break;
            default:
                br7.v(obj);
                ((sff) obj2).o.l(null);
                break;
        }
        return c1eVar;
    }
}
