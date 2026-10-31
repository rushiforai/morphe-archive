package iq;

import android.net.Uri;
import android.net.http.SslError;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.SslErrorHandler;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p extends WebViewClient {

    /* renamed from: a, reason: collision with root package name */
    public final String f67991a = "https://b.stripecdn.com/mobile-confirmation-challenge/assets/index.html?v=1";

    /* renamed from: b, reason: collision with root package name */
    public final f10.o f67992b;

    public p(f10.o oVar) {
        this.f67992b = oVar;
    }

    public static Uri a(Uri uri) {
        String path = uri.getPath();
        if (path == null) {
            return uri;
        }
        String strX1 = r70.k.x1(path, '/');
        if (Intrinsics.b(strX1, path)) {
            return uri;
        }
        Uri uriBuild = uri.buildUpon().path(strX1).build();
        Intrinsics.d(uriBuild);
        return uriBuild;
    }

    public static boolean b(String str, String str2) {
        if (str == null) {
            return false;
        }
        Uri uri = Uri.parse(str);
        Intrinsics.f(uri, "parse(...)");
        Uri uriA = a(uri);
        Uri uri2 = Uri.parse(str2);
        Intrinsics.f(uri2, "parse(...)");
        return uriA.equals(a(uri2));
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, WebResourceRequest webResourceRequest, WebResourceError webResourceError) {
        Uri url;
        CharSequence description;
        Uri url2;
        super.onReceivedError(webView, webResourceRequest, webResourceError);
        String string = null;
        if (b((webResourceRequest == null || (url2 = webResourceRequest.getUrl()) == null) ? null : url2.toString(), this.f67991a)) {
            if (webResourceError != null && (description = webResourceError.getDescription()) != null) {
                string = description.toString();
            }
            if (webResourceError != null) {
                webResourceError.getErrorCode();
            }
            if (webResourceRequest != null && (url = webResourceRequest.getUrl()) != null) {
                url.toString();
            }
            this.f67992b.f(new a(string, "generic_resource_error"));
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedHttpError(WebView webView, WebResourceRequest webResourceRequest, WebResourceResponse webResourceResponse) {
        Uri url;
        Uri url2;
        super.onReceivedHttpError(webView, webResourceRequest, webResourceResponse);
        if (b((webResourceRequest == null || (url2 = webResourceRequest.getUrl()) == null) ? null : url2.toString(), this.f67991a)) {
            String reasonPhrase = webResourceResponse != null ? webResourceResponse.getReasonPhrase() : null;
            if (webResourceResponse != null) {
                webResourceResponse.getStatusCode();
            }
            if (webResourceRequest != null && (url = webResourceRequest.getUrl()) != null) {
                url.toString();
            }
            this.f67992b.f(new a(reasonPhrase, "http_error"));
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedSslError(WebView webView, SslErrorHandler sslErrorHandler, SslError sslError) {
        super.onReceivedSslError(webView, sslErrorHandler, sslError);
        if (sslErrorHandler != null) {
            sslErrorHandler.cancel();
        }
        if (sslError != null) {
            sslError.getPrimaryError();
        }
        if (sslError != null) {
            sslError.getUrl();
        }
        this.f67992b.f(new a("received ssl error", "ssl_error"));
    }

    @Override // android.webkit.WebViewClient
    public final boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        if (webView != null) {
            webView.getUrl();
        }
        this.f67992b.f(new a("render process crashed", "render_process_gone"));
        return super.onRenderProcessGone(webView, renderProcessGoneDetail);
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, int i5, String str, String str2) {
        super.onReceivedError(webView, i5, str, str2);
        if (b(str2, this.f67991a)) {
            this.f67992b.f(new a(str, "generic_resource_error"));
        }
    }
}
