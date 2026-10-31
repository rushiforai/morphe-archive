package com.bytedance.sdk.openadsdk.oty.zb;

import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {
    private final float sya;
    private final int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final int f26960zb;

    public ycx(int i5, int i11, float f11) {
        this.ycx = i5;
        this.f26960zb = i11;
        this.sya = f11;
    }

    public static JSONObject ycx(ycx ycxVar) throws Throwable {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("width", ycxVar.ycx);
        jSONObject.put("height", ycxVar.f26960zb);
        jSONObject.put("alpha", ycxVar.sya);
        return jSONObject;
    }
}
