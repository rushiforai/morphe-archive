package com.bytedance.sdk.openadsdk.core;

import android.content.Context;
import android.text.TextUtils;
import android.webkit.WebView;
import com.bytedance.sdk.openadsdk.dj.zb;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class uh {
    public static void ycx(Context context, boolean z11, JSONObject jSONObject, com.bytedance.sdk.openadsdk.core.model.tn tnVar, String str, int i5, WebView webView, com.bytedance.sdk.openadsdk.core.widget.lt ltVar) {
        int i11;
        boolean z12;
        int iOptInt = jSONObject.optInt("landingStyle");
        String strOptString = jSONObject.optString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
        String strOptString2 = jSONObject.optString("fallback_url");
        String strOptString3 = jSONObject.optString("title", b.f42142b);
        boolean z13 = jSONObject.optInt("only_loading", 0) == 1;
        try {
            jSONObject.put("is_activity", z11);
            i11 = 1;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "cf0vsQa5eeuJRNx3mRyw", "VP4omyK4RcaOTudcixSMIVXlPg==", 44);
            i11 = 1;
        }
        com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar, str, i11, jSONObject);
        if (TextUtils.isEmpty(strOptString)) {
            return;
        }
        if (iOptInt != 0) {
            if (iOptInt == 1 || iOptInt == 8) {
                com.bytedance.sdk.openadsdk.dy.ycx.zb zbVar = new com.bytedance.sdk.openadsdk.dy.ycx.zb();
                zbVar.ycx(zb.ycx.f26770zb);
                zbVar.ycx(tnVar);
                zbVar.zb(str);
                zbVar.ycx(-1);
                zbVar.ycx(false);
                zbVar.zb(tnVar.liq());
                com.bytedance.sdk.openadsdk.dj.sya.ycx(zbVar);
                z12 = true;
                com.bytedance.sdk.openadsdk.utils.dv.ycx(context, strOptString, tnVar, zb.ycx.f26770zb, true);
            } else if (iOptInt == 2) {
                if (!com.bytedance.sdk.openadsdk.utils.dv.ycx(context, strOptString, tnVar, str)) {
                    com.bytedance.sdk.openadsdk.dy.ycx.zb zbVar2 = new com.bytedance.sdk.openadsdk.dy.ycx.zb();
                    zbVar2.ycx(zb.ycx.f26770zb);
                    zbVar2.ycx(tnVar);
                    zbVar2.zb(str);
                    zbVar2.ycx(-1);
                    zbVar2.ycx(false);
                    zbVar2.zb(tnVar.liq());
                    com.bytedance.sdk.openadsdk.dj.sya.ycx(zbVar2);
                    HashMap map = new HashMap();
                    map.put("deeplink_url", strOptString);
                    map.put("fallback_url", strOptString2);
                    map.put("jsb_deeplink", 1);
                    com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar, str, "open_fallback_url", map);
                    com.bytedance.sdk.openadsdk.utils.dv.ycx(context, strOptString2, tnVar, zb.ycx.f26770zb, true);
                }
            } else if (iOptInt == 3) {
                htf htfVar = new htf(tnVar);
                htfVar.ycx(strOptString3);
                htfVar.ycx(z13);
                yzp.ycx(context, strOptString, tnVar, i5, str, false, htfVar);
            } else {
                z12 = false;
            }
            if (ltVar == null && z12) {
                ltVar.ycx();
                return;
            }
        }
        if (webView != null) {
            webView.loadUrl(strOptString);
            com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar, str, 2, (JSONObject) null);
        } else {
            com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar, str, -1, (JSONObject) null);
        }
        z12 = true;
        if (ltVar == null) {
        }
    }
}
