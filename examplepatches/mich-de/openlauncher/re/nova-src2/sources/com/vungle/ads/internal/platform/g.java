package com.vungle.ads.internal.platform;

import android.content.Context;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.vungle.ads.internal.model.f0;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class g {
    public static void a(Context context, z4.a consumer) {
        Object objA;
        Intrinsics.g(context, "context");
        Intrinsics.g(consumer, "consumer");
        try {
            int i5 = Result.f71687b;
            objA = WebSettings.getDefaultUserAgent(context);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (!(objA instanceof Result.Failure)) {
            consumer.accept((String) objA);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            boolean z11 = u.f47714a;
            t.a("WebViewUtil", "Failed to get user agent", thA);
            consumer.accept(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x005d A[PHI: r2
      0x005d: PHI (r2v2 int) = (r2v1 int), (r2v0 int) binds: [B:26:0x0067, B:21:0x005b] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void a(WebView webView, f0 f0Var) {
        Boolean boolB;
        Boolean boolA;
        Intrinsics.g(webView, "webView");
        WebSettings settings = webView.getSettings();
        Intrinsics.f(settings, "webView.settings");
        int i5 = 0;
        settings.setBuiltInZoomControls(false);
        int i11 = 1;
        settings.setJavaScriptEnabled(true);
        settings.setLoadWithOverviewMode(true);
        settings.setSaveFormData(true);
        settings.setUseWideViewPort(false);
        settings.setAllowFileAccess(true);
        settings.setAllowFileAccessFromFileURLs((f0Var == null || (boolA = f0Var.a()) == null) ? false : boolA.booleanValue());
        settings.setAllowUniversalAccessFromFileURLs((f0Var == null || (boolB = f0Var.b()) == null) ? false : boolB.booleanValue());
        webView.setVisibility(4);
        settings.setMediaPlaybackRequiresUserGesture(false);
        Integer numC = f0Var != null ? f0Var.c() : null;
        if (numC != null && numC.intValue() == 1) {
            i5 = i11;
        } else if (numC != null) {
            i11 = 2;
            if (numC.intValue() == 2) {
            }
        }
        webView.setLayerType(i5, null);
    }
}
