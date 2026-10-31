package com.fyber.inneractive.sdk.web;

import android.text.TextUtils;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.util.IAlog;
import java.lang.ref.WeakReference;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes3.dex */
public final class v0 implements com.fyber.inneractive.sdk.ignite.r {
    public boolean B;

    /* renamed from: a, reason: collision with root package name */
    public final WebView f31385a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.ignite.h f31386b;

    /* renamed from: c, reason: collision with root package name */
    public final String f31387c;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.ignite.m f31388d;

    /* renamed from: e, reason: collision with root package name */
    public final String f31389e;

    /* renamed from: f, reason: collision with root package name */
    public final String f31390f;

    /* renamed from: g, reason: collision with root package name */
    public final String f31391g;

    /* renamed from: h, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.flow.v f31392h;

    /* renamed from: i, reason: collision with root package name */
    public t0 f31393i;

    /* renamed from: k, reason: collision with root package name */
    public String f31395k;

    /* renamed from: m, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.config.global.r f31397m;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    public n0 f31398p;

    /* renamed from: q, reason: collision with root package name */
    public WeakReference f31399q;

    /* renamed from: j, reason: collision with root package name */
    public String f31394j = "invalid_task_id";

    /* renamed from: l, reason: collision with root package name */
    public boolean f31396l = false;
    public long n = 10;

    /* renamed from: r, reason: collision with root package name */
    public boolean f31400r = false;

    /* renamed from: s, reason: collision with root package name */
    public boolean f31401s = false;

    /* renamed from: t, reason: collision with root package name */
    public final AtomicInteger f31402t = new AtomicInteger(0);

    /* renamed from: u, reason: collision with root package name */
    public final AtomicBoolean f31403u = new AtomicBoolean(false);

    /* renamed from: v, reason: collision with root package name */
    public final AtomicBoolean f31404v = new AtomicBoolean(false);

    /* renamed from: w, reason: collision with root package name */
    public boolean f31405w = false;

    /* renamed from: x, reason: collision with root package name */
    public boolean f31406x = false;

    /* renamed from: y, reason: collision with root package name */
    public boolean f31407y = false;

    /* renamed from: z, reason: collision with root package name */
    public boolean f31408z = false;
    public boolean A = false;
    public boolean C = false;
    public boolean D = false;
    public final m0 E = new m0(this);

    public v0(w0 w0Var) {
        this.f31387c = w0Var.f31410a;
        this.f31388d = w0Var.f31411b;
        this.f31389e = w0Var.f31412c;
        this.f31397m = w0Var.f31413d;
        this.f31390f = w0Var.f31414e;
        this.f31391g = w0Var.f31415f;
        this.f31392h = w0Var.f31416g;
        com.fyber.inneractive.sdk.ignite.h hVar = IAConfigManager.Q.F;
        this.f31386b = hVar;
        hVar.f28485g.add(this);
        this.f31385a = new WebView(com.fyber.inneractive.sdk.util.o.f31210a);
    }

    @Override // com.fyber.inneractive.sdk.ignite.r
    public final void a(String str, String str2) {
        if (str == null || str2 == null || !str2.equals(this.f31387c)) {
            return;
        }
        this.f31394j = str;
    }

    @Override // com.fyber.inneractive.sdk.ignite.r
    public final void b(String str) {
        this.f31408z = false;
        this.A = true;
        if (this.f31394j.equals(str)) {
            this.f31386b.m();
            d("onInstallationSuccess();");
        }
    }

    @Override // com.fyber.inneractive.sdk.ignite.r
    public final void c(String str) {
        com.fyber.inneractive.sdk.flow.v vVar;
        IIgniteServiceAPI iIgniteServiceAPI;
        if (this.f31404v.get() && str != null) {
            if (str.equals(com.fyber.inneractive.sdk.ignite.j.NOT_CONNECTED.a()) || str.equals(com.fyber.inneractive.sdk.ignite.j.SESSION_EXPIRED.a())) {
                if (this.f31402t.getAndIncrement() < 2) {
                    this.f31386b.a(new q0(this));
                    return;
                }
                com.fyber.inneractive.sdk.ignite.h hVar = this.f31386b;
                com.fyber.inneractive.sdk.ignite.l lVar = hVar.o;
                if (lVar == null || !lVar.isConnected() || (iIgniteServiceAPI = hVar.f28480b) == null || !iIgniteServiceAPI.asBinder().isBinderAlive()) {
                    com.fyber.inneractive.sdk.ignite.j jVar = com.fyber.inneractive.sdk.ignite.j.FAILED_TO_BIND_SERVICE;
                    com.fyber.inneractive.sdk.ignite.h hVar2 = this.f31386b;
                    if (hVar2.f28486h || (vVar = this.f31392h) == null) {
                        return;
                    }
                    hVar2.f28486h = true;
                    vVar.a(com.fyber.inneractive.sdk.network.t.IGNITE_FLOW_FAILED_TO_START, null, jVar.a(), null);
                }
            }
        }
    }

    public final void d(String str) {
        com.fyber.inneractive.sdk.util.r.f31216b.post(new o0(this, str));
    }

    public final void e(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.f31395k = str;
        WebSettings settings = this.f31385a.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setUseWideViewPort(true);
        this.f31385a.setInitialScale(1);
        this.f31385a.setBackgroundColor(-1);
        this.f31385a.setWebViewClient(this.E);
        WebView webView = this.f31385a;
        webView.setLongClickable(false);
        webView.setOnLongClickListener(new com.fyber.inneractive.sdk.util.p0());
        this.f31385a.addJavascriptInterface(new u0(this), "nativeInterface");
        this.f31385a.loadUrl(str);
        com.fyber.inneractive.sdk.config.global.r rVar = this.f31397m;
        if (rVar != null) {
            TimeUnit timeUnit = TimeUnit.SECONDS;
            Integer numA = ((com.fyber.inneractive.sdk.config.global.features.r) rVar.a(com.fyber.inneractive.sdk.config.global.features.r.class)).a("load_timeout");
            int i5 = 10;
            int iIntValue = numA != null ? numA.intValue() : 10;
            if (iIntValue < 30 && iIntValue > 2) {
                i5 = iIntValue;
            }
            long millis = timeUnit.toMillis(i5);
            this.n = millis;
            IAlog.a("InternalStoreWebpageController: Starting load timeout with %d", Long.valueOf(millis));
        }
        this.o = System.currentTimeMillis();
        n0 n0Var = new n0(this);
        this.f31398p = n0Var;
        com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(n0Var, this.n);
    }

    @Override // com.fyber.inneractive.sdk.ignite.r
    public final void a(String str) {
        this.f31408z = true;
        if (this.f31394j.equals(str)) {
            this.f31386b.m();
            d("onInstallStart();");
        }
    }

    @Override // com.fyber.inneractive.sdk.ignite.r
    public final void a(String str, int i5, double d5) {
        if (this.f31394j.equals(str)) {
            if (i5 == 0) {
                d(String.format("onDownloadProgress(%f);", Double.valueOf(d5)));
            } else {
                if (i5 != 1) {
                    return;
                }
                d("onInstallationProgress();");
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.ignite.r
    public final void a(String str, String str2, String str3) {
        com.fyber.inneractive.sdk.flow.v vVar;
        IIgniteServiceAPI iIgniteServiceAPI;
        if (this.D) {
            this.f31408z = false;
            if (this.f31394j.equals(str)) {
                this.f31386b.m();
                if (!this.f31404v.get() && !TextUtils.isEmpty(str2) && !TextUtils.isEmpty(str2) && str2.equals("App already installed")) {
                    d("onInstallationSuccess();");
                    this.A = true;
                    return;
                }
            }
            if ((str2 != null && (str2.equals(com.fyber.inneractive.sdk.ignite.j.NOT_CONNECTED.a()) || str2.equals(com.fyber.inneractive.sdk.ignite.j.SESSION_EXPIRED.a()))) || !this.f31386b.n()) {
                if (this.f31402t.getAndIncrement() < 2) {
                    this.f31386b.a(new p0(this, str2, str3));
                    return;
                }
                this.f31386b.m();
                d("onInstallationFailed();");
                com.fyber.inneractive.sdk.ignite.h hVar = this.f31386b;
                com.fyber.inneractive.sdk.ignite.l lVar = hVar.o;
                if (lVar == null || !lVar.isConnected() || (iIgniteServiceAPI = hVar.f28480b) == null || !iIgniteServiceAPI.asBinder().isBinderAlive()) {
                    com.fyber.inneractive.sdk.ignite.j jVar = com.fyber.inneractive.sdk.ignite.j.FAILED_TO_BIND_SERVICE;
                    com.fyber.inneractive.sdk.ignite.h hVar2 = this.f31386b;
                    if (!hVar2.f28486h && (vVar = this.f31392h) != null) {
                        hVar2.f28486h = true;
                        vVar.a(com.fyber.inneractive.sdk.network.t.IGNITE_FLOW_FAILED_TO_START, null, jVar.a(), null);
                    }
                }
            } else if (!TextUtils.equals(str2, com.fyber.inneractive.sdk.ignite.j.DOWNLOAD_IS_CANCELLED.a())) {
                this.f31386b.m();
                d("onInstallationFailed();");
            }
            com.fyber.inneractive.sdk.ignite.m mVar = this.f31388d;
            if (mVar != null) {
                this.f31392h.a(com.fyber.inneractive.sdk.network.t.IGNITE_FLOW_FAILED_TO_INSTALL_APP, str2, str3, mVar);
            }
        }
    }
}
