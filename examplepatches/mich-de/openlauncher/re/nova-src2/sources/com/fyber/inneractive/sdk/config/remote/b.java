package com.fyber.inneractive.sdk.config.remote;

import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public UnitDisplayType f27896a;

    /* renamed from: b, reason: collision with root package name */
    public Boolean f27897b;

    /* renamed from: c, reason: collision with root package name */
    public Integer f27898c;

    /* renamed from: d, reason: collision with root package name */
    public Integer f27899d;

    public static b a(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        b bVar = new b();
        int iOptInt = jSONObject.optInt("hide", Integer.MIN_VALUE);
        Integer numValueOf = Integer.valueOf(iOptInt);
        int iOptInt2 = jSONObject.optInt("refresh", Integer.MIN_VALUE);
        Integer numValueOf2 = Integer.valueOf(iOptInt2);
        bVar.f27896a = UnitDisplayType.fromValue(jSONObject.optString("unitDisplayType"));
        bVar.f27897b = jSONObject.has(n.f39150d) ? Boolean.valueOf(jSONObject.optBoolean(n.f39150d, true)) : null;
        if (iOptInt == Integer.MIN_VALUE) {
            numValueOf = null;
        }
        bVar.f27899d = numValueOf;
        bVar.f27898c = iOptInt2 != Integer.MIN_VALUE ? numValueOf2 : null;
        return bVar;
    }
}
