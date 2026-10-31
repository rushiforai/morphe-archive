package com.fyber.inneractive.sdk.flow;

import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public abstract class w extends x {

    /* renamed from: g, reason: collision with root package name */
    public com.fyber.inneractive.sdk.web.v0 f28419g;

    /* renamed from: h, reason: collision with root package name */
    public final v f28420h;

    public w(com.fyber.inneractive.sdk.config.x0 x0Var, com.fyber.inneractive.sdk.config.global.r rVar) {
        super(x0Var, rVar);
        this.f28420h = new v(this);
    }

    @Override // com.fyber.inneractive.sdk.flow.x
    public final com.fyber.inneractive.sdk.web.v0 a() {
        return this.f28419g;
    }

    @Override // com.fyber.inneractive.sdk.flow.x
    public final boolean c() {
        com.fyber.inneractive.sdk.web.v0 v0Var = this.f28419g;
        return v0Var != null && v0Var.f31396l;
    }

    @Override // com.fyber.inneractive.sdk.flow.x
    public final void e() {
        com.fyber.inneractive.sdk.response.e eVar;
        com.fyber.inneractive.sdk.response.e eVar2;
        com.fyber.inneractive.sdk.ignite.h hVar = IAConfigManager.Q.F;
        if (!hVar.f28484f || (eVar = this.f28438b) == null || !eVar.a() || !hVar.n() || c() || (eVar2 = this.f28438b) == null) {
            return;
        }
        com.fyber.inneractive.sdk.ignite.m mVar = eVar2.E;
        com.fyber.inneractive.sdk.ignite.m mVar2 = com.fyber.inneractive.sdk.ignite.m.NONE;
        if (mVar != mVar2) {
            IAlog.a("ignite webpage was not loaded yet, stopping the loading process", new Object[0]);
            com.fyber.inneractive.sdk.response.e eVar3 = this.f28438b;
            if (mVar2 == null) {
                eVar3.getClass();
            }
            eVar3.E = mVar2;
            com.fyber.inneractive.sdk.web.v0 v0Var = this.f28419g;
            if (v0Var != null) {
                com.fyber.inneractive.sdk.web.n0 n0Var = v0Var.f31398p;
                if (n0Var != null) {
                    com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(n0Var);
                    v0Var.f31398p = null;
                }
                if (!v0Var.f31407y) {
                    v0Var.f31385a.stopLoading();
                }
                this.f28420h.a(com.fyber.inneractive.sdk.network.t.IGNITE_FLOW_FAILED_TO_LOAD_WEBPAGE, this.f28419g.f31395k, com.fyber.inneractive.sdk.ignite.j.WEBPAGE_NOT_LOADED_BEFORE_SHOW.a(), this.f28438b.E);
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.x
    public final void a(String str) {
        com.fyber.inneractive.sdk.ignite.m mVar;
        com.fyber.inneractive.sdk.response.e eVar;
        com.fyber.inneractive.sdk.ignite.m mVar2 = com.fyber.inneractive.sdk.ignite.m.NONE;
        com.fyber.inneractive.sdk.response.e eVar2 = this.f28438b;
        if (eVar2 != null) {
            com.fyber.inneractive.sdk.ignite.m mVar3 = eVar2.E;
            mVar3.getClass();
            mVar = com.fyber.inneractive.sdk.ignite.m.SINGLE_TAP;
            if (mVar3 != mVar) {
                com.fyber.inneractive.sdk.ignite.m mVar4 = this.f28438b.E;
                mVar4.getClass();
                if (mVar4 != com.fyber.inneractive.sdk.ignite.m.TRUE_SINGLE_TAP || isVideoAd()) {
                    mVar = this.f28438b.E;
                } else {
                    this.f28420h.a(com.fyber.inneractive.sdk.network.t.IGNITE_FLOW_MODE_NOT_COMPATIBLE, null, null, null);
                }
            }
        } else {
            mVar = mVar2;
        }
        com.fyber.inneractive.sdk.ignite.h hVar = IAConfigManager.Q.F;
        if (!hVar.f28484f || (eVar = this.f28438b) == null || !eVar.a() || !hVar.n()) {
            com.fyber.inneractive.sdk.response.e eVar3 = this.f28438b;
            if (eVar3 != null) {
                eVar3.E = mVar2;
                return;
            }
            return;
        }
        com.fyber.inneractive.sdk.response.e eVar4 = this.f28438b;
        String str2 = eVar4 != null ? eVar4.f31063x : null;
        com.fyber.inneractive.sdk.web.w0 w0Var = new com.fyber.inneractive.sdk.web.w0();
        w0Var.f31410a = str2;
        w0Var.f31411b = mVar;
        w0Var.f31412c = str;
        w0Var.f31413d = this.f28439c;
        w0Var.f31414e = eVar4 != null ? eVar4.D : null;
        w0Var.f31415f = eVar4 != null ? eVar4.F : null;
        w0Var.f31416g = this.f28420h;
        com.fyber.inneractive.sdk.web.v0 v0Var = new com.fyber.inneractive.sdk.web.v0(w0Var);
        this.f28419g = v0Var;
        com.fyber.inneractive.sdk.config.global.features.r rVar = (com.fyber.inneractive.sdk.config.global.features.r) this.f28439c.a(com.fyber.inneractive.sdk.config.global.features.r.class);
        if (rVar == null || str2 == null) {
            return;
        }
        String strA = rVar.a("detail_url", "https://cdn2.inner-active.mobi/app-detail-page-v0/[BUNDLE_ID].html");
        v0Var.e(strA == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strA.replace("[BUNDLE_ID]", str2));
    }

    @Override // com.fyber.inneractive.sdk.flow.x
    public final boolean a(boolean z11, com.fyber.inneractive.sdk.util.g gVar) {
        com.fyber.inneractive.sdk.ignite.m mVar;
        com.fyber.inneractive.sdk.response.e eVar = this.f28438b;
        if (eVar != null) {
            mVar = eVar.E;
        } else {
            mVar = com.fyber.inneractive.sdk.ignite.m.NONE;
        }
        if (z11 || mVar == null || mVar != com.fyber.inneractive.sdk.ignite.m.TRUE_SINGLE_TAP) {
            return false;
        }
        return gVar == com.fyber.inneractive.sdk.util.g.VIDEO_CTA || gVar == com.fyber.inneractive.sdk.util.g.DEFAULT_ENDCARD;
    }
}
