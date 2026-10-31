package com.fyber.inneractive.sdk.flow;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.util.IAlog;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.Arrays;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public abstract class a {
    public static void a(InneractiveAdRequest inneractiveAdRequest, InneractiveInfrastructureError inneractiveInfrastructureError, x xVar, com.fyber.inneractive.sdk.response.e eVar, JSONArray jSONArray) throws JSONException {
        String string;
        if (inneractiveInfrastructureError.getFyberMarketplaceAdLoadFailureReason() == i.ADM_FETCH_FAILED || inneractiveInfrastructureError.getErrorCode().getMetricable() != InneractiveErrorCode.Metricable.INCLUDED_IN_FAILED_METRICS) {
            return;
        }
        if (xVar == null || xVar.b() || xVar.isVideoAd()) {
            com.fyber.inneractive.sdk.network.t tVar = com.fyber.inneractive.sdk.network.t.IA_AD_LOAD_FAILED;
            if (inneractiveInfrastructureError.isErrorAlreadyReported(tVar)) {
                return;
            }
            IAlog.a("Firing Event 801 - AdLoadFailed - errorCode - %s", inneractiveInfrastructureError.getErrorCode());
            if (inneractiveInfrastructureError.getCause() != null) {
                string = Arrays.toString(inneractiveInfrastructureError.getCause().getStackTrace());
            } else {
                StringBuilder sb2 = new StringBuilder();
                StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
                for (int i5 = 7; i5 >= 0 && i5 < 13 && i5 < stackTrace.length; i5++) {
                    sb2.append(stackTrace[i5].toString());
                    sb2.append(",");
                }
                string = sb2.toString();
            }
            com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(eVar);
            wVar.f28819b = tVar;
            wVar.f28818a = inneractiveAdRequest;
            wVar.f28821d = jSONArray;
            JSONObject jSONObject = new JSONObject();
            String string2 = inneractiveInfrastructureError.getFyberMarketplaceAdLoadFailureReason().toString();
            try {
                jSONObject.put(PglCryptUtils.KEY_MESSAGE, string2);
            } catch (Exception unused) {
                IAlog.f("Got exception adding param to json object: %s, %s", PglCryptUtils.KEY_MESSAGE, string2);
            }
            try {
                jSONObject.put(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, string);
            } catch (Exception unused2) {
                IAlog.f("Got exception adding param to json object: %s, %s", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, string);
            }
            String strDescription = inneractiveInfrastructureError.description();
            try {
                jSONObject.put("extra_description", strDescription);
            } catch (Exception unused3) {
                IAlog.f("Got exception adding param to json object: %s, %s", "extra_description", strDescription);
            }
            wVar.f28823f.put(jSONObject);
            wVar.a((String) null);
            inneractiveInfrastructureError.addReportedError(tVar);
        }
    }
}
