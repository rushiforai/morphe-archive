package com.vungle.ads.internal.ui;

import a5.a1;
import a5.h2;
import a5.i2;
import a5.j2;
import a5.s0;
import android.app.Activity;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.widget.FrameLayout;
import android.window.OnBackInvokedCallback;
import androidx.core.graphics.Insets;
import b.c0;
import com.google.android.gms.internal.measurement.v6;
import com.vungle.ads.AdCantPlayWithoutWebView;
import com.vungle.ads.AdConfig;
import com.vungle.ads.AdNotLoadedCantPlay;
import com.vungle.ads.ConcurrentPlaybackUnsupported;
import com.vungle.ads.VungleError;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.k2;
import com.vungle.ads.internal.model.i0;
import com.vungle.ads.internal.model.j3;
import com.vungle.ads.internal.model.s3;
import com.vungle.ads.internal.presenter.f0;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.v0;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class l extends Activity {

    /* renamed from: h, reason: collision with root package name */
    public static volatile v0 f47572h;

    /* renamed from: i, reason: collision with root package name */
    public static volatile com.vungle.ads.internal.presenter.a f47573i;

    /* renamed from: a, reason: collision with root package name */
    public com.vungle.ads.internal.presenter.r f47574a;

    /* renamed from: b, reason: collision with root package name */
    public s3 f47575b;

    /* renamed from: c, reason: collision with root package name */
    public Object f47576c;

    /* renamed from: e, reason: collision with root package name */
    public com.vungle.ads.internal.util.s f47578e;

    /* renamed from: d, reason: collision with root package name */
    public final com.vungle.ads.internal.util.w f47577d = new com.vungle.ads.internal.util.w();

    /* renamed from: f, reason: collision with root package name */
    public final b f47579f = new b(this);

    /* renamed from: g, reason: collision with root package name */
    public final AtomicBoolean f47580g = new AtomicBoolean(false);

    static {
        new a();
    }

    public static final void b(l this$0) {
        Intrinsics.g(this$0, "this$0");
        com.vungle.ads.internal.presenter.r rVar = this$0.f47574a;
        if (rVar != null) {
            rVar.d();
        }
    }

    @Override // android.app.Activity
    public final void onActivityResult(int i5, int i11, Intent intent) {
        super.onActivityResult(i5, i11, intent);
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.a("AdActivity", new c(i5, i11, intent));
        if (i5 == 10001) {
            this.f47580g.set(false);
            com.vungle.ads.internal.presenter.r rVar = this.f47574a;
            if (rVar != null) {
                String strH = c0.h(i11, "onActivityResultCode=");
                k2 k2Var = new k2(Sdk.SDKMetric.SDKMetricType.INLINE_INSTALL_STATUS);
                k2Var.f46865c = 1L;
                AnalyticsClient.INSTANCE.a(k2Var, rVar.b(), strH);
            }
        }
    }

    @Override // android.app.Activity
    public final void onBackPressed() {
        com.vungle.ads.internal.presenter.r rVar = this.f47574a;
        if (rVar != null) {
            rVar.d();
        }
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration newConfig) {
        Intrinsics.g(newConfig, "newConfig");
        try {
            super.onConfigurationChanged(newConfig);
            int i5 = newConfig.orientation;
            if (i5 == 2) {
                boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("AdActivity", "landscape");
            } else if (i5 == 1) {
                boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("AdActivity", "portrait");
            }
            com.vungle.ads.internal.presenter.r rVar = this.f47574a;
            if (rVar != null) {
                rVar.g();
            }
        } catch (Exception e3) {
            boolean z13 = com.vungle.ads.internal.util.u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("onConfigurationChanged: ");
            sbA.append(e3.getLocalizedMessage());
            com.vungle.ads.internal.util.t.b("AdActivity", sbA.toString());
        }
    }

    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) {
        String watermark$vungle_ads_release;
        View decorView;
        super.onCreate(bundle);
        requestWindowFeature(1);
        getWindow().setFlags(16777216, 16777216);
        v0 v0Var = f47572h;
        com.vungle.ads.internal.presenter.a aVar = f47573i;
        if (v0Var == null) {
            Intent intent = getIntent();
            Intrinsics.f(intent, "intent");
            String strB = a.b(intent);
            if (strB == null) {
                strB = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            if (aVar != null) {
                aVar.a(new AdNotLoadedCantPlay(c0.l("Can not play fullscreen ad. placement=", strB, " pendingData is null")).setLogEntry$vungle_ads_release(this.f47578e).logError$vungle_ads_release(), strB);
            }
            finish();
            return;
        }
        i0 i0VarA = v0Var.a();
        j3 j3VarB = v0Var.b();
        com.vungle.ads.internal.presenter.z zVarC = v0Var.c();
        this.f47578e = i0VarA.q();
        try {
            com.vungle.ads.internal.ui.view.j jVar = new com.vungle.ads.internal.ui.view.j(this, i0VarA.h());
            mk.v.P(getWindow(), false);
            long j11 = getIntent().getBooleanExtra("ad_invisible_logged", false) ? 3L : 2L;
            AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
            k2 k2Var = new k2(Sdk.SDKMetric.SDKMetricType.AD_VISIBILITY);
            k2Var.a(Long.valueOf(j11));
            AnalyticsClient.a(analyticsClient, k2Var, this.f47578e, 4);
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("AdActivity", "Log metric AD_VISIBILITY: " + j11);
            LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71679a;
            Lazy lazyB = LazyKt.b(lazyThreadSafetyMode, new d(this));
            Intent intent2 = getIntent();
            Intrinsics.f(intent2, "intent");
            String strA = a.a(intent2);
            FrameLayout frameLayout = null;
            s3 s3Var = strA != null ? new s3(strA) : null;
            this.f47575b = s3Var;
            if (s3Var != null) {
                ((com.vungle.ads.internal.signals.j) lazyB.getValue()).a(s3Var);
            }
            jVar.setCloseDelegate(new h(this, lazyB));
            jVar.setOnViewTouchListener(new i(this));
            jVar.setOrientationDelegate(new j(this));
            Lazy lazyB2 = LazyKt.b(lazyThreadSafetyMode, new e(this));
            Lazy lazyB3 = LazyKt.b(lazyThreadSafetyMode, new f(this));
            com.vungle.ads.internal.executor.j jVarF = ((com.vungle.ads.internal.executor.d) ((com.vungle.ads.internal.executor.a) lazyB2.getValue())).f();
            ReentrantLock reentrantLock = f0.f47373a;
            z zVarA = f0.a(i0VarA, j3VarB, jVarF, (com.vungle.ads.internal.platform.f) lazyB3.getValue());
            com.vungle.ads.internal.omsdk.d dVar = (com.vungle.ads.internal.omsdk.d) LazyKt.b(lazyThreadSafetyMode, new g(this)).getValue();
            boolean zC = i0VarA.C();
            dVar.getClass();
            com.vungle.ads.internal.omsdk.e eVarA = com.vungle.ads.internal.omsdk.d.a(zC);
            com.vungle.ads.internal.executor.j jVarD = ((com.vungle.ads.internal.executor.d) ((com.vungle.ads.internal.executor.a) lazyB2.getValue())).d();
            zVarA.a(eVarA);
            this.f47577d.a(zVarA);
            com.vungle.ads.internal.presenter.r rVar = new com.vungle.ads.internal.presenter.r(jVar, i0VarA, j3VarB, zVarA, jVarD, eVarA, (com.vungle.ads.internal.platform.f) lazyB3.getValue());
            rVar.a(aVar);
            rVar.a(zVarC);
            rVar.a(new k(this));
            rVar.h();
            setContentView(jVar, jVar.getLayoutParams());
            try {
                int i5 = Result.f71687b;
                getWindow().getDecorView().setBackgroundColor(-16777216);
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                ResultKt.a(th2);
            }
            k30.e eVar = new k30.e(this, 3);
            WeakHashMap weakHashMap = a1.f250a;
            s0.l(jVar, eVar);
            Window window = getWindow();
            v6 v6Var = new v6(getWindow().getDecorView());
            int i12 = Build.VERSION.SDK_INT;
            p10.c0 k2Var2 = i12 >= 35 ? new a5.k2(window, v6Var) : i12 >= 30 ? new j2(window, v6Var) : new i2(window, v6Var);
            k2Var2.Z();
            k2Var2.J(7);
            AdConfig adConfigJ = i0VarA.j();
            if (adConfigJ != null && (watermark$vungle_ads_release = adConfigJ.getWatermark$vungle_ads_release()) != null) {
                Window window2 = getWindow();
                if (window2 != null && (decorView = window2.getDecorView()) != null) {
                    frameLayout = (FrameLayout) decorView.findViewById(16908290);
                }
                if (frameLayout != null) {
                    a0 a0Var = new a0(this, watermark$vungle_ads_release);
                    frameLayout.addView(a0Var);
                    a0Var.bringToFront();
                }
            }
            this.f47574a = rVar;
            if (Build.VERSION.SDK_INT >= 33) {
                a();
            }
            com.vungle.ads.internal.util.d dVar2 = com.vungle.ads.internal.util.d.f47677f;
            com.vungle.ads.internal.util.a.a(this.f47579f);
            try {
                registerReceiver(this.f47577d, new IntentFilter("android.media.RINGER_MODE_CHANGED"));
            } catch (Throwable th3) {
                int i13 = Result.f71687b;
                ResultKt.a(th3);
            }
        } catch (InstantiationException e3) {
            if (aVar != null) {
                aVar.a(new AdCantPlayWithoutWebView(e3.getMessage()).setLogEntry$vungle_ads_release(this.f47578e).logError$vungle_ads_release(), j3VarB.b());
            }
            finish();
        }
    }

    @Override // android.app.Activity
    public final void onDestroy() {
        if (Build.VERSION.SDK_INT >= 33) {
            Object obj = this.f47576c;
            OnBackInvokedCallback onBackInvokedCallbackI = com.instabridge.mobilesdk.internal.esim.a.z(obj) ? com.instabridge.mobilesdk.internal.esim.a.i(obj) : null;
            if (onBackInvokedCallbackI != null) {
                getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(onBackInvokedCallbackI);
            }
            this.f47576c = null;
        }
        com.vungle.ads.internal.presenter.r rVar = this.f47574a;
        if (rVar != null) {
            rVar.a((isChangingConfigurations() ? 1 : 0) | 2);
        }
        com.vungle.ads.internal.presenter.r rVar2 = this.f47574a;
        if (rVar2 != null) {
            rVar2.a((k) null);
        }
        com.vungle.ads.internal.util.d dVar = com.vungle.ads.internal.util.d.f47677f;
        com.vungle.ads.internal.util.a.b(this.f47579f);
        try {
            int i5 = Result.f71687b;
            unregisterReceiver(this.f47577d);
            Unit unit = Unit.f71706a;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            ResultKt.a(th2);
        }
        this.f47574a = null;
        f47573i = null;
        f47572h = null;
        super.onDestroy();
    }

    @Override // android.app.Activity
    public final void onNewIntent(Intent intent) {
        Intrinsics.g(intent, "intent");
        super.onNewIntent(intent);
        Intent intent2 = getIntent();
        Intrinsics.f(intent2, "getIntent()");
        String strB = a.b(intent2);
        String strB2 = a.b(intent);
        Intent intent3 = getIntent();
        Intrinsics.f(intent3, "getIntent()");
        String strA = a.a(intent3);
        String strA2 = a.a(intent);
        if ((strB == null || strB2 == null || strB.equals(strB2)) && (strA == null || strA2 == null || strA.equals(strA2))) {
            return;
        }
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.a("AdActivity", "Tried to play another placement " + strB2 + " while playing " + strB);
        VungleError vungleErrorLogError$vungle_ads_release = new ConcurrentPlaybackUnsupported(c0.n("Trying to show ", strB2, " but ", strB, " is already showing")).setLogEntry$vungle_ads_release(this.f47578e).logError$vungle_ads_release();
        com.vungle.ads.internal.presenter.a aVar = f47573i;
        if (aVar != null) {
            aVar.a(vungleErrorLogError$vungle_ads_release, strB2);
        }
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("onConcurrentPlaybackError: ");
        sbA.append(vungleErrorLogError$vungle_ads_release.getLocalizedMessage());
        com.vungle.ads.internal.util.t.b("AdActivity", sbA.toString());
    }

    @Override // android.app.Activity
    public final void onPause() {
        super.onPause();
        com.vungle.ads.internal.presenter.r rVar = this.f47574a;
        if (rVar != null) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("MRAIDPresenter", "stop()");
            rVar.f47392a.b();
            rVar.f47395d.b(false);
        }
    }

    @Override // android.app.Activity
    public final void onResume() {
        super.onResume();
        com.vungle.ads.internal.presenter.r rVar = this.f47574a;
        if (rVar != null) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("MRAIDPresenter", "start()");
            rVar.f47392a.d();
            rVar.f47395d.b(true);
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        if (z11) {
            Window window = getWindow();
            v6 v6Var = new v6(getWindow().getDecorView());
            int i5 = Build.VERSION.SDK_INT;
            p10.c0 k2Var = i5 >= 35 ? new a5.k2(window, v6Var) : i5 >= 30 ? new j2(window, v6Var) : new i2(window, v6Var);
            k2Var.Z();
            k2Var.J(7);
        }
    }

    @Override // android.app.Activity
    public final void setRequestedOrientation(int i5) {
        super.setRequestedOrientation(i5);
    }

    public static final com.vungle.ads.internal.signals.j a(Lazy lazy) {
        return (com.vungle.ads.internal.signals.j) lazy.getValue();
    }

    public static final h2 a(l this$0, View v11, h2 insets) {
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(v11, "v");
        Intrinsics.g(insets, "insets");
        if (!this$0.f47580g.get()) {
            Insets insetsG = insets.f296a.g(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE);
            Intrinsics.f(insetsG, "insets.getInsets(\n      …t()\n                    )");
            v11.setPadding(insetsG.left, insetsG.top, insetsG.right, insetsG.bottom);
        }
        return insets;
    }

    public final void a() {
        m.z zVar = new m.z(this, 1);
        this.f47576c = zVar;
        getOnBackInvokedDispatcher().registerOnBackInvokedCallback(0, zVar);
    }
}
