package com.bytedance.sdk.openadsdk.dj.lud.zb;

import com.bykv.vk.openvk.ycx.ycx.ycx.sya.b;
import com.bytedance.sdk.component.utils.htf;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class xkz extends sya {

    /* renamed from: dj, reason: collision with root package name */
    private final int f26558dj;
    private final String lud;
    private final int sya;
    private long ycx;

    /* renamed from: zb, reason: collision with root package name */
    private long f26559zb;

    public xkz(b bVar) {
        this.sya = bVar.f22180a;
        this.f26558dj = bVar.f22181b;
        this.lud = bVar.f22182c;
    }

    public void ycx(long j11) {
        this.ycx = j11;
    }

    public void zb(long j11) {
        this.f26559zb = j11;
    }

    @Override // com.bytedance.sdk.openadsdk.dj.lud.zb.sya
    public void ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            jSONObject.put("buffers_time", this.ycx);
            jSONObject.put("total_duration", this.f26559zb);
            jSONObject.put("error_code", this.sya);
            jSONObject.put("extra_error_code", this.f26558dj);
            jSONObject.put("error_message", this.lud);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZPoDucB7lmiY1F01iA", "a+IsjCaue8iSZ9hZiR0=", "WuopoQyWesiOZdVXiRK0", 49);
            htf.sya("PlayErrorModel", th2.getMessage());
        }
    }
}
