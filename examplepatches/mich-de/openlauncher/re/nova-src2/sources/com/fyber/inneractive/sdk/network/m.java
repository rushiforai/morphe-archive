package com.fyber.inneractive.sdk.network;

import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.external.ImpressionData;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveAdSpotManager;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.util.IAlog;
import org.json.JSONException;

/* loaded from: classes.dex */
public abstract class m {

    /* renamed from: a, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.o f28748a;

    /* renamed from: b, reason: collision with root package name */
    public volatile boolean f28749b = false;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.config.global.r f28750c;

    /* renamed from: d, reason: collision with root package name */
    public final String f28751d;

    public m(com.fyber.inneractive.sdk.config.global.r rVar, String str, com.fyber.inneractive.sdk.flow.o oVar) {
        this.f28748a = oVar;
        this.f28750c = rVar;
        this.f28751d = str;
    }

    public final void a(InneractiveAdRequest inneractiveAdRequest, com.fyber.inneractive.sdk.response.e eVar) throws JSONException {
        com.fyber.inneractive.sdk.flow.o oVar;
        com.fyber.inneractive.sdk.flow.x xVar;
        if (this.f28748a == null) {
            return;
        }
        if (this.f28749b) {
            IAlog.e("IARemoteAdFetcher: ignoring response. Previous request was cancelled", new Object[0]);
            return;
        }
        com.fyber.inneractive.sdk.config.w0 w0VarA = com.fyber.inneractive.sdk.config.a.a(eVar.f31054m);
        if (inneractiveAdRequest != null) {
            inneractiveAdRequest.setSelectedUnitConfig(w0VarA);
        }
        com.fyber.inneractive.sdk.config.global.e eVar2 = new com.fyber.inneractive.sdk.config.global.e();
        ImpressionData impressionData = eVar.f31057r;
        eVar2.f27811a = impressionData != null ? impressionData.getDemandId() : null;
        try {
            eVar2.f27812b = Long.valueOf(IAConfigManager.Q.f27746d);
        } catch (NumberFormatException unused) {
            IAlog.a("invalid publisherId", new Object[0]);
        }
        this.f28750c.a(eVar2);
        InneractiveErrorCode inneractiveErrorCodeA = w0VarA == null ? InneractiveErrorCode.ERROR_CONFIGURATION_MISMATCH : eVar.a(inneractiveAdRequest, this.f28750c);
        if (inneractiveErrorCodeA != null) {
            com.fyber.inneractive.sdk.flow.i iVar = com.fyber.inneractive.sdk.flow.i.CONTENT_ERROR_UNSPECIFIED;
            if (w0VarA == null || inneractiveErrorCodeA == InneractiveErrorCode.ERROR_CONFIGURATION_MISMATCH) {
                iVar = com.fyber.inneractive.sdk.flow.i.NO_APP_CONFIG_AVAILABLE;
                IAlog.b("%sGot configuration mismatch!", IAlog.a(this));
                IAConfigManager.a();
            }
            InneractiveInfrastructureError inneractiveInfrastructureError = new InneractiveInfrastructureError(inneractiveErrorCodeA, iVar);
            Exception exc = eVar.f31062w;
            if (exc != null) {
                inneractiveInfrastructureError.setCause(exc);
            }
            com.fyber.inneractive.sdk.response.a aVarA = com.fyber.inneractive.sdk.response.a.a(eVar.f31048g);
            if (aVarA != null) {
                Exception exc2 = eVar.f31062w;
                if (exc2 != null) {
                    inneractiveInfrastructureError.setCause(exc2);
                }
                com.fyber.inneractive.sdk.util.r.f31215a.execute(new com.fyber.inneractive.sdk.flow.e(new com.fyber.inneractive.sdk.flow.f(eVar, inneractiveAdRequest, aVarA == com.fyber.inneractive.sdk.response.a.RETURNED_ADTYPE_HTML ? "send_failed_display_creatives" : "send_failed_vast_creatives", this.f28750c.b()), inneractiveInfrastructureError));
            }
            com.fyber.inneractive.sdk.config.global.r rVar = this.f28750c;
            if (rVar == null) {
                InneractiveAdSpot spot = InneractiveAdSpotManager.get().getSpot(this.f28751d);
                rVar = (spot == null || spot.getAdContent() == null) ? null : spot.getAdContent().f28439c;
            }
            com.fyber.inneractive.sdk.flow.a.a(inneractiveAdRequest, inneractiveInfrastructureError, null, eVar, rVar != null ? rVar.b() : null);
            if (this.f28749b || (oVar = this.f28748a) == null) {
                return;
            }
            oVar.a(inneractiveAdRequest, eVar, inneractiveInfrastructureError);
            return;
        }
        com.fyber.inneractive.sdk.flow.o oVar2 = this.f28748a;
        if (oVar2.f28262f) {
            IAlog.e("IAAdSourceBase: load cancelled: ignoring response. Previous load request was cancelled", new Object[0]);
            return;
        }
        com.fyber.inneractive.sdk.config.global.r rVar2 = oVar2.f28259c;
        IAlog.e("%sonAdDataAvailable: got response data: %s", oVar2.d(), eVar);
        if (eVar.a()) {
            com.fyber.inneractive.sdk.ignite.h hVar = IAConfigManager.Q.F;
            if (hVar.f28484f) {
                hVar.a((qc.a) null);
            }
        }
        com.fyber.inneractive.sdk.response.a aVarA2 = com.fyber.inneractive.sdk.response.a.a(eVar.f31048g);
        com.fyber.inneractive.sdk.interfaces.c cVar = oVar2.f28257a;
        if (cVar != null && (xVar = ((com.fyber.inneractive.sdk.flow.k) cVar).f28166c) != null) {
            xVar.destroy();
        }
        com.fyber.inneractive.sdk.factories.e eVar3 = (com.fyber.inneractive.sdk.factories.e) com.fyber.inneractive.sdk.factories.d.f28022a.f28023a.get(aVarA2);
        com.fyber.inneractive.sdk.interfaces.c cVarA = eVar3 != null ? eVar3.a() : null;
        oVar2.f28257a = cVarA;
        if (cVarA == null) {
            IAlog.f("%sonAdDataAvailable: Cannot find content handler for ad type: %s", oVar2.d(), aVarA2);
            com.fyber.inneractive.sdk.flow.n nVar = oVar2.f28258b;
            if (nVar != null) {
                ((com.fyber.inneractive.sdk.flow.e0) nVar).a(inneractiveAdRequest, eVar, new InneractiveInfrastructureError(InneractiveErrorCode.SDK_INTERNAL_ERROR, com.fyber.inneractive.sdk.flow.i.NO_CONTENT_LOADER_AVAILABLE));
            }
        } else {
            IAlog.e("%sonAdDataAvailable: found response loader: %s", oVar2.d(), oVar2.f28257a);
        }
        com.fyber.inneractive.sdk.interfaces.c cVar2 = oVar2.f28257a;
        if (cVar2 != null) {
            ((com.fyber.inneractive.sdk.flow.k) cVar2).a(inneractiveAdRequest, eVar, rVar2, oVar2, oVar2);
        } else {
            z.a("NullPointerException prevented", "mAdContentLoader is null", inneractiveAdRequest, eVar);
        }
    }

    public String b() {
        return null;
    }

    public void a() {
        this.f28749b = true;
        this.f28748a = null;
    }
}
