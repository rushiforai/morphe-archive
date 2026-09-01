package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.os.Parcelable;
import android.view.ViewGroup;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import coil3.request.NullRequestDataException;
import com.medium.android.profile.ui.view.UserProfileReference;
import com.medium.android.profile.ui.view.UserProfileTab;
import com.medium.android.profile.ui.view.m;
import com.medium.stats.ui.user.UserStatsTab;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pi9 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ pi9(Parcelable parcelable, String str, Object obj, int i) {
        this.a = i;
        this.b = parcelable;
        this.d = str;
        this.c = obj;
    }

    private final Object a(Object obj) {
        final lid lidVar = (lid) this.b;
        sb2 sb2Var = (sb2) this.c;
        Context context = (Context) this.d;
        ugd ugdVar = (ugd) obj;
        x68 x68Var = ugdVar.a;
        x68 x68Var2 = ugdVar.a;
        jhd jhdVar = jhd.b;
        x68Var.a(jhdVar);
        ghd ghdVar = ghd.Cut;
        final int i = 0;
        int i2 = 1;
        boolean z = (bkd.c(lidVar.l().b) || !lidVar.h() || lidVar.g == null) ? false : true;
        n92 n92Var = null;
        int i3 = 18;
        nbb nbbVar = new nbb(sb2Var, i3, new gid(lidVar, n92Var, i2));
        Resources resources = context.getResources();
        int i4 = 25;
        pda pdaVar = new pda(nbbVar, i4, n92Var);
        if (z) {
            x68Var2.a(new fhd(ghdVar.getKey(), resources.getString(ghdVar.m112getStringId9Hzcbyc()), ghdVar.m111getDrawableId3I4p1mQ(), pdaVar));
        }
        ghd ghdVar2 = ghd.Copy;
        boolean z2 = (bkd.c(lidVar.l().b) || lidVar.g == null) ? false : true;
        final int i5 = 2;
        nbb nbbVar2 = new nbb(sb2Var, i3, new gid(lidVar, n92Var, i5));
        Resources resources2 = context.getResources();
        pda pdaVar2 = new pda(nbbVar2, i4, n92Var);
        if (z2) {
            x68Var2.a(new fhd(ghdVar2.getKey(), resources2.getString(ghdVar2.m112getStringId9Hzcbyc()), ghdVar2.m111getDrawableId3I4p1mQ(), pdaVar2));
        }
        ghd ghdVar3 = ghd.Paste;
        boolean z3 = lidVar.h() && ((Boolean) lidVar.w.getValue()).booleanValue() && lidVar.g != null;
        nbb nbbVar3 = new nbb(sb2Var, i3, new gid(lidVar, n92Var, 3));
        Resources resources3 = context.getResources();
        pda pdaVar3 = new pda(nbbVar3, i4, n92Var);
        if (z3) {
            x68Var2.a(new fhd(ghdVar3.getKey(), resources3.getString(ghdVar3.m112getStringId9Hzcbyc()), ghdVar3.m111getDrawableId3I4p1mQ(), pdaVar3));
        }
        ghd ghdVar4 = ghd.SelectAll;
        boolean z4 = bkd.d(lidVar.l().b) != lidVar.l().a.b.length();
        m45 m45Var = new m45() { // from class: pid
            @Override // defpackage.m45
            public final Object invoke() {
                int i6 = i;
                c1e c1eVar = c1e.a;
                lid lidVar2 = lidVar;
                switch (i6) {
                    case 0:
                        break;
                    case 1:
                        uid uidVarB = lid.b(lidVar2.l().a, lk7.q(0, lidVar2.l().a.b.length()));
                        lidVar2.c.invoke(uidVarB);
                        long j = uidVarB.b;
                        lidVar2.v = new bkd(j);
                        lidVar2.t = uid.a(lidVar2.t, null, j, 5);
                        lidVar2.e(true);
                        break;
                    default:
                        m45 m45Var2 = lidVar2.f;
                        if (m45Var2 != null) {
                            m45Var2.invoke();
                        }
                        break;
                }
                return c1eVar;
            }
        };
        final int i6 = 1;
        m45 m45Var2 = new m45() { // from class: pid
            @Override // defpackage.m45
            public final Object invoke() {
                int i62 = i6;
                c1e c1eVar = c1e.a;
                lid lidVar2 = lidVar;
                switch (i62) {
                    case 0:
                        break;
                    case 1:
                        uid uidVarB = lid.b(lidVar2.l().a, lk7.q(0, lidVar2.l().a.b.length()));
                        lidVar2.c.invoke(uidVarB);
                        long j = uidVarB.b;
                        lidVar2.v = new bkd(j);
                        lidVar2.t = uid.a(lidVar2.t, null, j, 5);
                        lidVar2.e(true);
                        break;
                    default:
                        m45 m45Var22 = lidVar2.f;
                        if (m45Var22 != null) {
                            m45Var22.invoke();
                        }
                        break;
                }
                return c1eVar;
            }
        };
        Resources resources4 = context.getResources();
        pda pdaVar4 = new pda(m45Var2, i4, m45Var);
        if (z4) {
            x68Var2.a(new fhd(ghdVar4.getKey(), resources4.getString(ghdVar4.m112getStringId9Hzcbyc()), ghdVar4.m111getDrawableId3I4p1mQ(), pdaVar4));
        }
        if (Build.VERSION.SDK_INT >= 26) {
            ghd ghdVar5 = ghd.Autofill;
            if (lidVar.h() && bkd.c(lidVar.l().b)) {
                i = 1;
            }
            m45 m45Var3 = new m45() { // from class: pid
                @Override // defpackage.m45
                public final Object invoke() {
                    int i62 = i5;
                    c1e c1eVar = c1e.a;
                    lid lidVar2 = lidVar;
                    switch (i62) {
                        case 0:
                            break;
                        case 1:
                            uid uidVarB = lid.b(lidVar2.l().a, lk7.q(0, lidVar2.l().a.b.length()));
                            lidVar2.c.invoke(uidVarB);
                            long j = uidVarB.b;
                            lidVar2.v = new bkd(j);
                            lidVar2.t = uid.a(lidVar2.t, null, j, 5);
                            lidVar2.e(true);
                            break;
                        default:
                            m45 m45Var22 = lidVar2.f;
                            if (m45Var22 != null) {
                                m45Var22.invoke();
                            }
                            break;
                    }
                    return c1eVar;
                }
            };
            Resources resources5 = context.getResources();
            pda pdaVar5 = new pda(m45Var3, i4, n92Var);
            if (i != 0) {
                x68Var2.a(new fhd(ghdVar5.getKey(), resources5.getString(ghdVar5.m112getStringId9Hzcbyc()), ghdVar5.m111getDrawableId3I4p1mQ(), pdaVar5));
            }
        }
        x68Var2.a(jhdVar);
        return c1e.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private final Object d(Object obj) {
        e3e e3eVar = (e3e) this.b;
        b3e b3eVar = (b3e) this.c;
        gx5 gx5Var = (gx5) this.d;
        zv6 zv6Var = (zv6) obj;
        zv6Var.getClass();
        az5 az5Var = e3eVar.a;
        a3e a3eVar = a3e.b;
        zv6Var.r.e(((t0) az5Var).getSize(), new yv6(new lba(az5Var), new lba(az5Var, 18), null, new mz1(new o37(az5Var, b3eVar, gx5Var, 8), true, -334987442)));
        if (e3eVar.c) {
            ev6.k(zv6Var, "more-1", pxf.A);
            ev6.k(zv6Var, "more-2", pxf.B);
            ev6.k(zv6Var, "more-3", pxf.C);
        }
        return c1e.a;
    }

    private final Object g(Object obj) {
        f9e f9eVar = (f9e) this.b;
        n8e n8eVar = (n8e) this.c;
        sh9 sh9Var = (sh9) this.d;
        xu6 xu6Var = (xu6) obj;
        xu6Var.getClass();
        List list = f9eVar.a;
        xu6Var.l0(list.size(), new j8e(new n2c(15), 0, list), new lba(list, 20), new mz1(new o37(list, n8eVar, sh9Var, 9), true, 2039820996));
        if (f9eVar.b) {
            ev6.j(xu6Var, "loading_more", hlg.c, 2);
        }
        if (!f9eVar.d) {
            ev6.j(xu6Var, "end_of_feed", hlg.d, 2);
        }
        return c1e.a;
    }

    private final Object h(Object obj) {
        String str = (String) this.d;
        nee neeVar = (nee) this.b;
        efe efeVar = (efe) this.c;
        Context context = (Context) obj;
        context.getClass();
        WebView webView = new WebView(context);
        webView.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        webView.setWebViewClient(new lee(neeVar, efeVar));
        webView.setWebChromeClient(new WebChromeClient());
        webView.loadDataWithBaseURL("file:///android_res/", str, "text/html; charset=utf-8", "utf8", null);
        return webView;
    }

    private final Object i(Object obj) {
        UserProfileReference userProfileReference = (UserProfileReference) this.b;
        UserProfileTab userProfileTab = (UserProfileTab) this.c;
        String str = (String) this.d;
        so2 so2Var = (so2) obj;
        so2Var.getClass();
        eo2 eo2Var = so2Var.a;
        ys2 ys2Var = (ys2) eo2Var.e;
        lod lodVarJ = ys2Var.j();
        ble bleVarN = ys2Var.N();
        ko2 ko2Var = ys2Var.b;
        f88 f88Var = new f88(bleVarN, ko2Var.z());
        o2b o2bVarA = ys2Var.A();
        f88 f88VarG = ys2Var.G();
        o2b o2bVarJ = ys2Var.J();
        mya myaVar = new mya(ys2Var.N(), 17, ko2Var.z());
        eoc eocVarK = ys2Var.K();
        hhe hheVar = new hhe(ys2Var.N());
        ko2 ko2Var2 = eo2Var.b;
        og3 og3VarD = ko2Var2.d();
        hha hhaVarQ = ys2Var.Q();
        i03 i03Var = i03.a;
        tz7 tz7Var = new tz7(19);
        ax2 ax2VarM = ko2Var2.m();
        ax2 ax2Var = new ax2(ko2Var2.x(), 9);
        ax2 ax2VarT = ko2Var2.t();
        s26 s26VarZ = ko2Var2.z();
        slc slcVar = (slc) ko2Var2.G.get();
        dm4 dm4Var = (dm4) ko2Var2.j.get();
        r13 r13Var = xg3.a;
        iq7.s(r13Var);
        return new m(userProfileReference, userProfileTab, str, lodVarJ, f88Var, o2bVarA, f88VarG, o2bVarJ, myaVar, eocVarK, hheVar, og3VarD, hhaVarQ, tz7Var, ax2VarM, ax2Var, ax2VarT, s26VarZ, slcVar, dm4Var, r13Var, ys2Var.a);
    }

    private final Object j(Object obj) {
        yle yleVar = (yle) this.b;
        k8b k8bVar = (k8b) this.c;
        sh9 sh9Var = (sh9) this.d;
        xu6 xu6Var = (xu6) obj;
        xu6Var.getClass();
        List list = yleVar.a;
        xu6Var.l0(list.size(), new j8e(new n2c(18), 3, list), new lba(list, 22), new mz1(new o37(list, k8bVar, sh9Var, 10), true, 2039820996));
        if (yleVar.b) {
            ev6.j(xu6Var, "loading_more", gx1.j, 2);
        }
        if (!yleVar.d) {
            ev6.j(xu6Var, "end_of_feed", gx1.k, 2);
        }
        return c1e.a;
    }

    private final Object l(Object obj) {
        String str = (String) this.d;
        UserStatsTab userStatsTab = (UserStatsTab) this.b;
        String str2 = (String) this.c;
        uo2 uo2Var = (uo2) obj;
        uo2Var.getClass();
        r13 r13Var = xg3.a;
        iq7.s(r13Var);
        ys2 ys2Var = (ys2) uo2Var.a.e;
        return new yme(str, userStatsTab, str2, r13Var, ys2Var.a, new s53(ys2Var.N()));
    }

    private final Object n(Object obj) {
        c09 c09Var = (c09) this.b;
        c09 c09Var2 = (c09) this.c;
        c09 c09Var3 = (c09) this.d;
        f90 f90Var = (f90) obj;
        if (f90Var instanceof d90) {
            return c09Var != null ? new d90(c09Var) : (d90) f90Var;
        }
        if (!(f90Var instanceof c90)) {
            return f90Var;
        }
        c90 c90Var = (c90) f90Var;
        r14 r14Var = c90Var.b;
        return r14Var.c instanceof NullRequestDataException ? c09Var2 != null ? new c90(c09Var2, r14Var) : c90Var : c09Var3 != null ? new c90(c09Var3, r14Var) : c90Var;
    }

    private final Object o(Object obj) {
        x45 x45Var = (x45) this.b;
        x45 x45Var2 = (x45) this.c;
        x45 x45Var3 = (x45) this.d;
        f90 f90Var = (f90) obj;
        if (f90Var instanceof d90) {
            if (x45Var != null) {
                x45Var.invoke(f90Var);
            }
        } else if (f90Var instanceof e90) {
            if (x45Var2 != null) {
                x45Var2.invoke(f90Var);
            }
        } else if (f90Var instanceof c90) {
            if (x45Var3 != null) {
                x45Var3.invoke(f90Var);
            }
        } else if (!(f90Var instanceof b90)) {
            ygf.a();
            return null;
        }
        return c1e.a;
    }

    private final Object r(Object obj) {
        Map map = (Map) this.b;
        m45 m45Var = (m45) this.c;
        b55 b55Var = (b55) this.d;
        xu6 xu6Var = (xu6) obj;
        xu6Var.getClass();
        ev6.J(xu6Var, "voice-selector-header", new mz1(new zq(11, m45Var), true, 1381362962));
        if (map.isEmpty()) {
            ev6.j(xu6Var, "voice-selector-item-empty", k40.h, 2);
        } else {
            for (String str : map.keySet()) {
                ev6.j(xu6Var, ka1.r("voice-selector-header-", str), new mz1(new ba1(str, 7), true, 1849870133), 2);
                List list = (List) map.get(str);
                if (list != null) {
                    int i = 19;
                    xu6Var.l0(list.size(), new j8e(new n2c(i), 6, list), new lba(list, 24), new mz1(new oda(list, b55Var, i), true, 2039820996));
                }
            }
        }
        return c1e.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:308:0x0737  */
    @Override // defpackage.x45
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invoke(java.lang.Object r63) throws java.lang.Exception {
        /*
            Method dump skipped, instruction units count: 3314
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pi9.invoke(java.lang.Object):java.lang.Object");
    }

    public /* synthetic */ pi9(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    public /* synthetic */ pi9(String str, Object obj, Object obj2, int i) {
        this.a = i;
        this.d = str;
        this.b = obj;
        this.c = obj2;
    }
}
