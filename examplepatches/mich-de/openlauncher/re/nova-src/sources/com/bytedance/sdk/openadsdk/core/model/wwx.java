package com.bytedance.sdk.openadsdk.core.model;

import org.json.JSONObject;

/* loaded from: classes2.dex */
public class wwx {
    private String ycx = "horizontal";

    /* renamed from: zb, reason: collision with root package name */
    private int f25866zb = 1;
    private int sya = 1;

    /* renamed from: dj, reason: collision with root package name */
    private int f25861dj = 0;
    private int lud = 0;

    /* renamed from: lt, reason: collision with root package name */
    private int f25864lt = 0;

    /* renamed from: ul, reason: collision with root package name */
    private int f25865ul = 0;
    private int fby = 5000;

    /* renamed from: jw, reason: collision with root package name */
    private int f25863jw = 500;

    /* renamed from: jc, reason: collision with root package name */
    private int f25862jc = 0;

    public int dj() {
        return this.f25861dj;
    }

    public int fby() {
        return this.fby;
    }

    public int jc() {
        return this.f25862jc;
    }

    public int jw() {
        return this.f25863jw;
    }

    public int lt() {
        return this.f25864lt;
    }

    public int lud() {
        return this.lud;
    }

    public int sya() {
        return this.sya;
    }

    public int ul() {
        return this.f25865ul;
    }

    public String ycx() {
        return this.ycx;
    }

    public int zb() {
        return this.f25866zb;
    }

    public static wwx ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return new wwx();
        }
        wwx wwxVar = new wwx();
        wwxVar.ycx = jSONObject.optString("direction", "horizontal");
        wwxVar.f25866zb = jSONObject.optInt("auto_loop", 1);
        wwxVar.sya = jSONObject.optInt("allow_manual_loop", 1);
        wwxVar.f25861dj = jSONObject.optInt("unlimited_loop", 0);
        wwxVar.lud = jSONObject.optInt("left_margin", 0);
        wwxVar.f25864lt = jSONObject.optInt("right_margin", 0);
        wwxVar.f25865ul = jSONObject.optInt("ad_margin", 0);
        wwxVar.fby = jSONObject.optInt("loop_interval_time", 5000);
        wwxVar.f25863jw = jSONObject.optInt("flip_speed", 500);
        wwxVar.f25862jc = jSONObject.optInt("stop_auto_loop", 0);
        return wwxVar;
    }
}
