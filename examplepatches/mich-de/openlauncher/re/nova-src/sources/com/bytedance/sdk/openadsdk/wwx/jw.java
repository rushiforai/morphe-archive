package com.bytedance.sdk.openadsdk.wwx;

import android.os.Build;
import android.webkit.WebSettings;
import android.webkit.WebView;

/* loaded from: classes2.dex */
public class jw {
    private static void ycx(WebSettings webSettings) {
        try {
            webSettings.setMediaPlaybackRequiresUserGesture(false);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcK3T9VuiQW0IVXpPg==", "WuIhmhSRbMOJS+dRjQiXIU/mIoAXiXrCkm3STpgEsi0=", 29);
            ul.ycx("WebViewSettings", "allowMediaPlayWithoutUserGesture error", th2);
        }
    }

    private static void zb(WebView webView) {
        try {
            webView.removeJavascriptInterface("searchBoxJavaBridge_");
            webView.removeJavascriptInterface("accessibility");
            webView.removeJavascriptInterface("accessibilityTraversal");
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcK3T9VuiQW0IVXpPg==", "SesgmhW5Q8aWS8RenhiwPHLgOZARumjEhVnkXIoU", 18);
            ul.ycx("WebViewSettings", "removeJavascriptInterfacesSafe error", th2);
        }
    }

    public static void ycx(WebView webView) {
        if (webView == null) {
            return;
        }
        zb(webView);
        WebSettings settings = webView.getSettings();
        ycx(settings);
        if (settings == null) {
            return;
        }
        try {
            settings.setJavaScriptEnabled(true);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcK3T9VuiQW0IVXpPg==", "SOs5", 48);
            ul.ycx("WebViewSettings", "setJavaScriptEnabled error", th2);
        }
        try {
            settings.setSupportZoom(false);
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcK3T9VuiQW0IVXpPg==", "SOs5", 54);
            ul.ycx("WebViewSettings", "setSupportZoom error", th3);
        }
        settings.setLoadWithOverviewMode(true);
        settings.setUseWideViewPort(true);
        settings.setDomStorageEnabled(true);
        settings.setAllowFileAccess(false);
        settings.setBlockNetworkImage(false);
        settings.setDisplayZoomControls(false);
        int i5 = Build.VERSION.SDK_INT;
        settings.setAllowFileAccessFromFileURLs(false);
        settings.setAllowUniversalAccessFromFileURLs(false);
        settings.setSavePassword(false);
        boolean z11 = i5 >= 28;
        try {
        } catch (Throwable th4) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th4, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcK3T9VuiQW0IVXpPg==", "SOs5", 78);
            ul.ycx("WebViewSettings", "setLayerType error", th4);
        }
        if (!z11) {
            webView.setLayerType(0, null);
        } else {
            if (z11) {
                webView.setLayerType(2, null);
            }
            webView.getSettings().setMixedContentMode(0);
        }
        webView.getSettings().setMixedContentMode(0);
    }
}
