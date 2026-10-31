package com.bytedance.sdk.component.utils;

import android.annotation.TargetApi;
import android.webkit.WebView;

/* loaded from: classes2.dex */
public class xkz {
    private static final ycx ycx = new zb();

    public static class ycx {
        private ycx() {
        }

        public void ycx(WebView webView, String str) {
            if (webView == null) {
                return;
            }
            try {
                webView.loadUrl(str);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "d+EskTauZfKUQ9tOyDOhO17HIIUP", "V+EskTauZQ==", 18);
            }
        }
    }

    @TargetApi(19)
    public static class zb extends ycx {
        private zb() {
            super();
        }

        @Override // com.bytedance.sdk.component.utils.xkz.ycx
        public void ycx(WebView webView, String str) {
            if (webView == null) {
                return;
            }
            if (str != null && str.startsWith("javascript:")) {
                try {
                    webView.evaluateJavascript(str, null);
                    return;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "d+EskTauZfKUQ9tOyDqpPHDvObwOrGU=", "V+EskTauZQ==", 37);
                    boolean z11 = th2 instanceof IllegalStateException;
                }
            }
            try {
                webView.loadUrl(str);
            } catch (Throwable th3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "d+EskTauZfKUQ9tOyDqpPHDvObwOrGU=", "V+EskTauZQ==", 50);
            }
        }
    }

    public static void ycx(WebView webView, String str) {
        ycx.ycx(webView, str);
    }
}
