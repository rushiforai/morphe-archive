package com.teslacoilsw.launcher.novamobile;

import a5.a1;
import a5.i;
import a5.s0;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.ViewParent;
import android.webkit.CookieManager;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import androidx.activity.result.contract.ActivityResultContracts$StartActivityForResult;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;
import as.n;
import ay.k;
import b.x1;
import com.amplitude.android.sessionreplay.SessionReplay;
import com.google.android.material.appbar.MaterialToolbar;
import cv.y;
import cw.c0;
import d00.d;
import d00.e;
import d00.g;
import h6.g1;
import h6.x;
import j.c;
import java.util.List;
import java.util.WeakHashMap;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import m.m;
import r70.j;
import t70.m0;
import t70.y0;
import tx.b4;
import ul.b;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/teslacoilsw/launcher/novamobile/NovaMobileActivity;", "Lm/m;", "<init>", "()V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class NovaMobileActivity extends m {

    /* renamed from: x, reason: collision with root package name */
    public static final List f45911x = b.Q(".novalauncher.com", ".instabridge.com");
    public final b4 o = new b4();

    /* renamed from: p, reason: collision with root package name */
    public final c f45912p = registerForActivityResult(new ActivityResultContracts$StartActivityForResult(), new n(this, 4));

    /* renamed from: q, reason: collision with root package name */
    public WebView f45913q;

    /* renamed from: r, reason: collision with root package name */
    public ProgressBar f45914r;

    /* renamed from: s, reason: collision with root package name */
    public SwipeRefreshLayout f45915s;

    /* renamed from: t, reason: collision with root package name */
    public FrameLayout f45916t;

    /* renamed from: u, reason: collision with root package name */
    public WebView f45917u;

    /* renamed from: v, reason: collision with root package name */
    public Uri f45918v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f45919w;

    public static final boolean Z(NovaMobileActivity novaMobileActivity, Uri uri) {
        String host = uri.getHost();
        return host != null && (host.equals("accounts.google.com") || j.A0(host, ".accounts.google.com", false));
    }

    public static final void a0(NovaMobileActivity novaMobileActivity) {
        zy.c.i("nova_mobile_native_sign_in_started", null);
        yx.b.g("nova_mobile_native_sign_in_started", null);
        m0.t(g1.e(novaMobileActivity), null, null, new y(novaMobileActivity, null, 3), 3);
    }

    public final void b0() {
        WebView webView = this.f45917u;
        if (webView != null) {
            FrameLayout frameLayout = this.f45916t;
            if (frameLayout == null) {
                Intrinsics.m("webViewContainer");
                throw null;
            }
            frameLayout.removeView(webView);
            webView.destroy();
        }
        this.f45917u = null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v2, types: [java.lang.Object, java.util.Map] */
    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(2131623973);
        View viewFindViewById = findViewById(2131428712);
        i iVar = new i(12);
        WeakHashMap weakHashMap = a1.f250a;
        s0.l(viewFindViewById, iVar);
        zy.c.i("nova_mobile_opened", null);
        yx.b.g("nova_mobile_opened", null);
        ((MaterialToolbar) findViewById(2131429059)).y(new k(this, 12));
        this.f45914r = (ProgressBar) findViewById(2131428653);
        this.f45915s = (SwipeRefreshLayout) findViewById(2131428954);
        WebView webView = (WebView) findViewById(2131429193);
        this.f45913q = webView;
        if (webView == null) {
            Intrinsics.m("webView");
            throw null;
        }
        ViewParent parent = webView.getParent();
        Intrinsics.e(parent, "null cannot be cast to non-null type android.widget.FrameLayout");
        this.f45916t = (FrameLayout) parent;
        SwipeRefreshLayout swipeRefreshLayout = this.f45915s;
        if (swipeRefreshLayout == null) {
            Intrinsics.m("swipeRefresh");
            throw null;
        }
        swipeRefreshLayout.f15284b = new ae.i(this, 14);
        WebView webView2 = this.f45913q;
        if (webView2 == null) {
            Intrinsics.m("webView");
            throw null;
        }
        webView2.setOnScrollChangeListener(new View.OnScrollChangeListener() { // from class: d00.b
            @Override // android.view.View.OnScrollChangeListener
            public final void onScrollChange(View view, int i5, int i11, int i12, int i13) {
                SwipeRefreshLayout swipeRefreshLayout2 = this.f48679a.f45915s;
                if (swipeRefreshLayout2 != null) {
                    swipeRefreshLayout2.setEnabled(i11 == 0);
                } else {
                    Intrinsics.m("swipeRefresh");
                    throw null;
                }
            }
        });
        CookieManager cookieManager = CookieManager.getInstance();
        cookieManager.setAcceptCookie(true);
        WebView webView3 = this.f45913q;
        if (webView3 == null) {
            Intrinsics.m("webView");
            throw null;
        }
        cookieManager.setAcceptThirdPartyCookies(webView3, true);
        WebView webView4 = this.f45913q;
        if (webView4 == null) {
            Intrinsics.m("webView");
            throw null;
        }
        WebSettings settings = webView4.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setLoadWithOverviewMode(true);
        settings.setUseWideViewPort(true);
        settings.setSupportZoom(false);
        settings.setBuiltInZoomControls(false);
        settings.setDisplayZoomControls(false);
        settings.setSupportMultipleWindows(true);
        settings.setJavaScriptCanOpenWindowsAutomatically(true);
        settings.setUserAgentString(j.F0(settings.getUserAgentString(), "; wv)", ")", false));
        SessionReplay.Companion companion = SessionReplay.INSTANCE;
        WebView webView5 = this.f45913q;
        if (webView5 == null) {
            Intrinsics.m("webView");
            throw null;
        }
        companion.unmask(webView5);
        WebView webView6 = this.f45913q;
        if (webView6 == null) {
            Intrinsics.m("webView");
            throw null;
        }
        webView6.addJavascriptInterface(new g(this, new c0(this, 5)), "NativeAndroid");
        WebView webView7 = this.f45913q;
        if (webView7 == null) {
            Intrinsics.m("webView");
            throw null;
        }
        webView7.setWebViewClient(new d(this, 0));
        WebView webView8 = this.f45913q;
        if (webView8 == null) {
            Intrinsics.m("webView");
            throw null;
        }
        webView8.setWebChromeClient(new e(this, 1));
        getOnBackPressedDispatcher().a(this, new d00.c(this, 0));
        ProgressBar progressBar = this.f45914r;
        if (progressBar == null) {
            Intrinsics.m("progressBar");
            throw null;
        }
        progressBar.setVisibility(0);
        WebView webView9 = this.f45913q;
        if (webView9 != 0) {
            webView9.loadUrl(d00.y.f48723c, d00.y.f48722b);
        } else {
            Intrinsics.m("webView");
            throw null;
        }
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public final void onDestroy() {
        b0();
        WebView webView = this.f45913q;
        if (webView != null) {
            if (webView == null) {
                Intrinsics.m("webView");
                throw null;
            }
            webView.destroy();
        }
        super.onDestroy();
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public final void onStop() {
        super.onStop();
        x xVarE = g1.e(this);
        a80.e eVar = y0.f88884a;
        m0.t(xVarE, a80.d.f488c, null, new x1(2, null, 6), 2);
    }
}
