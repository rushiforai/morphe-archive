package com.bytedance.sdk.component.jw;

import android.graphics.Bitmap;
import android.net.http.SslError;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.SslErrorHandler;
import android.webkit.WebBackForwardList;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.bytedance.sdk.component.jw.ycx;
import java.util.List;

/* loaded from: classes2.dex */
public class jw extends WebViewClient {
    private final List<String> sya;
    private final WebViewClient ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final ycx.InterfaceC0038ycx f23801zb;

    public jw(ycx.InterfaceC0038ycx interfaceC0038ycx, WebViewClient webViewClient, List<String> list) {
        this.f23801zb = interfaceC0038ycx;
        this.ycx = webViewClient;
        this.sya = list;
    }

    private int ycx(WebView webView) {
        try {
            WebBackForwardList webBackForwardListCopyBackForwardList = webView.copyBackForwardList();
            if (webBackForwardListCopyBackForwardList != null) {
                return webBackForwardListCopyBackForwardList.getCurrentIndex() + 1;
            }
            return -1;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "bOsvowq5fuSMQ9JTmCGyJ0P3", "XOs5thaue8KOXudcixSJJl/rNQ==", 107);
            return -1;
        }
    }

    @Override // android.webkit.WebViewClient
    public void onPageFinished(WebView webView, String str) {
        this.ycx.onPageFinished(webView, str);
    }

    @Override // android.webkit.WebViewClient
    public void onPageStarted(WebView webView, String str, Bitmap bitmap) {
        ycx.InterfaceC0038ycx interfaceC0038ycx = this.f23801zb;
        if (interfaceC0038ycx != null) {
            interfaceC0038ycx.ycx(ycx(webView));
        }
        this.ycx.onPageStarted(webView, str, bitmap);
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedError(WebView webView, WebResourceRequest webResourceRequest, WebResourceError webResourceError) {
        this.ycx.onReceivedError(webView, webResourceRequest, webResourceError);
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedHttpError(WebView webView, WebResourceRequest webResourceRequest, WebResourceResponse webResourceResponse) {
        this.ycx.onReceivedHttpError(webView, webResourceRequest, webResourceResponse);
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedSslError(WebView webView, SslErrorHandler sslErrorHandler, SslError sslError) {
        this.ycx.onReceivedSslError(webView, sslErrorHandler, sslError);
    }

    @Override // android.webkit.WebViewClient
    public boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        return this.ycx.onRenderProcessGone(webView, renderProcessGoneDetail);
    }

    @Override // android.webkit.WebViewClient
    public WebResourceResponse shouldInterceptRequest(WebView webView, String str) {
        return this.ycx.shouldInterceptRequest(webView, str);
    }

    @Override // android.webkit.WebViewClient
    public boolean shouldOverrideUrlLoading(WebView webView, String str) {
        ycx.InterfaceC0038ycx interfaceC0038ycx = this.f23801zb;
        if (interfaceC0038ycx != null) {
            interfaceC0038ycx.ycx();
        }
        return this.ycx.shouldOverrideUrlLoading(webView, str);
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedError(WebView webView, int i5, String str, String str2) {
        this.ycx.onReceivedError(webView, i5, str, str2);
    }

    @Override // android.webkit.WebViewClient
    public WebResourceResponse shouldInterceptRequest(WebView webView, WebResourceRequest webResourceRequest) {
        ycx.InterfaceC0038ycx interfaceC0038ycx;
        if (zb.ycx(this.sya, webResourceRequest.getUrl().toString()) && (interfaceC0038ycx = this.f23801zb) != null) {
            interfaceC0038ycx.ycx();
        }
        return this.ycx.shouldInterceptRequest(webView, webResourceRequest);
    }
}
