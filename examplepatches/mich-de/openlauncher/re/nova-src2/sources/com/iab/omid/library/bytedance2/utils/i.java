package com.iab.omid.library.bytedance2.utils;

import android.webkit.WebView;
import androidx.webkit.WebViewCompat;
import java.util.Set;
import m7.s;

/* loaded from: classes3.dex */
public class i {
    public void a(WebView webView, String str) {
        WebViewCompat.removeWebMessageListener(webView, str);
    }

    public void a(WebView webView, String str, Set<String> set, s sVar) {
        WebViewCompat.addWebMessageListener(webView, str, set, sVar);
    }
}
