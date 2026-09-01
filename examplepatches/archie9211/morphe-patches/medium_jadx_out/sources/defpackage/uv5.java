package defpackage;

import android.net.Uri;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.medium.android.admin.stagebranch.uG.peNPu;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class uv5 extends WebViewClient {
    public boolean a;
    public final /* synthetic */ d28 b;
    public final /* synthetic */ x45 c;
    public final /* synthetic */ xv5 d;

    public uv5(d28 d28Var, x45 x45Var, xv5 xv5Var) {
        this.b = d28Var;
        this.c = x45Var;
        this.d = xv5Var;
    }

    @Override // android.webkit.WebViewClient
    public final void onPageFinished(WebView webView, String str) {
        str.getClass();
        this.a = true;
        if (this.b == d28.LOADING) {
            this.c.invoke(d28.LOADED);
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, WebResourceRequest webResourceRequest, WebResourceError webResourceError) {
        webResourceRequest.getClass();
        webResourceError.getClass();
        if (webResourceRequest.isForMainFrame()) {
            int errorCode = webResourceError.getErrorCode();
            CharSequence description = webResourceError.getDescription();
            wld.a.e(null, "onReceivedError: errorCode=" + errorCode + ", description=" + ((Object) description) + ", failingUrl=" + webResourceRequest.getUrl(), new Object[0]);
            int errorCode2 = webResourceError.getErrorCode();
            this.c.invoke((errorCode2 == -11 || errorCode2 == -2 || errorCode2 == -8 || errorCode2 == -7 || errorCode2 == -6) ? d28.OFFLINE : d28.ERROR);
        }
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, WebResourceRequest webResourceRequest) {
        webResourceRequest.getClass();
        String string = webResourceRequest.getUrl().toString();
        string.getClass();
        if (!this.a) {
            return false;
        }
        this.d.a(Uri.parse(string));
        return true;
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedHttpError(WebView webView, WebResourceRequest webResourceRequest, WebResourceResponse webResourceResponse) {
        webResourceRequest.getClass();
        webResourceResponse.getClass();
        if (webResourceRequest.isForMainFrame()) {
            wld.a.e(null, "onReceivedHttpError: statusCode=" + webResourceResponse.getStatusCode() + peNPu.GzMVVIGLAhNAqVh + webResourceResponse.getReasonPhrase() + ", failingUrl=" + webResourceRequest.getUrl(), new Object[0]);
            this.c.invoke(d28.ERROR);
        }
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, String str) {
        str.getClass();
        if (!this.a) {
            return false;
        }
        this.d.a(Uri.parse(str));
        return true;
    }
}
