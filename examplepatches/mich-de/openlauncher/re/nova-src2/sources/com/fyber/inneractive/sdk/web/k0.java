package com.fyber.inneractive.sdk.web;

import android.graphics.Bitmap;
import android.text.TextUtils;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.ByteArrayInputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes3.dex */
public final class k0 extends WebViewClient {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f31347a;

    /* renamed from: b, reason: collision with root package name */
    public final int f31348b;

    /* renamed from: c, reason: collision with root package name */
    public final int f31349c;

    /* renamed from: d, reason: collision with root package name */
    public final int f31350d;

    /* renamed from: e, reason: collision with root package name */
    public j f31351e;

    public k0(j jVar, boolean z11, int i5, int i11, int i12) {
        this.f31351e = jVar;
        this.f31347a = z11;
        this.f31348b = i5;
        this.f31349c = i11;
        this.f31350d = i12;
    }

    @Override // android.webkit.WebViewClient
    public final void onLoadResource(WebView webView, String str) {
        super.onLoadResource(webView, str);
        IAlog.e("Resources to load: %s", str);
        IAlog.d("%s %s", "RESOURCES", str);
        j jVar = this.f31351e;
        if (jVar != null) {
            i iVar = (i) jVar;
            if (TextUtils.isEmpty(str) || !str.startsWith("http://") || com.fyber.inneractive.sdk.util.s.a()) {
                return;
            }
            IAlog.a("%s Found a portential unsecure resource url: %s", IAlog.a(iVar), str);
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onPageFinished(WebView webView, String str) {
        super.onPageFinished(webView, str);
        IAlog.e("onPageFinished - url: %s", str);
        j jVar = this.f31351e;
        if (jVar != null) {
            jVar.a(webView);
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onPageStarted(WebView webView, String str, Bitmap bitmap) {
        super.onPageStarted(webView, str, bitmap);
        IAlog.e("onPageStarted - url: %s", str);
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, int i5, String str, String str2) {
        IAlog.e("%sError: code = %d text = %s WebView = %s", IAlog.a(this), Integer.valueOf(i5), str, webView);
        super.onReceivedError(webView, i5, str, str2);
        j jVar = this.f31351e;
        if (jVar != null) {
            jVar.d();
        }
    }

    @Override // android.webkit.WebViewClient
    public final boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        IAlog.a("onWebViewRenderProcessGone called for web view! %s", webView);
        if (webView != null) {
            com.fyber.inneractive.sdk.util.v.a(webView);
            webView.destroy();
        }
        j jVar = this.f31351e;
        if (jVar == null) {
            return true;
        }
        jVar.a();
        return true;
    }

    @Override // android.webkit.WebViewClient
    public final WebResourceResponse shouldInterceptRequest(WebView webView, WebResourceRequest webResourceRequest) {
        URL url;
        HttpURLConnection httpURLConnection;
        if (this.f31347a && webResourceRequest != null) {
            IAlog.e("shouldInterceptRequest, method = %s", webResourceRequest.getMethod());
            b1 b1Var = b1.f31264c;
            int i5 = this.f31348b;
            int i11 = this.f31349c;
            int i12 = this.f31350d;
            b1Var.getClass();
            WebResourceResponse webResourceResponse = null;
            if (webResourceRequest.getUrl() != null && webResourceRequest.getUrl().getScheme() != null && webResourceRequest.getUrl().getScheme().startsWith("http") && TextUtils.equals(webResourceRequest.getMethod(), "GET")) {
                c1 c1Var = (c1) b1Var.f31265a.get(new d1(webResourceRequest));
                if (c1Var != null) {
                    webResourceResponse = new WebResourceResponse(c1Var.f31271c, c1Var.f31272d, c1Var.f31273e, c1Var.f31274f, c1Var.f31270b, new ByteArrayInputStream(c1Var.f31269a));
                } else {
                    try {
                        url = new URL(webResourceRequest.getUrl().toString());
                    } catch (MalformedURLException unused) {
                        url = null;
                    }
                    if (url != null) {
                        ByteBuffer byteBufferAllocateDirect = (ByteBuffer) com.fyber.inneractive.sdk.util.f.f31185b.f31186a.poll();
                        if (byteBufferAllocateDirect == null) {
                            byteBufferAllocateDirect = ByteBuffer.allocateDirect(ReaderJsonLexerKt.BATCH_SIZE);
                        }
                        try {
                            httpURLConnection = (HttpURLConnection) url.openConnection();
                            try {
                                httpURLConnection.setRequestMethod(webResourceRequest.getMethod());
                                httpURLConnection.setInstanceFollowRedirects(false);
                                b1.a(webResourceRequest, httpURLConnection);
                            } catch (Throwable unused2) {
                            }
                        } catch (Throwable unused3) {
                            httpURLConnection = null;
                        }
                        if (httpURLConnection != null) {
                            httpURLConnection.setConnectTimeout(i5);
                            httpURLConnection.setReadTimeout(i11);
                            c1 c1VarA = null;
                            while (i12 > 0) {
                                try {
                                    c1VarA = b1.a(httpURLConnection, byteBufferAllocateDirect);
                                } catch (SocketTimeoutException | UnknownHostException unused4) {
                                } catch (Throwable unused5) {
                                    i12 = 0;
                                }
                                if (c1VarA != null) {
                                    break;
                                }
                                i12--;
                            }
                            if (c1VarA != null) {
                                try {
                                    if (c1VarA.a()) {
                                        b1Var.f31265a.put(new d1(webResourceRequest), c1VarA);
                                    }
                                    WebResourceResponse webResourceResponse2 = new WebResourceResponse(c1VarA.f31271c, c1VarA.f31272d, c1VarA.f31273e, c1VarA.f31274f, c1VarA.f31270b, new ByteArrayInputStream(c1VarA.f31269a));
                                    httpURLConnection.disconnect();
                                    com.fyber.inneractive.sdk.util.f.f31185b.f31186a.offer(byteBufferAllocateDirect);
                                    webResourceResponse = webResourceResponse2;
                                } catch (Throwable unused6) {
                                    httpURLConnection.disconnect();
                                }
                            } else {
                                httpURLConnection.disconnect();
                            }
                            com.fyber.inneractive.sdk.util.f.f31185b.f31186a.offer(byteBufferAllocateDirect);
                        }
                    }
                }
            }
            if (webResourceResponse != null) {
                return webResourceResponse;
            }
            IAlog.e("shouldInterceptRequest did not intercept %s", webResourceRequest.getUrl());
        }
        return super.shouldInterceptRequest(webView, webResourceRequest);
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, String str) {
        super.shouldOverrideUrlLoading(webView, str);
        j jVar = this.f31351e;
        return jVar != null && jVar.a(webView, str);
    }
}
