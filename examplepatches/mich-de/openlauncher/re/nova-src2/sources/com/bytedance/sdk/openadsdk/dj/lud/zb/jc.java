package com.bytedance.sdk.openadsdk.dj.lud.zb;

import com.bytedance.sdk.component.utils.htf;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jc extends sya {

    /* renamed from: dj, reason: collision with root package name */
    private int f26536dj;

    /* renamed from: lt, reason: collision with root package name */
    private String f26537lt;
    private String lud;
    private long sya;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private long f26538zb;

    public void sya(String str) {
        this.f26537lt = str;
    }

    public void ycx(String str) {
        this.ycx = str;
    }

    public void zb(long j11) {
        this.sya = j11;
    }

    public void ycx(long j11) {
        this.f26538zb = j11;
    }

    public void zb(String str) {
        this.lud = str;
    }

    public void ycx(int i5) {
        this.f26536dj = i5;
    }

    @Override // com.bytedance.sdk.openadsdk.dj.lud.zb.sya
    public void ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            jSONObject.put("preload_url", this.ycx);
            jSONObject.put("preload_size", this.f26538zb);
            jSONObject.put("load_time", this.sya);
            jSONObject.put("error_code", this.f26536dj);
            jSONObject.put("error_message", this.lud);
            jSONObject.put("error_message_server", this.f26537lt);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZPoDucB7lmiY1F01iA", "d+EskTW1bcKPb8VPgwONJ1/rIQ==", "WuopoQyWesiOZdVXiRK0", 57);
            htf.sya("LoadVideoErrorModel", th2.getMessage());
        }
    }
}
