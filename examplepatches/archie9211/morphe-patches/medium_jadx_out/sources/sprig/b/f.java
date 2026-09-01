package sprig.b;

import android.content.Intent;
import android.net.Uri;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.userleap.SprigLoggingLevel;
import defpackage.c1e;
import defpackage.co6;
import defpackage.ev6;
import defpackage.lv8;
import defpackage.m45;
import defpackage.tuc;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J#\u0010\t\u001a\u00020\b2\b\u0010\u0005\u001a\u0004\u0018\u00010\u00042\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0016¢\u0006\u0004\b\t\u0010\nJ-\u0010\u000f\u001a\u00020\b2\b\u0010\u0005\u001a\u0004\u0018\u00010\u00042\b\u0010\f\u001a\u0004\u0018\u00010\u000b2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0016¢\u0006\u0004\b\u000f\u0010\u0010J-\u0010\u0012\u001a\u00020\b2\b\u0010\u0005\u001a\u0004\u0018\u00010\u00042\b\u0010\f\u001a\u0004\u0018\u00010\u000b2\b\u0010\u000e\u001a\u0004\u0018\u00010\u0011H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J%\u0010\u0014\u001a\u0004\u0018\u00010\r2\b\u0010\u0005\u001a\u0004\u0018\u00010\u00042\b\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0016¢\u0006\u0004\b\u0014\u0010\u0015J!\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0005\u001a\u00020\u00042\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J#\u0010\u001b\u001a\u00020\u00162\b\u0010\u0005\u001a\u0004\u0018\u00010\u00042\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019H\u0016¢\u0006\u0004\b\u001b\u0010\u001c¨\u0006\u001d"}, d2 = {"Lsprig/b/f;", "Landroid/webkit/WebViewClient;", "<init>", "()V", "Landroid/webkit/WebView;", "view", "", "url", "Lc1e;", "onPageFinished", "(Landroid/webkit/WebView;Ljava/lang/String;)V", "Landroid/webkit/WebResourceRequest;", "request", "Landroid/webkit/WebResourceResponse;", "errorResponse", "onReceivedHttpError", "(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V", "Landroid/webkit/WebResourceError;", "onReceivedError", "(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V", "shouldInterceptRequest", "(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;", "", "shouldOverrideUrlLoading", "(Landroid/webkit/WebView;Ljava/lang/String;)Z", "Landroid/webkit/RenderProcessGoneDetail;", "detail", "onRenderProcessGone", "(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class f extends WebViewClient {
    public static final f INSTANCE = new f();

    private f() {
    }

    @Override // android.webkit.WebViewClient
    public void onPageFinished(WebView view, String url) {
        super.onPageFinished(view, url);
        h hVar = view instanceof h ? (h) view : null;
        if (hVar == null) {
            new a(view);
        } else {
            b.sendVerboseLoggingEvent$default(b.INSTANCE, "[SprigWebView][onPageFinished] ----> Ready. Making JS call configure() in WebSDK.", null, 0, 6, null);
            h.executeJavascript$default(hVar, ev6.y("configure('", hVar.getEnvironment(), "', '", hVar.mobileHeaders$userleap_release(), "');"), null, 2, null);
        }
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError errorResponse) {
        b.sendVerboseLoggingEvent$default(b.INSTANCE, "[SprigWebView][onReceivedError] ----> " + (request != null ? request.getUrl() : null) + " " + (errorResponse != null ? Integer.valueOf(errorResponse.getErrorCode()) : null) + ": " + ((Object) (errorResponse != null ? errorResponse.getDescription() : null)), SprigLoggingLevel.ERROR, 0, 4, null);
        super.onReceivedError(view, request, errorResponse);
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedHttpError(WebView view, WebResourceRequest request, WebResourceResponse errorResponse) {
        super.onReceivedHttpError(view, request, errorResponse);
        b.sendVerboseLoggingEvent$default(b.INSTANCE, "[SprigWebView][onReceivedHttpError] ----> " + (request != null ? request.getUrl() : null) + " " + (errorResponse != null ? Integer.valueOf(errorResponse.getStatusCode()) : null) + ": " + (errorResponse != null ? errorResponse.getReasonPhrase() : null), SprigLoggingLevel.ERROR, 0, 4, null);
    }

    @Override // android.webkit.WebViewClient
    public boolean onRenderProcessGone(WebView view, RenderProcessGoneDetail detail) {
        b.sendEngineeringLoggingEvent$default(b.INSTANCE, "[SprigWebView][onRenderProcessGone] ----> detail: " + detail, SprigLoggingLevel.WARNING, 0, 4, null);
        g.INSTANCE.recreateWebViewIfSafe$userleap_release();
        return true;
    }

    @Override // android.webkit.WebViewClient
    public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
        String method = request != null ? request.getMethod() : null;
        if (method == null) {
            return super.shouldInterceptRequest(view, request);
        }
        String string = request.getUrl().toString();
        string.getClass();
        if (!method.equalsIgnoreCase("OPTIONS")) {
            b.sendEngineeringLoggingEvent$default(b.INSTANCE, lv8.r("[SprigWebView] <---- ", string, ", method=", method), null, 0, 6, null);
        }
        return super.shouldInterceptRequest(view, request);
    }

    @Override // android.webkit.WebViewClient
    public boolean shouldOverrideUrlLoading(WebView view, String url) {
        view.getClass();
        if (url == null) {
            return false;
        }
        if (!tuc.N(url, "http://", false) && !tuc.N(url, "https://", false)) {
            return false;
        }
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(url));
        intent.addFlags(268435456);
        view.getContext().startActivity(intent);
        b.sendLoggingEvent$default(b.INSTANCE, "[SprigWebView] <---- Opening external link: ".concat(url), null, 0, 6, null);
        return true;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0003\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0001\u0010\u0002"}, d2 = {"Lc1e;", "invoke", "()V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class a extends co6 implements m45 {
        final /* synthetic */ WebView $view;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(WebView webView) {
            super(0);
            this.$view = webView;
        }

        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        public final void m161invoke() {
            b.sendVerboseLoggingEvent$default(b.INSTANCE, "Web view (" + this.$view + ") is not a SprigWebView.", SprigLoggingLevel.CRITICAL, 0, 4, null);
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m161invoke();
            return c1e.a;
        }
    }
}
