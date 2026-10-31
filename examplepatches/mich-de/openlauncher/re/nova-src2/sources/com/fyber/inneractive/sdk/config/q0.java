package com.fyber.inneractive.sdk.config;

import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class q0 implements com.fyber.inneractive.sdk.util.b1 {

    /* renamed from: a, reason: collision with root package name */
    public Integer f27881a = null;

    /* renamed from: b, reason: collision with root package name */
    public UnitDisplayType f27882b;

    /* renamed from: c, reason: collision with root package name */
    public Boolean f27883c;

    /* renamed from: d, reason: collision with root package name */
    public Integer f27884d;

    @Override // com.fyber.inneractive.sdk.util.b1
    public final JSONObject a() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "refresh", this.f27881a);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "unitDisplayType", this.f27882b);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39150d, this.f27883c);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "hideDelay", this.f27884d);
        return jSONObject;
    }
}
