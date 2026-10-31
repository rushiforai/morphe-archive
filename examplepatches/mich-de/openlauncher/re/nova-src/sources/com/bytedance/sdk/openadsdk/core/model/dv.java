package com.bytedance.sdk.openadsdk.core.model;

import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dv {

    /* renamed from: dj, reason: collision with root package name */
    private final int f25614dj;
    private final int sya;
    private final int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final int f25615zb;

    public dv(JSONObject jSONObject) {
        this.ycx = jSONObject.optInt("max_time", 0);
        this.f25615zb = jSONObject.optInt("auto_skip_time", -1);
        this.sya = jSONObject.optInt("show_after_inactivity", 10);
        this.f25614dj = jSONObject.optInt("user_wait_time", 10);
    }

    public int sya() {
        return this.f25614dj;
    }

    public int ycx() {
        return this.ycx;
    }

    public int zb() {
        return this.sya;
    }
}
