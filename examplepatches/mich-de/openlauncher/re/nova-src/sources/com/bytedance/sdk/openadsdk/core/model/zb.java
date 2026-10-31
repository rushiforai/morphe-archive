package com.bytedance.sdk.openadsdk.core.model;

import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {

    /* renamed from: dj, reason: collision with root package name */
    private String f25879dj;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f25880lt;
    private String lud;
    private String sya;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f25881zb;

    public String dj() {
        return this.lud;
    }

    public boolean lt() {
        return this.f25880lt;
    }

    public String lud() {
        return this.f25879dj;
    }

    public String sya() {
        return this.sya;
    }

    public JSONObject ul() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("privacy_url", this.sya);
            jSONObject.put("privacy_title", this.f25879dj);
            jSONObject.put("text", this.f25881zb);
            jSONObject.put("icon", this.ycx);
            return jSONObject;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "euoBlAG5ZQ==", "T+EHhgyyRsWK", 73);
            return jSONObject;
        }
    }

    public void ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        this.ycx = jSONObject.optString("icon");
        this.f25881zb = jSONObject.optString("text");
        this.sya = jSONObject.optString("privacy_url");
        this.f25879dj = jSONObject.optString("privacy_title");
        this.lud = jSONObject.optString("iab_privacy_bar_text");
    }

    public String zb() {
        return this.f25881zb;
    }

    public String ycx() {
        return this.ycx;
    }

    public void ycx(boolean z11) {
        this.f25880lt = z11;
    }
}
