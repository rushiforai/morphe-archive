package com.bytedance.adsdk.ycx;

import com.bytedance.adsdk.ugeno.dj.ycx;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj implements com.bytedance.adsdk.ugeno.dj.ycx {

    public static class ycx implements ycx.InterfaceC0014ycx {
        private com.bytedance.adsdk.ycx.zb.ycx ycx;

        /* renamed from: zb, reason: collision with root package name */
        private String f22795zb;

        private ycx(String str) {
            this.f22795zb = str;
            this.ycx = com.bytedance.adsdk.ycx.zb.ycx.ycx(str);
        }

        public static ycx ycx(String str) {
            return new ycx(str);
        }

        @Override // com.bytedance.adsdk.ugeno.dj.ycx.InterfaceC0014ycx
        public Object ycx(JSONObject jSONObject) {
            com.bytedance.adsdk.ycx.zb.ycx ycxVar = this.ycx;
            if (ycxVar == null) {
                return this.f22795zb;
            }
            Object objYcx = ycxVar.ycx(jSONObject);
            if (objYcx instanceof String) {
                return objYcx;
            }
            if (objYcx instanceof com.bytedance.adsdk.ycx.zb.ycx.ycx) {
                return String.valueOf(wwx.ycx((com.bytedance.adsdk.ycx.zb.ycx.ycx) objYcx));
            }
            if (objYcx == null || !objYcx.getClass().isArray()) {
                return String.valueOf(objYcx);
            }
            try {
                return new JSONArray(objYcx).toString();
            } catch (JSONException unused) {
                return String.valueOf(objYcx);
            }
        }
    }

    @Override // com.bytedance.adsdk.ugeno.dj.ycx
    public ycx.InterfaceC0014ycx ycx(String str) {
        return ycx.ycx(str);
    }
}
