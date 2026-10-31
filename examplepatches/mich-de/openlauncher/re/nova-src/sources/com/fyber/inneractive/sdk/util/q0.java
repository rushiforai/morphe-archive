package com.fyber.inneractive.sdk.util;

import android.webkit.ValueCallback;
import android.webkit.WebView;

/* loaded from: classes3.dex */
public abstract class q0 {
    public static void a(com.fyber.inneractive.sdk.web.m mVar, String str, ValueCallback valueCallback) {
        mVar.evaluateJavascript(str, valueCallback);
    }

    public static void a(WebView webView, String str) {
        webView.evaluateJavascript(str, null);
    }
}
