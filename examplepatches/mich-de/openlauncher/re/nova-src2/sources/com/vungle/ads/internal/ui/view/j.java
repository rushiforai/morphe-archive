package com.vungle.ads.internal.ui.view;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.webkit.WebView;
import android.widget.RelativeLayout;
import b.e8;
import com.vungle.ads.internal.model.f0;
import com.vungle.ads.internal.ui.z;
import com.vungle.ads.internal.util.a0;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class j extends RelativeLayout {

    /* renamed from: a, reason: collision with root package name */
    public final String f47623a;

    /* renamed from: b, reason: collision with root package name */
    public WebView f47624b;

    /* renamed from: c, reason: collision with root package name */
    public h f47625c;

    /* renamed from: d, reason: collision with root package name */
    public f f47626d;

    /* renamed from: e, reason: collision with root package name */
    public i f47627e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(Context context, String str) throws InstantiationException {
        super(context);
        Intrinsics.g(context, "context");
        this.f47623a = str;
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        setLayoutParams(layoutParams);
        WebView webViewA = a0.a(context, str);
        this.f47624b = webViewA;
        if (webViewA != null) {
            webViewA.setLayoutParams(layoutParams);
        }
        WebView webView = this.f47624b;
        if (webView != null) {
            webView.setTag("VungleWebView");
        }
        addView(this.f47624b, layoutParams);
        a();
        c();
    }

    public static /* synthetic */ void getCloseDelegate$vungle_ads_release$annotations() {
    }

    public static /* synthetic */ void getOnViewTouchListener$vungle_ads_release$annotations() {
    }

    public static /* synthetic */ void getOrientationDelegate$vungle_ads_release$annotations() {
    }

    public final void c() {
        WebView webView = this.f47624b;
        if (webView != null) {
            webView.setBackgroundColor(0);
            webView.setVisibility(8);
        }
    }

    public final void d() {
        WebView webView = this.f47624b;
        if (webView != null) {
            webView.setVisibility(0);
        }
        WebView webView2 = this.f47624b;
        if (webView2 != null) {
            webView2.onResume();
        }
    }

    @Nullable
    public final f getCloseDelegate$vungle_ads_release() {
        return this.f47626d;
    }

    @Nullable
    public final String getEventId() {
        return this.f47623a;
    }

    @Nullable
    public final h getOnViewTouchListener$vungle_ads_release() {
        return this.f47625c;
    }

    @Nullable
    public final i getOrientationDelegate$vungle_ads_release() {
        return this.f47627e;
    }

    @Nullable
    public final String getUrl() {
        WebView webView = this.f47624b;
        if (webView != null) {
            return webView.getUrl();
        }
        return null;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        ViewGroup.LayoutParams layoutParams;
        super.onAttachedToWindow();
        ViewGroup.LayoutParams layoutParams2 = getLayoutParams();
        if (layoutParams2 != null) {
            layoutParams2.height = -1;
            layoutParams2.width = -1;
        }
        WebView webView = this.f47624b;
        if (webView == null || (layoutParams = webView.getLayoutParams()) == null) {
            return;
        }
        layoutParams.height = -1;
        layoutParams.width = -1;
    }

    public final void setCloseDelegate(@NotNull f closeDelegate) {
        Intrinsics.g(closeDelegate, "closeDelegate");
        this.f47626d = closeDelegate;
    }

    public final void setCloseDelegate$vungle_ads_release(@Nullable f fVar) {
        this.f47626d = fVar;
    }

    public final void setOnViewTouchListener(@Nullable h hVar) {
        this.f47625c = hVar;
    }

    public final void setOnViewTouchListener$vungle_ads_release(@Nullable h hVar) {
        this.f47625c = hVar;
    }

    public final void setOrientation(int i5) {
        i iVar = this.f47627e;
        if (iVar != null) {
            ((com.vungle.ads.internal.ui.j) iVar).f47570a.setRequestedOrientation(i5);
        }
    }

    public final void setOrientationDelegate(@Nullable i iVar) {
        this.f47627e = iVar;
    }

    public final void setOrientationDelegate$vungle_ads_release(@Nullable i iVar) {
        this.f47627e = iVar;
    }

    public final void a() {
        WebView webView = this.f47624b;
        if (webView != null) {
            webView.setOnTouchListener(new e8(this, 4));
        }
    }

    public final void b() {
        WebView webView = this.f47624b;
        if (webView != null) {
            webView.onPause();
        }
    }

    public static final boolean a(j this$0, View view, MotionEvent motionEvent) {
        Intrinsics.g(this$0, "this$0");
        h hVar = this$0.f47625c;
        if (hVar != null) {
            return hVar.onTouch(motionEvent);
        }
        return false;
    }

    public final void a(z vngWebViewClient, f0 f0Var) {
        Intrinsics.g(vngWebViewClient, "vngWebViewClient");
        WebView webView = this.f47624b;
        if (webView != null) {
            com.vungle.ads.internal.platform.g.a(webView, f0Var);
            webView.setWebViewClient(vngWebViewClient);
        }
    }

    public final void a(String url) {
        Intrinsics.g(url, "url");
        boolean z11 = u.f47714a;
        t.a("MRAIDAdWidget", "loadUrl: ".concat(url));
        WebView webView = this.f47624b;
        if (webView != null) {
            webView.loadUrl(url);
        }
    }

    public final void a(long j11) {
        try {
            int i5 = Result.f71687b;
            ViewParent parent = getParent();
            ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
            if (viewGroup != null) {
                viewGroup.removeView(this);
                Unit unit = Unit.f71706a;
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            ResultKt.a(th2);
        }
        try {
            removeAllViews();
            Unit unit2 = Unit.f71706a;
        } catch (Throwable th3) {
            int i12 = Result.f71687b;
            ResultKt.a(th3);
        }
        if (j11 <= 0) {
            new g(this).run();
        } else {
            new com.vungle.ads.internal.util.o().a(new g(this), j11);
        }
    }
}
