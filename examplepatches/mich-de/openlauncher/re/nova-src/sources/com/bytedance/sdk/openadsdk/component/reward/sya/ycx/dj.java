package com.bytedance.sdk.openadsdk.component.reward.sya.ycx;

import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj {

    /* renamed from: dj, reason: collision with root package name */
    private float f24908dj;

    /* renamed from: ea, reason: collision with root package name */
    private int f24909ea;
    private String fby;

    /* renamed from: jc, reason: collision with root package name */
    private String f24910jc;

    /* renamed from: jw, reason: collision with root package name */
    private JSONObject f24911jw;

    /* renamed from: lt, reason: collision with root package name */
    private float f24912lt;
    private float lud;
    private String sya;

    /* renamed from: ul, reason: collision with root package name */
    private float f24913ul;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private boolean f24914zb = true;

    public boolean dj() {
        return this.f24914zb;
    }

    public float fby() {
        return this.f24912lt;
    }

    public String jc() {
        return this.fby;
    }

    public float jw() {
        return this.f24913ul;
    }

    public float lt() {
        return this.f24908dj;
    }

    public String lud() {
        return this.sya;
    }

    public int sya() {
        return this.ycx;
    }

    public float ul() {
        return this.lud;
    }

    public int ycx() {
        return this.f24909ea;
    }

    public String zb() {
        return this.f24910jc;
    }

    public void dj(float f11) {
        this.f24913ul = f11;
    }

    public void sya(float f11) {
        this.f24912lt = f11;
    }

    public void ycx(int i5) {
        this.f24909ea = i5;
    }

    public void zb(int i5) {
        this.ycx = i5;
    }

    public void sya(String str) {
        this.fby = str;
    }

    public void ycx(String str) {
        this.f24910jc = str;
    }

    public void zb(String str) {
        this.sya = str;
    }

    public void ycx(boolean z11) {
        this.f24914zb = z11;
    }

    public void zb(float f11) {
        this.lud = f11;
    }

    public static dj zb(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        dj djVar = new dj();
        djVar.zb(jSONObject.optString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL));
        djVar.ycx(jSONObject.optInt("materialPosition"));
        djVar.zb(jSONObject.optInt("showType"));
        djVar.ycx(jSONObject.optBoolean("lpClickable", true));
        float fZb = dc.zb(pmi.ycx(), (float) jSONObject.optDouble("x"));
        float fZb2 = dc.zb(pmi.ycx(), (float) jSONObject.optDouble("y"));
        float fZb3 = dc.zb(pmi.ycx(), (float) jSONObject.optDouble("width"));
        float fZb4 = dc.zb(pmi.ycx(), (float) jSONObject.optDouble("height"));
        djVar.ycx(fZb);
        djVar.zb(fZb2);
        djVar.sya(fZb3);
        djVar.dj(fZb4);
        djVar.sya(jSONObject.optString("tag"));
        djVar.ycx(jSONObject.optString("sessionID"));
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("materialDict");
        if (jSONObjectOptJSONObject != null) {
            djVar.ycx(jSONObjectOptJSONObject);
        }
        return djVar;
    }

    public void ycx(float f11) {
        this.f24908dj = f11;
    }

    public void ycx(JSONObject jSONObject) {
        this.f24911jw = jSONObject;
    }

    public boolean ycx(float f11, float f12) {
        if (f11 < lt()) {
            return false;
        }
        if (f11 > fby() + lt() || f12 < ul()) {
            return false;
        }
        return f12 <= jw() + ul();
    }
}
