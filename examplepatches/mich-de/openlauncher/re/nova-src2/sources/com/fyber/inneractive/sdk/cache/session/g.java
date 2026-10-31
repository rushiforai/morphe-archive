package com.fyber.inneractive.sdk.cache.session;

import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public int f27691a;

    /* renamed from: b, reason: collision with root package name */
    public int f27692b;

    /* renamed from: c, reason: collision with root package name */
    public int f27693c;

    /* renamed from: d, reason: collision with root package name */
    public final long f27694d;

    public g(int i5, int i11, int i12, long j11) {
        this.f27694d = j11;
        this.f27691a = i5;
        this.f27692b = i11;
        this.f27693c = i12;
    }

    public final JSONObject a(boolean z11, boolean z12) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        if (z11) {
            try {
                jSONObject.put("time", this.f27694d);
            } catch (JSONException unused) {
            }
        }
        jSONObject.put("imp", this.f27691a);
        if (z12) {
            jSONObject.put("com", this.f27693c);
        }
        jSONObject.put("cli", this.f27692b);
        return jSONObject;
    }

    public static g a(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        long jOptLong = jSONObject.optLong("time");
        int iOptInt = jSONObject.optInt("cli", -1);
        int iOptInt2 = jSONObject.optInt("imp", -1);
        int iOptInt3 = jSONObject.optInt("com", -1);
        if (jOptLong == 0 || iOptInt < 0 || iOptInt2 < 0 || iOptInt3 < 0) {
            return null;
        }
        return new g(iOptInt2, iOptInt, iOptInt3, jOptLong);
    }
}
