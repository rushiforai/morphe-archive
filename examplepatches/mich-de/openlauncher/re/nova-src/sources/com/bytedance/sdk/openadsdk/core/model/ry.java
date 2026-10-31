package com.bytedance.sdk.openadsdk.core.model;

import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ry {
    private int sya;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f25741zb;

    public JSONObject dj() throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("u", this.ycx);
            jSONObject.put("ft", this.sya);
            jSONObject.put("fu", this.f25741zb);
            return jSONObject;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "f+sohS+1Z8w=", "T+EHpiyS", 47);
            return null;
        }
    }

    public int sya() {
        return this.sya;
    }

    public String ycx() {
        return this.ycx;
    }

    public String zb() {
        return this.f25741zb;
    }

    public void ycx(String str) {
        this.ycx = str;
    }

    public void zb(String str) {
        this.f25741zb = str;
    }

    public void ycx(int i5) {
        this.sya = i5;
    }
}
