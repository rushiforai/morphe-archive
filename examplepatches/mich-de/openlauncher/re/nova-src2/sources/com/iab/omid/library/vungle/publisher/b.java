package com.iab.omid.library.vungle.publisher;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Handler;
import android.util.Log;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.iab.omid.library.vungle.adsession.AdSessionContext;
import com.iab.omid.library.vungle.adsession.VerificationScriptResource;
import com.iab.omid.library.vungle.internal.g;
import com.iab.omid.library.vungle.internal.h;
import com.iab.omid.library.vungle.internal.l;
import com.iab.omid.library.vungle.utils.f;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public class b extends AdSessionStatePublisher {

    /* renamed from: g, reason: collision with root package name */
    private WebView f35252g;

    /* renamed from: h, reason: collision with root package name */
    private Long f35253h;

    /* renamed from: i, reason: collision with root package name */
    private final Map<String, VerificationScriptResource> f35254i;

    /* renamed from: j, reason: collision with root package name */
    private final String f35255j;

    public class a extends WebViewClient {
        public a() {
        }

        @Override // android.webkit.WebViewClient
        public boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
            return b.this.a(webView, renderProcessGoneDetail);
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView webView, WebResourceRequest webResourceRequest) {
            return com.iab.omid.library.vungle.webviewclient.a.a(webResourceRequest.getUrl().toString());
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView webView, String str) {
            return com.iab.omid.library.vungle.webviewclient.a.a(str);
        }
    }

    /* renamed from: com.iab.omid.library.vungle.publisher.b$b, reason: collision with other inner class name */
    public class C0129b extends WebViewClient {
        public C0129b() {
        }

        @Override // android.webkit.WebViewClient
        public boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
            return b.this.a(webView, renderProcessGoneDetail);
        }
    }

    public class c implements Runnable {

        /* renamed from: a, reason: collision with root package name */
        private final WebView f35258a;

        public c() {
            this.f35258a = b.this.f35252g;
        }

        @Override // java.lang.Runnable
        public void run() {
            this.f35258a.destroy();
        }
    }

    public b(String str, Map<String, VerificationScriptResource> map, String str2) {
        super(str);
        this.f35253h = null;
        this.f35254i = map;
        this.f35255j = str2;
    }

    private WebViewClient c(boolean z11) {
        return z11 ? k() : j();
    }

    private WebViewClient j() {
        return new C0129b();
    }

    private WebViewClient k() {
        return new a();
    }

    @Override // com.iab.omid.library.vungle.publisher.AdSessionStatePublisher
    public void b() {
        super.b();
        new Handler().postDelayed(new c(), Math.max(4000 - (this.f35253h == null ? 4000L : TimeUnit.MILLISECONDS.convert(f.b() - this.f35253h.longValue(), TimeUnit.NANOSECONDS)), 2000L));
        this.f35252g = null;
    }

    @Override // com.iab.omid.library.vungle.publisher.AdSessionStatePublisher
    public void i() {
        super.i();
        l();
    }

    @SuppressLint({"SetJavaScriptEnabled"})
    public void l() {
        Context contextA = g.b().a();
        WebView webView = new WebView(contextA);
        this.f35252g = webView;
        webView.getSettings().setJavaScriptEnabled(true);
        this.f35252g.getSettings().setAllowContentAccess(false);
        this.f35252g.getSettings().setAllowFileAccess(false);
        this.f35252g.setWebViewClient(c(a(com.iab.omid.library.vungle.attestation.g.a(this.f35252g), contextA)));
        a(this.f35252g);
        h.a().c(this.f35252g, this.f35255j);
        for (String str : this.f35254i.keySet()) {
            h.a().d(this.f35252g, this.f35254i.get(str).getResourceUrl().toExternalForm(), str);
        }
        this.f35253h = Long.valueOf(f.b());
    }

    @Override // com.iab.omid.library.vungle.publisher.AdSessionStatePublisher
    public void a(com.iab.omid.library.vungle.adsession.a aVar, AdSessionContext adSessionContext) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        Map<String, VerificationScriptResource> injectedResourcesMap = adSessionContext.getInjectedResourcesMap();
        for (String str : injectedResourcesMap.keySet()) {
            com.iab.omid.library.vungle.utils.c.a(jSONObject, str, injectedResourcesMap.get(str).toJsonObject());
        }
        a(aVar, adSessionContext, jSONObject);
    }

    private boolean a(boolean z11, Context context) {
        return !z11 && com.iab.omid.library.vungle.attestation.c.a(context).b();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean a(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        StringBuilder sbA = l.a("WebView renderer gone: ");
        sbA.append(renderProcessGoneDetail.toString());
        sbA.append(" for WebView: ");
        sbA.append(webView);
        Log.w("NativeBridge", sbA.toString());
        if (getWebView() == webView) {
            Log.w("NativeBridge", "Deallocating the Native bridge as it is unusable. No further events will be generated for this session.");
            a((WebView) null);
        }
        if (webView == null) {
            return true;
        }
        webView.destroy();
        return true;
    }
}
