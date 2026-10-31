package com.fyber.inneractive.sdk.flow;

import android.app.Activity;
import android.view.View;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveUnitController;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.w1;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class p0 extends b0 implements com.fyber.inneractive.sdk.interfaces.f {

    /* renamed from: k, reason: collision with root package name */
    public com.fyber.inneractive.sdk.interfaces.e f28265k;

    /* renamed from: l, reason: collision with root package name */
    public Runnable f28266l;

    /* renamed from: m, reason: collision with root package name */
    public w1 f28267m;
    public Runnable n;
    public w1 o;

    /* renamed from: r, reason: collision with root package name */
    public long f28270r;

    /* renamed from: w, reason: collision with root package name */
    public m0 f28275w;

    /* renamed from: p, reason: collision with root package name */
    public boolean f28268p = false;

    /* renamed from: q, reason: collision with root package name */
    public boolean f28269q = false;

    /* renamed from: s, reason: collision with root package name */
    public boolean f28271s = false;

    /* renamed from: t, reason: collision with root package name */
    public boolean f28272t = false;

    /* renamed from: u, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.util.a f28273u = new com.fyber.inneractive.sdk.util.a();

    /* renamed from: v, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.util.a f28274v = new com.fyber.inneractive.sdk.util.a();

    public abstract boolean I();

    public final void J() {
        if (this.f28266l == null) {
            long jM = M();
            this.f28270r = jM;
            this.f28266l = new l0(this, jM);
            IAlog.a("%senabling close with delay %d", IAlog.a(this), Long.valueOf(this.f28270r));
            x xVar = this.f28031b;
            boolean zB = xVar != null ? b(xVar) : false;
            if (!zB || I()) {
                if (this.f28269q) {
                    return;
                }
                this.f28269q = true;
                w1 w1Var = new w1(TimeUnit.MILLISECONDS, this.f28270r);
                this.f28267m = w1Var;
                w1Var.f31250e = new n0(this);
                w1Var.f31249d = false;
                w1Var.f31248c.sendEmptyMessage(1932593528);
                return;
            }
            if (zB) {
                com.fyber.inneractive.sdk.interfaces.e eVar = this.f28265k;
                if (eVar != null) {
                    eVar.showCloseCountdown();
                }
                m0 m0Var = new m0(this, this.f28270r + 100);
                this.f28275w = m0Var;
                m0Var.start();
            }
        }
    }

    public abstract int K();

    public abstract int L();

    public abstract long M();

    public abstract boolean N();

    public abstract long a(long j11);

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public void a(com.fyber.inneractive.sdk.interfaces.e eVar, Activity activity) throws InneractiveUnitController.AdDisplayError {
        if (this.f28030a == null) {
            IAlog.f("%sYou must set the spot to render before calling renderAd", IAlog.a(this));
            throw new InneractiveUnitController.AdDisplayError("No spot ad to render");
        }
        if (eVar != null) {
            this.f28265k = eVar;
        } else {
            IAlog.f("%srenderAd called with a null activity!", IAlog.a(this));
            throw new InneractiveUnitController.AdDisplayError("Activity is null");
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public void b(boolean z11) {
    }

    public abstract boolean b(x xVar);

    public final void d(boolean z11) throws JSONException {
        com.fyber.inneractive.sdk.network.w wVar;
        if (this.f28031b == null) {
            com.fyber.inneractive.sdk.network.u uVar = com.fyber.inneractive.sdk.network.u.MRAID_CUSTOM_CLOSE_DETECTED;
            wVar = new com.fyber.inneractive.sdk.network.w((com.fyber.inneractive.sdk.response.e) null);
            wVar.f28820c = uVar;
            wVar.f28818a = null;
            wVar.f28821d = null;
        } else {
            com.fyber.inneractive.sdk.network.u uVar2 = com.fyber.inneractive.sdk.network.u.MRAID_CUSTOM_CLOSE_DETECTED;
            x xVar = this.f28031b;
            InneractiveAdRequest inneractiveAdRequest = xVar.f28437a;
            com.fyber.inneractive.sdk.response.e eVar = xVar.f28438b;
            JSONArray jSONArrayB = xVar.f28439c.b();
            wVar = new com.fyber.inneractive.sdk.network.w(eVar);
            wVar.f28820c = uVar2;
            wVar.f28818a = inneractiveAdRequest;
            wVar.f28821d = jSONArrayB;
        }
        JSONObject jSONObject = new JSONObject();
        Boolean boolValueOf = Boolean.valueOf(z11);
        try {
            jSONObject.put("fyber_close_enabled", boolValueOf);
        } catch (Exception unused) {
            IAlog.f("Got exception adding param to json object: %s, %s", "fyber_close_enabled", boolValueOf);
        }
        wVar.f28823f.put(jSONObject);
        wVar.a((String) null);
    }

    @Override // com.fyber.inneractive.sdk.flow.b0, com.fyber.inneractive.sdk.external.InneractiveAdRenderer
    public void destroy() {
        Runnable runnable = this.f28266l;
        if (runnable != null) {
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(runnable);
            this.f28266l = null;
        }
        Runnable runnable2 = this.n;
        if (runnable2 != null) {
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(runnable2);
            this.n = null;
        }
        com.fyber.inneractive.sdk.interfaces.e eVar = this.f28265k;
        if (eVar != null) {
            eVar.destroy();
        }
        this.f28265k = null;
        m0 m0Var = this.f28275w;
        if (m0Var != null) {
            m0Var.cancel();
            this.f28275w = null;
        }
        w1 w1Var = this.o;
        if (w1Var != null) {
            w1Var.f31250e = null;
            this.o = null;
        }
        w1 w1Var2 = this.f28267m;
        if (w1Var2 != null) {
            w1Var2.f31250e = null;
            this.f28267m = null;
        }
        super.destroy();
    }

    public final void e(boolean z11) {
        com.fyber.inneractive.sdk.network.w wVar;
        this.f28268p = true;
        if (z11) {
            if (this.f28031b == null) {
                com.fyber.inneractive.sdk.network.u uVar = com.fyber.inneractive.sdk.network.u.FAIL_SAFE_ACTIVATED;
                wVar = new com.fyber.inneractive.sdk.network.w((com.fyber.inneractive.sdk.response.e) null);
                wVar.f28820c = uVar;
                wVar.f28818a = null;
                wVar.f28821d = null;
            } else {
                com.fyber.inneractive.sdk.network.u uVar2 = com.fyber.inneractive.sdk.network.u.FAIL_SAFE_ACTIVATED;
                x xVar = this.f28031b;
                InneractiveAdRequest inneractiveAdRequest = xVar.f28437a;
                com.fyber.inneractive.sdk.response.e eVar = xVar.f28438b;
                JSONArray jSONArrayB = xVar.f28439c.b();
                wVar = new com.fyber.inneractive.sdk.network.w(eVar);
                wVar.f28820c = uVar2;
                wVar.f28818a = inneractiveAdRequest;
                wVar.f28821d = jSONArrayB;
            }
            JSONObject jSONObject = new JSONObject();
            Boolean boolValueOf = Boolean.valueOf(N());
            try {
                jSONObject.put("is_endcard", boolValueOf);
            } catch (Exception unused) {
                IAlog.f("Got exception adding param to json object: %s, %s", "is_endcard", boolValueOf);
            }
            wVar.f28823f.put(jSONObject);
            wVar.a((String) null);
        }
        com.fyber.inneractive.sdk.interfaces.e eVar2 = this.f28265k;
        if (eVar2 != null) {
            eVar2.showCloseButton(z11, L(), K());
            if (z11) {
                return;
            }
            com.fyber.inneractive.sdk.util.a aVar = this.f28274v;
            aVar.f31169d = 0L;
            aVar.f31170e = 0L;
            aVar.f31171f = 0L;
            aVar.f31167b = false;
            aVar.a(false);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.b0, com.fyber.inneractive.sdk.external.InneractiveAdRenderer
    public final void initialize(InneractiveAdSpot inneractiveAdSpot) {
        super.initialize(inneractiveAdSpot);
        this.f28274v.f31166a = inneractiveAdSpot;
        this.f28273u.f31166a = inneractiveAdSpot;
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final View x() {
        com.fyber.inneractive.sdk.interfaces.e eVar = this.f28265k;
        if (eVar != null) {
            return eVar.getLayout();
        }
        return null;
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final int y() {
        com.fyber.inneractive.sdk.interfaces.e eVar = this.f28265k;
        if (eVar == null || eVar.getLayout() == null) {
            return 1;
        }
        return this.f28265k.getLayout().getHeight();
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final int z() {
        com.fyber.inneractive.sdk.interfaces.e eVar = this.f28265k;
        if (eVar == null || eVar.getLayout() == null) {
            return 1;
        }
        return this.f28265k.getLayout().getWidth();
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public boolean b(com.fyber.inneractive.sdk.flow.storepromo.observer.a aVar) {
        IAlog.f("InneractiveFullscreenAdRendererImpl : registerObserver: %s doesnt support Store Promo", getClass().getName());
        return false;
    }

    @Override // com.fyber.inneractive.sdk.interfaces.f
    public void a(com.fyber.inneractive.sdk.flow.storepromo.observer.a aVar) {
        IAlog.f("InneractiveFullscreenAdRendererImpl : unregisterObserver: %s doesnt support Store Promo", getClass().getName());
    }
}
