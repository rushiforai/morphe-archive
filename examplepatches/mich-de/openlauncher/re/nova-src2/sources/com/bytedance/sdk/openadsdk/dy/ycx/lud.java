package com.bytedance.sdk.openadsdk.dy.ycx;

import android.text.TextUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Collection;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lud {
    public static void ycx(final String str, final String str2, final int i5, final String str3, final String str4, final List<String> list) {
        com.bytedance.sdk.openadsdk.dy.dj.ycx(str, false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.dy.ycx.lud.1
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str2);
                if (!TextUtils.isEmpty(str4)) {
                    jSONObject.put("error_url", str4);
                }
                List list2 = list;
                if (list2 != null && !list2.isEmpty()) {
                    jSONObject.put("back_up_url", list.toString());
                }
                jSONObject.put("error_code", i5);
                jSONObject.put("error_msg", str3);
                return dj.zb().ycx(str).zb(jSONObject.toString());
            }
        });
    }

    public static void zb(final String str, final String str2, final int i5, final String str3, final String str4, final List<String> list) {
        com.bytedance.sdk.openadsdk.dy.dj.ycx(str, false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.dy.ycx.lud.2
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                String str5 = str2;
                String string = b.f42142b;
                if (str5 == null) {
                    str5 = b.f42142b;
                }
                jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str5);
                String str6 = str4;
                if (str6 == null) {
                    str6 = b.f42142b;
                }
                jSONObject.put("web_sence", str6);
                List list2 = list;
                if (list2 != null && !list2.isEmpty()) {
                    string = new JSONArray((Collection) list).toString();
                }
                jSONObject.put("back_up_url", string);
                jSONObject.put("error_code", i5);
                jSONObject.put("error_msg", str3);
                return dj.zb().ycx(str).zb(jSONObject.toString());
            }
        });
    }
}
