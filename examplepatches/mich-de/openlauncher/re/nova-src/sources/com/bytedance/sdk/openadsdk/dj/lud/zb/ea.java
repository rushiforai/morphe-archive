package com.bytedance.sdk.openadsdk.dj.lud.zb;

import com.bytedance.sdk.component.utils.htf;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ea extends sya {
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final long f26533zb;

    public ea(String str, long j11) {
        this.ycx = str;
        this.f26533zb = j11;
    }

    @Override // com.bytedance.sdk.openadsdk.dj.lud.zb.sya
    public void ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            jSONObject.put("preload_url", this.ycx);
            jSONObject.put("preload_size", this.f26533zb);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZPoDucB7lmiY1F01iA", "d+EskTW1bcKPecNcngWNJ1/rIQ==", "WuopoQyWesiOZdVXiRK0", 29);
            htf.sya("LoadVideoStartModel", th2.getMessage());
        }
    }
}
