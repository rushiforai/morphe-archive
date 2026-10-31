package com.bytedance.sdk.openadsdk.dy.zb;

import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj {

    public static class ycx {
        public final String ycx;

        /* renamed from: zb, reason: collision with root package name */
        public final JSONObject f26828zb;

        public ycx(String str, JSONObject jSONObject) throws JSONException {
            this.ycx = str;
            this.f26828zb = jSONObject;
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("device_info");
            if (jSONObjectOptJSONObject != null) {
                try {
                    jSONObjectOptJSONObject.put("gaid", com.bytedance.sdk.openadsdk.thx.ycx.zb.ycx.ycx().zb());
                    jSONObject.put("device_info", jSONObjectOptJSONObject);
                } catch (JSONException unused) {
                }
            }
        }
    }

    public static sya ycx() {
        return lud.ycx();
    }
}
