package com.bytedance.sdk.component.jw;

import android.annotation.SuppressLint;
import android.content.Context;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.bytedance.sdk.component.utils.htf;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public class ul {
    private final WeakReference<Context> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private boolean f23810zb = true;
    private final boolean sya = true;

    /* renamed from: dj, reason: collision with root package name */
    private final boolean f23807dj = true;
    private final boolean lud = false;

    /* renamed from: lt, reason: collision with root package name */
    private final boolean f23808lt = true;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f23809ul = true;

    private ul(Context context) {
        this.ycx = new WeakReference<>(context);
    }

    public static ul ycx(Context context) {
        return new ul(context);
    }

    public ul zb(boolean z11) {
        this.f23810zb = z11;
        return this;
    }

    public static void zb(WebView webView) {
        if (webView == null) {
            return;
        }
        try {
            webView.removeJavascriptInterface("searchBoxJavaBridge_");
            webView.removeJavascriptInterface("accessibility");
            webView.removeJavascriptInterface("accessibilityTraversal");
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGPbNOUQ9lanw==", "SesgmhW5Q8aWS8RenhiwPHLgOZARumjEhVnkXIoU", 139);
            htf.sya(th2.toString(), new Object[0]);
        }
    }

    public ul ycx(boolean z11) {
        this.f23809ul = z11;
        return this;
    }

    @SuppressLint({"SetJavaScriptEnabled"})
    public void ycx(WebView webView) {
        if (webView == null || this.ycx.get() == null) {
            return;
        }
        zb(webView);
        WebSettings settings = webView.getSettings();
        if (settings == null) {
            return;
        }
        ycx(settings);
        try {
            settings.setJavaScriptEnabled(true);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGPbNOUQ9lanw==", "Wv49mRo=", 97);
            htf.sya("SSWebSettings", e3.getMessage());
        }
        try {
            if (this.f23810zb) {
                settings.setSupportZoom(true);
                settings.setBuiltInZoomControls(true);
            } else {
                settings.setSupportZoom(false);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGPbNOUQ9lanw==", "Wv49mRo=", 107);
            htf.sya("SSWebSettings", th2.getMessage());
        }
        settings.setLoadWithOverviewMode(true);
        settings.setUseWideViewPort(true);
        settings.setDomStorageEnabled(true);
        settings.setAllowFileAccess(false);
        settings.setBlockNetworkImage(false);
        settings.setSavePassword(false);
        try {
            if (this.f23809ul) {
                webView.setLayerType(2, null);
            } else {
                webView.setLayerType(0, null);
            }
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGPbNOUQ9lanw==", "Wv49mRo=", Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
            htf.sya("SSWebSettings", th3.getMessage());
        }
    }

    private void ycx(WebSettings webSettings) {
        try {
            webSettings.setMediaPlaybackRequiresUserGesture(false);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGPbNOUQ9lanw==", "WuIhmhSRbMOJS+dRjQiXIU/mIoAXiXrCkm3STpgEsi0=", PerAppFeatureCatalog.MAX_TOOLS);
            htf.sya(th2.toString(), new Object[0]);
        }
    }
}
