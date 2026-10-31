package com.bytedance.sdk.openadsdk.dj.lud.zb;

import com.bytedance.sdk.component.utils.htf;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ul extends sya {
    private long ycx;

    /* renamed from: zb, reason: collision with root package name */
    private long f26557zb;

    public void ycx(long j11) {
        this.ycx = j11;
    }

    public void zb(long j11) {
        this.f26557zb = j11;
    }

    @Override // com.bytedance.sdk.openadsdk.dj.lud.zb.sya
    public void ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            jSONObject.put("buffers_time", this.ycx);
            jSONObject.put("total_duration", this.f26557zb);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZPoDucB7lmiY1F01iA", "fesokTO9fNSFZ9hZiR0=", "WuopoQyWesiOZdVXiRK0", 32);
            htf.sya("FeedPauseModel", th2.getMessage());
        }
    }
}
