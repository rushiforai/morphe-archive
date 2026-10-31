package com.bytedance.sdk.openadsdk.dj.lud.zb;

import com.bytedance.sdk.component.utils.htf;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ry extends sya {
    public long sya;
    public long ycx;

    /* renamed from: zb, reason: collision with root package name */
    public int f26545zb;

    public void ycx(long j11) {
        this.ycx = j11;
    }

    public void zb(long j11) {
        this.sya = j11;
    }

    public void ycx(int i5) {
        this.f26545zb = i5;
    }

    @Override // com.bytedance.sdk.openadsdk.dj.lud.zb.sya
    public void ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            jSONObject.put("buffers_time", this.ycx);
            jSONObject.put("buffers_count", this.f26545zb);
            jSONObject.put("total_duration", this.sya);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZPoDucB7lmiY1F01iA", "a+IsjCGpb8GFWPpSiBSs", "WuopoQyWesiOZdVXiRK0", 39);
            htf.sya("PlayBufferModel", th2.getMessage());
        }
    }
}
