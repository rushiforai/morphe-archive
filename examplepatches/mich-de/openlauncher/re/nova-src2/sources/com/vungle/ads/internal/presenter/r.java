package com.vungle.ads.internal.presenter;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.view.MotionEvent;
import b.u4;
import com.amplitude.android.migration.DatabaseConstants;
import com.iab.omid.library.vungle.adsession.AdSession;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.AdConfig;
import com.vungle.ads.IndexHtmlError;
import com.vungle.ads.InvalidCTAUrl;
import com.vungle.ads.MraidTemplateError;
import com.vungle.ads.NetworkUnreachable;
import com.vungle.ads.PrivacyUrlError;
import com.vungle.ads.TpatError;
import com.vungle.ads.VungleError;
import com.vungle.ads.WebViewError;
import com.vungle.ads.WebViewRenderProcessUnresponsive;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.ConfigManager;
import com.vungle.ads.internal.k2;
import com.vungle.ads.internal.model.d1;
import com.vungle.ads.internal.model.i0;
import com.vungle.ads.internal.model.j3;
import com.vungle.ads.internal.model.q1;
import com.vungle.ads.internal.model.w2;
import com.vungle.ads.internal.model.y1;
import com.vungle.ads.internal.network.VungleApiClient;
import com.vungle.ads.internal.p0;
import com.vungle.ads.internal.privacy.PrivacyConsent;
import com.vungle.ads.internal.privacy.PrivacyManager;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.r1;
import com.vungle.ads.internal.util.PathProvider;
import h6.c1;
import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KTypeProjection;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializersKt;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonObject;
import kotlinx.serialization.modules.SerializersModule;

/* loaded from: classes4.dex */
public final class r implements com.vungle.ads.internal.ui.view.n, com.vungle.ads.internal.ui.view.o {

    /* renamed from: a, reason: collision with root package name */
    public final com.vungle.ads.internal.ui.view.j f47392a;

    /* renamed from: b, reason: collision with root package name */
    public final i0 f47393b;

    /* renamed from: c, reason: collision with root package name */
    public final j3 f47394c;

    /* renamed from: d, reason: collision with root package name */
    public final com.vungle.ads.internal.ui.z f47395d;

    /* renamed from: e, reason: collision with root package name */
    public Executor f47396e;

    /* renamed from: f, reason: collision with root package name */
    public final com.vungle.ads.internal.omsdk.e f47397f;

    /* renamed from: g, reason: collision with root package name */
    public final com.vungle.ads.internal.platform.f f47398g;

    /* renamed from: h, reason: collision with root package name */
    public long f47399h;

    /* renamed from: i, reason: collision with root package name */
    public a f47400i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f47401j;

    /* renamed from: k, reason: collision with root package name */
    public final AtomicBoolean f47402k;

    /* renamed from: l, reason: collision with root package name */
    public final AtomicBoolean f47403l;

    /* renamed from: m, reason: collision with root package name */
    public Long f47404m;
    public String n;
    public final Lazy o;

    /* renamed from: p, reason: collision with root package name */
    public final Lazy f47405p;

    /* renamed from: q, reason: collision with root package name */
    public final Lazy f47406q;

    /* renamed from: r, reason: collision with root package name */
    public final Lazy f47407r;

    /* renamed from: s, reason: collision with root package name */
    public z f47408s;

    /* renamed from: t, reason: collision with root package name */
    public y f47409t;

    /* renamed from: u, reason: collision with root package name */
    public final Lazy f47410u;

    /* renamed from: v, reason: collision with root package name */
    public final Lazy f47411v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f47412w;

    /* renamed from: x, reason: collision with root package name */
    public final Lazy f47413x;

    /* renamed from: y, reason: collision with root package name */
    public long f47414y;

    /* renamed from: z, reason: collision with root package name */
    public static final Set f47391z = kotlin.collections.c.f1(new String[]{"open", "openNonMraid", "openAppStore", "openPrivacy"});
    public static final Map A = MapsKt.j0(new Pair("checkpoint.0", Sdk.SDKMetric.SDKMetricType.AD_START_EVENT), new Pair("clickUrl", Sdk.SDKMetric.SDKMetricType.AD_CLICK_EVENT));

    public r(com.vungle.ads.internal.ui.view.j adWidget, i0 advertisement, j3 placement, com.vungle.ads.internal.ui.z vungleWebClient, com.vungle.ads.internal.executor.j executor, com.vungle.ads.internal.omsdk.e omTracker, com.vungle.ads.internal.platform.f platform) {
        Intrinsics.g(adWidget, "adWidget");
        Intrinsics.g(advertisement, "advertisement");
        Intrinsics.g(placement, "placement");
        Intrinsics.g(vungleWebClient, "vungleWebClient");
        Intrinsics.g(executor, "executor");
        Intrinsics.g(omTracker, "omTracker");
        Intrinsics.g(platform, "platform");
        this.f47392a = adWidget;
        this.f47393b = advertisement;
        this.f47394c = placement;
        this.f47395d = vungleWebClient;
        this.f47396e = executor;
        this.f47397f = omTracker;
        this.f47398g = platform;
        this.f47402k = new AtomicBoolean(false);
        this.f47403l = new AtomicBoolean(false);
        Context context = adWidget.getContext();
        Intrinsics.f(context, "adWidget.context");
        LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71679a;
        this.o = LazyKt.b(lazyThreadSafetyMode, new n(context));
        Context context2 = adWidget.getContext();
        Intrinsics.f(context2, "adWidget.context");
        this.f47405p = LazyKt.b(lazyThreadSafetyMode, new o(context2));
        Context context3 = adWidget.getContext();
        Intrinsics.f(context3, "adWidget.context");
        this.f47406q = LazyKt.b(lazyThreadSafetyMode, new p(context3));
        Context context4 = adWidget.getContext();
        Intrinsics.f(context4, "adWidget.context");
        this.f47407r = LazyKt.b(lazyThreadSafetyMode, new q(context4));
        this.f47410u = LazyKt.a(m.f47386a);
        this.f47411v = LazyKt.a(new j(this));
        this.f47413x = LazyKt.a(new d(this));
    }

    public final com.vungle.ads.internal.network.r c() {
        return (com.vungle.ads.internal.network.r) this.f47407r.getValue();
    }

    public final void d() {
        if (this.f47412w) {
            this.f47392a.a("javascript:window.vungle.mraidBridgeExt.requestMRAIDClose()");
        }
    }

    public final void e() {
        Boolean bool;
        a aVar = this.f47400i;
        if (aVar != null) {
            aVar.a("successfulView", null, this.f47394c.f47068a);
        }
        if (this.f47394c.j()) {
            ConfigManager.INSTANCE.getClass();
            w2 w2Var = ConfigManager.f46715a;
            if (!((w2Var == null || (bool = w2Var.f47183i) == null) ? false : bool.booleanValue()) || this.f47403l.getAndSet(true)) {
                return;
            }
            this.f47396e.execute(new k40.a(this, 2));
        }
    }

    public final void f() {
        a((VungleError) new WebViewRenderProcessUnresponsive("fatal=true"), true, (String) null);
    }

    public final void g() {
        this.f47395d.a();
    }

    /* JADX WARN: Removed duplicated region for block: B:77:0x014d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void h() {
        String strQ;
        String strN;
        String strP;
        String strO;
        boolean z11;
        IndexHtmlError indexHtmlError;
        int settings;
        this.f47402k.set(false);
        AdConfig adConfigJ = this.f47393b.j();
        if (adConfigJ != null && (settings = adConfigJ.getF46549b()) > 0) {
            this.f47412w = (settings & 2) == 2;
        }
        AdConfig adConfigJ2 = this.f47393b.j();
        Integer numValueOf = adConfigJ2 != null ? Integer.valueOf(adConfigJ2.getAdOrientation()) : null;
        this.f47392a.setOrientation((numValueOf != null && numValueOf.intValue() == 0) ? 7 : (numValueOf != null && numValueOf.intValue() == 1) ? 6 : 4);
        this.f47397f.a();
        this.f47395d.a((com.vungle.ads.internal.ui.view.n) this);
        this.f47395d.a((com.vungle.ads.internal.ui.view.o) this);
        this.f47395d.b(false);
        if (!this.f47393b.H()) {
            String str = this.f47393b.f47053i;
            File file = str != null ? new File(str) : null;
            if (file == null || !file.exists()) {
                Sdk.SDKError.Reason reason = Sdk.SDKError.Reason.AD_HTML_FAILED_TO_LOAD;
                StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Fail to load html ");
                sbA.append(file != null ? file.getPath() : null);
                indexHtmlError = new IndexHtmlError(reason, sbA.toString());
            } else {
                this.f47392a.a(this.f47395d, this.f47393b.v());
                com.vungle.ads.internal.ui.view.j jVar = this.f47392a;
                StringBuilder sbA2 = com.iab.omid.library.vungle.internal.l.a("file://");
                sbA2.append(file.getPath());
                jVar.a(sbA2.toString());
                indexHtmlError = null;
            }
            if (indexHtmlError != null) {
                indexHtmlError.setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                a aVar = this.f47400i;
                if (aVar != null) {
                    aVar.a(indexHtmlError, this.f47394c.f47068a);
                }
                a();
                return;
            }
        }
        this.f47404m = Long.valueOf(System.currentTimeMillis());
        z zVar = this.f47408s;
        this.n = zVar != null ? ((r1) zVar).r() : null;
        z zVar2 = this.f47408s;
        if (zVar2 == null || (strQ = ((r1) zVar2).q()) == null) {
            strQ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        z zVar3 = this.f47408s;
        if (zVar3 == null || (strN = ((r1) zVar3).n()) == null) {
            strN = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        z zVar4 = this.f47408s;
        if (zVar4 == null || (strP = ((r1) zVar4).p()) == null) {
            strP = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        z zVar5 = this.f47408s;
        if (zVar5 == null || (strO = ((r1) zVar5).o()) == null) {
            strO = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        this.f47393b.a(strQ, strN, strP, strO);
        ConfigManager.INSTANCE.getClass();
        if (ConfigManager.m()) {
            PrivacyManager.INSTANCE.getClass();
            z11 = "unknown".equals(PrivacyManager.b());
        }
        this.f47395d.a(z11, ConfigManager.l(), ConfigManager.k(), ConfigManager.i(), ConfigManager.j());
        if (z11) {
            PrivacyManager.INSTANCE.getClass();
            PrivacyManager.a("opted_out_by_timeout", "vungle_modal", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        }
        int iA = this.f47393b.a(Boolean.valueOf(this.f47394c.j()));
        if (iA > 0) {
            ((com.vungle.ads.internal.util.o) this.f47410u.getValue()).a(new k40.a(this, 1), iA);
        } else {
            this.f47412w = true;
        }
        a aVar2 = this.f47400i;
        if (aVar2 != null) {
            aVar2.a("start", null, this.f47394c.b());
        }
    }

    public final void i() {
        Long l9 = this.f47404m;
        if (l9 != null) {
            List listB = this.f47393b.b("ad.close", String.valueOf(System.currentTimeMillis() - l9.longValue()), String.valueOf(((com.vungle.ads.internal.platform.c) this.f47398g).k()));
            if (listB != null) {
                Iterator it = listB.iterator();
                while (it.hasNext()) {
                    com.vungle.ads.internal.network.p pVar = new com.vungle.ads.internal.network.p((String) it.next());
                    pVar.f47271i = "ad.close";
                    pVar.f47272j = b();
                    c().a(pVar.a(), false);
                }
            }
        }
    }

    public final boolean j() {
        y1 y1Var;
        Long l9;
        y1 y1Var2;
        Boolean bool;
        ConfigManager.INSTANCE.getClass();
        w2 w2Var = ConfigManager.f46715a;
        if ((w2Var == null || (y1Var2 = w2Var.f47189q) == null || (bool = y1Var2.f47200a) == null) ? false : bool.booleanValue()) {
            return false;
        }
        if (this.f47399h == 0) {
            return true;
        }
        long jCurrentTimeMillis = System.currentTimeMillis() - this.f47399h;
        w2 w2Var2 = ConfigManager.f46715a;
        return jCurrentTimeMillis > ((w2Var2 == null || (y1Var = w2Var2.f47189q) == null || (l9 = y1Var.f47201b) == null) ? Long.MAX_VALUE : l9.longValue());
    }

    public static final void c(r this$0) {
        Intrinsics.g(this$0, "this$0");
        this$0.i();
    }

    public final void a(a aVar) {
        this.f47400i = aVar;
    }

    public final com.vungle.ads.internal.util.s b() {
        return (com.vungle.ads.internal.util.s) this.f47411v.getValue();
    }

    public static final void d(r this$0) {
        Intrinsics.g(this$0, "this$0");
        String strB = this$0.f47394c.b();
        List list = null;
        com.vungle.ads.internal.network.m mVarA = ((VungleApiClient) this$0.o.getValue()).a(new q1(list, this$0.f47404m, this$0.f47393b.e(), strB, this$0.n, (d1) null, 67));
        if (mVarA == null) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.b("MRAIDPresenter", "Invalid ri call.");
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Error RI API for placement: ");
            sbA.append(this$0.f47394c.b());
            new NetworkUnreachable(sbA.toString()).setLogEntry$vungle_ads_release(this$0.b()).logErrorNoReturnValue$vungle_ads_release();
            return;
        }
        mVarA.a(new h(this$0));
    }

    public final void a(z zVar) {
        this.f47408s = zVar;
    }

    public final void a(com.vungle.ads.internal.ui.k kVar) {
        this.f47409t = kVar;
    }

    public final void a(int i5) {
        long j11;
        AdSession adSession;
        a aVar;
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.a("MRAIDPresenter", "detach()");
        boolean z12 = (i5 & 1) != 0;
        boolean z13 = (i5 & 2) != 0;
        com.vungle.ads.internal.ui.z zVar = this.f47395d;
        zVar.f47665q = null;
        zVar.o = null;
        if (!z12 && z13 && !this.f47402k.getAndSet(true) && (aVar = this.f47400i) != null) {
            aVar.a("end", null, this.f47394c.f47068a);
        }
        com.vungle.ads.internal.omsdk.e eVar = this.f47397f;
        if (!eVar.f47319b || (adSession = eVar.f47320c) == null) {
            j11 = 0;
        } else {
            adSession.finish();
            j11 = com.vungle.ads.internal.omsdk.e.f47317d;
        }
        eVar.f47319b = false;
        eVar.f47320c = null;
        this.f47392a.a(j11);
    }

    public static final void e(r this$0) {
        Intrinsics.g(this$0, "this$0");
        this$0.f47412w = true;
    }

    public final void a(MotionEvent motionEvent) {
        if (motionEvent != null) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("MRAIDPresenter", "user interaction");
            this.f47399h = System.currentTimeMillis();
            ((p0) this.f47413x.getValue()).a(motionEvent);
        }
    }

    public final void a() {
        if (com.vungle.ads.internal.util.y.a()) {
            this.f47396e.execute(new k40.a(this, 0));
        } else {
            i();
        }
        com.vungle.ads.internal.util.y.a(new e(this));
    }

    public final void a(String str) {
        Handler handler = com.vungle.ads.internal.util.y.f47718a;
        com.vungle.ads.internal.util.y.a(new k(this));
        k2 k2Var = new k2(Sdk.SDKMetric.SDKMetricType.INLINE_INSTALL_STATUS);
        k2Var.f46865c = 2L;
        AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
        analyticsClient.a(k2Var, b(), str);
        analyticsClient.c(Sdk.SDKError.Reason.INLINE_INSTALL_ERROR, String.valueOf(str), b());
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:100:0x023e, code lost:
    
        r14 = r0.a();
     */
    /* JADX WARN: Code restructure failed: missing block: B:101:0x0242, code lost:
    
        r0 = com.vungle.ads.internal.util.r.a(com.tiktok.appevents.edp.TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, r20);
     */
    /* JADX WARN: Code restructure failed: missing block: B:102:0x024c, code lost:
    
        if (com.vungle.ads.internal.util.n.a(r0) != false) goto L104;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x024e, code lost:
    
        new com.vungle.ads.InvalidCTAUrl(h6.c1.m(')', "Invalid CTA Url (", r0)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x0268, code lost:
    
        if (j() == false) goto L108;
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x026a, code lost:
    
        r18.f47399h = 0;
        a("open", r0, true);
     */
    /* JADX WARN: Code restructure failed: missing block: B:108:0x0272, code lost:
    
        r18.f47399h = 0;
        r2 = r18.f47392a.getContext();
        kotlin.jvm.internal.Intrinsics.f(r2, "adWidget.context");
        r0 = com.vungle.ads.internal.util.l.a(r14, r0, r2, b(), new com.vungle.ads.internal.presenter.f(r14, r18));
        r2 = r18.f47400i;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x028e, code lost:
    
        if (r2 == null) goto L111;
     */
    /* JADX WARN: Code restructure failed: missing block: B:110:0x0290, code lost:
    
        r2.a("open", "adClick", r18.f47394c.b());
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x0299, code lost:
    
        if (r0 == false) goto L287;
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:0x029b, code lost:
    
        r0 = r18.f47400i;
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x029d, code lost:
    
        if (r0 == null) goto L288;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x029f, code lost:
    
        r0.a("open", "adLeftApplication", r18.f47394c.b());
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x021e, code lost:
    
        if (r19.equals("open") == false) goto L256;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x0232, code lost:
    
        if (r19.equals("openNonMraid") == false) goto L256;
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x0236, code lost:
    
        r0 = r18.f47393b.c();
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x023c, code lost:
    
        if (r0 == null) goto L101;
     */
    /* JADX WARN: Removed duplicated region for block: B:270:0x0661  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(String command, JsonObject arguments) {
        int iIntValue;
        Integer numU0;
        Object objA;
        boolean z11;
        String upperCase;
        long j11;
        List listA;
        Sdk.SDKError.Reason reason;
        Intrinsics.g(command, "command");
        Intrinsics.g(arguments, "arguments");
        String strA = null;
        Map map = null;
        switch (command.hashCode()) {
            case -1988620632:
                if (command.equals("detectBlackScreen")) {
                    String strA2 = com.vungle.ads.internal.util.r.a("samplingFactor", arguments);
                    if (strA2 == null || (numU0 = r70.i.u0(strA2)) == null) {
                        iIntValue = 100;
                    } else {
                        Integer num = numU0.intValue() > 0 ? numU0 : null;
                        if (num != null) {
                            iIntValue = num.intValue();
                        }
                    }
                    this.f47395d.a(iIntValue);
                    break;
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case -1912374177:
                if (command.equals("successfulView")) {
                    e();
                    break;
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z122 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case -1422950858:
                if (command.equals("action")) {
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z1222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case -735200587:
                if (command.equals("actionWithValue")) {
                    String strA3 = com.vungle.ads.internal.util.r.a(DatabaseConstants.EVENT_FIELD, arguments);
                    String strA4 = com.vungle.ads.internal.util.r.a("value", arguments);
                    if ("videoLength".equalsIgnoreCase(strA3)) {
                        try {
                            int i5 = Result.f71687b;
                            objA = strA4 != null ? Long.valueOf(Long.parseLong(strA4)) : null;
                        } catch (Throwable th2) {
                            int i11 = Result.f71687b;
                            objA = ResultKt.a(th2);
                        }
                        Long l9 = (Long) (objA instanceof Result.Failure ? null : objA);
                        this.f47414y = l9 != null ? l9.longValue() : 0L;
                        break;
                    }
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z12222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case -660787472:
                if (command.equals("consentAction")) {
                    String strA5 = com.vungle.ads.internal.util.r.a(DatabaseConstants.EVENT_FIELD, arguments);
                    PrivacyConsent privacyConsent = PrivacyConsent.OPT_OUT;
                    String value = Intrinsics.b(strA5, privacyConsent.getValue()) ? privacyConsent.getValue() : PrivacyConsent.OPT_IN.getValue();
                    PrivacyManager.INSTANCE.getClass();
                    PrivacyManager.a(value, "vungle_modal", null);
                    break;
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z122222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case -649897046:
                if (command.equals("openAppStore")) {
                    com.vungle.ads.internal.model.i iVarC = this.f47393b.c();
                    String strA6 = iVarC != null ? iVarC.a() : null;
                    String strA7 = com.vungle.ads.internal.util.r.a(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, arguments);
                    if (!com.vungle.ads.internal.util.n.a(strA7)) {
                        new InvalidCTAUrl(c1.m(')', "Invalid InlineInstall Url (", strA7)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                    }
                    Context context = this.f47392a.getContext();
                    Intrinsics.f(context, "adWidget.context");
                    boolean zA = com.vungle.ads.internal.util.l.a(strA6, null, context, b(), new f(strA6, this));
                    if (zA) {
                        z11 = zA;
                    } else {
                        if (strA7 != null && strA7.length() != 0) {
                            Uri uri = Uri.parse(strA7);
                            Intrinsics.f(uri, "parse(this)");
                            Intent intent = new Intent("android.intent.action.VIEW", uri);
                            intent.setPackage("com.android.vending");
                            if (!(this.f47392a.getContext() instanceof Activity)) {
                                intent.addFlags(268435456);
                            }
                            if (intent.resolveActivity(this.f47392a.getContext().getPackageManager()) == null) {
                                a("url: " + strA7 + ", message: play store not installed");
                            } else {
                                y yVar = this.f47409t;
                                Pair pairA = yVar != null ? ((com.vungle.ads.internal.ui.k) yVar).a(intent) : new Pair(Boolean.FALSE, null);
                                boolean zBooleanValue = ((Boolean) pairA.f71683a).booleanValue();
                                String str = (String) pairA.f71684b;
                                if (!zBooleanValue) {
                                    a("url: " + strA7 + ", message: " + str);
                                } else {
                                    String strA8 = com.iab.omid.library.vungle.d.a("url: ", strA7);
                                    k2 k2Var = new k2(Sdk.SDKMetric.SDKMetricType.INLINE_INSTALL_STATUS);
                                    k2Var.f46865c = 1L;
                                    AnalyticsClient.INSTANCE.a(k2Var, b(), strA8);
                                    z11 = true;
                                }
                            }
                        } else {
                            a("url: " + strA7 + ", message: url is null/empty");
                        }
                        z11 = false;
                    }
                    if (z11) {
                        this.f47399h = 0L;
                        a aVar = this.f47400i;
                        if (aVar != null) {
                            aVar.a("open", "adClick", this.f47394c.b());
                        }
                        a aVar2 = this.f47400i;
                        if (aVar2 != null) {
                            aVar2.a("open", "adLeftApplication", this.f47394c.b());
                            break;
                        }
                    }
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z1222222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case -568000867:
                if (command.equals("pingUrl")) {
                    String strA9 = com.vungle.ads.internal.util.r.a("requestType", arguments);
                    if (strA9 != null) {
                        upperCase = strA9.toUpperCase(Locale.ROOT);
                        Intrinsics.f(upperCase, "this as java.lang.String).toUpperCase(Locale.ROOT)");
                    } else {
                        upperCase = null;
                    }
                    if (!b70.g.O0(ul.b.Q("GET", "POST"), upperCase)) {
                        new TpatError(Sdk.SDKError.Reason.TPAT_ERROR, b.c0.l("Invalid request type: ", upperCase, ". Only 'GET' and 'POST' are supported")).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                        break;
                    } else {
                        String strA10 = com.vungle.ads.internal.util.r.a(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, arguments);
                        String strA11 = com.vungle.ads.internal.util.r.a("requestData", arguments);
                        boolean z13 = Boolean.parseBoolean(com.vungle.ads.internal.util.r.a("retry", arguments));
                        String strA12 = com.vungle.ads.internal.util.r.a("headers", arguments);
                        if (strA12 != null) {
                            try {
                                Json.Companion r92 = Json.INSTANCE;
                                SerializersModule serializersModule = r92.getSerializersModule();
                                KTypeProjection.Companion companion = KTypeProjection.INSTANCE;
                                KSerializer<Object> kSerializerSerializer = SerializersKt.serializer(serializersModule, Reflection.e(companion.invariant(Reflection.b(String.class)), companion.invariant(Reflection.b(String.class))));
                                Intrinsics.e(kSerializerSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of kotlinx.serialization.internal.Platform_commonKt.cast>");
                                map = (Map) r92.decodeFromString(kSerializerSerializer, strA12);
                            } catch (Exception unused) {
                                new TpatError(Sdk.SDKError.Reason.TPAT_ERROR, com.iab.omid.library.vungle.d.a("Failed to decode header: ", strA12)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                                return;
                            }
                        }
                        if (!com.vungle.ads.internal.util.z.a(strA10)) {
                            new TpatError(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR, "URL is missing in params from a template for generic tpat").setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                            break;
                        } else if (strA10 != null) {
                            com.vungle.ads.internal.network.p pVarA = new com.vungle.ads.internal.network.p(strA10).a(map).a(strA11).a(z13).b("pingUrl").a(b());
                            if (Intrinsics.b(upperCase, "GET")) {
                                pVarA.b();
                            } else {
                                pVarA.c();
                            }
                            c().a(pVarA.a(), false);
                            break;
                        }
                    }
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z12222222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case -511324706:
                if (command.equals("openPrivacy")) {
                    String strA13 = com.vungle.ads.internal.util.r.a(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, arguments);
                    if (j()) {
                        this.f47399h = 0L;
                        a("openPrivacy", strA13, true);
                        break;
                    } else {
                        if (strA13 != null && strA13.length() != 0) {
                            if (com.vungle.ads.internal.util.n.a(strA13)) {
                                this.f47399h = 0L;
                                AnalyticsClient.a(AnalyticsClient.INSTANCE, new k2(Sdk.SDKMetric.SDKMetricType.PRIVACY_URL_OPENED), b(), 4);
                                Context context2 = this.f47392a.getContext();
                                Intrinsics.f(context2, "adWidget.context");
                                if (com.vungle.ads.internal.util.l.a(null, strA13, context2, b(), null)) {
                                    a aVar3 = this.f47400i;
                                    if (aVar3 != null) {
                                        aVar3.a("open", "adLeftApplication", this.f47394c.b());
                                        break;
                                    }
                                } else {
                                    new PrivacyUrlError(com.iab.omid.library.vungle.d.a("Failed to launch privacy url: ", strA13)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                                    break;
                                }
                            } else {
                                j11 = 0;
                            }
                        } else {
                            j11 = 0;
                        }
                        this.f47399h = j11;
                        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Invalid privacy url: ");
                        if (strA13 == null) {
                            strA13 = "nonePrivacyUrl";
                        }
                        sbA.append(strA13);
                        new PrivacyUrlError(sbA.toString()).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                        break;
                    }
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z122222222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case -418575596:
                break;
            case -348095344:
                if (command.equals("useCustomPrivacy")) {
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z1222222222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case 3417674:
                break;
            case 3566511:
                if (command.equals("tpat")) {
                    String strA14 = com.vungle.ads.internal.util.r.a(DatabaseConstants.EVENT_FIELD, arguments);
                    if (strA14 != null && strA14.length() != 0) {
                        Sdk.SDKMetric.SDKMetricType sDKMetricType = (Sdk.SDKMetric.SDKMetricType) A.get(strA14);
                        if (sDKMetricType != null) {
                            AnalyticsClient.a(AnalyticsClient.INSTANCE, new k2(sDKMetricType), b(), 4);
                        }
                        if (strA14.equals("checkpoint.0")) {
                            listA = this.f47393b.b(strA14, ((com.vungle.ads.internal.platform.c) this.f47398g).e(), String.valueOf(((com.vungle.ads.internal.platform.c) this.f47398g).k()));
                        } else if (strA14.equals("video.length")) {
                            listA = i0.a(this.f47393b, strA14, String.valueOf(this.f47414y), 4);
                        } else {
                            listA = i0.a(this.f47393b, strA14, (String) null, 6);
                        }
                        if (listA != null) {
                            Iterator it = listA.iterator();
                            while (it.hasNext()) {
                                c().a(new com.vungle.ads.internal.network.p((String) it.next()).b(strA14).a(b()).a(), false);
                            }
                        }
                        if (strA14.equals("checkpoint.0") && !this.f47401j) {
                            this.f47401j = true;
                            a aVar4 = this.f47400i;
                            if (aVar4 != null) {
                                aVar4.a("adViewed", null, this.f47394c.b());
                            }
                            Handler handler = com.vungle.ads.internal.util.y.f47718a;
                            com.vungle.ads.internal.util.y.a(new i(this));
                            break;
                        }
                    } else {
                        new TpatError(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR, "Empty tpat key").setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                        break;
                    }
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z12222222222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case 94756344:
                if (command.equals(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39150d)) {
                    a();
                    break;
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z122222222222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case 96784904:
                if (command.equals("error")) {
                    String strA15 = com.vungle.ads.internal.util.r.a(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, arguments);
                    boolean z14 = Boolean.parseBoolean(com.vungle.ads.internal.util.r.a("fatal", arguments));
                    String strA16 = com.vungle.ads.internal.util.r.a("errorMessage", arguments);
                    if (z14) {
                        reason = Sdk.SDKError.Reason.AD_CLOSED_TEMPLATE_ERROR;
                    } else {
                        reason = Sdk.SDKError.Reason.MRAID_ERROR;
                    }
                    String strM = u4.m(strA15, " : ", strA16);
                    MraidTemplateError mraidTemplateError = new MraidTemplateError(reason, strM);
                    Handler handler2 = com.vungle.ads.internal.util.y.f47718a;
                    com.vungle.ads.internal.util.y.a(new g(this, mraidTemplateError, z14, strM));
                    break;
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z1222222222222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case 133423073:
                if (command.equals(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39154h)) {
                    String strA17 = com.vungle.ads.internal.util.r.a("forceOrientation", arguments);
                    if (strA17 != null && strA17.length() != 0) {
                        Locale ENGLISH = Locale.ENGLISH;
                        Intrinsics.f(ENGLISH, "ENGLISH");
                        String lowerCase = strA17.toLowerCase(ENGLISH);
                        Intrinsics.f(lowerCase, "this as java.lang.String).toLowerCase(locale)");
                        if (lowerCase.equals("landscape")) {
                            this.f47392a.setOrientation(6);
                            break;
                        } else if (lowerCase.equals("portrait")) {
                            this.f47392a.setOrientation(7);
                            break;
                        }
                    }
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z12222222222222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case 592314818:
                if (command.equals("updateSignals")) {
                    String strA18 = com.vungle.ads.internal.util.r.a("signals", arguments);
                    if (strA18 != null && strA18.length() != 0) {
                        ((com.vungle.ads.internal.signals.j) this.f47406q.getValue()).b(strA18);
                        break;
                    }
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z122222222222222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case 1496446614:
                if (command.equals("getAvailableDiskSpace")) {
                    try {
                        Context context3 = this.f47392a.getContext();
                        File noBackupFilesDir = context3.getNoBackupFilesDir();
                        PathProvider pathProvider = (PathProvider) this.f47405p.getValue();
                        String path = noBackupFilesDir.getPath();
                        Intrinsics.f(path, "dir.path");
                        pathProvider.getClass();
                        this.f47395d.a(PathProvider.a(path), com.vungle.ads.internal.util.z.a(context3));
                        break;
                    } catch (Exception e3) {
                        boolean z15 = com.vungle.ads.internal.util.u.f47714a;
                        StringBuilder sbA2 = com.iab.omid.library.vungle.internal.l.a("Failed to get available disk space: ");
                        sbA2.append(e3.getMessage());
                        com.vungle.ads.internal.util.t.b("MRAIDPresenter", sbA2.toString());
                        return;
                    }
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z1222222222222222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            case 1614272768:
                if (command.equals("useCustomClose")) {
                }
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z12222222222222222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
            default:
                new MraidTemplateError(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY, com.iab.omid.library.vungle.d.a("Unknown MRAID Command: ", command)).setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
                boolean z122222222222222222 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("MRAIDPresenter", "processCommand# Unknown MRAID Command: ".concat(command));
                break;
        }
    }

    public final void a(String command, String url) {
        Intrinsics.g(command, "command");
        Intrinsics.g(url, "url");
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.a("MRAIDPresenter", new l(command, url));
        if (f47391z.contains(command)) {
            a(command, url, false);
        }
    }

    public final void a(String str, String str2, boolean z11) {
        k2 k2Var = new k2(Sdk.SDKMetric.SDKMetricType.BANNER_AUTO_REDIRECT);
        StringBuilder sb2 = new StringBuilder("command: ");
        sb2.append(str);
        sb2.append(", mainFrame: ");
        sb2.append(z11);
        if (str2 != null) {
            sb2.append(", url: ");
            sb2.append(str2);
        }
        String string = sb2.toString();
        Intrinsics.f(string, "StringBuilder().apply(builderAction).toString()");
        k2Var.a(string);
        AnalyticsClient.a(AnalyticsClient.INSTANCE, k2Var, b(), 4);
    }

    public final void a(boolean z11, String errorDesc) {
        Intrinsics.g(errorDesc, "errorDesc");
        if (z11) {
            WebViewError webViewError = new WebViewError(errorDesc);
            webViewError.setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
            a aVar = this.f47400i;
            if (aVar != null) {
                aVar.a(webViewError, this.f47394c.f47068a);
            }
            a();
        }
    }

    public final void a(VungleError vungleError, boolean z11, String str) {
        boolean z12 = com.vungle.ads.internal.util.u.f47714a;
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("handleWebViewException: ");
        sbA.append(vungleError.getLocalizedMessage());
        sbA.append(", fatal: ");
        sbA.append(z11);
        sbA.append(", errorMsg: ");
        sbA.append(str);
        com.vungle.ads.internal.util.t.b("MRAIDPresenter", sbA.toString());
        vungleError.setLogEntry$vungle_ads_release(b()).logErrorNoReturnValue$vungle_ads_release();
        if (z11) {
            a aVar = this.f47400i;
            if (aVar != null) {
                aVar.a(vungleError, this.f47394c.f47068a);
            }
            a();
        }
    }
}
