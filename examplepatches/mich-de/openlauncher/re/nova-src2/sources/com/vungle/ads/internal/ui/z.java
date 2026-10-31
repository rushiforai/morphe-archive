package com.vungle.ads.internal.ui;

import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import b.c0;
import cl.n0;
import com.amplitude.core.events.Identify;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.BuildConfig;
import com.vungle.ads.OutOfMemory;
import com.vungle.ads.WebViewRenderingProcessGone;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.model.i0;
import com.vungle.ads.internal.model.j3;
import com.vungle.ads.internal.p1;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.ui.z;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.JsonElementBuildersKt;
import kotlinx.serialization.json.JsonObjectBuilder;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class z extends WebViewClient implements com.vungle.ads.internal.util.v {

    /* renamed from: a, reason: collision with root package name */
    public final i0 f47651a;

    /* renamed from: b, reason: collision with root package name */
    public final j3 f47652b;

    /* renamed from: c, reason: collision with root package name */
    public final ExecutorService f47653c;

    /* renamed from: d, reason: collision with root package name */
    public final com.vungle.ads.internal.platform.f f47654d;

    /* renamed from: e, reason: collision with root package name */
    public final com.vungle.ads.internal.load.f f47655e;

    /* renamed from: f, reason: collision with root package name */
    public final Long f47656f;

    /* renamed from: g, reason: collision with root package name */
    public final Lazy f47657g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f47658h;

    /* renamed from: i, reason: collision with root package name */
    public String f47659i;

    /* renamed from: j, reason: collision with root package name */
    public String f47660j;

    /* renamed from: k, reason: collision with root package name */
    public String f47661k;

    /* renamed from: l, reason: collision with root package name */
    public String f47662l;

    /* renamed from: m, reason: collision with root package name */
    public WebView f47663m;
    public boolean n;
    public com.vungle.ads.internal.ui.view.n o;

    /* renamed from: p, reason: collision with root package name */
    public com.vungle.ads.internal.ui.view.o f47664p;

    /* renamed from: q, reason: collision with root package name */
    public com.vungle.ads.internal.omsdk.f f47665q;

    /* renamed from: r, reason: collision with root package name */
    public Boolean f47666r;

    /* renamed from: s, reason: collision with root package name */
    public final p1 f47667s;

    /* renamed from: t, reason: collision with root package name */
    public final p1 f47668t;

    public /* synthetic */ z(i0 i0Var, j3 j3Var, ExecutorService executorService, com.vungle.ads.internal.platform.f fVar) {
        this(i0Var, j3Var, executorService, fVar, null, null);
    }

    public static final void b(z this$0, WebView webView) throws Throwable {
        Intrinsics.g(this$0, "this$0");
        com.vungle.ads.internal.load.f fVar = this$0.f47655e;
        if (fVar != null) {
            fVar.b();
        }
        this$0.a(webView, "window.vungle.mraidBridge.notifyCommandComplete()");
    }

    public static final void c(z this$0, WebView webView) throws Throwable {
        Intrinsics.g(this$0, "this$0");
        com.vungle.ads.internal.load.f fVar = this$0.f47655e;
        if (fVar != null) {
            fVar.a();
        }
        this$0.a(webView, "window.vungle.mraidBridge.notifyCommandComplete()");
    }

    @Override // android.webkit.WebViewClient
    public final void onPageFinished(WebView webView, String str) {
        super.onPageFinished(webView, str);
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.a("VungleWebClient", s.f47587a);
        if (webView == null) {
            return;
        }
        this.f47663m = webView;
        webView.setVisibility(0);
        a();
        if (Build.VERSION.SDK_INT >= 29) {
            webView.setWebViewRenderProcessClient(new o(this.f47664p));
        }
        com.vungle.ads.internal.omsdk.f fVar = this.f47665q;
        if (fVar != null) {
            ((com.vungle.ads.internal.omsdk.e) fVar).a(webView);
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, int i5, String description, String failingUrl) {
        Intrinsics.g(description, "description");
        Intrinsics.g(failingUrl, "failingUrl");
        super.onReceivedError(webView, i5, description, failingUrl);
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedHttpError(WebView webView, WebResourceRequest webResourceRequest, WebResourceResponse webResourceResponse) {
        super.onReceivedHttpError(webView, webResourceRequest, webResourceResponse);
        String strValueOf = String.valueOf(webResourceResponse != null ? Integer.valueOf(webResourceResponse.getStatusCode()) : null);
        String strValueOf2 = String.valueOf(webResourceRequest != null ? webResourceRequest.getUrl() : null);
        boolean z11 = false;
        boolean z12 = webResourceRequest != null && webResourceRequest.isForMainFrame();
        boolean z13 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.b("VungleWebClient", "Http Error desc " + strValueOf + ' ' + z12 + " for URL " + strValueOf2);
        if ((strValueOf2.length() > 0 ? this.f47651a.b(strValueOf2) : false) && z12) {
            z11 = true;
        }
        String strG = a2.c.g(' ', strValueOf2, strValueOf);
        com.vungle.ads.internal.ui.view.o oVar = this.f47664p;
        if (oVar != null) {
            ((com.vungle.ads.internal.presenter.r) oVar).a(z11, strG);
        }
    }

    @Override // android.webkit.WebViewClient
    public final boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        this.f47663m = null;
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.a("VungleWebClient", new u(webView, renderProcessGoneDetail));
        com.vungle.ads.internal.ui.view.o oVar = this.f47664p;
        if (oVar != null) {
            Boolean boolValueOf = renderProcessGoneDetail != null ? Boolean.valueOf(renderProcessGoneDetail.didCrash()) : null;
            com.vungle.ads.internal.presenter.r rVar = (com.vungle.ads.internal.presenter.r) oVar;
            boolean zBooleanValue = boolValueOf != null ? boolValueOf.booleanValue() : true;
            rVar.a(new WebViewRenderingProcessGone(a2.c.l("didCrash=", zBooleanValue)), zBooleanValue, (String) null);
        }
        return true;
    }

    @Override // android.webkit.WebViewClient
    public final WebResourceResponse shouldInterceptRequest(WebView webView, WebResourceRequest webResourceRequest) throws Throwable {
        String scheme;
        Object objA;
        Uri url = webResourceRequest != null ? webResourceRequest.getUrl() : null;
        if (url != null && (scheme = url.getScheme()) != null) {
            Locale ROOT = Locale.ROOT;
            Intrinsics.f(ROOT, "ROOT");
            String lowerCase = scheme.toLowerCase(ROOT);
            Intrinsics.f(lowerCase, "this as java.lang.String).toLowerCase(locale)");
            if (lowerCase.equals("http") || lowerCase.equals("https")) {
                if (!this.f47651a.B()) {
                    boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                    com.vungle.ads.internal.util.t.a("VungleWebClient", x.f47649a);
                    return null;
                }
                String string = url.toString();
                Intrinsics.f(string, "uri.toString()");
                com.vungle.ads.internal.model.b bVarA = this.f47651a.a(string);
                String strC = bVarA != null ? bVarA.c() : null;
                if (strC != null && strC.length() != 0) {
                    File file = new File(strC);
                    if (file.exists()) {
                        long jB = bVarA.b();
                        if (jB > 0) {
                            long length = file.length();
                            String str = webResourceRequest.getRequestHeaders().get("Range");
                            this.f47667s.a(str + " cached:" + length + ' ' + string);
                            AnalyticsClient.a(AnalyticsClient.INSTANCE, this.f47667s, this.f47651a.q());
                            try {
                                int i5 = Result.f71687b;
                                if (str == null || !r70.j.I0(str, "bytes=", false)) {
                                    objA = new Pair(0L, null);
                                } else {
                                    List listI1 = r70.k.i1(r70.k.a1(str, "bytes="), new String[]{Identify.UNSET_VALUE}, 6);
                                    String str2 = (String) b70.g.Z0(0, listI1);
                                    Long lV0 = str2 != null ? r70.i.v0(str2) : null;
                                    String str3 = (String) b70.g.Z0(1, listI1);
                                    Long lV02 = str3 != null ? r70.i.v0(str3) : null;
                                    if (lV0 == null) {
                                        if (lV02 == null) {
                                            lV0 = 0L;
                                        } else {
                                            lV0 = Long.valueOf(jB - lV02.longValue());
                                            lV02 = null;
                                        }
                                    }
                                    objA = new Pair(lV0, lV02);
                                }
                            } catch (Throwable th2) {
                                int i11 = Result.f71687b;
                                objA = ResultKt.a(th2);
                            }
                            if (Result.a(objA) != null) {
                                objA = new Pair(0L, null);
                            }
                            Pair pair = (Pair) objA;
                            Object obj = pair.f71684b;
                            Number number = (Number) pair.f71683a;
                            bVarA.c(number.longValue());
                            Long l9 = (Long) obj;
                            bVarA.a(l9);
                            long jLongValue = number.longValue();
                            long j11 = length - jLongValue;
                            boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                            StringBuilder sb2 = new StringBuilder(">>request: ");
                            sb2.append(url);
                            sb2.append(" rangeStart=");
                            sb2.append(jLongValue);
                            sb2.append(" rangeEnd=");
                            sb2.append(l9);
                            sb2.append(" cachedFileLength=");
                            sb2.append(length);
                            c0.B(sb2, " availableBytes=", j11, " contentLength=");
                            sb2.append(jB);
                            sb2.append(' ');
                            com.vungle.ads.internal.util.t.a(sb2.toString());
                            if (j11 <= 0) {
                                com.vungle.ads.internal.util.t.a("VungleWebClient", new y(str));
                                bVarA.r();
                                length = file.length();
                            }
                            long jLongValue2 = l9 != null ? l9.longValue() : length - 1;
                            long j12 = (jLongValue2 - jLongValue) + 1;
                            try {
                                FileInputStream fileInputStream = new FileInputStream(file);
                                WebResourceResponse webResourceResponse = new WebResourceResponse(bVarA.d(), "UTF-8", Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE, "Partial Content", MapsKt.j0(new Pair("Content-Type", bVarA.d()), new Pair("Accept-Ranges", "bytes"), new Pair("Content-Length", String.valueOf(j12)), new Pair("Content-Range", "bytes " + jLongValue + '-' + jLongValue2 + '/' + jB)), new BufferedInputStream(fileInputStream, 1024));
                                StringBuilder sb3 = new StringBuilder("<<Return:");
                                sb3.append(webResourceResponse.getResponseHeaders());
                                com.vungle.ads.internal.util.t.a(sb3.toString());
                                return webResourceResponse;
                            } catch (Throwable th3) {
                                int i12 = Result.f71687b;
                                Throwable thA = Result.a(ResultKt.a(th3));
                                if (thA != null) {
                                    boolean z13 = com.vungle.ads.internal.util.u.f47714a;
                                    StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Error serving local range video: ");
                                    sbA.append(thA.getMessage());
                                    com.vungle.ads.internal.util.t.a("VungleWebClient", sbA.toString(), thA);
                                    this.f47668t.a(string + ' ' + thA.getMessage());
                                    AnalyticsClient.a(AnalyticsClient.INSTANCE, this.f47668t, this.f47651a.q());
                                }
                                return null;
                            }
                        }
                    }
                }
            }
        }
        return null;
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, String str) {
        return a(webView, str, true);
    }

    public z(i0 advertisement, j3 placement, ExecutorService offloadExecutor, com.vungle.ads.internal.platform.f fVar, com.vungle.ads.internal.load.f fVar2, Long l9) {
        Intrinsics.g(advertisement, "advertisement");
        Intrinsics.g(placement, "placement");
        Intrinsics.g(offloadExecutor, "offloadExecutor");
        this.f47651a = advertisement;
        this.f47652b = placement;
        this.f47653c = offloadExecutor;
        this.f47654d = fVar;
        this.f47655e = fVar2;
        this.f47656f = l9;
        this.f47657g = LazyKt.a(p.f47584a);
        Sdk.SDKMetric.SDKMetricType sDKMetricType = Sdk.SDKMetric.SDKMetricType.AD_PLAY_WITH_PARTIAL_DOWNLOAD_ASSET;
        this.f47667s = new p1(sDKMetricType);
        this.f47668t = new p1(sDKMetricType);
    }

    public final void a(int i5) {
        ((com.vungle.ads.internal.util.j) this.f47657g.getValue()).a(this.f47663m, i5, new q(this));
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, WebResourceRequest webResourceRequest, WebResourceError webResourceError) {
        super.onReceivedError(webView, webResourceRequest, webResourceError);
        String strValueOf = String.valueOf(webResourceError != null ? webResourceError.getDescription() : null);
        String strValueOf2 = String.valueOf(webResourceRequest != null ? webResourceRequest.getUrl() : null);
        boolean z11 = false;
        boolean z12 = webResourceRequest != null && webResourceRequest.isForMainFrame();
        boolean z13 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.b("VungleWebClient", "Error desc " + strValueOf + ' ' + z12 + " for URL " + strValueOf2);
        if ((strValueOf2.length() > 0 ? this.f47651a.b(strValueOf2) : false) && z12) {
            z11 = true;
        }
        String strG = a2.c.g(' ', strValueOf2, strValueOf);
        com.vungle.ads.internal.ui.view.o oVar = this.f47664p;
        if (oVar != null) {
            ((com.vungle.ads.internal.presenter.r) oVar).a(z11, strG);
        }
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, WebResourceRequest webResourceRequest) {
        Uri url;
        return a(webView, (webResourceRequest == null || (url = webResourceRequest.getUrl()) == null) ? null : url.toString(), webResourceRequest != null ? webResourceRequest.isForMainFrame() : true);
    }

    public final void b(boolean z11) {
        this.f47666r = Boolean.valueOf(z11);
        WebView webView = this.f47663m;
        if (webView != null) {
            JsonObjectBuilder jsonObjectBuilder = new JsonObjectBuilder();
            JsonElementBuildersKt.put(jsonObjectBuilder, "isViewable", Boolean.valueOf(z11));
            a(webView, "window.vungle.mraidBridge.notifyPropertiesChange(" + jsonObjectBuilder.build() + ')');
        }
    }

    public final void a(boolean z11, String str, String str2, String str3, String str4) {
        this.f47658h = z11;
        this.f47659i = str;
        this.f47660j = str2;
        this.f47661k = str3;
        this.f47662l = str4;
    }

    public final void a(com.vungle.ads.internal.ui.view.n nVar) {
        this.o = nVar;
    }

    public final boolean a(WebView webView, String str, boolean z11) {
        boolean zA;
        String host;
        try {
            boolean z12 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("VungleWebClient", "MRAID Command " + str + " mainFrame=" + z11);
            if (str != null && str.length() != 0) {
                Uri uri = Uri.parse(str);
                Intrinsics.f(uri, "parse(this)");
                String scheme = uri.getScheme();
                if (scheme != null && scheme.length() != 0) {
                    if (!z11) {
                        if (Intrinsics.b(scheme, "mraid")) {
                            host = uri.getHost();
                        } else if (!r70.j.B0(scheme, "http", true) && !r70.j.B0(scheme, "https", true)) {
                            host = "unknownScheme";
                        } else {
                            host = "openNonMraid";
                        }
                        if (host != null) {
                            com.vungle.ads.internal.ui.view.n nVar = this.o;
                            if (nVar != null) {
                                ((com.vungle.ads.internal.presenter.r) nVar).a(host, str);
                            }
                            return true;
                        }
                    }
                    if (Intrinsics.b(scheme, "mraid")) {
                        zA = a(webView, uri);
                    } else {
                        zA = (r70.j.B0(scheme, "http", true) || r70.j.B0(scheme, "https", true)) ? a(str) : false;
                    }
                    if (zA) {
                        return true;
                    }
                    com.vungle.ads.internal.util.t.a("VungleWebClient", new r(str));
                }
                return false;
            }
            com.vungle.ads.internal.util.t.b("VungleWebClient", "Invalid URL ");
            return false;
        } catch (Throwable th2) {
            if (th2 instanceof OutOfMemoryError) {
                new OutOfMemory(com.iab.omid.library.vungle.d.a("mraid:", str)).logErrorNoReturnValue$vungle_ads_release();
            }
            return false;
        }
    }

    public final boolean a(final WebView webView, Uri uri) {
        String host = uri.getHost();
        if (host == null) {
            return false;
        }
        int iHashCode = host.hashCode();
        if (iHashCode != -1943542072) {
            if (iHashCode != 88409791) {
                if (iHashCode == 119543762 && host.equals("readyToPlay")) {
                    final int i5 = 0;
                    this.f47653c.execute(new Runnable(this) { // from class: m40.a

                        /* renamed from: b, reason: collision with root package name */
                        public final /* synthetic */ z f76004b;

                        {
                            this.f76004b = this;
                        }

                        @Override // java.lang.Runnable
                        public final void run() throws Throwable {
                            switch (i5) {
                                case 0:
                                    z.b(this.f76004b, webView);
                                    break;
                                case 1:
                                    z.c(this.f76004b, webView);
                                    break;
                                default:
                                    z.a(this.f76004b, webView);
                                    break;
                            }
                        }
                    });
                    return true;
                }
            } else if (host.equals("failToLoad")) {
                final int i11 = 1;
                this.f47653c.execute(new Runnable(this) { // from class: m40.a

                    /* renamed from: b, reason: collision with root package name */
                    public final /* synthetic */ z f76004b;

                    {
                        this.f76004b = this;
                    }

                    @Override // java.lang.Runnable
                    public final void run() throws Throwable {
                        switch (i11) {
                            case 0:
                                z.b(this.f76004b, webView);
                                break;
                            case 1:
                                z.c(this.f76004b, webView);
                                break;
                            default:
                                z.a(this.f76004b, webView);
                                break;
                        }
                    }
                });
                return true;
            }
        } else if (host.equals("propertiesChangeCompleted")) {
            if (!this.n) {
                this.n = true;
                final int i12 = 2;
                this.f47653c.execute(new Runnable(this) { // from class: m40.a

                    /* renamed from: b, reason: collision with root package name */
                    public final /* synthetic */ z f76004b;

                    {
                        this.f76004b = this;
                    }

                    @Override // java.lang.Runnable
                    public final void run() throws Throwable {
                        switch (i12) {
                            case 0:
                                z.b(this.f76004b, webView);
                                break;
                            case 1:
                                z.c(this.f76004b, webView);
                                break;
                            default:
                                z.a(this.f76004b, webView);
                                break;
                        }
                    }
                });
            }
            return true;
        }
        a(webView, uri, host);
        return true;
    }

    public static final void a(z this$0, WebView webView) {
        Intrinsics.g(this$0, "this$0");
        this$0.a(webView, "window.vungle.mraidBridge.notifyReadyEvent(" + this$0.f47651a.g() + ')');
    }

    public final void a(WebView webView, Uri uri, String str) {
        com.vungle.ads.internal.ui.view.n nVar = this.o;
        if (nVar == null) {
            a(webView, "window.vungle.mraidBridge.notifyCommandComplete()");
        } else {
            this.f47653c.execute(new n0(nVar, str, this, webView, uri, 4));
        }
    }

    public final boolean a(String str) {
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.a("VungleWebClient", "Open URL" + str);
        com.vungle.ads.internal.ui.view.n nVar = this.o;
        if (nVar == null) {
            return true;
        }
        this.f47653c.execute(new kz.c(6, nVar, str));
        return true;
    }

    public final void a() {
        this.f47653c.execute(new g.p(this, 15));
    }

    public final void a(long j11, long j12) {
        WebView webView = this.f47663m;
        if (webView != null) {
            StringBuilder sb2 = new StringBuilder("window.vungle.mraidBridgeExt.notifyAvailableDiskSpace(");
            sb2.append(j11);
            sb2.append('-');
            a(webView, a2.c.n(sb2, j12, ')'));
        }
    }

    public final void a(String errorMessage, int i5) {
        Intrinsics.g(errorMessage, "errorMessage");
        WebView webView = this.f47663m;
        if (webView != null) {
            a(webView, "window.vungle.mraidBridgeExt.notifyBlackScreenResult(" + i5 + ')');
        }
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.a("VungleWebClient", "Returning black screen result: " + i5 + '%');
        if (i5 >= 0) {
            AnalyticsClient.a(AnalyticsClient.INSTANCE, Sdk.SDKMetric.SDKMetricType.BLACK_SCREEN_IS_DETECTED, i5, this.f47651a.q(), null, 8);
        } else {
            AnalyticsClient.INSTANCE.c(Sdk.SDKError.Reason.BLACK_SCREEN_DETECTION_ERROR, errorMessage, this.f47651a.q());
        }
    }

    @Override // com.vungle.ads.internal.util.v
    public final void a(boolean z11) {
        WebView webView = this.f47663m;
        if (webView != null) {
            JsonObjectBuilder jsonObjectBuilder = new JsonObjectBuilder();
            JsonElementBuildersKt.put(jsonObjectBuilder, "isSilent", Boolean.valueOf(z11));
            a(webView, "window.vungle.mraidBridge.notifyPropertiesChange(" + jsonObjectBuilder.build() + ')');
        }
    }

    public final void a(com.vungle.ads.internal.ui.view.o errorHandler) {
        Intrinsics.g(errorHandler, "errorHandler");
        this.f47664p = errorHandler;
    }

    public final void a(com.vungle.ads.internal.omsdk.e eVar) {
        this.f47665q = eVar;
    }

    public final void a(WebView webView, String str) {
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.a("VungleWebClient", new v(str));
        Handler handler = com.vungle.ads.internal.util.y.f47718a;
        com.vungle.ads.internal.util.y.a(new w(this, webView, str));
    }

    public static final void a(com.vungle.ads.internal.ui.view.n mraidDelegateSnapshot, String command, z this$0, WebView webView, Uri uri) {
        Intrinsics.g(mraidDelegateSnapshot, "$mraidDelegateSnapshot");
        Intrinsics.g(command, "$command");
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(uri, "$uri");
        try {
            try {
                JsonObjectBuilder jsonObjectBuilder = new JsonObjectBuilder();
                for (String param : uri.getQueryParameterNames()) {
                    Intrinsics.f(param, "param");
                    JsonElementBuildersKt.put(jsonObjectBuilder, param, uri.getQueryParameter(param));
                }
                ((com.vungle.ads.internal.presenter.r) mraidDelegateSnapshot).a(command, jsonObjectBuilder.build());
            } catch (Exception e3) {
                boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("VungleWebClient", "MRAID command failed", e3);
            }
            this$0.a(webView, "window.vungle.mraidBridge.notifyCommandComplete()");
        } catch (Throwable th2) {
            this$0.a(webView, "window.vungle.mraidBridge.notifyCommandComplete()");
            throw th2;
        }
    }

    public static final void a(com.vungle.ads.internal.ui.view.n mraidDelegateSnapshot, String url) {
        Intrinsics.g(mraidDelegateSnapshot, "$mraidDelegateSnapshot");
        Intrinsics.g(url, "$url");
        JsonObjectBuilder jsonObjectBuilder = new JsonObjectBuilder();
        JsonElementBuildersKt.put(jsonObjectBuilder, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, url);
        ((com.vungle.ads.internal.presenter.r) mraidDelegateSnapshot).a("openNonMraid", jsonObjectBuilder.build());
    }

    public static final void a(boolean z11, z this$0) {
        Intrinsics.g(this$0, "this$0");
        JsonObjectBuilder jsonObjectBuilder = new JsonObjectBuilder();
        JsonElementBuildersKt.put(jsonObjectBuilder, "placementType", this$0.f47651a.G());
        Boolean bool = this$0.f47666r;
        if (bool != null) {
            JsonElementBuildersKt.put(jsonObjectBuilder, "isViewable", bool);
        }
        JsonElementBuildersKt.put(jsonObjectBuilder, "os", "android");
        JsonElementBuildersKt.put(jsonObjectBuilder, "osVersion", String.valueOf(Build.VERSION.SDK_INT));
        JsonElementBuildersKt.put(jsonObjectBuilder, "incentivized", Boolean.valueOf(this$0.f47652b.j()));
        com.vungle.ads.internal.platform.f fVar = this$0.f47654d;
        if (fVar != null) {
            JsonElementBuildersKt.put(jsonObjectBuilder, "isSilent", Boolean.valueOf(((com.vungle.ads.internal.platform.c) fVar).n()));
        }
        Long l9 = this$0.f47656f;
        if (l9 != null) {
            JsonElementBuildersKt.put(jsonObjectBuilder, "timeLoaded", l9);
        }
        if (this$0.f47658h) {
            JsonElementBuildersKt.put(jsonObjectBuilder, "consentRequired", Boolean.TRUE);
            JsonElementBuildersKt.put(jsonObjectBuilder, "consentTitleText", this$0.f47659i);
            JsonElementBuildersKt.put(jsonObjectBuilder, "consentBodyText", this$0.f47660j);
            JsonElementBuildersKt.put(jsonObjectBuilder, "consentAcceptButtonText", this$0.f47661k);
            JsonElementBuildersKt.put(jsonObjectBuilder, "consentDenyButtonText", this$0.f47662l);
        } else {
            JsonElementBuildersKt.put(jsonObjectBuilder, "consentRequired", Boolean.FALSE);
        }
        JsonElementBuildersKt.put(jsonObjectBuilder, "sdkVersion", BuildConfig.VERSION_NAME);
        String str = "window.vungle.mraidBridge.notifyPropertiesChange(" + jsonObjectBuilder.build() + AbstractJsonLexerKt.COMMA + z11 + ')';
        WebView webView = this$0.f47663m;
        if (webView != null) {
            this$0.a(webView, str);
        }
    }
}
