package com.bytedance.sdk.openadsdk.core;

import android.view.ViewGroup;
import android.view.ViewParent;
import android.webkit.WebView;

/* loaded from: classes2.dex */
public class oby {
    public static void ycx(WebView webView) {
        if (webView == null) {
            return;
        }
        try {
            webView.setWebChromeClient(null);
            webView.setWebViewClient(null);
            ViewParent parent = webView.getParent();
            if (parent instanceof ViewGroup) {
                ((ViewGroup) parent).removeView(webView);
            }
            webView.removeAllViews();
            webView.destroy();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "bOsvowq5fvOXT9ZWiQM=", "WOIolBGLbMW2Q9JKox+ELUj6P5oa", 38);
        }
    }
}
