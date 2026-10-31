package com.fyber.inneractive.sdk.flow;

import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveAdViewUnitController;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.external.NativeAdUnitController;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Iterator;

/* loaded from: classes.dex */
public abstract class o implements com.fyber.inneractive.sdk.interfaces.a, com.fyber.inneractive.sdk.interfaces.b {

    /* renamed from: a, reason: collision with root package name */
    public com.fyber.inneractive.sdk.interfaces.c f28257a;

    /* renamed from: b, reason: collision with root package name */
    public n f28258b;

    /* renamed from: c, reason: collision with root package name */
    public com.fyber.inneractive.sdk.config.global.r f28259c;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.network.m f28260d;

    /* renamed from: e, reason: collision with root package name */
    public final String f28261e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f28262f = false;

    public o(String str) {
        this.f28261e = str;
    }

    public void a(InneractiveAdRequest inneractiveAdRequest, com.fyber.inneractive.sdk.response.e eVar) {
    }

    public void b(InneractiveAdRequest inneractiveAdRequest) {
    }

    public final com.fyber.inneractive.sdk.response.e c() {
        com.fyber.inneractive.sdk.interfaces.c cVar = this.f28257a;
        if (cVar == null) {
            return null;
        }
        k kVar = (k) cVar;
        x xVar = kVar.f28166c;
        return xVar != null ? xVar.f28438b : kVar.f28165b;
    }

    public String d() {
        return IAlog.a(this);
    }

    public final void a(InneractiveAdRequest inneractiveAdRequest, com.fyber.inneractive.sdk.response.e eVar, InneractiveInfrastructureError inneractiveInfrastructureError) {
        if (IAlog.f31163a <= 3) {
            Thread.dumpStack();
        }
        IAlog.e("%sgot onAdRequestFailed! with: %s", d(), inneractiveInfrastructureError.getErrorCode());
        if (this.f28258b != null) {
            if (eVar != null && eVar.f31050i != null) {
                inneractiveInfrastructureError.setCause(new Exception(eVar.f31050i + ": " + eVar.f31051j));
            }
            ((e0) this.f28258b).a(inneractiveAdRequest, eVar, inneractiveInfrastructureError);
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.a
    public void a(InneractiveAdRequest inneractiveAdRequest) {
        x xVar;
        com.fyber.inneractive.sdk.response.e eVar;
        s0 s0Var;
        IAlog.e("%sgot onAdLoaded!", d());
        com.fyber.inneractive.sdk.interfaces.c cVar = this.f28257a;
        if (cVar != null) {
            n nVar = this.f28258b;
            if (nVar != null && (xVar = ((k) cVar).f28166c) != null) {
                e0 e0Var = (e0) nVar;
                if (e0Var.f28052a.n.get()) {
                    IAlog.a("%s: onAdLoaded: spot is already destroyed", h0.a(e0Var.f28052a));
                    h0 h0Var = e0Var.f28052a;
                    p pVar = h0Var.f28161l;
                    h0Var.a(xVar);
                } else {
                    h0 h0Var2 = e0Var.f28052a;
                    if (!h0Var2.f28159j && (s0Var = h0Var2.f28155f) != null && s0Var.supportsRefresh()) {
                        if (e0Var.f28052a.f28155f.canRefreshAd()) {
                            h0 h0Var3 = e0Var.f28052a;
                            h0Var3.f28154e = xVar;
                            xVar.f28437a = inneractiveAdRequest;
                            g0 g0Var = h0Var3.f28158i;
                            if (g0Var != null) {
                                g0Var.onAdRefreshed(h0Var3);
                            } else {
                                s0 s0Var2 = h0Var3.f28155f;
                                if (s0Var2 instanceof InneractiveAdViewUnitController) {
                                    ((InneractiveAdViewUnitController) s0Var2).onAdRefreshed(h0Var3);
                                }
                            }
                        } else {
                            IAlog.a("%sad loaded successfully, but the selected unit controller has rejected the refresh!", h0.a(e0Var.f28052a));
                            h0 h0Var4 = e0Var.f28052a;
                            h0Var4.f28158i.onAdRefreshFailed(h0Var4, InneractiveErrorCode.CANCELLED);
                        }
                    } else {
                        h0 h0Var5 = e0Var.f28052a;
                        h0Var5.f28154e = xVar;
                        xVar.f28437a = inneractiveAdRequest;
                        Iterator it = h0Var5.f28156g.iterator();
                        while (it.hasNext()) {
                            s0 s0Var3 = (s0) it.next();
                            if (s0Var3.supports(h0Var5)) {
                                h0Var5.f28155f = s0Var3;
                                h0 h0Var6 = e0Var.f28052a;
                                InneractiveAdSpot.RequestListener requestListener = h0Var6.f28151b;
                                if (requestListener != null) {
                                    if (requestListener instanceof InneractiveAdSpot.NativeAdRequestListener) {
                                        InneractiveAdSpot.NativeAdRequestListener nativeAdRequestListener = (InneractiveAdSpot.NativeAdRequestListener) requestListener;
                                        s0 s0Var4 = h0Var6.f28155f;
                                        if ((xVar instanceof w0) && (s0Var4 instanceof NativeAdUnitController)) {
                                            w0 w0Var = (w0) xVar;
                                            w0Var.f28434v = (NativeAdUnitController) s0Var4;
                                            nativeAdRequestListener.onInneractiveSuccessfulNativeAdRequest(h0Var6, w0Var);
                                        } else {
                                            IAlog.b("%s: Invalid native response: controller or/and content mismatch", IAlog.a(h0Var6));
                                            nativeAdRequestListener.onInneractiveFailedAdRequest(h0Var6, InneractiveErrorCode.ERROR_CONFIGURATION_MISMATCH);
                                        }
                                    } else {
                                        requestListener.onInneractiveSuccessfulAdRequest(h0Var6);
                                    }
                                }
                                e0Var.f28052a.f28159j = false;
                            }
                        }
                        e0Var.f28052a.f28154e.destroy();
                        IAlog.a("%sCannot find appropriate unit controller for unit: %s", h0.a(e0Var.f28052a), e0Var.f28052a.f28154e.f28440d);
                        m mVar = e0Var.f28052a.f28157h;
                        com.fyber.inneractive.sdk.response.e eVarC = mVar != null ? mVar.c() : null;
                        e0Var.a(inneractiveAdRequest, eVarC, new InneractiveInfrastructureError(InneractiveErrorCode.INVALID_INPUT, i.COULD_NOT_SELECT_UNIT_CONTROLLER, new Exception("Cannot find appropriate unit controller for unit: " + e0Var.f28052a.f28154e.f28440d)));
                        h0 h0Var7 = e0Var.f28052a;
                        h0Var7.f28154e = null;
                        h0Var7.f28159j = false;
                    }
                    String str = e0Var.f28052a.f28150a;
                    com.fyber.inneractive.sdk.metrics.d dVar = com.fyber.inneractive.sdk.metrics.d.f28545d;
                    dVar.a(str).e();
                    dVar.a(str).b();
                    h0 h0Var8 = e0Var.f28052a;
                    x xVar2 = h0Var8.f28154e;
                    if (xVar2 != null && (eVar = xVar2.f28438b) != null && eVar.n != null) {
                        x xVar3 = h0Var8.f28154e;
                        com.fyber.inneractive.sdk.response.e eVar2 = xVar3.f28438b;
                        new com.fyber.inneractive.sdk.metrics.c(eVar2, h0Var8.f28152c, h0Var8.f28150a, eVar2.n, xVar3.f28439c.b()).a();
                    }
                }
            } else {
                IAlog.b("%sgot onAdLoaded! but content or listener is null", d());
            }
            this.f28257a = null;
        }
        b(inneractiveAdRequest);
    }

    @Override // com.fyber.inneractive.sdk.interfaces.a
    public final void a(InneractiveInfrastructureError inneractiveInfrastructureError) {
        x xVar;
        IAlog.e("%sgot onFailedLoading! with: %s", d(), inneractiveInfrastructureError);
        com.fyber.inneractive.sdk.interfaces.c cVar = this.f28257a;
        InneractiveAdRequest inneractiveAdRequest = (cVar == null || (xVar = ((k) cVar).f28166c) == null) ? null : xVar.f28437a;
        com.fyber.inneractive.sdk.response.e eVarC = c();
        IAlog.e("%sgot handleFailedLoading! with: %s", d(), inneractiveInfrastructureError);
        n nVar = this.f28258b;
        if (nVar != null) {
            ((e0) nVar).a(inneractiveAdRequest, eVarC, inneractiveInfrastructureError);
        }
        if (inneractiveInfrastructureError.getFyberMarketplaceAdLoadFailureReason() != i.NATIVE_AD_PARSING_ERROR) {
            a(inneractiveAdRequest, eVarC);
        }
    }

    public void a(boolean z11) {
        this.f28262f = true;
        com.fyber.inneractive.sdk.interfaces.c cVar = this.f28257a;
        if (cVar == null || !z11) {
            return;
        }
        cVar.cancel();
        x xVar = ((k) this.f28257a).f28166c;
        if (xVar != null) {
            xVar.destroy();
        }
        this.f28257a = null;
    }
}
