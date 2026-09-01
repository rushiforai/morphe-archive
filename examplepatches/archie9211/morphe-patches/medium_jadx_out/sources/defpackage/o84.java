package defpackage;

import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.net.http.SslError;
import android.webkit.SslErrorHandler;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.medium.android.donkey.read.web.ExternalWebViewStateException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o84 extends WebViewClient {
    public final String a;
    public final /* synthetic */ WebView b;
    public final /* synthetic */ l78 c;
    public final /* synthetic */ l78 d;
    public final /* synthetic */ l78 e;
    public final /* synthetic */ l78 f;
    public final /* synthetic */ l78 g;
    public final /* synthetic */ c84 h;
    public final /* synthetic */ nw2 i;
    public final /* synthetic */ String j;

    public o84(WebView webView, l78 l78Var, l78 l78Var2, l78 l78Var3, l78 l78Var4, l78 l78Var5, c84 c84Var, nw2 nw2Var, String str) {
        this.b = webView;
        this.c = l78Var;
        this.d = l78Var2;
        this.e = l78Var3;
        this.f = l78Var4;
        this.g = l78Var5;
        this.h = c84Var;
        this.i = nw2Var;
        this.j = str;
        this.a = webView.getSettings().getUserAgentString();
    }

    @Override // android.webkit.WebViewClient
    public final void doUpdateVisitedHistory(WebView webView, String str, boolean z) {
        l78 l78Var = this.e;
        super.doUpdateVisitedHistory(webView, (String) l78Var.getValue(), z);
        if (str != null) {
            l78Var.setValue(huc.a(str));
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onPageFinished(WebView webView, String str) {
        this.f.setValue(Boolean.TRUE);
        this.g.setValue(Boolean.valueOf(webView != null ? webView.canGoBack() : false));
        if (str != null) {
            l78 l78Var = this.e;
            if (g76.L((String) l78Var.getValue(), str)) {
                return;
            }
            l78Var.setValue(huc.a(str));
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onPageStarted(WebView webView, String str, Bitmap bitmap) {
        this.c.setValue("");
        String str2 = str == null ? "" : str;
        try {
            String authority = Uri.parse(str2).getAuthority();
            str2 = authority != null ? authority : "";
        } catch (Exception unused) {
        }
        this.d.setValue(str2);
        l78 l78Var = this.e;
        if (str != null && !g76.L((String) l78Var.getValue(), str)) {
            l78Var.setValue(huc.a(str));
        }
        String strR = ka1.r("Page started loading: ", (String) l78Var.getValue());
        km4.I(wld.a, null, strR, new Object[0], strR);
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, WebResourceRequest webResourceRequest, WebResourceError webResourceError) {
        webResourceError.getClass();
        String str = "onReceivedError - error code: " + webResourceError.getErrorCode() + ", description: " + ((Object) webResourceError.getDescription());
        ExternalWebViewStateException externalWebViewStateException = new ExternalWebViewStateException(str);
        wld.a.e(externalWebViewStateException, str, new Object[0]);
        hy2 hy2Var = g01.y;
        if (hy2Var != null) {
            hy2Var.a(str, externalWebViewStateException, fy3.a);
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedHttpError(WebView webView, WebResourceRequest webResourceRequest, WebResourceResponse webResourceResponse) {
        webResourceResponse.getClass();
        if (webResourceResponse.getStatusCode() == 400) {
            this.b.getSettings().setUserAgentString(this.a);
        }
        String str = "onReceivedHttpError - status code: " + webResourceResponse.getStatusCode() + ", description: " + webResourceResponse.getReasonPhrase() + ", data: " + webResourceResponse.getData();
        ExternalWebViewStateException externalWebViewStateException = new ExternalWebViewStateException(str);
        wld.a.e(externalWebViewStateException, str, new Object[0]);
        hy2 hy2Var = g01.y;
        if (hy2Var != null) {
            hy2Var.a(str, externalWebViewStateException, fy3.a);
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedSslError(WebView webView, SslErrorHandler sslErrorHandler, SslError sslError) {
        sslError.getClass();
        String str = "onReceivedSslError - error: " + sslError.getPrimaryError() + ", url: " + sslError.getUrl() + ", certificate: " + sslError.getCertificate();
        ExternalWebViewStateException externalWebViewStateException = new ExternalWebViewStateException(str);
        wld.a.e(externalWebViewStateException, str, new Object[0]);
        hy2 hy2Var = g01.y;
        if (hy2Var != null) {
            hy2Var.a(str, externalWebViewStateException, fy3.a);
        }
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, WebResourceRequest webResourceRequest) {
        Uri url;
        String string = null;
        Context context = webView != null ? webView.getContext() : null;
        if (webResourceRequest != null && (url = webResourceRequest.getUrl()) != null) {
            string = url.toString();
        }
        return v4.x(context, string, this.h, this.i, this.j, ((Boolean) this.f.getValue()).booleanValue());
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, String str) {
        return v4.x(webView != null ? webView.getContext() : null, str, this.h, this.i, this.j, ((Boolean) this.f.getValue()).booleanValue());
    }
}
