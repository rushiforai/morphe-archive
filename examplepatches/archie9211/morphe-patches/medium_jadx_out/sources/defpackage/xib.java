package defpackage;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import com.medium.android.admin.admintools.AdminToolsFragment;
import com.medium.android.admin.flags.FlagsFragment;
import com.medium.android.core.navigation.s;
import com.medium.android.postpage.sharepostfriendlink.a;
import com.medium.android.settings.downloadedcontent.DownloadedContentFragment;
import com.medium.android.settings.main.SettingsFragment;
import com.medium.android.settings.ui.customappicon.c;
import com.medium.android.settings.ui.discoverability.DiscoverabilityFragment;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class xib extends x55 implements m45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xib(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() throws Exception {
        int i = this.a;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                vr7 vr7Var = ((pq5) this.receiver).a.a.c;
                long jCurrentTimeMillis = System.currentTimeMillis();
                vr7Var.getClass();
                vr7Var.B(ek6.RESUBSCRIBE_BANNER_CLOSE_AT, jCurrentTimeMillis);
                return c1eVar;
            case 1:
                elb elbVar = (elb) this.receiver;
                k92 k92Var = elbVar.a;
                if (k92Var == null) {
                    g76.g0("coroutineScope");
                    throw null;
                }
                o7f.m(k92Var, null);
                elbVar.f();
                w73 w73Var = elbVar.e;
                if (w73Var == null) {
                    g76.g0("connectionManager");
                    throw null;
                }
                ((b42) w73Var.g).close();
                v2d v2dVar = (v2d) w73Var.h;
                if (v2dVar != null) {
                    v2dVar.close();
                }
                return c1eVar;
            case 2:
                ((pub) this.receiver).c();
                return c1eVar;
            case 3:
                ((pub) this.receiver).a();
                return c1eVar;
            case 4:
                SettingsFragment settingsFragment = ((d2c) this.receiver).a;
                settingsFragment.Z();
                Context contextS = settingsFragment.S();
                String str = settingsFragment.j1().A;
                str.getClass();
                m4.w(contextS, R.id.customAppIconFragment, c.a(str), null, 12);
                return c1eVar;
            case 5:
                SettingsFragment settingsFragment2 = ((d2c) this.receiver).a;
                settingsFragment2.Z();
                Context contextS2 = settingsFragment2.S();
                String str2 = settingsFragment2.j1().A;
                Bundle bundleA = ho2.A(str2);
                bundleA.putParcelable("bundle_info", new DownloadedContentFragment.BundleInfo(str2));
                m4.w(contextS2, R.id.downloadedContent, bundleA, null, 12);
                return c1eVar;
            case 6:
                SettingsFragment settingsFragment3 = ((d2c) this.receiver).a;
                ((p13) settingsFragment3.Z()).i(settingsFragment3.S(), settingsFragment3.j1().A);
                return c1eVar;
            case 7:
                SettingsFragment settingsFragment4 = ((d2c) this.receiver).a;
                settingsFragment4.Z();
                Context contextS3 = settingsFragment4.S();
                String str3 = settingsFragment4.j1().A;
                Bundle bundleA2 = ho2.A(str3);
                bundleA2.putParcelable("bundle_info", new DiscoverabilityFragment.BundleInfo(str3));
                m4.w(contextS3, R.id.discoverabilityFragment, bundleA2, null, 12);
                return c1eVar;
            case 8:
                SettingsFragment settingsFragment5 = ((d2c) this.receiver).a;
                s sVarZ = settingsFragment5.Z();
                Context contextS4 = settingsFragment5.S();
                settingsFragment5.i1();
                ((p13) sVarZ).f(contextS4, Uri.parse(i03.q), settingsFragment5.j1().A);
                return c1eVar;
            case 9:
                SettingsFragment settingsFragment6 = ((d2c) this.receiver).a;
                py2 py2Var = settingsFragment6.v0;
                if (py2Var == null) {
                    g76.g0("deepLinkHandler");
                    throw null;
                }
                Context contextS5 = settingsFragment6.S();
                settingsFragment6.i1();
                py2Var.a(contextS5, Uri.parse(i03.D), settingsFragment6.j1().A, null);
                return c1eVar;
            case 10:
                SettingsFragment settingsFragment7 = ((d2c) this.receiver).a;
                py2 py2Var2 = settingsFragment7.v0;
                if (py2Var2 == null) {
                    g76.g0("deepLinkHandler");
                    throw null;
                }
                Context contextS6 = settingsFragment7.S();
                settingsFragment7.i1();
                py2Var2.a(contextS6, Uri.parse(i03.E), settingsFragment7.j1().A, null);
                return c1eVar;
            case 11:
                SettingsFragment settingsFragment8 = ((d2c) this.receiver).a;
                ((p13) settingsFragment8.Z()).f0(settingsFragment8.S());
                return c1eVar;
            case 12:
                SettingsFragment settingsFragment9 = ((d2c) this.receiver).a;
                settingsFragment9.Z();
                Context contextS7 = settingsFragment9.S();
                String str4 = settingsFragment9.j1().A;
                Bundle bundleA3 = ho2.A(str4);
                bundleA3.putParcelable("bundle_info", new AdminToolsFragment.BundleInfo(str4));
                m4.w(contextS7, R.id.adminToolsFragment, bundleA3, null, 12);
                return c1eVar;
            case 13:
                SettingsFragment settingsFragment10 = ((d2c) this.receiver).a;
                settingsFragment10.Z();
                Context contextS8 = settingsFragment10.S();
                String str5 = settingsFragment10.j1().A;
                Bundle bundleA4 = ho2.A(str5);
                bundleA4.putParcelable("bundle_info", new FlagsFragment.BundleInfo(str5));
                m4.w(contextS8, R.id.flagsFragment, bundleA4, null, 12);
                return c1eVar;
            case 14:
                xpc xpcVar = ((d2c) this.receiver).a.j1().w;
                xpcVar.getClass();
                xpcVar.m(null, s2c.a);
                return c1eVar;
            case 15:
                SettingsFragment settingsFragment11 = ((d2c) this.receiver).a;
                s sVarZ2 = settingsFragment11.Z();
                Context contextS9 = settingsFragment11.S();
                settingsFragment11.i1();
                ((p13) sVarZ2).f(contextS9, Uri.parse(i03.j), settingsFragment11.j1().A);
                return c1eVar;
            case 16:
                SettingsFragment settingsFragment12 = ((d2c) this.receiver).a;
                ((p13) settingsFragment12.Z()).u(settingsFragment12.S(), settingsFragment12.j1().A);
                return c1eVar;
            case 17:
                SettingsFragment settingsFragment13 = ((d2c) this.receiver).a;
                s sVarZ3 = settingsFragment13.Z();
                Context contextS10 = settingsFragment13.S();
                settingsFragment13.i1();
                ((p13) sVarZ3).f(contextS10, Uri.parse(i03.k), settingsFragment13.j1().A);
                return c1eVar;
            case 18:
                SettingsFragment settingsFragment14 = ((d2c) this.receiver).a;
                ((p13) settingsFragment14.Z()).C(settingsFragment14.S(), settingsFragment14.j1().A);
                return c1eVar;
            case 19:
                f3c f3cVarJ1 = ((d2c) this.receiver).a.j1();
                xpc xpcVar2 = f3cVarJ1.w;
                u2c u2cVar = new u2c(f3cVarJ1.d.a());
                xpcVar2.getClass();
                xpcVar2.m(null, u2cVar);
                return c1eVar;
            case 20:
                SettingsFragment settingsFragment15 = ((d2c) this.receiver).a;
                ((p13) settingsFragment15.Z()).A(settingsFragment15.S(), settingsFragment15.j1().A);
                return c1eVar;
            case 21:
                SettingsFragment settingsFragment16 = ((d2c) this.receiver).a;
                s sVarZ4 = settingsFragment16.Z();
                Context contextS11 = settingsFragment16.S();
                settingsFragment16.i1();
                ((p13) sVarZ4).f(contextS11, Uri.parse(i03.l), settingsFragment16.j1().A);
                return c1eVar;
            case 22:
                f3c f3cVarJ12 = ((d2c) this.receiver).a.j1();
                vx0.c0(f76.F(f3cVarJ12), null, null, new xi7(f3cVarJ12, n92Var, 15), 3);
                return c1eVar;
            case 23:
                ((d2c) this.receiver).a.j1().w.l(null);
                return c1eVar;
            case 24:
                ((d2c) this.receiver).a.j1().w.l(null);
                return c1eVar;
            case 25:
                f3c f3cVarJ13 = ((d2c) this.receiver).a.j1();
                f3cVarJ13.w.l(null);
                vx0.c0(f76.F(f3cVarJ13), null, null, new d3c(f3cVarJ13, n92Var, 1), 3);
                return c1eVar;
            case 26:
                f3c f3cVarJ14 = ((d2c) this.receiver).a.j1();
                vx0.c0(f76.F(f3cVarJ14), null, null, new d3c(f3cVarJ14, n92Var, 0), 3);
                return c1eVar;
            case 27:
                ((d2c) this.receiver).a.j1().w.l(null);
                return c1eVar;
            case 28:
                ((d2c) this.receiver).a.Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            default:
                ((a) ((i5c) this.receiver)).b();
                return c1eVar;
        }
    }
}
