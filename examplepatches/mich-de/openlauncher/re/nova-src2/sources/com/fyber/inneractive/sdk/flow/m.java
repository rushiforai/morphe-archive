package com.fyber.inneractive.sdk.flow;

import android.text.TextUtils;
import com.amplitude.core.events.Identify;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class m extends o {

    /* renamed from: g, reason: collision with root package name */
    public l f28181g;

    public m(String str) {
        super(str);
    }

    public static void a(boolean z11, com.fyber.inneractive.sdk.response.e eVar, InneractiveAdRequest inneractiveAdRequest) throws JSONException {
        String spotId = inneractiveAdRequest.getSpotId();
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        String str = (String) iAConfigManager.f27764x.f27773d.get("KEY_MISSMATCH_STATS_SPOTS");
        if (TextUtils.isEmpty(str)) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (str.contains(Identify.UNSET_VALUE + spotId + Identify.UNSET_VALUE)) {
            return;
        }
        com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(com.fyber.inneractive.sdk.network.t.MISSMATCH_SPOTID, inneractiveAdRequest, eVar);
        String strL = z11 ? b.c0.l("There is no ", spotId, " spot ID in current app config") : b.c0.l("spot ID ", spotId, " is not active in current app config");
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("reason", strL);
        } catch (Exception unused) {
            IAlog.f("Got exception adding param to json object: %s, %s", "reason", strL);
        }
        wVar.f28823f.put(jSONObject);
        wVar.a((String) null);
        iAConfigManager.f27764x.f27773d.put("KEY_MISSMATCH_STATS_SPOTS", a80.m.h(str, " -", spotId, Identify.UNSET_VALUE));
    }

    @Override // com.fyber.inneractive.sdk.interfaces.b
    public final void b() {
        IAlog.a("%s onRetry()", IAlog.a(this));
    }

    public final void c(InneractiveAdRequest inneractiveAdRequest) {
        o oVar;
        com.fyber.inneractive.sdk.config.y0 y0Var;
        UnitDisplayType unitDisplayType;
        n nVar;
        if (!InneractiveAdManager.wasInitialized() && (nVar = this.f28258b) != null) {
            ((e0) nVar).a(inneractiveAdRequest, c(), new InneractiveInfrastructureError(InneractiveErrorCode.SDK_NOT_INITIALIZED, i.NO_APP_CONFIG_AVAILABLE));
        }
        String spotId = inneractiveAdRequest.getSpotId();
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        HashMap map = iAConfigManager.f27743a;
        com.fyber.inneractive.sdk.config.v0 v0Var = (map == null || !map.containsKey(spotId)) ? null : (com.fyber.inneractive.sdk.config.v0) iAConfigManager.f27743a.get(spotId);
        com.fyber.inneractive.sdk.response.e eVarC = c();
        if (v0Var != null && !v0Var.f27941b) {
            a(false, eVarC, inneractiveAdRequest);
            ((e0) this.f28258b).a(inneractiveAdRequest, c(), new InneractiveInfrastructureError(InneractiveErrorCode.SPOT_DISABLED, i.NO_APP_CONFIG_AVAILABLE));
            return;
        }
        if (v0Var == null || !v0Var.f27940a.iterator().hasNext()) {
            if (v0Var == null) {
                a(true, eVarC, inneractiveAdRequest);
                IAConfigManager.a();
            }
            IAlog.f("************************************************************************************************************************", new Object[0]);
            IAlog.f("*** Requested spot id '%s' doesn't exist within this application config - application Id: '%s'", inneractiveAdRequest.getSpotId(), iAConfigManager.f27745c);
            IAlog.f("*** Are you sure that you are using the correct application and spot ids, as defined for this application in the Inneractive console?", new Object[0]);
            IAlog.f("************************************************************************************************************************", new Object[0]);
            ((e0) this.f28258b).a(inneractiveAdRequest, eVarC, new InneractiveInfrastructureError(InneractiveErrorCode.ERROR_CONFIGURATION_NO_SUCH_SPOT, i.NO_APP_CONFIG_AVAILABLE));
            return;
        }
        com.fyber.inneractive.sdk.config.w0 w0Var = (com.fyber.inneractive.sdk.config.w0) v0Var.f27940a.get(0);
        if (w0Var.f27947e != null || (w0Var.f27945c == null && ((y0Var = w0Var.f27948f) == null || ((unitDisplayType = y0Var.f27963j) != UnitDisplayType.INTERSTITIAL && unitDisplayType != UnitDisplayType.REWARDED)))) {
            ((e0) this.f28258b).a(inneractiveAdRequest, c(), new InneractiveInfrastructureError(InneractiveErrorCode.UNSUPPORTED_SPOT, i.NO_APP_CONFIG_AVAILABLE));
            return;
        }
        com.fyber.inneractive.sdk.config.global.r rVarA = com.fyber.inneractive.sdk.config.global.r.a();
        this.f28259c = rVarA;
        rVarA.a(false, inneractiveAdRequest.getSpotId());
        com.fyber.inneractive.sdk.network.s sVar = new com.fyber.inneractive.sdk.network.s(inneractiveAdRequest, inneractiveAdRequest.f28394b, this.f28259c, this);
        this.f28260d = sVar;
        sVar.f28749b = false;
        IAlog.a("IARemoteAdFetcher: requestAd called", new Object[0]);
        if (TextUtils.isEmpty(inneractiveAdRequest.getSpotId())) {
            IAlog.b("appID is null or empty. Please provide a valid appID and re-try.", new Object[0]);
        } else {
            if (com.fyber.inneractive.sdk.util.o.a("android.permission.INTERNET")) {
                if (!com.fyber.inneractive.sdk.util.o.a("android.permission.ACCESS_NETWORK_STATE")) {
                    IAlog.b("It is recommended to add ACCESS_NETWORK_STATE permission to the Manifest for better targetting", new Object[0]);
                }
                if (!com.fyber.inneractive.sdk.util.o.a("android.permission.READ_PHONE_STATE")) {
                    IAlog.f("It is recomended to add the READ_PHONE_STATE permission to the manifest for better targetting", new Object[0]);
                }
                iAConfigManager.f27759s.a(sVar.f28772f);
                return;
            }
            IAlog.b("INTERNET permission is missing. Please add it to the Manifest and re-try, otherwise ads will not be requested and displayed! ", new Object[0]);
        }
        InneractiveInfrastructureError inneractiveInfrastructureError = new InneractiveInfrastructureError(InneractiveErrorCode.INVALID_INPUT, i.VALIDATE_PARAMS_FAILED, new Exception("appID is null or empty or INTERNET permission is missing"));
        if (sVar.f28749b || (oVar = sVar.f28748a) == null) {
            return;
        }
        oVar.a(inneractiveAdRequest, null, inneractiveInfrastructureError);
    }

    @Override // com.fyber.inneractive.sdk.flow.o
    public final String d() {
        return IAlog.a(this);
    }

    @Override // com.fyber.inneractive.sdk.interfaces.b
    public final void a() {
        IAlog.a("%s onTimeout()", IAlog.a(this));
    }
}
