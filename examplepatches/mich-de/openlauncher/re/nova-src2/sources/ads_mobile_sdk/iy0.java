package ads_mobile_sdk;

import android.content.Intent;
import android.net.Uri;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import b.c0;
import b.e6;
import b.t2;
import java.io.ByteArrayInputStream;
import java.nio.charset.Charset;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import t70.m0;

/* loaded from: classes2.dex */
public final class iy0 extends WebViewClient {

    /* renamed from: a, reason: collision with root package name */
    public final b.u7 f5028a;

    /* renamed from: b, reason: collision with root package name */
    public final tx0 f5029b;

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f5030c;

    /* renamed from: d, reason: collision with root package name */
    public final rw0 f5031d;

    /* renamed from: e, reason: collision with root package name */
    public final k8 f5032e;

    /* renamed from: f, reason: collision with root package name */
    public final jr0 f5033f;

    /* renamed from: g, reason: collision with root package name */
    public final b.xc f5034g;

    /* renamed from: h, reason: collision with root package name */
    public final e6 f5035h;

    /* renamed from: i, reason: collision with root package name */
    public final io.sentry.e3 f5036i;

    /* renamed from: j, reason: collision with root package name */
    public final AtomicBoolean f5037j;

    /* renamed from: k, reason: collision with root package name */
    public final AtomicBoolean f5038k;

    /* renamed from: l, reason: collision with root package name */
    public final AtomicInteger f5039l;

    /* renamed from: m, reason: collision with root package name */
    public final io.sentry.e3 f5040m;
    public final io.sentry.e3 n;
    public final io.sentry.e3 o;

    /* renamed from: p, reason: collision with root package name */
    public final io.sentry.e3 f5041p;

    /* renamed from: q, reason: collision with root package name */
    public hr1 f5042q;

    /* renamed from: r, reason: collision with root package name */
    public zs3 f5043r;

    /* renamed from: s, reason: collision with root package name */
    public final io.sentry.e3 f5044s;

    /* renamed from: t, reason: collision with root package name */
    public final AtomicBoolean f5045t;

    /* renamed from: u, reason: collision with root package name */
    public volatile z03 f5046u;

    /* renamed from: w, reason: collision with root package name */
    public static final /* synthetic */ KProperty[] f5027w = {t2.C(iy0.class, "loadedDeferred", "getLoadedDeferred()Lkotlinx/coroutines/CompletableDeferred;"), t2.C(iy0.class, "encounteredError", "getEncounteredError()Lcom/google/android/libraries/ads/mobile/sdk/internal/util/GmaResult$WebError;"), t2.C(iy0.class, "followUrls", "getFollowUrls()Z"), t2.C(iy0.class, "isCrossProcessAdEnabled", "isCrossProcessAdEnabled()Z"), t2.C(iy0.class, "adEventEmitter", "getAdEventEmitter()Lcom/google/android/libraries/ads/mobile/sdk/internal/event/InternalAdEventListener;"), t2.C(iy0.class, "onJavascriptReadyListener", "getOnJavascriptReadyListener()Lcom/google/android/libraries/ads/mobile/sdk/internal/webview/JavascriptReadyListener;")};

    /* renamed from: v, reason: collision with root package name */
    public static final lm.e f5026v = new lm.e(11);

    public iy0(b.u7 u7Var, tx0 tx0Var, t70.j0 backgroundScope, rw0 gmaUtil, k8 adSpamClient, jr0 flags, b.xc xcVar, e6 httpClient) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Intrinsics.g(adSpamClient, "adSpamClient");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(httpClient, "httpClient");
        this.f5028a = u7Var;
        this.f5029b = tx0Var;
        this.f5030c = backgroundScope;
        this.f5031d = gmaUtil;
        this.f5032e = adSpamClient;
        this.f5033f = flags;
        this.f5034g = xcVar;
        this.f5035h = httpClient;
        Object obj = null;
        this.f5036i = new io.sentry.e3(1, obj, obj);
        this.f5037j = new AtomicBoolean(false);
        this.f5038k = new AtomicBoolean(false);
        this.f5039l = new AtomicInteger(0);
        this.f5040m = new io.sentry.e3(1, obj, obj);
        Boolean bool = Boolean.FALSE;
        int i5 = 1;
        this.n = new io.sentry.e3(i5, obj, bool);
        this.o = new io.sentry.e3(i5, obj, bool);
        int i11 = 1;
        this.f5041p = new io.sentry.e3(i11, obj, obj);
        this.f5044s = new io.sentry.e3(i11, obj, obj);
        this.f5045t = new AtomicBoolean(false);
    }

    public final b.xc a() {
        return this.f5034g;
    }

    public final zs3 c() {
        return this.f5043r;
    }

    public final void d() {
        KProperty[] kPropertyArr = f5027w;
        zu0 zu0Var = (zu0) this.f5040m.getValue(this, kPropertyArr[1]);
        io.sentry.e3 e3Var = this.f5036i;
        if (zu0Var != null) {
            t70.r rVar = (t70.r) e3Var.getValue(this, kPropertyArr[0]);
            if (rVar != null) {
                ((t70.s) rVar).X(zu0Var);
            }
            e3Var.setValue(this, kPropertyArr[0], null);
            return;
        }
        if (this.f5029b.f10131k.get()) {
            bv0 bv0Var = bv0.f1574c;
            t70.r rVar2 = (t70.r) e3Var.getValue(this, kPropertyArr[0]);
            if (rVar2 != null) {
                ((t70.s) rVar2).X(bv0Var);
            }
            e3Var.setValue(this, kPropertyArr[0], null);
            return;
        }
        if (this.f5038k.get()) {
            bv0 bv0Var2 = bv0.f1574c;
            t70.r rVar3 = (t70.r) e3Var.getValue(this, kPropertyArr[0]);
            if (rVar3 != null) {
                ((t70.s) rVar3).X(bv0Var2);
            }
            e3Var.setValue(this, kPropertyArr[0], null);
            return;
        }
        if (!this.f5037j.get() || this.f5039l.get() > 0) {
            return;
        }
        xu0 xu0Var = new xu0(Unit.f71706a);
        t70.r rVar4 = (t70.r) e3Var.getValue(this, kPropertyArr[0]);
        if (rVar4 != null) {
            ((t70.s) rVar4).X(xu0Var);
        }
        e3Var.setValue(this, kPropertyArr[0], null);
    }

    @Override // android.webkit.WebViewClient
    public final void onLoadResource(WebView view, String url) throws Throwable {
        Intrinsics.g(view, "view");
        Intrinsics.g(url, "url");
        Uri uri = Uri.parse(url);
        f5026v.getClass();
        if (lm.e.h(uri)) {
            m0.u(EmptyCoroutineContext.f71803a, new vx0(this, uri, null, 2));
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onPageFinished(WebView webView, String url) throws Throwable {
        Intrinsics.g(webView, "webView");
        Intrinsics.g(url, "url");
        this.f5037j.set(true);
        ty1 ty1Var = (ty1) this.f5044s.getValue(this, f5027w[5]);
        Continuation continuation = null;
        if (ty1Var != null) {
            m0.u(EmptyCoroutineContext.f71803a, new ns3(ty1Var.f10148a, ty1Var.f10149b, continuation, 1));
        }
        d();
        if (this.f5029b.f10131k.get()) {
            ay0 ay0Var = new ay0(this, continuation, 1);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            t70.j0 j0Var = this.f5030c;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(ay0Var, null), 2);
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, int i5, String str, String str2) {
        super.onReceivedError(webView, i5, str, str2);
        zu0 zu0Var = new zu0(i5, str, str2);
        this.f5040m.setValue(this, f5027w[1], zu0Var);
    }

    @Override // android.webkit.WebViewClient
    public final boolean onRenderProcessGone(WebView view, RenderProcessGoneDetail detail) {
        Intrinsics.g(view, "view");
        Intrinsics.g(detail, "detail");
        boolean zDidCrash = detail.didCrash();
        int iRendererPriorityAtExit = detail.rendererPriorityAtExit();
        tx0 tx0Var = this.f5029b;
        ViewParent parent = tx0Var.getParent();
        Continuation continuation = null;
        ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
        if (viewGroup != null) {
            viewGroup.removeView(tx0Var);
        }
        zi3.a(tx0Var.f10122b, new bx0(tx0Var, continuation, 4));
        zi3.a(tx0Var.f10123c, new bx0(tx0Var, continuation, 5));
        StringBuilder sb2 = new StringBuilder("WebView render process gone. Crashed? ");
        sb2.append(zDidCrash);
        String strP = c0.p(sb2, " Priority? ", iRendererPriorityAtExit);
        tx0Var.f10125e.a(strP, (Throwable) new Exception(strP));
        return true;
    }

    @Override // android.webkit.WebViewClient
    public final WebResourceResponse shouldInterceptRequest(WebView webView, WebResourceRequest webResourceRequest) {
        WebResourceResponse webResourceResponse;
        Continuation continuation = null;
        Uri url = webResourceRequest != null ? webResourceRequest.getUrl() : null;
        if (url == null) {
            return null;
        }
        if (!Intrinsics.b(url.toString(), "https://googlemobileads.com/warmup")) {
            iy0 iy0Var = this;
            WebResourceRequest webResourceRequest2 = webResourceRequest;
            Uri uri = url;
            m0.t(iy0Var.f5030c, null, null, new cy0(url, webResourceRequest2, iy0Var, continuation, 0), 3);
            hr1 hr1Var = iy0Var.f5042q;
            if (hr1Var != null) {
                androidx.room.q qVar = new androidx.room.q(hr1Var, iy0Var, webResourceRequest2, continuation, 5);
                iy0Var = iy0Var;
                webResourceRequest2 = webResourceRequest2;
                webResourceResponse = (WebResourceResponse) m0.u(EmptyCoroutineContext.f71803a, qVar);
            } else {
                webResourceResponse = null;
            }
            if (webResourceResponse != null) {
                return webResourceResponse;
            }
            jr0 jr0Var = iy0Var.f5033f;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads_analytics_events_via_webview_requests", Boolean.FALSE, jn.a$10)).booleanValue()) {
                return (WebResourceResponse) m0.u(EmptyCoroutineContext.f71803a, new cy0(uri, webResourceRequest2, iy0Var, continuation, 1));
            }
            return (WebResourceResponse) m0.u(EmptyCoroutineContext.f71803a, new androidx.room.q(uri, webResourceRequest2, this, (Continuation) null));
        }
        List<String> list = (List) this.f5029b.f10144z.poll();
        if (list == null) {
            list = EmptyList.f71733a;
        }
        f5026v.getClass();
        if (list.isEmpty()) {
            return new WebResourceResponse("text/html", "UTF-8", new ByteArrayInputStream(new byte[0]));
        }
        StringBuilder sb2 = new StringBuilder("<!DOCTYPE html><html><head></head><body><p>Warmup page</p>");
        for (String str : list) {
            String path = Uri.parse(str).getPath();
            if (path == null) {
                path = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            if (r70.j.A0(path, ".js", true)) {
                sb2.append("<script src=\"" + str + "\"></script>");
            } else if (r70.j.A0(path, ".css", true)) {
                sb2.append("<link rel=\"stylesheet\" href=\"" + str + "\">");
            }
        }
        sb2.append("</body></html>");
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        Charset charsetForName = Charset.forName("UTF-8");
        Intrinsics.f(charsetForName, "forName(...)");
        byte[] bytes = string.getBytes(charsetForName);
        Intrinsics.f(bytes, "getBytes(...)");
        return new WebResourceResponse("text/html", "UTF-8", new ByteArrayInputStream(bytes));
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) throws Throwable {
        Intrinsics.g(view, "view");
        Intrinsics.g(request, "request");
        lm.e eVar = f5026v;
        Uri url = request.getUrl();
        Intrinsics.f(url, "getUrl(...)");
        eVar.getClass();
        boolean zH = lm.e.h(url);
        int i5 = 2;
        int i11 = 1;
        Continuation continuation = null;
        if (zH) {
            Uri url2 = request.getUrl();
            Intrinsics.f(url2, "getUrl(...)");
            m0.u(EmptyCoroutineContext.f71803a, new vx0(this, url2, continuation, i5));
            return true;
        }
        if (((Boolean) this.n.getValue(this, f5027w[2])).booleanValue()) {
            Uri url3 = request.getUrl();
            Intrinsics.f(url3, "getUrl(...)");
            if (lm.e.k(url3)) {
                z03 z03Var = this.f5046u;
                if (z03Var != null && !z03Var.a()) {
                    m0.t(this.f5030c, null, null, new gy0(this, request, continuation, 0), 3);
                    return true;
                }
                if (!this.f5045t.getAndSet(true)) {
                    zi3.a(this.f5030c, new gy0(this, request, continuation, i11));
                }
                return super.shouldOverrideUrlLoading(view, request);
            }
        }
        if (!this.f5029b.willNotDraw()) {
            Uri url4 = request.getUrl();
            Intrinsics.f(url4, "getUrl(...)");
            a(url4);
            return true;
        }
        cz.b bVar = mu0.f7335a;
        mu0.b("Non-creative WebView unable to handle URL: " + request.getUrl(), null);
        return true;
    }

    public final void a(Uri uri) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(this.f5032e.a(uri, this.f5029b));
        z03 z03Var = this.f5046u;
        Continuation continuation = null;
        if (z03Var != null && !z03Var.a()) {
            m0.t(this.f5030c, null, null, new vx0(this, uri, continuation, 0), 3);
            return;
        }
        if (this.f5031d.a(intent)) {
            if (!this.f5045t.getAndSet(true)) {
                t70.j0 j0Var = this.f5030c;
                vx0 vx0Var = new vx0(this, uri, continuation, 1);
                EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                Intrinsics.g(j0Var, "<this>");
                Intrinsics.g(context, "context");
                m0.t(j0Var, context, null, new ar.a(vx0Var, null), 2);
            }
            if (((Boolean) this.o.getValue(this, f5027w[3])).booleanValue()) {
                t70.j0 j0Var2 = this.f5030c;
                a60.a aVar = new a60.a(this, continuation, 22);
                EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                Intrinsics.g(j0Var2, "<this>");
                Intrinsics.g(context2, "context");
                m0.t(j0Var2, context2, null, new ar.a(aVar, null), 2);
            }
        }
    }
}
