package com.bytedance.sdk.openadsdk.uh.sya;

import com.bytedance.sdk.openadsdk.oty.sya;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: dj, reason: collision with root package name */
    public boolean f27090dj;

    /* renamed from: lt, reason: collision with root package name */
    public long f27091lt;
    public long lud;
    public boolean sya;

    /* renamed from: ul, reason: collision with root package name */
    public long f27092ul;
    public boolean ycx;

    /* renamed from: zb, reason: collision with root package name */
    public boolean f27093zb;

    /* renamed from: com.bytedance.sdk.openadsdk.uh.sya.ycx$ycx, reason: collision with other inner class name */
    public interface InterfaceC0110ycx {
        ycx lt();
    }

    public ycx dj(boolean z11) {
        this.sya = z11;
        return this;
    }

    public ycx sya(boolean z11) {
        this.f27093zb = z11;
        return this;
    }

    public ycx ycx(boolean z11) {
        this.f27090dj = z11;
        return this;
    }

    public ycx zb(boolean z11) {
        this.ycx = z11;
        return this;
    }

    public ycx sya(long j11) {
        this.f27092ul = j11;
        return this;
    }

    public ycx ycx(long j11) {
        this.lud = j11;
        return this;
    }

    public ycx zb(long j11) {
        this.f27091lt = j11;
        return this;
    }

    public JSONObject ycx() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("isCompleted", this.ycx);
            jSONObject.put("isFromVideoDetailPage", this.f27093zb);
            jSONObject.put("isFromDetailPage", this.sya);
            jSONObject.put("duration", this.lud);
            jSONObject.put("totalPlayDuration", this.f27091lt);
            jSONObject.put("currentPlayPosition", this.f27092ul);
            jSONObject.put("isAutoPlay", this.f27090dj);
            return jSONObject;
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+aTbFmw4VG", "becpkAyfZsmUWNhRgBSyDFr6LLgMuGzL", "T+EHhgyyRsWK", 71);
            return jSONObject;
        }
    }

    public static ycx ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        ycx ycxVar = new ycx();
        ycxVar.zb(jSONObject.optBoolean("isCompleted"));
        ycxVar.sya(jSONObject.optBoolean("isFromVideoDetailPage"));
        ycxVar.dj(jSONObject.optBoolean("isFromDetailPage"));
        ycxVar.ycx(jSONObject.optLong("duration"));
        ycxVar.zb(jSONObject.optLong("totalPlayDuration"));
        ycxVar.sya(jSONObject.optLong("currentPlayPosition"));
        ycxVar.ycx(jSONObject.optBoolean("isAutoPlay"));
        return ycxVar;
    }
}
