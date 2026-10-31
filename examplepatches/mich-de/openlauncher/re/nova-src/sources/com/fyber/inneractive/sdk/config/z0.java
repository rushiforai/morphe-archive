package com.fyber.inneractive.sdk.config;

import com.fyber.inneractive.sdk.config.enums.Vendor;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class z0 implements com.fyber.inneractive.sdk.util.b1 {

    /* renamed from: a, reason: collision with root package name */
    public Integer f27967a = 50;

    /* renamed from: b, reason: collision with root package name */
    public Integer f27968b = 50;

    /* renamed from: c, reason: collision with root package name */
    public Set f27969c = null;

    @Override // com.fyber.inneractive.sdk.util.b1
    public final JSONObject a() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "pausePct", this.f27967a);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "playPct", this.f27968b);
        JSONArray jSONArray = new JSONArray();
        Set<Vendor> set = this.f27969c;
        if (set != null) {
            for (Vendor vendor : set) {
                if (vendor != null) {
                    jSONArray.put(vendor);
                }
            }
        }
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "vendor", jSONArray);
        return jSONObject;
    }
}
