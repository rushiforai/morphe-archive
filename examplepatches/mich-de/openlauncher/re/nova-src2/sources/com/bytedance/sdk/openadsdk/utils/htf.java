package com.bytedance.sdk.openadsdk.utils;

import android.net.Uri;
import android.text.TextUtils;
import android.webkit.WebView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes2.dex */
public class htf {
    public static void ycx(Uri uri, com.bytedance.sdk.openadsdk.core.kgy kgyVar) {
        if (kgyVar == null || !kgyVar.ycx(uri)) {
            return;
        }
        try {
            kgyVar.zb(uri);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "cf0Phwq4bsK1Xt5Rnw==", "U+8jkQ+5WsSIT9pc", 22);
            e3.toString();
        }
    }

    public static String ycx(WebView webView, int i5) {
        if (webView == null) {
            return b.f42142b;
        }
        String userAgentString = webView.getSettings().getUserAgentString();
        if (TextUtils.isEmpty(userAgentString)) {
            return b.f42142b;
        }
        return userAgentString + " open_news open_news_u_s/" + i5;
    }
}
