package com.bytedance.sdk.component.ycx;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Base64;
import android.webkit.JavascriptInterface;
import android.webkit.WebView;
import b.c0;

/* loaded from: classes2.dex */
public class htf extends ycx {

    /* renamed from: jc, reason: collision with root package name */
    static final /* synthetic */ boolean f24119jc = true;
    protected String fby;

    /* renamed from: jw, reason: collision with root package name */
    protected WebView f24120jw;

    public void dj() {
        this.f24120jw.removeJavascriptInterface(this.fby);
    }

    @Override // com.bytedance.sdk.component.ycx.ycx
    @JavascriptInterface
    public void invokeMethod(String str) {
        super.invokeMethod(str);
    }

    @SuppressLint({"AddJavascriptInterface"})
    public void sya() {
        if (!f24119jc && this.f24120jw == null) {
            throw new AssertionError();
        }
        this.f24120jw.addJavascriptInterface(this, this.fby);
    }

    @Override // com.bytedance.sdk.component.ycx.ycx
    public Context ycx(jw jwVar) {
        Context context = jwVar.lud;
        if (context != null) {
            return context;
        }
        WebView webView = jwVar.ycx;
        if (webView != null) {
            return webView.getContext();
        }
        throw new IllegalStateException("WebView cannot be null!");
    }

    @Override // com.bytedance.sdk.component.ycx.ycx
    @SuppressLint({"JavascriptInterface", "AddJavascriptInterface"})
    public void zb(jw jwVar) {
        this.f24120jw = jwVar.ycx;
        this.fby = jwVar.sya;
        if (jwVar.f24128ry) {
            return;
        }
        sya();
    }

    @Override // com.bytedance.sdk.component.ycx.ycx
    public String ycx() {
        return this.f24120jw.getUrl();
    }

    @Override // com.bytedance.sdk.component.ycx.ycx
    public void zb() {
        super.zb();
        dj();
    }

    @Override // com.bytedance.sdk.component.ycx.ycx
    public void ycx(String str, xkz xkzVar) {
        if (xkzVar != null && !TextUtils.isEmpty(xkzVar.fby)) {
            String str2 = xkzVar.fby;
            ycx(str, c0.q(c0.w("javascript:(function(){   const iframe = document.querySelector(atob('", Base64.encodeToString(("iframe[src=\"" + str2 + "\"").getBytes(), 2), "'));   if (iframe && iframe.contentWindow) {        iframe.contentWindow.postMessage(", str, ", atob('"), Base64.encodeToString(str2.getBytes(), 2), "'));   }})()"));
            return;
        }
        super.ycx(str, xkzVar);
    }

    @Override // com.bytedance.sdk.component.ycx.ycx
    public void ycx(String str) {
        ycx(str, c0.s(new StringBuilder("javascript:"), this.fby, "._handleMessageFromToutiao(", str, ")"));
    }

    private void ycx(String str, final String str2) {
        if (this.f24151lt || TextUtils.isEmpty(str2)) {
            return;
        }
        Runnable runnable = new Runnable() { // from class: com.bytedance.sdk.component.ycx.htf.1
            @Override // java.lang.Runnable
            public void run() {
                if (htf.this.f24151lt) {
                    return;
                }
                try {
                    htf.this.f24120jw.evaluateJavascript(str2, null);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VqjtZ", "bOsvowq5fuWSQ9NaiVXx", "Sfsj", 120);
                }
            }
        };
        if (Looper.myLooper() != Looper.getMainLooper()) {
            this.f24150dj.post(runnable);
        } else {
            runnable.run();
        }
    }
}
