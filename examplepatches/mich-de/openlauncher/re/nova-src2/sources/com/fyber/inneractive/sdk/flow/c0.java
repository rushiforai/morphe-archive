package com.fyber.inneractive.sdk.flow;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.bidder.adm.AdmParametersOuterClass$AdmParameters;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.network.k1;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class c0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.bidder.adm.y f28041a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.config.global.r f28042b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f28043c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ h0 f28044d;

    public c0(h0 h0Var, com.fyber.inneractive.sdk.bidder.adm.y yVar, com.fyber.inneractive.sdk.config.global.r rVar, String str) {
        this.f28044d = h0Var;
        this.f28041a = yVar;
        this.f28042b = rVar;
        this.f28043c = str;
    }

    public final void a() {
        com.fyber.inneractive.sdk.config.global.b bVar;
        com.fyber.inneractive.sdk.config.global.k kVar;
        com.fyber.inneractive.sdk.config.global.l lVar;
        IAlog.a("%s : InneractiveAdSpotImpl markup data available", h0.a(this.f28044d));
        if (this.f28044d.n.get()) {
            h0 h0Var = this.f28044d;
            p pVar = h0Var.f28161l;
            h0Var.a(h0Var.f28154e);
            return;
        }
        AdmParametersOuterClass$AdmParameters admParametersOuterClass$AdmParameters = this.f28041a.f27616a;
        if (admParametersOuterClass$AdmParameters != null) {
            com.fyber.inneractive.sdk.config.global.r rVar = this.f28042b;
            List<AdmParametersOuterClass$AdmParameters.Experiment> abExperimentsList = admParametersOuterClass$AdmParameters.getAbExperimentsList();
            rVar.getClass();
            com.fyber.inneractive.sdk.config.global.a aVar = IAConfigManager.Q.f27766z;
            aVar.getClass();
            for (com.fyber.inneractive.sdk.config.global.features.i iVar : rVar.f27837b.values()) {
                if (iVar != null && (lVar = aVar.f27803a) != null) {
                    com.fyber.inneractive.sdk.config.global.q qVar = (com.fyber.inneractive.sdk.config.global.q) lVar.f27831a.get(iVar.f27818b);
                    if (qVar != null) {
                        iVar.f27833a = qVar.f27833a;
                    }
                }
            }
            if (abExperimentsList == null || abExperimentsList.size() <= 0) {
                return;
            }
            com.fyber.inneractive.sdk.config.global.a aVar2 = IAConfigManager.Q.f27766z;
            aVar2.f27804b = rVar;
            for (com.fyber.inneractive.sdk.config.global.features.i iVar2 : rVar.f27837b.values()) {
                for (AdmParametersOuterClass$AdmParameters.Experiment experiment : abExperimentsList) {
                    String identifier = experiment.getIdentifier();
                    String variant = experiment.getVariant();
                    com.fyber.inneractive.sdk.config.global.l lVar2 = aVar2.f27803a;
                    if (lVar2 != null) {
                        com.fyber.inneractive.sdk.config.global.q qVar2 = (com.fyber.inneractive.sdk.config.global.q) lVar2.f27831a.get(iVar2.f27818b);
                        if (qVar2 != null && (bVar = (com.fyber.inneractive.sdk.config.global.b) qVar2.f27835c.get(identifier)) != null) {
                            Iterator it = bVar.f27807c.iterator();
                            while (true) {
                                if (it.hasNext()) {
                                    kVar = (com.fyber.inneractive.sdk.config.global.k) it.next();
                                    if (kVar.f27829b.equals(variant)) {
                                        break;
                                    }
                                } else {
                                    kVar = null;
                                    break;
                                }
                            }
                            iVar2.f27819c.put(bVar.f27805a, bVar);
                            if (kVar != null) {
                                iVar2.f27820d.put(bVar.f27805a, kVar);
                            }
                        }
                    }
                }
            }
        }
    }

    public final void a(Exception exc, InneractiveErrorCode inneractiveErrorCode, com.fyber.inneractive.sdk.response.e... eVarArr) throws JSONException {
        i iVar;
        com.fyber.inneractive.sdk.network.t tVar;
        if (this.f28044d.n.get()) {
            IAlog.a("%s : onResponseDataError: spot is already destroyed won't continue", h0.a(this.f28044d));
            h0 h0Var = this.f28044d;
            p pVar = h0Var.f28161l;
            h0Var.a(h0Var.f28154e);
            return;
        }
        IAlog.a("%s : InneractiveAdSpotImpl data error", h0.a(this.f28044d));
        com.fyber.inneractive.sdk.response.e eVar = eVarArr.length > 0 ? eVarArr[0] : null;
        this.f28044d.getClass();
        if (exc.getCause() instanceof com.fyber.inneractive.sdk.response.nativead.a) {
            iVar = i.NATIVE_AD_PARSING_ERROR;
        } else {
            iVar = i.ADM_FETCH_FAILED;
        }
        InneractiveInfrastructureError inneractiveInfrastructureError = new InneractiveInfrastructureError(inneractiveErrorCode, iVar);
        e0 e0Var = this.f28044d.f28153d;
        if (e0Var != null) {
            e0Var.a(null, eVar, inneractiveInfrastructureError);
        }
        p pVar2 = this.f28044d.f28161l;
        if (pVar2 != null) {
            IAlog.e("%sgot handleFailedLoading! with: %s", pVar2.d(), inneractiveInfrastructureError);
            n nVar = pVar2.f28258b;
            if (nVar != null) {
                ((e0) nVar).a(null, eVar, inneractiveInfrastructureError);
            }
            if (inneractiveInfrastructureError.getFyberMarketplaceAdLoadFailureReason() != i.NATIVE_AD_PARSING_ERROR) {
                pVar2.a(null, eVar);
            }
        }
        h0 h0Var2 = this.f28044d;
        String str = this.f28043c;
        com.fyber.inneractive.sdk.config.global.r rVar = this.f28042b;
        h0Var2.getClass();
        int i5 = f0.f28145a[inneractiveErrorCode.ordinal()];
        if (i5 == 1 || i5 == 2) {
            tVar = com.fyber.inneractive.sdk.network.t.FATAL_ADM_MARKUP_FETCHING_ERROR;
        } else if (i5 != 3) {
            tVar = com.fyber.inneractive.sdk.network.t.FATAL_ADM_PARSING_ERROR;
        } else {
            tVar = com.fyber.inneractive.sdk.network.t.NATIVE_ERROR_INVALID_NATIVE_RESPONSE;
        }
        if (eVar != null) {
            eVar.A = false;
        }
        String name = exc.getClass().getName();
        if (exc instanceof k1) {
            name = "NetworkStackException";
        }
        JSONArray jSONArrayB = rVar.b();
        com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(eVar);
        wVar.f28819b = tVar;
        wVar.f28818a = null;
        wVar.f28821d = jSONArrayB;
        com.fyber.inneractive.sdk.network.x xVar = new com.fyber.inneractive.sdk.network.x();
        xVar.a(name, "exception").a(exc.getLocalizedMessage() != null ? exc.getLocalizedMessage() : exc, PglCryptUtils.KEY_MESSAGE);
        InneractiveErrorCode inneractiveErrorCode2 = InneractiveErrorCode.NATIVE_AD_FAILED_TO_LOAD;
        if (inneractiveErrorCode == inneractiveErrorCode2 && exc.getCause() != null && exc.getCause().getCause() != null) {
            xVar.a(exc.getCause().getCause().getMessage(), "reason");
        } else if (inneractiveErrorCode != inneractiveErrorCode2) {
            xVar.a(str, "admPayload");
        }
        wVar.f28823f.put(xVar.f28825a);
        wVar.a((String) null);
    }
}
