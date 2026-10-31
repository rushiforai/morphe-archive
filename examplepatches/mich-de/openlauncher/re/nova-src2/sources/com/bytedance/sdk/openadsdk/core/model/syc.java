package com.bytedance.sdk.openadsdk.core.model;

import org.json.JSONObject;

/* loaded from: classes2.dex */
public class syc {
    private final int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final int f25746zb;

    public syc(JSONObject jSONObject) {
        this.ycx = jSONObject.optInt("auto_click", 0);
        this.f25746zb = jSONObject.optInt("hidden_bar", 0);
    }

    public int ycx() {
        return this.ycx;
    }

    public boolean zb() {
        return this.f25746zb == 1;
    }

    public static boolean ycx(tn tnVar) {
        if (tnVar == null || !tnVar.wnd() || tnVar.kyd() == null) {
            return false;
        }
        return tnVar.kyd().zb();
    }
}
