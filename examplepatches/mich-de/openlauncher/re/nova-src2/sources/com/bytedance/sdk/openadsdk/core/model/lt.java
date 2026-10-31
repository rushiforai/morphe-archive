package com.bytedance.sdk.openadsdk.core.model;

import com.instabridge.ai.proactive.AiDatabase;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt {

    /* renamed from: ul, reason: collision with root package name */
    private int f25694ul;
    private String ycx = b.f42142b;

    /* renamed from: zb, reason: collision with root package name */
    private String f25695zb = b.f42142b;
    private String sya = b.f42142b;

    /* renamed from: dj, reason: collision with root package name */
    private String f25692dj = b.f42142b;
    private double lud = -1.0d;

    /* renamed from: lt, reason: collision with root package name */
    private int f25693lt = -1;

    public double dj() {
        return this.lud;
    }

    public JSONObject fby() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("app_name", zb());
            jSONObject.put("app_size", lt());
            jSONObject.put("comment_num", lud());
            jSONObject.put("download_url", ycx());
            jSONObject.put("package_name", sya());
            jSONObject.put(AiDatabase.COL_INSIGHT_SCORE, dj());
            jSONObject.put("app_category", ul());
            return jSONObject;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "ev49vA26Zg==", "T+EHpiySRsWKT9RJ", 101);
            com.bytedance.sdk.component.utils.htf.sya(e3.toString(), new Object[0]);
            return jSONObject;
        }
    }

    public int lt() {
        return this.f25694ul;
    }

    public int lud() {
        return this.f25693lt;
    }

    public String sya() {
        return this.sya;
    }

    public String ul() {
        return this.f25692dj;
    }

    public String ycx() {
        return this.ycx;
    }

    public String zb() {
        return this.f25695zb;
    }

    public void dj(String str) {
        this.f25692dj = str;
    }

    public void sya(String str) {
        this.sya = str;
    }

    public void ycx(String str) {
        this.ycx = str;
    }

    public void zb(String str) {
        this.f25695zb = str;
    }

    public void ycx(double d5) {
        if (d5 >= 1.0d && d5 <= 5.0d) {
            this.lud = d5;
        } else {
            this.lud = -1.0d;
        }
    }

    public void zb(int i5) {
        this.f25694ul = i5;
    }

    public void ycx(int i5) {
        if (i5 <= 0) {
            this.f25693lt = -1;
        } else {
            this.f25693lt = i5;
        }
    }
}
