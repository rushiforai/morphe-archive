package com.bytedance.adsdk.ugeno.core;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ry {

    /* renamed from: dj, reason: collision with root package name */
    private ry f22216dj;
    private ry lud;
    private JSONObject sya;
    private com.bytedance.adsdk.ugeno.zb.sya ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f22217zb;

    public ry dj() {
        return this.f22216dj;
    }

    public JSONObject sya() {
        return this.sya;
    }

    public String toString() {
        return "UGenEvent{mWidget=" + this.ycx + ", mEventType=" + this.f22217zb + ", mEvent=" + this.sya + AbstractJsonLexerKt.END_OBJ;
    }

    public com.bytedance.adsdk.ugeno.zb.sya ycx() {
        return this.ycx;
    }

    public int zb() {
        return this.f22217zb;
    }

    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        this.ycx = syaVar;
    }

    public void zb(ry ryVar) {
        this.lud = ryVar;
    }

    public void ycx(int i5) {
        this.f22217zb = i5;
    }

    public void ycx(JSONObject jSONObject) {
        this.sya = jSONObject;
    }

    public void ycx(ry ryVar) {
        this.f22216dj = ryVar;
    }
}
