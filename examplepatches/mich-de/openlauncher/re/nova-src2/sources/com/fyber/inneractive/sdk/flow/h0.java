package com.fyber.inneractive.sdk.flow;

import android.app.Application;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Looper;
import android.text.TextUtils;
import android.widget.ImageView;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveAdSpotManager;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveFullscreenUnitController;
import com.fyber.inneractive.sdk.external.InneractiveMediationName;
import com.fyber.inneractive.sdk.external.InneractiveUnitController;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class h0 implements i0, r0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f28150a;

    /* renamed from: b, reason: collision with root package name */
    public InneractiveAdSpot.RequestListener f28151b;

    /* renamed from: c, reason: collision with root package name */
    public InneractiveAdRequest f28152c;

    /* renamed from: d, reason: collision with root package name */
    public e0 f28153d;

    /* renamed from: e, reason: collision with root package name */
    public x f28154e;

    /* renamed from: f, reason: collision with root package name */
    public s0 f28155f;

    /* renamed from: g, reason: collision with root package name */
    public final HashSet f28156g;

    /* renamed from: h, reason: collision with root package name */
    public m f28157h;

    /* renamed from: i, reason: collision with root package name */
    public g0 f28158i;

    /* renamed from: l, reason: collision with root package name */
    public p f28161l;

    /* renamed from: m, reason: collision with root package name */
    public com.fyber.inneractive.sdk.rtb.watermark.b f28162m;

    /* renamed from: j, reason: collision with root package name */
    public boolean f28159j = true;

    /* renamed from: k, reason: collision with root package name */
    public boolean f28160k = false;
    public final AtomicBoolean n = new AtomicBoolean(false);
    public final Object o = new Object();

    public h0() {
        String string = UUID.randomUUID().toString();
        this.f28150a = string;
        this.f28156g = new HashSet();
        IAlog.a("%sInneractiveAdSpotImpl created with UID: %s", IAlog.a(this), string);
    }

    public static String a(h0 h0Var) {
        h0Var.getClass();
        return IAlog.a(h0Var);
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final void addUnitController(InneractiveUnitController inneractiveUnitController) {
        if (inneractiveUnitController != null) {
            s0 s0Var = (s0) inneractiveUnitController;
            s0Var.setAdSpot(this);
            if (this.f28156g.size() > 0) {
                Iterator it = new HashSet(this.f28156g).iterator();
                while (it.hasNext()) {
                    InneractiveUnitController inneractiveUnitController2 = (InneractiveUnitController) it.next();
                    if (inneractiveUnitController2.getClass().equals(inneractiveUnitController.getClass())) {
                        removeUnitController(inneractiveUnitController2);
                    }
                }
            }
            this.f28156g.add(s0Var);
            if (this.f28154e != null) {
                Iterator it2 = this.f28156g.iterator();
                while (it2.hasNext()) {
                    s0 s0Var2 = (s0) it2.next();
                    if (s0Var2.supports(this)) {
                        this.f28155f = s0Var2;
                        return;
                    }
                }
            }
        }
    }

    public final void b() throws JSONException {
        Bitmap bitmap;
        this.n.set(true);
        Iterator it = this.f28156g.iterator();
        while (it.hasNext()) {
            ((InneractiveUnitController) it.next()).destroy();
        }
        this.f28156g.clear();
        a((x) null);
        this.f28151b = null;
        com.fyber.inneractive.sdk.rtb.watermark.b bVar = this.f28162m;
        if (bVar != null) {
            IAlog.a("%s destroy called", "InneractiveWatermark");
            ImageView imageView = bVar.f31092a;
            if (imageView != null) {
                Drawable background = imageView.getBackground();
                if ((background instanceof BitmapDrawable) && (bitmap = ((BitmapDrawable) background).getBitmap()) != null) {
                    try {
                        bitmap.recycle();
                    } catch (Throwable unused) {
                    }
                }
            }
            com.fyber.inneractive.sdk.util.v.a(bVar.f31092a);
            bVar.f31092a = null;
            this.f28162m = null;
        }
        a();
        InneractiveAdSpotManager.get().removeSpot(this);
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final void destroy() throws JSONException {
        IAlog.a("%sInneractiveAdSpotImpl spot destroy: %s", IAlog.a(this), this.f28150a);
        if (Looper.myLooper() == null || Looper.getMainLooper() != Looper.myLooper()) {
            com.fyber.inneractive.sdk.util.r.f31216b.post(new d0(this));
        } else {
            b();
        }
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final x getAdContent() {
        return this.f28154e;
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final InneractiveAdRequest getCurrentProcessedRequest() {
        return this.f28152c;
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final String getLocalUniqueId() {
        return this.f28150a;
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final InneractiveMediationName getMediationName() {
        return IAConfigManager.Q.n;
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final String getMediationNameString() {
        return IAConfigManager.Q.f27755m;
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final String getMediationVersion() {
        return IAConfigManager.Q.o;
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final String getRequestedSpotId() {
        InneractiveAdRequest inneractiveAdRequest = this.f28152c;
        return inneractiveAdRequest != null ? inneractiveAdRequest.getSpotId() : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final InneractiveUnitController getSelectedUnitController() {
        return this.f28155f;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0019  */
    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean isReady() throws JSONException {
        boolean z11;
        x xVar;
        x xVar2 = this.f28154e;
        if (xVar2 == null) {
            return false;
        }
        com.fyber.inneractive.sdk.response.e eVar = xVar2.f28438b;
        if (eVar != null) {
            z11 = eVar.f31042a < System.currentTimeMillis();
        }
        if (z11 && (xVar = this.f28154e) != null) {
            com.fyber.inneractive.sdk.response.e eVar2 = xVar.f28438b;
            if (!this.f28160k && eVar2 != null) {
                long minutes = TimeUnit.MILLISECONDS.toMinutes(System.currentTimeMillis() - eVar2.f31044c);
                long j11 = eVar2.f31043b;
                long j12 = minutes - j11;
                StringBuilder sbU = b.c0.u(j12, "Firing Event 802 - AdExpired - time passed- ", ", sessionTimeOut - ");
                sbU.append(j11);
                IAlog.a(sbU.toString(), new Object[0]);
                com.fyber.inneractive.sdk.network.t tVar = com.fyber.inneractive.sdk.network.t.IA_AD_EXPIRED;
                InneractiveAdRequest inneractiveAdRequest = xVar.f28437a;
                JSONArray jSONArrayB = xVar.f28439c.b();
                com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(eVar2);
                wVar.f28819b = tVar;
                wVar.f28818a = inneractiveAdRequest;
                wVar.f28821d = jSONArrayB;
                JSONObject jSONObject = new JSONObject();
                Long lValueOf = Long.valueOf(j12);
                try {
                    jSONObject.put("time_passed", lValueOf);
                } catch (Exception unused) {
                    IAlog.f("Got exception adding param to json object: %s, %s", "time_passed", lValueOf);
                }
                Long lValueOf2 = Long.valueOf(j11);
                try {
                    jSONObject.put("timeout", lValueOf2);
                } catch (Exception unused2) {
                    IAlog.f("Got exception adding param to json object: %s, %s", "timeout", lValueOf2);
                }
                wVar.f28823f.put(jSONObject);
                wVar.a((String) null);
                this.f28160k = true;
            }
        }
        return !z11 && this.f28154e.d();
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final void loadAd(String str) {
        if (this.n.get()) {
            IAlog.a("%s : loadAd: spot is already destroyed", IAlog.a(this));
            a(this.f28154e);
            return;
        }
        IAlog.a("%s : InneractiveAdSpotImpl Start load ad process", IAlog.a(this));
        if (IAConfigManager.c()) {
            IAConfigManager.e();
            IAlog.a("%sIAB TCF purpose 1 disabled, dropping request", IAlog.a(this));
            InneractiveAdSpot.RequestListener requestListener = this.f28151b;
            if (requestListener != null) {
                requestListener.onInneractiveFailedAdRequest(this, InneractiveErrorCode.IAB_TCF_PURPOSE_1_DISABLED);
                return;
            }
            return;
        }
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        iAConfigManager.K.set(true);
        if (str == null || TextUtils.isEmpty(str)) {
            InneractiveAdSpot.RequestListener requestListener2 = this.f28151b;
            if (requestListener2 != null) {
                requestListener2.onInneractiveFailedAdRequest(this, InneractiveErrorCode.INVALID_INPUT);
                return;
            }
            return;
        }
        if (!InneractiveAdManager.wasInitialized()) {
            InneractiveAdSpot.RequestListener requestListener3 = this.f28151b;
            if (requestListener3 != null) {
                requestListener3.onInneractiveFailedAdRequest(this, InneractiveErrorCode.SDK_NOT_INITIALIZED);
                return;
            }
            return;
        }
        com.fyber.inneractive.sdk.metrics.d.f28545d.a(this.f28150a).c();
        String str2 = this.f28150a;
        this.f28161l = new p(str2);
        if (this.f28153d == null) {
            this.f28153d = new e0(this);
        }
        com.fyber.inneractive.sdk.bidder.adm.y yVar = new com.fyber.inneractive.sdk.bidder.adm.y(str, str2);
        com.fyber.inneractive.sdk.config.global.r rVarA = com.fyber.inneractive.sdk.config.global.r.a();
        c0 c0Var = new c0(this, yVar, rVarA, str);
        IAlog.a("%s initOmidSdkIfNeeded", IAlog.a(this));
        if (IAConfigManager.g()) {
            Application application = com.fyber.inneractive.sdk.util.o.f31210a;
            IAlog.c("initOmidSdk", new Object[0]);
            com.fyber.inneractive.sdk.util.r.f31215a.execute(new com.fyber.inneractive.sdk.config.e0(iAConfigManager, application));
        }
        iAConfigManager.G.a();
        com.fyber.inneractive.sdk.util.r.f31215a.execute(new com.fyber.inneractive.sdk.bidder.adm.t(yVar, c0Var, rVarA));
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final void removeUnitController(InneractiveUnitController inneractiveUnitController) {
        if (inneractiveUnitController != null) {
            s0 s0Var = this.f28155f;
            if (s0Var != null && s0Var.equals(inneractiveUnitController)) {
                this.f28155f.destroy();
                this.f28155f = null;
            }
            this.f28156g.remove(inneractiveUnitController);
        }
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final void requestAd(InneractiveAdRequest inneractiveAdRequest) {
        if (IAConfigManager.c()) {
            IAConfigManager.e();
            IAlog.a("%sIAB TCF purpose 1 disabled, dropping request", IAlog.a(this));
            InneractiveAdSpot.RequestListener requestListener = this.f28151b;
            if (requestListener != null) {
                requestListener.onInneractiveFailedAdRequest(this, InneractiveErrorCode.IAB_TCF_PURPOSE_1_DISABLED);
                return;
            }
            return;
        }
        IAConfigManager.Q.K.set(true);
        IAlog.a("%srequestAd called with request: %s", IAlog.a(this), inneractiveAdRequest);
        if (inneractiveAdRequest == null && this.f28152c == null) {
            IAlog.b("%srequestAd called with a null request, but no previous request is available! Cannot continue", IAlog.a(this));
            InneractiveAdSpot.RequestListener requestListener2 = this.f28151b;
            if (requestListener2 != null) {
                requestListener2.onInneractiveFailedAdRequest(this, InneractiveErrorCode.INVALID_INPUT);
                return;
            }
            return;
        }
        if (!InneractiveAdManager.wasInitialized()) {
            InneractiveAdSpot.RequestListener requestListener3 = this.f28151b;
            if (requestListener3 != null) {
                requestListener3.onInneractiveFailedAdRequest(this, InneractiveErrorCode.SDK_NOT_INITIALIZED);
                return;
            }
            return;
        }
        InneractiveAdRequest inneractiveAdRequest2 = inneractiveAdRequest != null ? inneractiveAdRequest : this.f28152c;
        String str = this.f28150a;
        inneractiveAdRequest2.f28394b = str;
        com.fyber.inneractive.sdk.metrics.d.f28545d.a(str).c();
        if (this.f28156g.isEmpty()) {
            IAlog.b("%srequestAd called but no AdUnitControllers exist! Cannot continue", IAlog.a(this));
            if (this.f28151b != null) {
                if (inneractiveAdRequest == null) {
                    inneractiveAdRequest = this.f28152c;
                }
                a(inneractiveAdRequest, null);
                this.f28151b.onInneractiveFailedAdRequest(this, InneractiveErrorCode.INVALID_INPUT);
                return;
            }
            return;
        }
        m mVar = this.f28157h;
        if (mVar != null) {
            boolean z11 = inneractiveAdRequest != null || this.f28152c == null;
            l lVar = mVar.f28181g;
            if (lVar != null) {
                IAConfigManager.removeListener(lVar);
            }
            com.fyber.inneractive.sdk.network.m mVar2 = mVar.f28260d;
            if (mVar2 != null) {
                mVar2.a();
                mVar.f28260d = null;
            }
            mVar.a(z11);
            mVar.f28258b = null;
        }
        if (inneractiveAdRequest != null) {
            InneractiveAdRequest inneractiveAdRequest3 = this.f28152c;
            if (inneractiveAdRequest3 != null) {
                inneractiveAdRequest.setSelectedUnitConfig(inneractiveAdRequest3.getSelectedUnitConfig());
            }
            this.f28152c = inneractiveAdRequest;
            x xVar = this.f28154e;
            if (xVar != null) {
                xVar.destroy();
                this.f28159j = true;
            }
            Iterator it = this.f28156g.iterator();
            while (true) {
                if (!it.hasNext()) {
                    this.f28152c.f28393a = false;
                    break;
                } else if (((s0) it.next()) instanceof InneractiveFullscreenUnitController) {
                    break;
                }
            }
        }
        this.f28157h = new m(this.f28150a);
        if (this.f28153d == null) {
            this.f28153d = new e0(this);
        }
        IAlog.a("%sFound ad source for request! %s", IAlog.a(this), this.f28157h);
        IAlog.a("%s initOmidSdkIfNeeded", IAlog.a(this));
        if (IAConfigManager.g()) {
            Application application = com.fyber.inneractive.sdk.util.o.f31210a;
            IAlog.c("initOmidSdk", new Object[0]);
            com.fyber.inneractive.sdk.util.r.f31215a.execute(new com.fyber.inneractive.sdk.config.e0(IAConfigManager.Q, application));
        }
        IAConfigManager.Q.G.a();
        m mVar3 = this.f28157h;
        if (mVar3 != null) {
            InneractiveAdRequest inneractiveAdRequest4 = this.f28152c;
            mVar3.f28258b = this.f28153d;
            if (IAConfigManager.d()) {
                mVar3.c(inneractiveAdRequest4);
                return;
            }
            l lVar2 = new l(mVar3, inneractiveAdRequest4);
            mVar3.f28181g = lVar2;
            IAConfigManager.addListener(lVar2);
            IAConfigManager.a();
        }
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final void setMediationName(InneractiveMediationName inneractiveMediationName) {
        InneractiveAdManager.setMediationName(inneractiveMediationName);
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final void setMediationVersion(String str) {
        InneractiveAdManager.setMediationVersion(str);
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final void setRequestListener(InneractiveAdSpot.RequestListener requestListener) {
        IAlog.a("%ssetRequestListener called with: %s", IAlog.a(this), requestListener);
        this.f28151b = requestListener;
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final void setMediationName(String str) {
        InneractiveAdManager.setMediationName(str);
    }

    @Override // com.fyber.inneractive.sdk.flow.r0
    public final void a(g0 g0Var) {
        this.f28158i = g0Var;
        requestAd(null);
    }

    @Override // com.fyber.inneractive.sdk.flow.i0
    public final void a() throws JSONException {
        x xVar;
        JSONArray jSONArrayB;
        com.fyber.inneractive.sdk.config.global.r rVar;
        x xVar2 = this.f28154e;
        if (xVar2 != null) {
            if (xVar2.b() && (xVar = this.f28154e) != null && !xVar.f28441e) {
                String string = Arrays.toString(Thread.currentThread().getStackTrace());
                IAlog.a("Firing Event 803 - Stack trace - %s", string);
                com.fyber.inneractive.sdk.network.t tVar = com.fyber.inneractive.sdk.network.t.IA_AD_DESTROYED_WITHOUT_SHOW;
                x xVar3 = this.f28154e;
                InneractiveAdRequest inneractiveAdRequest = xVar3.f28437a;
                com.fyber.inneractive.sdk.response.e eVar = xVar3.f28438b;
                m mVar = this.f28157h;
                p pVar = this.f28161l;
                com.fyber.inneractive.sdk.config.global.r rVar2 = pVar != null ? pVar.f28259c : null;
                if (mVar != null && (rVar = mVar.f28259c) != null) {
                    jSONArrayB = rVar.b();
                } else {
                    jSONArrayB = rVar2 != null ? rVar2.b() : null;
                }
                com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(eVar);
                wVar.f28819b = tVar;
                wVar.f28818a = inneractiveAdRequest;
                wVar.f28821d = jSONArrayB;
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("stack_trace", string);
                } catch (Exception unused) {
                    IAlog.f("Got exception adding param to json object: %s, %s", "stack_trace", string);
                }
                wVar.f28823f.put(jSONObject);
                wVar.a((String) null);
            }
            this.f28154e.destroy();
            this.f28154e = null;
        }
        this.f28155f = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0033  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(InneractiveAdRequest inneractiveAdRequest, com.fyber.inneractive.sdk.response.e eVar) {
        UnitDisplayType unitDisplayType;
        com.fyber.inneractive.sdk.response.e eVar2;
        if (inneractiveAdRequest == null || inneractiveAdRequest.getSelectedUnitConfig() == null) {
            unitDisplayType = null;
        } else if (((com.fyber.inneractive.sdk.config.w0) inneractiveAdRequest.getSelectedUnitConfig()).f27945c != null) {
            unitDisplayType = ((com.fyber.inneractive.sdk.config.w0) inneractiveAdRequest.getSelectedUnitConfig()).f27945c.f27882b;
        } else if (((com.fyber.inneractive.sdk.config.w0) inneractiveAdRequest.getSelectedUnitConfig()).f27948f != null) {
            unitDisplayType = ((com.fyber.inneractive.sdk.config.w0) inneractiveAdRequest.getSelectedUnitConfig()).f27948f.f27963j;
        }
        x xVar = this.f28154e;
        com.fyber.inneractive.sdk.response.e eVar3 = (xVar == null || (eVar2 = xVar.f28438b) == null) ? eVar : eVar2;
        String str = this.f28150a;
        if (unitDisplayType == null && eVar3 != null) {
            unitDisplayType = eVar3.n;
        }
        UnitDisplayType unitDisplayType2 = unitDisplayType;
        x xVar2 = this.f28154e;
        new com.fyber.inneractive.sdk.metrics.c(eVar3, inneractiveAdRequest, str, unitDisplayType2, xVar2 != null ? xVar2.f28439c.b() : null).a();
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdSpot
    public final void loadAd(String str, String str2) {
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        com.fyber.inneractive.sdk.config.j jVar = iAConfigManager.f27762v;
        com.fyber.inneractive.sdk.config.v vVar = iAConfigManager.f27761u;
        if (vVar != null && vVar.f27936b.a(true, "ext_wm") && jVar != null && !TextUtils.isEmpty(str2)) {
            this.f28162m = new com.fyber.inneractive.sdk.rtb.watermark.b(jVar.a(), str2);
        }
        loadAd(str);
    }

    public final void a(x xVar) {
        synchronized (this.o) {
            try {
                p pVar = this.f28161l;
                if (pVar != null) {
                    pVar.a(true);
                    pVar.f28258b = null;
                    this.f28161l = null;
                }
                m mVar = this.f28157h;
                if (mVar != null) {
                    l lVar = mVar.f28181g;
                    if (lVar != null) {
                        IAConfigManager.removeListener(lVar);
                    }
                    com.fyber.inneractive.sdk.network.m mVar2 = mVar.f28260d;
                    if (mVar2 != null) {
                        mVar2.a();
                        mVar.f28260d = null;
                    }
                    mVar.a(true);
                    mVar.f28258b = null;
                    this.f28157h = null;
                }
                if (xVar != null) {
                    xVar.destroy();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
