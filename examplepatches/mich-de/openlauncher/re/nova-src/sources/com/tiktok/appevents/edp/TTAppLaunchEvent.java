package com.tiktok.appevents.edp;

import org.json.JSONObject;

/* loaded from: classes4.dex */
public class TTAppLaunchEvent {
    private JSONObject prop;

    /* renamed from: ts, reason: collision with root package name */
    private long f46543ts;

    public TTAppLaunchEvent(JSONObject jSONObject, long j11) {
        this.prop = jSONObject;
        this.f46543ts = j11;
    }

    public JSONObject getProp() {
        return this.prop;
    }

    public long getTs() {
        return this.f46543ts;
    }

    public void setProp(JSONObject jSONObject) {
        this.prop = jSONObject;
    }

    public void setTs(long j11) {
        this.f46543ts = j11;
    }
}
