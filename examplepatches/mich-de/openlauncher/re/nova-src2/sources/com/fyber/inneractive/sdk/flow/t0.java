package com.fyber.inneractive.sdk.flow;

import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class t0 extends w {

    /* renamed from: i, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.t f28389i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f28390j;

    public t0(com.fyber.inneractive.sdk.config.x0 x0Var, com.fyber.inneractive.sdk.config.global.r rVar, com.fyber.inneractive.sdk.response.g gVar, InneractiveAdRequest inneractiveAdRequest) {
        super(x0Var, rVar);
        this.f28390j = false;
        this.f28438b = gVar;
        this.f28437a = inneractiveAdRequest;
    }

    @Override // com.fyber.inneractive.sdk.flow.x
    public final boolean b() {
        com.fyber.inneractive.sdk.config.y0 y0Var;
        com.fyber.inneractive.sdk.config.x0 x0Var = this.f28440d;
        if (x0Var == null || (y0Var = ((com.fyber.inneractive.sdk.config.w0) x0Var).f27948f) == null) {
            IAlog.f("%s : isFullscreenAd() called with unit config: %s or mUnitConfig.getVideo is null", IAlog.a(this), this.f28440d);
            return false;
        }
        UnitDisplayType unitDisplayType = y0Var.f27963j;
        return UnitDisplayType.INTERSTITIAL.equals(unitDisplayType) || UnitDisplayType.REWARDED.equals(unitDisplayType) || UnitDisplayType.VERTICAL.equals(unitDisplayType);
    }

    @Override // com.fyber.inneractive.sdk.flow.x
    public final boolean d() {
        return this.f28389i != null;
    }

    @Override // com.fyber.inneractive.sdk.flow.x
    public final void destroy() {
        com.fyber.inneractive.sdk.player.n nVar;
        if (this.f28419g != null && b()) {
            com.fyber.inneractive.sdk.web.v0 v0Var = this.f28419g;
            v0Var.f31407y = true;
            v0Var.D = false;
            v0Var.f31386b.f28485g.remove(v0Var);
            v0Var.f31393i = null;
            IAlog.a("destroy internalStoreWebpageController", new Object[0]);
            this.f28419g = null;
        }
        com.fyber.inneractive.sdk.player.t tVar = this.f28389i;
        if (tVar != null) {
            com.fyber.inneractive.sdk.player.b bVar = tVar.f30652a;
            if (bVar != null && (nVar = bVar.f28837b) != null) {
                nVar.f30587i = true;
                IAlog.a("IAMediaPlayerFlowManager: destroy", new Object[0]);
                nVar.a();
                com.fyber.inneractive.sdk.flow.endcard.b bVarA = nVar.f30642u.f28076b.a();
                if (bVarA != null) {
                    bVarA.destroy();
                }
                if (nVar.f30579a != null) {
                    IAlog.a("%s : destroy() : playerController being destroyed", InneractiveMediationDefs.GENDER_FEMALE);
                    nVar.f30579a.a();
                    nVar.f30579a = null;
                }
                nVar.f30590l = null;
                com.fyber.inneractive.sdk.flow.endcard.k kVar = nVar.f30642u;
                if (kVar != null) {
                    com.fyber.inneractive.sdk.flow.endcard.m mVar = kVar.f28076b;
                    Iterator it = mVar.f28113a.iterator();
                    while (it.hasNext()) {
                        ((com.fyber.inneractive.sdk.flow.endcard.b) it.next()).destroy();
                    }
                    mVar.f28113a.clear();
                    mVar.f28114b.clear();
                    mVar.f28115c = -1;
                }
                com.fyber.inneractive.sdk.player.ui.remote.g gVar = nVar.f30643v;
                if (gVar != null) {
                    gVar.f30730a.a();
                }
                com.fyber.inneractive.sdk.flow.storepromo.b bVar2 = nVar.f30644w;
                if (bVar2 != null) {
                    bVar2.f28281a.a();
                    bVar2.a();
                    bVar2.f28285e = null;
                    bVar2.f28288h.clear();
                }
            }
            this.f28389i = null;
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.x
    public boolean isVideoAd() {
        return true;
    }
}
