package com.bytedance.sdk.openadsdk.dj.lud.zb;

import com.bytedance.sdk.component.utils.htf;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj extends sya {

    /* renamed from: dj, reason: collision with root package name */
    public int f26531dj = 0;
    public int sya;
    public long ycx;

    /* renamed from: zb, reason: collision with root package name */
    public long f26532zb;

    public void ycx(long j11) {
        this.ycx = j11;
    }

    public void zb(long j11) {
        this.f26532zb = j11;
    }

    public void ycx(int i5) {
        this.sya = i5;
    }

    public void zb(int i5) {
        this.f26531dj = i5;
    }

    @Override // com.bytedance.sdk.openadsdk.dj.lud.zb.sya
    public void ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            jSONObject.put("total_duration", this.ycx);
            jSONObject.put("buffers_time", this.f26532zb);
            jSONObject.put("break_reason", this.sya);
            jSONObject.put("video_backup", this.f26531dj);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZPoDucB7lmiY1F01iA", "fesokSGubMaLZ9hZiR0=", "WuopoQyWesiOZdVXiRK0", 45);
            htf.sya("FeedBreakModel", th2.getMessage());
        }
    }
}
