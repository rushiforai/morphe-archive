package com.fyber.inneractive.sdk.web;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.graphics.Rect;
import android.os.Handler;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.k1;

/* loaded from: classes3.dex */
public abstract class i implements j, com.fyber.inneractive.sdk.util.m0, l, x0 {

    /* renamed from: b, reason: collision with root package name */
    public m f31304b;

    /* renamed from: c, reason: collision with root package name */
    public j0 f31305c;

    /* renamed from: d, reason: collision with root package name */
    public k0 f31306d;

    /* renamed from: f, reason: collision with root package name */
    public g f31308f;

    /* renamed from: g, reason: collision with root package name */
    public j1 f31309g;

    /* renamed from: j, reason: collision with root package name */
    public boolean f31312j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f31313k;

    /* renamed from: l, reason: collision with root package name */
    public f f31314l;

    /* renamed from: m, reason: collision with root package name */
    public final d f31315m;
    public final c n;
    public e o;

    /* renamed from: p, reason: collision with root package name */
    public String f31316p;

    /* renamed from: q, reason: collision with root package name */
    public String f31317q;

    /* renamed from: r, reason: collision with root package name */
    public InneractiveAdRequest f31318r;

    /* renamed from: s, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.x f31319s;

    /* renamed from: t, reason: collision with root package name */
    public com.fyber.inneractive.sdk.response.e f31320t;

    /* renamed from: a, reason: collision with root package name */
    public boolean f31303a = false;

    /* renamed from: h, reason: collision with root package name */
    public float f31310h = 0.0f;

    /* renamed from: i, reason: collision with root package name */
    public final Rect f31311i = new Rect();

    /* renamed from: e, reason: collision with root package name */
    public final boolean f31307e = false;

    public i(boolean z11, com.fyber.inneractive.sdk.config.global.r rVar) {
        this.f31313k = z11;
        this.f31304b = a(rVar);
        i1 i1Var = (i1) this;
        this.n = new c(i1Var);
        this.f31315m = new d(i1Var);
    }

    @Override // com.fyber.inneractive.sdk.web.j
    public void a(WebView webView) {
    }

    public abstract boolean a(String str, com.fyber.inneractive.sdk.util.g1 g1Var);

    public void b(boolean z11) {
        IAlog.a("%s destroy is fatal: %b", IAlog.a(this), Boolean.valueOf(z11));
        e eVar = this.o;
        if (eVar != null && !eVar.f31279a.isTerminated() && !eVar.f31279a.isShutdown()) {
            e eVar2 = this.o;
            eVar2.f31284f = true;
            eVar2.f31279a.shutdownNow();
            Handler handler = eVar2.f31280b;
            if (handler != null) {
                com.fyber.inneractive.sdk.util.d dVar = eVar2.f31282d;
                if (dVar != null) {
                    handler.removeCallbacks(dVar);
                }
                com.fyber.inneractive.sdk.util.e eVar3 = eVar2.f31281c;
                if (eVar3 != null) {
                    eVar2.f31280b.removeCallbacks(eVar3);
                }
                eVar2.f31280b = null;
            }
            this.o = null;
        }
        m mVar = this.f31304b;
        if (mVar != null) {
            com.fyber.inneractive.sdk.util.l0.f31201a.a(mVar);
            com.fyber.inneractive.sdk.util.v.a(this.f31304b);
            this.f31304b.setWebChromeClient(null);
            if (f() == null) {
                this.f31304b.destroy();
            } else {
                com.fyber.inneractive.sdk.measurement.tracker.e eVarF = f();
                un.b bVar = eVarF.f28527a;
                if (bVar != null) {
                    try {
                        bVar.c();
                    } catch (Throwable unused) {
                    }
                    com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(new com.fyber.inneractive.sdk.measurement.tracker.c(eVarF), z11 ? 0 : 1000);
                    eVarF.f28527a = null;
                    eVarF.f28528b = null;
                }
            }
        }
        k0 k0Var = this.f31306d;
        if (k0Var != null) {
            k0Var.f31351e = null;
        }
        c cVar = this.n;
        if (cVar != null) {
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(cVar);
        }
        d dVar2 = this.f31315m;
        if (dVar2 != null) {
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(dVar2);
        }
        this.f31309g = null;
        if (!z11) {
            this.f31308f = null;
        }
        this.f31304b = null;
        this.f31305c = null;
        this.f31306d = null;
        this.f31319s = null;
        this.f31318r = null;
    }

    @Override // com.fyber.inneractive.sdk.web.j
    public void d() {
    }

    public void e() {
        b(false);
    }

    public abstract com.fyber.inneractive.sdk.measurement.tracker.e f();

    public com.fyber.inneractive.sdk.util.g1 g() {
        m mVar = this.f31304b;
        return mVar != null ? mVar.getLastClickedLocation() : new com.fyber.inneractive.sdk.util.g1();
    }

    public void h() {
        m mVar = this.f31304b;
        if (mVar == null) {
            return;
        }
        WebSettings settings = mVar.getSettings();
        boolean z11 = true;
        settings.setJavaScriptEnabled(true);
        settings.setLoadsImagesAutomatically(true);
        settings.setJavaScriptCanOpenWindowsAutomatically(true);
        if (!IAConfigManager.Q.f27758r && com.fyber.inneractive.sdk.util.s.a()) {
            settings.setMixedContentMode(2);
        }
        if (this.f31307e) {
            settings.setMediaPlaybackRequiresUserGesture(false);
        }
        m mVar2 = this.f31304b;
        mVar2.setHorizontalScrollBarEnabled(false);
        mVar2.setHorizontalScrollbarOverlay(false);
        mVar2.setVerticalScrollBarEnabled(false);
        mVar2.setVerticalScrollbarOverlay(false);
        mVar2.getSettings().setSupportZoom(false);
        this.f31304b.setFocusable(true);
        this.f31304b.setBackgroundColor(0);
        j0 j0Var = new j0();
        this.f31305c = j0Var;
        this.f31304b.setWebChromeClient(j0Var);
        try {
            Context context = this.f31304b.getContext();
            ApplicationInfo applicationInfo = context != null ? context.getApplicationInfo() : null;
            if (applicationInfo == null || (applicationInfo.flags & 2) == 0) {
                z11 = false;
            }
            WebView.setWebContentsDebuggingEnabled(z11);
        } catch (Exception unused) {
            IAlog.a("Could not set web contents debugging flag", new Object[0]);
        }
        this.f31304b.setListener(this);
    }

    public final void i() {
        IAlog.a("IAWebViewController resetClick()", new Object[0]);
        c cVar = this.n;
        if (cVar != null) {
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(cVar);
        }
        d dVar = this.f31315m;
        if (dVar != null) {
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(dVar);
        }
        this.f31312j = false;
    }

    public void setAdContent(com.fyber.inneractive.sdk.flow.x xVar) {
        this.f31319s = xVar;
    }

    public void setAdRequest(InneractiveAdRequest inneractiveAdRequest) {
        this.f31318r = inneractiveAdRequest;
    }

    public void setAdResponse(com.fyber.inneractive.sdk.response.e eVar) {
        this.f31320t = eVar;
    }

    public void setListener(j1 j1Var) {
        this.f31309g = j1Var;
    }

    public final m a(com.fyber.inneractive.sdk.config.global.r rVar) {
        int i5;
        int i11;
        m mVar = new m();
        if (rVar != null) {
            com.fyber.inneractive.sdk.config.global.features.f fVar = (com.fyber.inneractive.sdk.config.global.features.f) rVar.a(com.fyber.inneractive.sdk.config.global.features.f.class);
            Boolean boolC = fVar.c("agg_res");
            zBooleanValue = boolC != null ? boolC.booleanValue() : false;
            Integer numA = fVar.a("agg_res_ct");
            int iMax = Math.max(numA != null ? numA.intValue() : 500, 50);
            Integer numA2 = fVar.a("agg_res_rt");
            int iMax2 = Math.max(numA2 != null ? numA2.intValue() : 500, 50);
            Integer numA3 = fVar.a("agg_res_retries");
            iMax = Math.max(numA3 != null ? numA3.intValue() : 2, 1);
            i11 = iMax2;
            i5 = iMax;
        } else {
            i5 = 500;
            i11 = 500;
        }
        k0 k0Var = new k0(this, zBooleanValue, i5, i11, iMax);
        this.f31306d = k0Var;
        mVar.setWebViewClient(k0Var);
        return mVar;
    }

    public final void a(InneractiveInfrastructureError inneractiveInfrastructureError) {
        g gVar = this.f31308f;
        if (gVar != null) {
            gVar.a(this, inneractiveInfrastructureError);
        }
        b(true);
    }

    @Override // com.fyber.inneractive.sdk.util.m0
    public final void a(float f11, Rect rect) {
        if (f11 == this.f31310h && rect.equals(this.f31311i)) {
            return;
        }
        this.f31310h = f11;
        this.f31311i.set(rect);
        m mVar = this.f31304b;
        if (mVar != null) {
            mVar.a();
        }
    }

    @Override // com.fyber.inneractive.sdk.web.j
    public boolean a(WebView webView, String str) {
        IAlog.a("%shandleUrl called with: %s", IAlog.a(this), str);
        if (this.f31304b == null) {
            IAlog.a("handleUrl: web view already destroyed. Cannot handle url", new Object[0]);
            return false;
        }
        if (k1.a(str)) {
            this.f31304b.loadUrl("chrome://crash");
            return true;
        }
        if (str != null && str.startsWith("data:")) {
            return false;
        }
        com.fyber.inneractive.sdk.util.g1 g1VarG = g();
        if (a(str, g1VarG)) {
            return true;
        }
        a(new h(this, str, g1VarG));
        return true;
    }

    public void a(boolean z11) {
        IAlog.a("%sonWebViewVisibilityChanged called with: %s", IAlog.a(this), Boolean.valueOf(z11));
        j1 j1Var = this.f31309g;
        if (j1Var != null) {
            j1Var.a(z11);
        }
    }

    @Override // com.fyber.inneractive.sdk.web.j
    public void a() {
        j1 j1Var = this.f31309g;
        if (j1Var != null) {
            j1Var.a();
        }
        b(true);
    }

    public final void a(f fVar) {
        IAlog.e("IAWebViewController Web view click detected", new Object[0]);
        if (this.f31312j) {
            IAlog.e("IAWebViewController Native click detected before web view request. Processing click", new Object[0]);
            fVar.d();
            i();
            return;
        }
        if (this.f31313k) {
            IAlog.e("IAWebViewController Native click was not detected yet. Caching click request and waiting", new Object[0]);
            d dVar = this.f31315m;
            if (dVar != null) {
                com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(dVar);
            }
            this.f31314l = fVar;
            if (this.f31315m != null) {
                com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(this.f31315m, IAConfigManager.Q.f27761u.f27936b.a("click_timeout", 1000, 1000));
                return;
            }
            return;
        }
        d dVar2 = this.f31315m;
        if (dVar2 != null) {
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(dVar2);
        }
        this.f31314l = null;
        fVar.d();
    }
}
