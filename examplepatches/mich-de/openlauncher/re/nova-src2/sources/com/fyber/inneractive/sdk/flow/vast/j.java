package com.fyber.inneractive.sdk.flow.vast;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.config.global.r;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.fyber.inneractive.sdk.model.vast.l;
import com.fyber.inneractive.sdk.network.t;
import com.fyber.inneractive.sdk.network.u;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.network.x;
import com.fyber.inneractive.sdk.util.IAlog;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class j {
    public static InneractiveErrorCode a(InneractiveAdRequest inneractiveAdRequest, com.fyber.inneractive.sdk.response.g gVar, r rVar) throws JSONException {
        t tVar;
        InneractiveErrorCode inneractiveErrorCode;
        InneractiveErrorCode inneractiveErrorCode2;
        t tVar2;
        x xVarA;
        Set<com.fyber.inneractive.sdk.model.vast.r> setKeySet;
        String str;
        String str2 = gVar.f31050i;
        if ("VastErrorInvalidFile".equals(str2)) {
            inneractiveErrorCode2 = InneractiveErrorCode.SERVER_INVALID_RESPONSE;
            tVar2 = t.VAST_ERROR_INVALID_RESPONSE;
            if (gVar.f31051j != null) {
                xVarA = new x().a(gVar.f31051j, "exception");
                t tVar3 = tVar2;
                inneractiveErrorCode = inneractiveErrorCode2;
                tVar = tVar3;
            }
            t tVar4 = tVar2;
            inneractiveErrorCode = inneractiveErrorCode2;
            tVar = tVar4;
            xVarA = null;
        } else {
            if ("ErrorNoCompatibleMediaFile".equals(str2)) {
                inneractiveErrorCode2 = InneractiveErrorCode.SERVER_INVALID_RESPONSE;
                tVar2 = t.VAST_ERROR_NO_COMPATIBLE_MEDIA_FILE;
                LinkedHashMap linkedHashMap = gVar.O;
                if (linkedHashMap != null && (setKeySet = linkedHashMap.keySet()) != null && setKeySet.size() > 0) {
                    x xVar = new x();
                    JSONArray jSONArray = new JSONArray();
                    for (com.fyber.inneractive.sdk.model.vast.r rVar2 : setKeySet) {
                        try {
                            f fVar = (f) linkedHashMap.get(rVar2);
                            JSONObject jSONObject = new JSONObject();
                            jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, rVar2.f28637g);
                            jSONObject.put("bitrate", rVar2.f28635e);
                            jSONObject.put("mime", TextUtils.isEmpty(rVar2.f28634d) ? "na" : rVar2.f28634d);
                            jSONObject.put("delivery", rVar2.f28631a);
                            e eVar = fVar.f28414a;
                            jSONObject.put("reason", eVar != null ? eVar.value : 0);
                            jSONObject.put("required_value", fVar.f28415b);
                            jSONArray.put(jSONObject);
                        } catch (JSONException unused) {
                            IAlog.a("VastResponseValidator: Failed converting media file data to Extra data json!", new Object[0]);
                        }
                    }
                    xVar.a(jSONArray, "media_files");
                    inneractiveErrorCode = inneractiveErrorCode2;
                    tVar = tVar2;
                    xVarA = xVar;
                }
            } else if ("VastErrorTooManyWrappers".equals(str2)) {
                inneractiveErrorCode2 = InneractiveErrorCode.SERVER_INVALID_RESPONSE;
                tVar2 = t.VAST_ERROR_TOO_MANY_WRAPPERS;
                xVarA = new x().a(Integer.valueOf(IAConfigManager.Q.f27752j.f27875b), InneractiveMediationNameConsts.MAX);
                t tVar32 = tVar2;
                inneractiveErrorCode = inneractiveErrorCode2;
                tVar = tVar32;
            } else if ("ErrorNoMediaFiles".equals(str2)) {
                inneractiveErrorCode2 = InneractiveErrorCode.SERVER_INVALID_RESPONSE;
                tVar2 = t.VAST_ERROR_NO_MEDIA_FILES;
            } else if ("ErrorConfigurationMismatch".equals(str2)) {
                inneractiveErrorCode2 = InneractiveErrorCode.ERROR_CONFIGURATION_MISMATCH;
                tVar2 = t.INTERNAL_CONFIG_MISMATCH;
            } else if ("VastErrorUnsecure".equals(str2)) {
                inneractiveErrorCode2 = InneractiveErrorCode.SERVER_INVALID_RESPONSE;
                tVar2 = t.VAST_ERROR_UNSECURE_URL;
            } else {
                tVar = null;
                inneractiveErrorCode = null;
                xVarA = null;
            }
            t tVar42 = tVar2;
            inneractiveErrorCode = inneractiveErrorCode2;
            tVar = tVar42;
            xVarA = null;
        }
        if (tVar != null) {
            JSONArray jSONArrayB = rVar == null ? null : rVar.b();
            w wVar = new w(gVar);
            wVar.f28819b = tVar;
            wVar.f28818a = inneractiveAdRequest;
            wVar.f28821d = jSONArrayB;
            if (xVarA != null) {
                wVar.f28823f.put(xVarA.f28825a);
            }
            wVar.a((String) null);
        }
        if (gVar.n != UnitDisplayType.NATIVE) {
            ArrayList arrayList = gVar.P;
            if (arrayList != null && arrayList.size() > 0) {
                u uVar = u.VAST_EVENT_COMPANION_FILTERED;
                JSONArray jSONArrayB2 = rVar == null ? null : rVar.b();
                w wVar2 = new w(gVar);
                wVar2.f28820c = uVar;
                wVar2.f28818a = inneractiveAdRequest;
                wVar2.f28821d = jSONArrayB2;
                JSONObject jSONObject2 = new JSONObject();
                JSONArray jSONArray2 = new JSONArray();
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    com.fyber.inneractive.sdk.model.vast.h hVar = (com.fyber.inneractive.sdk.model.vast.h) it.next();
                    hVar.getClass();
                    JSONObject jSONObject3 = new JSONObject();
                    try {
                        jSONObject3.put("w", hVar.f28606a);
                        jSONObject3.put("h", hVar.f28607b);
                        jSONObject3.put("ctr", hVar.f28612g);
                        jSONObject3.put("clt", hVar.f28613h);
                        String str3 = hVar.f28611f;
                        if (str3 != null) {
                            jSONObject3.put("content", str3);
                            str = k.H;
                        } else {
                            str = null;
                        }
                        l lVar = hVar.f28609d;
                        if (lVar != null) {
                            jSONObject3.put("content", lVar.f28618b);
                            jSONObject3.put("creativeType", hVar.f28609d.f28617a);
                            str = k.F;
                        }
                        if (!TextUtils.isEmpty(hVar.f28610e)) {
                            jSONObject3.put("content", hVar.f28610e);
                            str = "iFrameResource";
                        }
                        if (str != null) {
                            jSONObject3.put(TTConst.TRACK_TYPE, str);
                        }
                        b bVar = hVar.f28614i;
                        if (bVar != null) {
                            jSONObject3.put("reason", bVar.f28400a);
                            jSONObject3.put("exception", hVar.f28614i.getMessage());
                        }
                    } catch (JSONException e3) {
                        IAlog.a("Failed creating Companion json object: %s", e3.getMessage());
                        jSONObject3 = null;
                    }
                    jSONArray2.put(jSONObject3);
                }
                try {
                    jSONObject2.put("companion_data", jSONArray2);
                } catch (Exception unused2) {
                    IAlog.f("Got exception adding param to json object: %s, %s", "companion_data", jSONArray2);
                }
                wVar2.f28823f.put(jSONObject2);
                wVar2.a((String) null);
            }
            com.fyber.inneractive.sdk.model.vast.b bVar2 = gVar.N;
            int size = bVar2 != null ? bVar2.f28574g.size() : 0;
            ArrayList arrayList2 = gVar.P;
            int size2 = arrayList2 != null ? arrayList2.size() : 0;
            u uVar2 = u.NUMBER_OF_COMPANIONS;
            JSONArray jSONArrayB3 = rVar == null ? null : rVar.b();
            w wVar3 = new w(gVar);
            wVar3.f28820c = uVar2;
            wVar3.f28818a = inneractiveAdRequest;
            wVar3.f28821d = jSONArrayB3;
            JSONObject jSONObject4 = new JSONObject();
            Integer numValueOf = Integer.valueOf(size + size2);
            try {
                jSONObject4.put("number_of_endcards", numValueOf);
            } catch (Exception unused3) {
                IAlog.f("Got exception adding param to json object: %s, %s", "number_of_endcards", numValueOf);
            }
            wVar3.f28823f.put(jSONObject4);
            wVar3.a((String) null);
        }
        if (gVar.N != null) {
            i iVar = new i(gVar);
            if (iVar.size() > 0) {
                JSONObject jSONObject5 = new JSONObject();
                JSONArray jSONArray3 = new JSONArray();
                u uVar3 = u.OMID_VAST_DETECTION;
                JSONArray jSONArrayB4 = rVar == null ? null : rVar.b();
                w wVar4 = new w(gVar);
                wVar4.f28820c = uVar3;
                wVar4.f28818a = inneractiveAdRequest;
                wVar4.f28821d = jSONArrayB4;
                Iterator it2 = iVar.iterator();
                while (it2.hasNext()) {
                    com.fyber.inneractive.sdk.measurement.h hVar2 = (com.fyber.inneractive.sdk.measurement.h) it2.next();
                    hVar2.getClass();
                    JSONObject jSONObject6 = new JSONObject();
                    try {
                        jSONObject6.put("success", String.valueOf(hVar2.b()));
                        if (!hVar2.b()) {
                            jSONObject6.put("error_reason", hVar2.a());
                        }
                    } catch (JSONException unused4) {
                        jSONObject6 = null;
                    }
                    if (jSONObject6 != null) {
                        jSONArray3.put(jSONObject6);
                    }
                }
                try {
                    jSONObject5.put("verifications", jSONArray3);
                } catch (Exception unused5) {
                    IAlog.f("Got exception adding param to json object: %s, %s", "verifications", jSONArray3);
                }
                wVar4.f28823f.put(jSONObject5);
                wVar4.a((String) null);
            }
        }
        return inneractiveErrorCode;
    }
}
