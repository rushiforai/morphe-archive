package defpackage;

import android.content.pm.PackageInfo;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class ez {
    public static PackageInfo a() {
        return WebView.getCurrentWebViewPackage();
    }

    public static boolean b(WebSettings webSettings) {
        return webSettings.getSafeBrowsingEnabled();
    }

    public static WebChromeClient c(WebView webView) {
        return webView.getWebChromeClient();
    }

    public static WebViewClient d(WebView webView) {
        return webView.getWebViewClient();
    }

    public static void e(WebSettings webSettings, boolean z) {
        webSettings.setSafeBrowsingEnabled(z);
    }
}
