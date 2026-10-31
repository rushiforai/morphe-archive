package com.fyber.inneractive.sdk.flow;

import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.activities.InneractiveInternalBrowserActivity;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.c1;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.external.ImpressionData;
import com.fyber.inneractive.sdk.external.InneractiveAdRenderer;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveAdViewEventsListenerWithImpressionData;
import com.fyber.inneractive.sdk.external.InneractiveFullscreenAdEventsListenerWithImpressionData;
import com.fyber.inneractive.sdk.external.InneractiveUnitController;
import com.fyber.inneractive.sdk.external.OnGlobalImpressionDataListener;
import com.fyber.inneractive.sdk.external.WebViewRendererProcessHasGoneError;
import com.fyber.inneractive.sdk.network.h1;
import com.fyber.inneractive.sdk.network.z0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.g1;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class b0 implements InneractiveAdRenderer, InneractiveInternalBrowserActivity.InternalBrowserListener, com.fyber.inneractive.sdk.click.f, com.fyber.inneractive.sdk.web.t0 {

    /* renamed from: a, reason: collision with root package name */
    public InneractiveAdSpot f28030a;

    /* renamed from: b, reason: collision with root package name */
    public x f28031b;

    /* renamed from: c, reason: collision with root package name */
    public InneractiveUnitController.EventsListener f28032c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f28033d = false;

    /* renamed from: e, reason: collision with root package name */
    public boolean f28034e = false;

    /* renamed from: f, reason: collision with root package name */
    public boolean f28035f = true;

    /* renamed from: g, reason: collision with root package name */
    public Runnable f28036g;

    /* renamed from: h, reason: collision with root package name */
    public com.fyber.inneractive.sdk.click.r f28037h;

    /* renamed from: i, reason: collision with root package name */
    public z f28038i;

    /* renamed from: j, reason: collision with root package name */
    public View f28039j;

    public final boolean A() {
        com.fyber.inneractive.sdk.config.global.r rVar;
        x xVar = this.f28031b;
        if (xVar == null || (rVar = xVar.f28439c) == null || rVar.a(com.fyber.inneractive.sdk.config.global.features.c.class) == null) {
            return false;
        }
        com.fyber.inneractive.sdk.config.global.features.c cVar = (com.fyber.inneractive.sdk.config.global.features.c) this.f28031b.f28439c.a(com.fyber.inneractive.sdk.config.global.features.c.class);
        cVar.getClass();
        return new ArrayList(cVar.f27819c.values()).size() > 0;
    }

    public boolean B() {
        return false;
    }

    public boolean C() {
        x xVar = this.f28031b;
        if (xVar != null) {
            return xVar.b();
        }
        return true;
    }

    public boolean D() {
        return this instanceof com.fyber.inneractive.sdk.renderers.c0;
    }

    public final void E() {
        com.fyber.inneractive.sdk.response.e eVar;
        w();
        if (this.f28034e || this.f28032c == null) {
            return;
        }
        IAlog.a("%sCalling external interface onAdImpression", IAlog.a(this));
        this.f28032c.onAdImpression(this.f28030a);
        x xVar = this.f28031b;
        if (xVar != null && (eVar = xVar.f28438b) != null) {
            IAConfigManager iAConfigManager = IAConfigManager.Q;
            c1 c1Var = iAConfigManager.f27764x;
            if (c1Var != null) {
                UnitDisplayType unitDisplayType = eVar.n;
                ImpressionData impressionData = eVar.f31057r;
                c1Var.a(unitDisplayType, "LAST_DOMAIN_SHOWED", impressionData != null ? impressionData.getAdvertiserDomain() : null);
                c1Var.a(unitDisplayType, "LAST_APP_BUNDLE_ID", eVar.f31063x);
                if (this.f28031b.isVideoAd()) {
                    c1Var.a(unitDisplayType, new String[]{"LAST_VAST_SKIPED"}[0], "0");
                    c1Var.a(unitDisplayType, new String[]{"LAST_VAST_CLICKED_TYPE"}[0], "0");
                }
                c1Var.a(unitDisplayType, new String[]{"LAST_CLICKED"}[0], "0");
            }
            com.fyber.inneractive.sdk.util.y0 y0Var = iAConfigManager.A;
            com.fyber.inneractive.sdk.config.x0 x0Var = this.f28031b.f28440d;
            ImpressionData impressionData2 = eVar.f31057r;
            if (x0Var != null) {
                OnGlobalImpressionDataListener onGlobalImpressionDataListener = y0Var.f31253a;
                if (onGlobalImpressionDataListener != null) {
                    com.fyber.inneractive.sdk.config.w0 w0Var = (com.fyber.inneractive.sdk.config.w0) x0Var;
                    onGlobalImpressionDataListener.onImpression(w0Var.f27944b, w0Var.f27943a, impressionData2);
                }
            } else {
                y0Var.getClass();
            }
            InneractiveUnitController.EventsListener eventsListener = this.f28032c;
            if (eventsListener instanceof InneractiveFullscreenAdEventsListenerWithImpressionData) {
                ((InneractiveFullscreenAdEventsListenerWithImpressionData) eventsListener).onAdImpression(this.f28030a, eVar.f31057r);
            } else if (eventsListener instanceof InneractiveAdViewEventsListenerWithImpressionData) {
                ((InneractiveAdViewEventsListenerWithImpressionData) eventsListener).onAdImpression(this.f28030a, eVar.f31057r);
            }
        }
        this.f28034e = true;
    }

    public final void F() {
        if (this.f28032c != null) {
            IAlog.a("%sCalling external interface onAdWillOpenExternalApp", IAlog.a(this));
            this.f28032c.onAdWillOpenExternalApp(this.f28030a);
        }
    }

    public void G() {
        View viewX = x();
        if (viewX == null || this.f28039j == null || viewX.getParent() == null || !(viewX.getParent() instanceof ViewGroup)) {
            return;
        }
        viewX.getLayoutParams();
        ((ViewGroup) viewX.getParent()).removeView(this.f28039j);
        e(this.f28039j);
        this.f28039j = null;
    }

    public final void H() {
        com.fyber.inneractive.sdk.response.e eVar;
        x xVar = this.f28031b;
        if (xVar == null || (eVar = xVar.f28438b) == null) {
            return;
        }
        String str = eVar.o;
        if (TextUtils.isEmpty(str)) {
            return;
        }
        IAlog.e("%sfiring rewarded completion!", IAlog.a(this));
        IAlog.d("AD_REWARDED_COMPLETION", new Object[0]);
        z0.b(str);
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x01be  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00fa  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0116  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0195  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x019b  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x019e  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x01ae  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final com.fyber.inneractive.sdk.util.d0 a(Context context, String str, g1 g1Var, com.fyber.inneractive.sdk.util.g gVar, boolean z11, com.fyber.inneractive.sdk.click.o oVar) {
        String queryParameter;
        String strReplace;
        boolean z12;
        com.fyber.inneractive.sdk.click.r rVar;
        com.fyber.inneractive.sdk.web.v0 v0VarA;
        x xVar;
        com.fyber.inneractive.sdk.click.r rVar2;
        com.fyber.inneractive.sdk.response.e eVar;
        com.fyber.inneractive.sdk.response.e eVar2;
        if (!z11 && (!this.f28035f || this.f28033d)) {
            String str2 = this.f28033d ? "external/browser is already open" : "click is in grace period";
            IAlog.a("InneractiveAdRendererImpl: openClickThroughUrl - %s", str2);
            return new com.fyber.inneractive.sdk.util.d0(com.fyber.inneractive.sdk.util.g0.FAILED, new Exception(str2));
        }
        if (context != null) {
            IAlog.a("%sBlocking clicks until grace has ended", IAlog.a(this));
            this.f28035f = false;
            Runnable runnable = this.f28036g;
            if (runnable != null) {
                com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(runnable);
            }
            a0 a0Var = new a0(this);
            this.f28036g = a0Var;
            com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(a0Var, 1000L);
        }
        float f11 = g1Var.f31187a;
        c(z11);
        if (TextUtils.isEmpty(str)) {
            IAlog.a("InneractiveAdRendererImpl: openClickThroughUrl - is empty", new Object[0]);
            return new com.fyber.inneractive.sdk.util.d0(com.fyber.inneractive.sdk.util.g0.FAILED, new Exception("empty url"));
        }
        x xVar2 = this.f28031b;
        if (xVar2 != null && (eVar2 = xVar2.f28438b) != null && eVar2.a()) {
            com.fyber.inneractive.sdk.ignite.h hVar = IAConfigManager.Q.F;
            if (hVar.f28484f) {
                hVar.a((qc.a) null);
            }
        }
        this.f28038i = new z(this, g1Var, gVar, oVar);
        if (!TextUtils.isEmpty(str)) {
            Uri uri = Uri.parse(str);
            String scheme = uri.getScheme();
            String host = uri.getHost();
            queryParameter = (scheme == null || !scheme.equals("fybernativebrowser") || host == null || !host.equals("navigate")) ? null : uri.getQueryParameter(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
        }
        String scheme2 = !TextUtils.isEmpty(str) ? Uri.parse(str).getScheme() : null;
        if (TextUtils.isEmpty(queryParameter)) {
            strReplace = str;
            if (!strReplace.contains("FYBER_OPEN_BROWSER")) {
                z12 = true;
            }
            if (strReplace.contains("[IS_CTA_CLICK]")) {
                strReplace = strReplace.replace("[IS_CTA_CLICK]", String.valueOf(B() && gVar == com.fyber.inneractive.sdk.util.g.VIDEO_CTA));
            }
            String str3 = strReplace;
            if (x() != null) {
                v();
            }
            rVar = this.f28037h;
            if (rVar != null) {
                rVar.f27735f = true;
                Iterator it = rVar.f27739j.iterator();
                while (it.hasNext()) {
                    ((com.fyber.inneractive.sdk.click.a) it.next()).a();
                }
                rVar.f27739j.clear();
                h1 h1Var = rVar.f27738i;
                if (h1Var != null) {
                    h1Var.f28777a = true;
                }
                com.fyber.inneractive.sdk.util.z0 z0Var = rVar.f27730a;
                z0Var.f31257c = false;
                com.fyber.inneractive.sdk.config.e eVar3 = IAConfigManager.Q.f27764x.f27771b;
                if (eVar3 != null) {
                    eVar3.f27791a.remove(z0Var);
                }
                rVar.f27734e = null;
                this.f28037h = null;
            }
            com.fyber.inneractive.sdk.click.r rVar3 = new com.fyber.inneractive.sdk.click.r(z12, this.f28031b);
            rVar3.f27739j.addAll(Arrays.asList(new com.fyber.inneractive.sdk.click.i(!z12, scheme2), new com.fyber.inneractive.sdk.click.g(this, g1Var, gVar), new com.fyber.inneractive.sdk.click.d(), new com.fyber.inneractive.sdk.click.h(), new com.fyber.inneractive.sdk.click.l()));
            this.f28037h = rVar3;
            x xVar3 = this.f28031b;
            v0VarA = xVar3 == null ? xVar3.a() : null;
            if (v0VarA != null) {
                v0VarA.f31393i = this;
            }
            x xVar4 = this.f28031b;
            boolean z13 = xVar4 == null && xVar4.a(g1Var.f31189c, gVar);
            xVar = this.f28031b;
            if (xVar != null && xVar.f28438b != null) {
                xVar.e();
            }
            rVar2 = this.f28037h;
            if (rVar2 != null) {
                z zVar = this.f28038i;
                x xVar5 = this.f28031b;
                com.fyber.inneractive.sdk.ignite.m mVar = (xVar5 == null || (eVar = xVar5.f28438b) == null) ? com.fyber.inneractive.sdk.ignite.m.NONE : eVar.E;
                InneractiveAdSpot inneractiveAdSpot = this.f28030a;
                rVar2.a(context, str3, zVar, v0VarA, z13, mVar, inneractiveAdSpot != null ? inneractiveAdSpot.getLocalUniqueId() : null);
            }
            com.fyber.inneractive.sdk.util.g0 g0Var = com.fyber.inneractive.sdk.util.g0.OPEN_IN_EXTERNAL_APPLICATION;
            context.getClass();
            return new com.fyber.inneractive.sdk.util.d0(g0Var, null);
        }
        strReplace = queryParameter;
        z12 = false;
        if (strReplace.contains("[IS_CTA_CLICK]")) {
        }
        String str32 = strReplace;
        if (x() != null) {
        }
        rVar = this.f28037h;
        if (rVar != null) {
        }
        com.fyber.inneractive.sdk.click.r rVar32 = new com.fyber.inneractive.sdk.click.r(z12, this.f28031b);
        rVar32.f27739j.addAll(Arrays.asList(new com.fyber.inneractive.sdk.click.i(!z12, scheme2), new com.fyber.inneractive.sdk.click.g(this, g1Var, gVar), new com.fyber.inneractive.sdk.click.d(), new com.fyber.inneractive.sdk.click.h(), new com.fyber.inneractive.sdk.click.l()));
        this.f28037h = rVar32;
        x xVar32 = this.f28031b;
        if (xVar32 == null) {
        }
        if (v0VarA != null) {
        }
        x xVar42 = this.f28031b;
        if (xVar42 == null) {
        }
        xVar = this.f28031b;
        if (xVar != null) {
            xVar.e();
        }
        rVar2 = this.f28037h;
        if (rVar2 != null) {
        }
        com.fyber.inneractive.sdk.util.g0 g0Var2 = com.fyber.inneractive.sdk.util.g0.OPEN_IN_EXTERNAL_APPLICATION;
        context.getClass();
        return new com.fyber.inneractive.sdk.util.d0(g0Var2, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x01b6  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0171  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x01b2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(com.fyber.inneractive.sdk.click.b bVar, g1 g1Var, com.fyber.inneractive.sdk.util.g gVar) throws JSONException {
        boolean z11;
        boolean z12;
        com.fyber.inneractive.sdk.config.global.r rVar;
        com.fyber.inneractive.sdk.config.global.r rVar2;
        com.fyber.inneractive.sdk.config.global.r rVar3;
        x xVar = this.f28031b;
        InneractiveAdRequest inneractiveAdRequest = xVar != null ? xVar.f28437a : null;
        com.fyber.inneractive.sdk.response.e eVar = xVar != null ? xVar.f28438b : null;
        JSONArray jSONArrayB = (xVar == null || (rVar3 = xVar.f28439c) == null) ? null : rVar3.b();
        com.fyber.inneractive.sdk.network.u uVar = com.fyber.inneractive.sdk.network.u.FYBER_SUCCESS_CLICK;
        com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(eVar);
        wVar.f28820c = uVar;
        wVar.f28818a = inneractiveAdRequest;
        wVar.f28821d = jSONArrayB;
        com.fyber.inneractive.sdk.network.x xVar2 = new com.fyber.inneractive.sdk.network.x();
        int iZ = z();
        int iY = y();
        long j11 = bVar.f27701e;
        if (j11 != 0) {
            xVar2.a(Long.valueOf(j11), "time_passed");
        }
        JSONArray jSONArray = new JSONArray();
        Iterator it = bVar.f27702f.iterator();
        while (it.hasNext()) {
            com.fyber.inneractive.sdk.click.j jVar = (com.fyber.inneractive.sdk.click.j) it.next();
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, jVar.f27719a);
                jSONObject.put("success", jVar.f27720b);
                jSONObject.put("opened_by", jVar.f27721c);
                jSONObject.put("reason", jVar.f27722d);
            } catch (Exception unused) {
            }
            jSONArray.put(jSONObject);
        }
        xVar2.a(jSONArray, "urls");
        xVar2.a(gVar, "origin");
        if (gVar == com.fyber.inneractive.sdk.util.g.FMP_ENDCARD) {
            xVar2.a(gVar.a(), "version");
        }
        if (g1Var != null && g1Var.f31189c) {
            xVar2.a(Boolean.TRUE, "is_auto_click");
        }
        if (g1Var != null) {
            if (g1Var.f31187a > 0.0f && g1Var.f31188b > 0.0f) {
                int iB = C() ? iZ : com.fyber.inneractive.sdk.util.o.b(iZ);
                float f11 = iB == 0 ? 0.0f : g1Var.f31187a / iB;
                int iB2 = C() ? iY : com.fyber.inneractive.sdk.util.o.b(iY);
                float f12 = iB2 != 0 ? g1Var.f31188b / iB2 : 0.0f;
                IAlog.a("Point location -  x - %.2f , y- %.2f", Float.valueOf(f11), Float.valueOf(f12));
                C();
                Locale locale = Locale.ENGLISH;
                com.fyber.inneractive.sdk.network.x xVarA = xVar2.a(String.format(locale, "%.2f", Float.valueOf(f11)), "td_x");
                C();
                xVarA.a(String.format(locale, "%.2f", Float.valueOf(f12)), "td_y");
            }
        }
        boolean z13 = true;
        if (C() || D()) {
            xVar2.a(com.fyber.inneractive.sdk.util.o.b() == 1 ? "p" : "l", "o");
        } else if (iZ > 0 || iY > 0) {
            xVar2.a(Integer.valueOf(iZ), "b_w");
            xVar2.a(Integer.valueOf(iY), "b_h");
        }
        x xVar3 = this.f28031b;
        com.fyber.inneractive.sdk.config.global.features.d dVar = (xVar3 == null || (rVar2 = xVar3.f28439c) == null) ? null : (com.fyber.inneractive.sdk.config.global.features.d) rVar2.a(com.fyber.inneractive.sdk.config.global.features.d.class);
        if (dVar == null) {
            z11 = false;
        } else {
            com.fyber.inneractive.sdk.model.vast.a aVar = dVar.f27817e;
            if (aVar != null ? aVar.f28566d : false) {
                z11 = true;
            }
        }
        if (!z11) {
            z13 = false;
        } else if (!com.fyber.inneractive.sdk.util.g.DEFAULT_ENDCARD.equals(gVar) && !com.fyber.inneractive.sdk.util.g.VIDEO_CTA.equals(gVar)) {
            if (com.fyber.inneractive.sdk.util.g.VIDEO_CLICK.equals(gVar)) {
                x xVar4 = this.f28031b;
                com.fyber.inneractive.sdk.config.global.features.v vVar = (xVar4 == null || (rVar = xVar4.f28439c) == null) ? null : (com.fyber.inneractive.sdk.config.global.features.v) rVar.a(com.fyber.inneractive.sdk.config.global.features.v.class);
                if (vVar == null) {
                    z12 = false;
                    if (!z12) {
                    }
                } else {
                    Boolean boolC = vVar.c("show_cta");
                    if (boolC != null ? boolC.booleanValue() : true) {
                        z12 = true;
                    }
                    if (!z12) {
                    }
                }
            }
        }
        if (z13) {
            xVar2.a(IAConfigManager.Q.f27756p, "cta_lng");
        }
        wVar.f28823f.put(xVar2.f28825a);
        wVar.a((String) null);
    }

    public final void c(boolean z11) {
        com.fyber.inneractive.sdk.response.e eVar;
        if (z11) {
            IAlog.a("%s : will not notify click on fallback", IAlog.a(this));
            return;
        }
        if (this.f28032c != null) {
            IAlog.a("%sCalling external interface onAdClicked", IAlog.a(this));
            this.f28032c.onAdClicked(this.f28030a);
        }
        x xVar = this.f28031b;
        if (xVar == null || (eVar = xVar.f28438b) == null) {
            return;
        }
        IAConfigManager.Q.f27764x.a(eVar.n, "LAST_CLICKED", "1");
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdRenderer
    public boolean canRefreshAd() {
        return true;
    }

    public void d(View view) {
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdRenderer
    public void destroy() {
        if (this.f28033d) {
            InneractiveInternalBrowserActivity.setInternalBrowserListener(null);
            this.f28033d = false;
        }
        Runnable runnable = this.f28036g;
        if (runnable != null) {
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(runnable);
            this.f28036g = null;
        }
        this.f28031b = null;
        this.f28032c = null;
        this.f28030a = null;
        if (this.f28037h != null) {
            G();
            com.fyber.inneractive.sdk.click.r rVar = this.f28037h;
            rVar.f27735f = true;
            Iterator it = rVar.f27739j.iterator();
            while (it.hasNext()) {
                ((com.fyber.inneractive.sdk.click.a) it.next()).a();
            }
            rVar.f27739j.clear();
            h1 h1Var = rVar.f27738i;
            if (h1Var != null) {
                h1Var.f28777a = true;
            }
            com.fyber.inneractive.sdk.util.z0 z0Var = rVar.f27730a;
            z0Var.f31257c = false;
            com.fyber.inneractive.sdk.config.e eVar = IAConfigManager.Q.f27764x.f27771b;
            if (eVar != null) {
                eVar.f27791a.remove(z0Var);
            }
            rVar.f27734e = null;
            this.f28037h = null;
            this.f28038i = null;
        }
    }

    public void e(View view) {
    }

    @Override // com.fyber.inneractive.sdk.external.InneractiveAdRenderer
    public void initialize(InneractiveAdSpot inneractiveAdSpot) {
        this.f28030a = inneractiveAdSpot;
        this.f28031b = inneractiveAdSpot.getAdContent();
        this.f28032c = inneractiveAdSpot.getSelectedUnitController().getEventsListener();
    }

    public final com.fyber.inneractive.sdk.ignite.m o() {
        com.fyber.inneractive.sdk.response.e eVar;
        x xVar = this.f28031b;
        return (xVar == null || !xVar.c() || (eVar = this.f28031b.f28438b) == null) ? com.fyber.inneractive.sdk.ignite.m.NONE : eVar.E;
    }

    @Override // com.fyber.inneractive.sdk.activities.InneractiveInternalBrowserActivity.InternalBrowserListener
    public final void onApplicationInBackground() {
        F();
    }

    @Override // com.fyber.inneractive.sdk.activities.InneractiveInternalBrowserActivity.InternalBrowserListener
    public final void onInternalBrowserDismissed() {
        IAlog.a("onInternalBrowserDismissed callback called", new Object[0]);
        if (this.f28033d) {
            this.f28033d = false;
            InneractiveInternalBrowserActivity.setInternalBrowserListener(null);
        }
        if (this.f28032c != null) {
            IAlog.a("%sCalling external interface onAdWillCloseInternalBrowser", IAlog.a(this));
            this.f28032c.onAdWillCloseInternalBrowser(this.f28030a);
        }
    }

    public void t() {
        E();
    }

    public void v() {
        View viewX = x();
        if (viewX == null || viewX.getParent() == null || !(viewX.getParent() instanceof ViewGroup) || this.f28039j != null) {
            return;
        }
        View viewInflate = View.inflate(viewX.getContext(), R.layout.ia_layout_click_overlay, null);
        this.f28039j = viewInflate;
        if (viewInflate != null) {
            ((ViewGroup) viewX.getParent()).addView(this.f28039j, viewX.getLayoutParams());
            d(this.f28039j);
        }
    }

    public Context w() {
        return com.fyber.inneractive.sdk.util.o.a(x());
    }

    public abstract View x();

    public int y() {
        return -1;
    }

    public int z() {
        return -1;
    }

    public final Context c(View view) {
        View view2;
        View[] viewArr = {view, x()};
        int i5 = 0;
        while (true) {
            if (i5 >= 2) {
                view2 = null;
                break;
            }
            view2 = viewArr[i5];
            if (view2 != null) {
                break;
            }
            i5++;
        }
        return com.fyber.inneractive.sdk.util.o.a(view2);
    }

    @Override // com.fyber.inneractive.sdk.click.f
    public final void a(com.fyber.inneractive.sdk.click.b bVar, g1 g1Var, com.fyber.inneractive.sdk.util.g gVar) throws JSONException {
        b(bVar, g1Var, gVar);
    }

    public final void a(String str, com.fyber.inneractive.sdk.click.q qVar) {
        JSONArray jSONArrayB;
        com.fyber.inneractive.sdk.response.e eVar;
        InneractiveAdRequest inneractiveAdRequest;
        x xVar = this.f28031b;
        if (xVar != null) {
            eVar = xVar.f28438b;
            inneractiveAdRequest = xVar.f28437a;
            com.fyber.inneractive.sdk.config.global.r rVar = xVar.f28439c;
            jSONArrayB = rVar != null ? rVar.b() : null;
        } else {
            jSONArrayB = null;
            eVar = null;
            inneractiveAdRequest = null;
        }
        com.fyber.inneractive.sdk.network.u uVar = com.fyber.inneractive.sdk.network.u.EXTERNAL_BROWSER_OPENED;
        com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(eVar);
        wVar.f28820c = uVar;
        wVar.f28818a = inneractiveAdRequest;
        wVar.f28821d = jSONArrayB;
        wVar.a(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str).a("fallback", (qVar == com.fyber.inneractive.sdk.click.q.OPENED_USING_CHROME_NAVIGATE || qVar == com.fyber.inneractive.sdk.click.q.OPENED_IN_EXTERNAL_BROWSER) ? "chrome" : "na").a((String) null);
    }

    public final void a(WebViewRendererProcessHasGoneError webViewRendererProcessHasGoneError) {
        String simpleName = webViewRendererProcessHasGoneError.getClass().getSimpleName();
        String message = webViewRendererProcessHasGoneError.getMessage();
        x xVar = this.f28031b;
        com.fyber.inneractive.sdk.network.z.a(simpleName, message, xVar != null ? xVar.f28437a : null, xVar != null ? xVar.f28438b : null);
        if (this.f28032c != null) {
            IAlog.a("%sCalling external interface onAdEnteredErrorState: %s", IAlog.a(this), webViewRendererProcessHasGoneError.getMessage());
            this.f28032c.onAdEnteredErrorState(this.f28030a, webViewRendererProcessHasGoneError);
        }
    }
}
