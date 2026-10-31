package com.bytedance.sdk.openadsdk.dj.lud.zb;

import com.bytedance.sdk.component.utils.htf;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ok extends sya {

    /* renamed from: dj, reason: collision with root package name */
    private long f26543dj;
    private boolean lud;
    private long sya;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private long f26544zb;

    public void sya(long j11) {
        this.f26543dj = j11;
    }

    public void ycx(String str) {
        this.ycx = str;
    }

    public void zb(long j11) {
        this.sya = j11;
    }

    public void ycx(long j11) {
        this.f26544zb = j11;
    }

    @Override // com.bytedance.sdk.openadsdk.dj.lud.zb.sya
    public void ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            jSONObject.put("preload_url", this.ycx);
            jSONObject.put("preload_size", this.f26544zb);
            jSONObject.put("load_time", this.sya);
            jSONObject.put("local_cache", this.f26543dj);
            jSONObject.put("use_global_cache", this.lud);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZPoDucB7lmiY1F01iA", "d+EskTW1bcKPecJejxSzO3bhKZAP", "WuopoQyWesiOZdVXiRK0", 65);
            htf.sya("LoadVideoSuccessModel", th2.getMessage());
        }
    }

    public void ycx(boolean z11) {
        this.lud = z11;
    }
}
