package com.bytedance.sdk.openadsdk.core.model;

import org.json.JSONObject;

/* loaded from: classes2.dex */
public class hf {

    /* renamed from: dj, reason: collision with root package name */
    private String f25643dj = "Next Ad";
    private int sya;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f25644zb;

    public int dj() {
        return this.ycx;
    }

    public String sya() {
        return this.f25643dj;
    }

    public int ycx() {
        return this.sya;
    }

    public int zb() {
        return this.f25644zb;
    }

    public void sya(int i5) {
        this.ycx = i5;
    }

    public void ycx(int i5) {
        this.sya = i5;
    }

    public void zb(int i5) {
        this.f25644zb = i5;
    }

    public void ycx(String str) {
        this.f25643dj = str;
    }

    public static hf ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        hf hfVar = new hf();
        try {
            int iMax = Math.max(jSONObject.optInt("endcard_show_time", 0), 0);
            int iOptInt = jSONObject.optInt("is_allow_pause", 0);
            int iOptInt2 = jSONObject.optInt("landing_type", 0);
            String strOptString = jSONObject.optString("endcard_next_ad_text", "Next Ad");
            hfVar.sya(iMax);
            hfVar.zb(iOptInt);
            hfVar.ycx(strOptString);
            hfVar.ycx(iOptInt2);
            return hfVar;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "dvshgQqdbfSDT9lY", "WPwolBe5RNKMXt58iCKjLVXr", 75);
            return hfVar;
        }
    }
}
