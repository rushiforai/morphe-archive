package com.fyber.inneractive.sdk.config;

import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class w0 implements x0 {

    /* renamed from: a, reason: collision with root package name */
    public String f27943a;

    /* renamed from: b, reason: collision with root package name */
    public String f27944b;

    /* renamed from: c, reason: collision with root package name */
    public q0 f27945c;

    /* renamed from: d, reason: collision with root package name */
    public t0 f27946d;

    /* renamed from: e, reason: collision with root package name */
    public u0 f27947e;

    /* renamed from: f, reason: collision with root package name */
    public y0 f27948f;

    /* renamed from: g, reason: collision with root package name */
    public z0 f27949g;

    public final String toString() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "id", this.f27943a);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "spotId", this.f27944b);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "display", this.f27945c);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "monitor", this.f27946d);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "native", this.f27947e);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "video", this.f27948f);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "viewability", this.f27949g);
        return jSONObject.toString();
    }
}
