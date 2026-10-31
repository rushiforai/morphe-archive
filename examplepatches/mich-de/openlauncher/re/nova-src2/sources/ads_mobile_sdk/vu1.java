package ads_mobile_sdk;

import android.net.Uri;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class vu1 extends WebViewClient {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f10898a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f10899b;

    public /* synthetic */ vu1(Object obj, int i5) {
        this.f10899b = i5;
        this.f10898a = obj;
    }

    @Override // android.webkit.WebViewClient
    public boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        switch (this.f10899b) {
            case 0:
                ((xu1) this.f10898a).a(webView, renderProcessGoneDetail);
                return true;
            default:
                return super.onRenderProcessGone(webView, renderProcessGoneDetail);
        }
    }

    @Override // android.webkit.WebViewClient
    public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
        switch (this.f10899b) {
            case 1:
                Intrinsics.g(view, "view");
                Intrinsics.g(request, "request");
                iy0 iy0Var = ((xw0) this.f10898a).f11866a;
                Uri url = request.getUrl();
                Intrinsics.f(url, "getUrl(...)");
                iy0Var.a(url);
                return true;
            default:
                return super.shouldOverrideUrlLoading(view, request);
        }
    }
}
