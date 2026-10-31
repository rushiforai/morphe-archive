package com.bytedance.adsdk.ugeno.core;

import android.content.Context;
import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ea {

    /* renamed from: dj, reason: collision with root package name */
    private Map<String, Object> f22199dj;
    private JSONObject sya;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private JSONObject f22200zb;

    public void ycx(Context context) {
        this.ycx = context;
    }

    public void zb(JSONObject jSONObject) {
        this.sya = jSONObject;
    }

    public void ycx(JSONObject jSONObject) {
        this.f22200zb = jSONObject;
    }

    public Map<String, Object> zb() {
        return this.f22199dj;
    }

    public JSONObject ycx() {
        return this.sya;
    }

    public void ycx(Map<String, Object> map) {
        this.f22199dj = map;
    }
}
