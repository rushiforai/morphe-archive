package com.fyber.inneractive.sdk.flow.endcard;

import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.ValueCallback;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.flow.t0;
import com.fyber.inneractive.sdk.flow.y0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.web.i1;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONException;

/* loaded from: classes3.dex */
public class u extends a implements ValueCallback {

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.flow.vast.a f28129c;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.controller.d f28130d;

    /* renamed from: e, reason: collision with root package name */
    public String f28131e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f28132f;

    /* renamed from: g, reason: collision with root package name */
    public ViewGroup f28133g;

    /* renamed from: h, reason: collision with root package name */
    public final AtomicBoolean f28134h;

    /* renamed from: i, reason: collision with root package name */
    public final s f28135i;

    public u(b bVar) {
        super(bVar);
        this.f28132f = false;
        this.f28134h = new AtomicBoolean(false);
        this.f28135i = new s(this);
        y0 y0Var = bVar.f28057c;
        t0 t0Var = y0Var.f28454b;
        InneractiveAdRequest inneractiveAdRequest = y0Var.f28455c;
        com.fyber.inneractive.sdk.response.g gVar = y0Var.f28456d;
        this.f28129c = new com.fyber.inneractive.sdk.flow.vast.a(gVar.n, inneractiveAdRequest == null || inneractiveAdRequest.getAllowFullscreen(), gVar.f31046e, gVar.f31047f, t0Var.f28440d);
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.a, com.fyber.inneractive.sdk.flow.endcard.n
    public final void a() {
        com.fyber.inneractive.sdk.util.v.a(b());
        i1 i1Var = e().f28889a;
        if (i1Var != null) {
            i1Var.a(false);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.n
    public final View b() {
        ViewGroup viewGroup = this.f28133g;
        if (viewGroup != null) {
            return viewGroup;
        }
        if (!this.f28132f) {
            return null;
        }
        i1 i1Var = e().f28889a;
        com.fyber.inneractive.sdk.web.m mVar = i1Var == null ? null : i1Var.f31304b;
        if (mVar == null) {
            return null;
        }
        ViewGroup viewGroupA = a.a(mVar);
        this.f28133g = viewGroupA;
        return viewGroupA;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.a
    public final void c() {
        com.fyber.inneractive.sdk.player.controller.d dVarE = e();
        i1 i1Var = dVarE.f28889a;
        if (i1Var != null) {
            UnitDisplayType unitDisplayType = dVarE.f28891c;
            if (!UnitDisplayType.INTERSTITIAL.equals(unitDisplayType) && !UnitDisplayType.REWARDED.equals(unitDisplayType)) {
                UnitDisplayType.VERTICAL.equals(unitDisplayType);
            }
            i1Var.l();
        }
    }

    public q d() {
        return null;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.a, com.fyber.inneractive.sdk.flow.endcard.n
    public final void destroy() {
        a();
        com.fyber.inneractive.sdk.player.controller.d dVarE = e();
        i1 i1Var = dVarE.f28889a;
        if (i1Var != null) {
            i1Var.e();
            dVarE.f28889a = null;
        }
    }

    public final com.fyber.inneractive.sdk.player.controller.d e() {
        com.fyber.inneractive.sdk.player.controller.d dVar = this.f28130d;
        if (dVar == null) {
            b bVar = this.f28054b;
            dVar = new com.fyber.inneractive.sdk.player.controller.d(bVar.f28057c.f28453a, this.f28129c, bVar.i(), d());
            y0 y0Var = this.f28054b.f28057c;
            i1 i1Var = dVar.f28889a;
            if (i1Var != null) {
                if (i1Var.f31319s == null) {
                    i1Var.setAdContent(y0Var.f28454b);
                }
                if (i1Var.f31318r == null) {
                    i1Var.setAdRequest(y0Var.f28455c);
                }
                if (i1Var.f31320t == null) {
                    i1Var.setAdResponse(y0Var.f28456d);
                }
            }
            this.f28130d = dVar;
        }
        return dVar;
    }

    public boolean f() {
        com.fyber.inneractive.sdk.config.v vVar = IAConfigManager.Q.f27761u;
        return vVar != null && vVar.f27936b.a(false, "dt_plbl");
    }

    @Override // android.webkit.ValueCallback
    public final void onReceiveValue(Object obj) {
        String str = (String) obj;
        if (!TextUtils.isEmpty(str)) {
            IAlog.a("%s Playable detected: %s", this.f28053a, str);
            try {
                this.f28054b.a(new JSONArray(str));
            } catch (JSONException e3) {
                IAlog.f("%s invalid playable detection method: %s", this.f28053a, e3.getMessage());
            }
        }
        this.f28054b.m();
    }

    public final void a(com.fyber.inneractive.sdk.flow.endcard.loaders.listeners.a aVar) {
        com.fyber.inneractive.sdk.web.g tVar;
        String str = this.f28131e;
        if (!TextUtils.isEmpty(str)) {
            com.fyber.inneractive.sdk.player.controller.d dVarE = e();
            if (aVar == null) {
                tVar = this.f28135i;
            } else {
                tVar = new t(this, aVar);
            }
            dVarE.a(str, tVar, !(this instanceof p));
            return;
        }
        throw new com.fyber.inneractive.sdk.flow.vast.h("End-Card HTML not loaded", "No template");
    }
}
