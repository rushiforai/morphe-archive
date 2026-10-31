package com.bytedance.sdk.openadsdk.core.model;

import com.tiktok.appevents.edp.TTEDPEventConstants;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class xz {

    /* renamed from: dj, reason: collision with root package name */
    private String f25867dj;

    /* renamed from: lt, reason: collision with root package name */
    private ycx f25868lt;
    private JSONObject lud;
    private String sya;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f25869zb;

    public static class ycx {
        private JSONArray sya;
        private JSONArray ycx;

        /* renamed from: zb, reason: collision with root package name */
        private JSONArray f25870zb;

        public JSONArray sya() {
            return this.sya;
        }

        public JSONArray ycx() {
            return this.ycx;
        }

        public JSONArray zb() {
            return this.f25870zb;
        }

        public void sya(JSONArray jSONArray) {
            this.sya = jSONArray;
        }

        public void ycx(JSONArray jSONArray) {
            this.ycx = jSONArray;
        }

        public void zb(JSONArray jSONArray) {
            this.f25870zb = jSONArray;
        }

        public static ycx ycx(JSONObject jSONObject) {
            if (jSONObject == null) {
                return null;
            }
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("image");
            ycx ycxVar = new ycx();
            ycxVar.ycx(jSONArrayOptJSONArray);
            ycxVar.zb(jSONObject.optJSONArray("fetch"));
            ycxVar.sya(jSONObject.optJSONArray("script"));
            return ycxVar;
        }
    }

    public String dj() {
        return this.f25867dj;
    }

    public ycx lt() {
        return this.f25868lt;
    }

    public JSONObject lud() {
        return this.lud;
    }

    public String sya() {
        return this.sya;
    }

    public String ycx() {
        return this.ycx;
    }

    public String zb() {
        return this.f25869zb;
    }

    public static xz ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        xz xzVar = new xz();
        xzVar.ycx = jSONObject.optString("id");
        xzVar.f25867dj = jSONObject.optString("data");
        xzVar.sya = jSONObject.optString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
        xzVar.f25869zb = jSONObject.optString("md5");
        xzVar.lud = jSONObject.optJSONObject("custom_components");
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("preload");
        if (jSONObjectOptJSONObject != null) {
            xzVar.f25868lt = ycx.ycx(jSONObjectOptJSONObject);
        }
        return xzVar;
    }
}
