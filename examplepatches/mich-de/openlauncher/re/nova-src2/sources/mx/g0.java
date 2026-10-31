package mx;

import android.content.Context;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.graphics.Rect;
import android.os.Build;
import android.os.HandlerThread;
import android.os.LocaleList;
import b.x1;
import com.android.launcher3.AppWidgetResizeFrame;
import com.android.launcher3.LauncherProvider;
import com.google.android.gms.internal.measurement.ge;
import com.novalauncher.novalytics.stats.internal.DailyMetricsDatabase;
import com.teslacoilsw.launcher.NovaApplication;
import e10.a3;
import e10.y2;
import java.util.List;
import kotlin.LazyKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import o9.t1;
import o9.v1;

/* loaded from: classes.dex */
public final class g0 {

    /* renamed from: a, reason: collision with root package name */
    public static Context f77088a;

    /* renamed from: b, reason: collision with root package name */
    public static LocaleList f77089b;

    /* renamed from: c, reason: collision with root package name */
    public static op.r f77090c;

    /* renamed from: d, reason: collision with root package name */
    public static LauncherProvider f77091d;

    /* renamed from: e, reason: collision with root package name */
    public static float f77092e;

    /* renamed from: f, reason: collision with root package name */
    public static fz.d0 f77093f;

    /* renamed from: g, reason: collision with root package name */
    public static l0 f77094g;

    /* renamed from: h, reason: collision with root package name */
    public static final lh.i f77095h;

    /* renamed from: i, reason: collision with root package name */
    public static y70.d f77096i;

    /* renamed from: j, reason: collision with root package name */
    public static g20.w f77097j;

    /* renamed from: k, reason: collision with root package name */
    public static s10.d0 f77098k;

    /* renamed from: l, reason: collision with root package name */
    public static final kl.q0 f77099l;

    /* renamed from: m, reason: collision with root package name */
    public static final a70.d f77100m;
    public static final a70.d n;

    static {
        LazyKt.a(new h50.q(16));
        kl.q0 q0Var = new kl.q0();
        q0Var.f71629a = EmptyList.f71733a;
        f77099l = q0Var;
        HandlerThread handlerThread = new HandlerThread("appbg");
        handlerThread.start();
        f77095h = handlerThread.getLooper() != null ? new lh.i(handlerThread.getLooper(), 3) : new lh.i();
        f77100m = LazyKt.a(new h50.q(17));
        n = LazyKt.a(new h50.q(18));
    }

    public static void a(Runnable runnable) {
        t70.m0.t(t70.l1.f88818a, null, null, new e0(runnable, (Continuation) null, 0), 3);
    }

    public static void b() {
        ((t1) t1.f80131h.h(e())).f80133b.d();
        a80.e eVar = t70.y0.f88884a;
        t70.m0.t(t70.l1.f88818a, y70.o.f96819a, null, new x1(28), 2);
    }

    public static g20.w c() {
        g20.w wVar = f77097j;
        if (wVar != null) {
            return wVar;
        }
        Intrinsics.m("appShortcutSearchManager");
        throw null;
    }

    public static s10.d0 d() {
        s10.d0 d0Var = f77098k;
        if (d0Var != null) {
            return d0Var;
        }
        Intrinsics.m("branchSearchManager");
        throw null;
    }

    public static Context e() {
        Context context = f77088a;
        if (context != null) {
            return context;
        }
        Intrinsics.m("context");
        throw null;
    }

    public static final SharedPreferences f(Context context) {
        return context.getSharedPreferences("nova", 0);
    }

    public static fz.d0 g() {
        fz.d0 d0Var = f77093f;
        if (d0Var != null) {
            return d0Var;
        }
        Intrinsics.m("iconCache");
        throw null;
    }

    public static String h() {
        l0 l0Var = f77094g;
        if (l0Var == null) {
            Intrinsics.m("invariantDeviceProfile");
            throw null;
        }
        int i5 = l0Var.f80271d;
        y2 y2Var = y2.f51877a;
        return i5 + " " + ((fz.d) y2Var.i().l()).b() + " " + y2Var.E0().l();
    }

    public static op.r i() {
        op.r rVar = f77090c;
        if (rVar != null) {
            return rVar;
        }
        Intrinsics.m("stats");
        throw null;
    }

    public static void j(Context context) {
        lh.i iVar = f77095h;
        if (f77088a != null) {
            return;
        }
        Context applicationContext = context.getApplicationContext();
        f77088a = applicationContext;
        f77089b = applicationContext.getResources().getConfiguration().getLocales();
        androidx.room.m mVarK = fg.a.k(context, DailyMetricsDatabase.class, "daily-metrics");
        int i5 = 0;
        mVarK.f15249l = false;
        int i11 = 1;
        mVarK.f15250m = true;
        x7.f.f95132a = (DailyMetricsDatabase) mVarK.b();
        y2 y2Var = y2.f51877a;
        y2Var.getClass();
        String str = (String) y2.k().l();
        Boolean bool = NovaApplication.f45635g;
        f77090c = new op.r(context, str, fg.a.n());
        k(applicationContext);
        bb.b bVar = (bb.b) bb.b.f17790h.h(applicationContext);
        bVar.onPluginConnected(y00.a.f96546a, applicationContext);
        bVar.onPluginConnected(new y00.b(applicationContext), applicationContext);
        if (((Boolean) y2Var.u1().l()).booleanValue()) {
            bVar.onPluginConnected(new y00.c(applicationContext), applicationContext);
        }
        boolean z11 = h1.f77108b;
        cy.d0 d0Var = cy.d0.f48442a;
        Context applicationContext2 = applicationContext.getApplicationContext();
        y70.d dVar = cy.d0.f48443b;
        a80.e eVar = t70.y0.f88884a;
        Continuation continuation = null;
        t70.m0.t(dVar, a80.d.f488c, null, new b10.v0(applicationContext2, continuation, 2), 2);
        cy.d0 d0Var2 = cy.d0.f48442a;
        cy.d0.C(applicationContext2);
        if (!cy.d0.f48446e) {
            qx.q qVar = qx.q.f84576a;
            cy.a aVar = new cy.a();
            synchronized (qx.q.f84578c) {
                qx.q.f84577b.add(aVar);
            }
            cy.d0.f48446e = true;
        }
        t70.m0.t(dVar, null, null, new cy.t(applicationContext2, continuation, i5), 3);
        try {
            PackageInfo packageInfo = applicationContext.getPackageManager().getPackageInfo("com.teslacoilsw.launcher.prime", 64);
            h1.f77109c = packageInfo.firstInstallTime > System.currentTimeMillis() - ((long) 172800000);
            Signature[] signatureArr = packageInfo.signatures;
            Intrinsics.d(signatureArr);
            int iHashCode = signatureArr[0].hashCode();
            if (iHashCode == -1577060375 || iHashCode == 763259628) {
                h1.f77108b = "com.teslacoilsw.launcher.prime".equals(packageInfo.packageName);
            }
        } catch (PackageManager.NameNotFoundException unused) {
            h1.f77108b = false;
        }
        if (a3.f51435a.f51552h || h1.f77108b) {
            aa.o oVar = h1.f77114h;
            iVar.removeCallbacks(oVar);
            iVar.postDelayed(oVar, 20000L);
        }
        if (w20.m.f93691a) {
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("com.huawei.android.thememanager.applytheme");
            ge geVar = new ge(i11);
            if (Build.VERSION.SDK_INT >= 33) {
                applicationContext.registerReceiver(geVar, intentFilter, "com.android.keyguard.permission.SWITCHTHEME", f77095h, 2);
            } else {
                applicationContext.registerReceiver(geVar, intentFilter, "com.android.keyguard.permission.SWITCHTHEME", iVar);
            }
        }
        IntentFilter intentFilter2 = new IntentFilter();
        intentFilter2.addAction("android.intent.action.PACKAGE_ADDED");
        intentFilter2.addAction("android.intent.action.PACKAGE_REMOVED");
        intentFilter2.addDataScheme("package");
        intentFilter2.addDataSchemeSpecificPart("com.teslacoilsw.launcher.prime", 0);
        intentFilter2.addDataSchemeSpecificPart("com.teslacoilsw.launcherclientproxy", 0);
        applicationContext.registerReceiver(h1.f77117k, intentFilter2);
        l();
        if (f77098k == null) {
            f77098k = new s10.d0(e(), t70.k0.a(EmptyCoroutineContext.f71803a), (ja.h) ja.h.f69294h.h(e()));
        }
        f77099l.j(e());
    }

    public static void k(Context context) {
        Context applicationContext = context.getApplicationContext();
        Intrinsics.e(applicationContext, "null cannot be cast to non-null type com.teslacoilsw.launcher.NovaApplication");
        NovaApplication novaApplication = (NovaApplication) applicationContext;
        novaApplication.f45639a = ab.e0.b(novaApplication);
        Object objH = o9.z0.f80267w.h(novaApplication);
        Intrinsics.e(objH, "null cannot be cast to non-null type com.teslacoilsw.launcher.NovaInvariantDeviceProfile");
        l0 l0Var = (l0) objH;
        f77094g = l0Var;
        if (f77093f == null) {
            List list = v1.f80192a;
            fz.u uVar = novaApplication.f45639a;
            if (uVar == null) {
                Intrinsics.m("iconConfig");
                throw null;
            }
            f77093f = new fz.d0(novaApplication, l0Var, "app_icons.db", uVar, false, true);
        }
        f77092e = novaApplication.getResources().getDisplayMetrics().density;
    }

    public static void l() {
        Continuation continuation = null;
        if (f77097j != null) {
            t70.m0.t(t70.l1.f88818a, null, null, new b10.r0(13), 3);
        }
        y70.d dVar = f77096i;
        if (dVar != null) {
            t70.k0.c(dVar, null);
        }
        y70.d dVarA = t70.k0.a(EmptyCoroutineContext.f71803a);
        f77096i = dVarA;
        f77097j = new g20.w(e(), dVarA);
        t70.m0.t(dVarA, null, null, new f0(2, continuation, 0), 3);
    }

    public static boolean m() {
        return f77088a != null;
    }

    public static boolean n() {
        return ((Boolean) n.getValue()).booleanValue();
    }

    public static boolean o() {
        NovaApplication novaApplication = NovaApplication.f45637i;
        if (novaApplication != null) {
            return ((Boolean) novaApplication.f45640b.getValue()).booleanValue();
        }
        Intrinsics.m("instance");
        throw null;
    }

    public static void p() {
        o9.z0 z0Var;
        Rect rect = AppWidgetResizeFrame.S;
        t1 t1VarD = t1.d();
        if (t1VarD == null || (z0Var = t1VarD.f80136e) == null) {
            return;
        }
        z0Var.h(e());
    }
}
