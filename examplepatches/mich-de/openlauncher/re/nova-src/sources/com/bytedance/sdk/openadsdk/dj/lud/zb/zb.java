package com.bytedance.sdk.openadsdk.dj.lud.zb;

import com.bytedance.sdk.component.utils.htf;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb extends sya {

    /* renamed from: dj, reason: collision with root package name */
    private int f26563dj;
    private int sya;
    private long ycx;

    /* renamed from: zb, reason: collision with root package name */
    private long f26564zb;

    public void ycx(long j11) {
        this.ycx = j11;
    }

    public void zb(long j11) {
        this.f26564zb = j11;
    }

    public void ycx(int i5) {
        this.sya = i5;
    }

    public void zb(int i5) {
        this.f26563dj = i5;
    }

    @Override // com.bytedance.sdk.openadsdk.dj.lud.zb.sya
    public void ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            jSONObject.put("buffers_time", this.ycx);
            jSONObject.put("total_duration", this.f26564zb);
            jSONObject.put("vbtt_skip_type", this.sya);
            jSONObject.put("skip_reason", this.f26563dj);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZPoDucB7lmiY1F01iA", "fuAplgKubfSLQ8dwgxWlJA==", "WuopoQyWesiOZdVXiRK0", 46);
            htf.sya("EndcardSkipModel", th2.getMessage());
        }
    }
}
