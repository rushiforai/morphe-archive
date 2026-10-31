package com.fyber.inneractive.sdk.config.remote;

import com.fyber.inneractive.sdk.config.enums.Orientation;
import com.fyber.inneractive.sdk.config.enums.Skip;
import com.fyber.inneractive.sdk.config.enums.TapAction;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public Boolean f27918a;

    /* renamed from: b, reason: collision with root package name */
    public Integer f27919b;

    /* renamed from: c, reason: collision with root package name */
    public Integer f27920c;

    /* renamed from: d, reason: collision with root package name */
    public Skip f27921d;

    /* renamed from: e, reason: collision with root package name */
    public Boolean f27922e;

    /* renamed from: f, reason: collision with root package name */
    public TapAction f27923f;

    /* renamed from: g, reason: collision with root package name */
    public Orientation f27924g;

    /* renamed from: h, reason: collision with root package name */
    public Integer f27925h;

    /* renamed from: i, reason: collision with root package name */
    public Integer f27926i;

    /* renamed from: j, reason: collision with root package name */
    public UnitDisplayType f27927j;

    /* renamed from: k, reason: collision with root package name */
    public final ArrayList f27928k = new ArrayList();

    public static j a(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        j jVar = new j();
        int iOptInt = jSONObject.optInt("maxBitrate", Integer.MIN_VALUE);
        Integer numValueOf = Integer.valueOf(iOptInt);
        if (iOptInt != Integer.MIN_VALUE && iOptInt <= 0) {
            numValueOf = Integer.MIN_VALUE;
        }
        int iOptInt2 = jSONObject.optInt("minBitrate", Integer.MIN_VALUE);
        Integer numValueOf2 = Integer.valueOf(iOptInt2);
        int iOptInt3 = jSONObject.optInt("pivotBitrate", Integer.MIN_VALUE);
        Integer numValueOf3 = Integer.valueOf(iOptInt3);
        int iOptInt4 = jSONObject.optInt("padding", Integer.MIN_VALUE);
        Integer numValueOf4 = Integer.valueOf(iOptInt4);
        if (numValueOf.intValue() == Integer.MIN_VALUE) {
            numValueOf = null;
        }
        jVar.f27919b = numValueOf;
        if (iOptInt2 == Integer.MIN_VALUE) {
            numValueOf2 = null;
        }
        jVar.f27920c = numValueOf2;
        jVar.f27921d = Skip.fromValue(Integer.valueOf(jSONObject.optInt("skip", Integer.MIN_VALUE)));
        jVar.f27922e = jSONObject.has("muted") ? Boolean.valueOf(jSONObject.optBoolean("muted", true)) : null;
        jVar.f27918a = jSONObject.has("autoPlay") ? Boolean.valueOf(jSONObject.optBoolean("autoPlay", true)) : null;
        jVar.f27924g = Orientation.fromValue(jSONObject.optString("orientation"));
        jVar.f27923f = TapAction.fromValue(jSONObject.optString("tap"));
        if (iOptInt3 == Integer.MIN_VALUE) {
            numValueOf3 = null;
        }
        jVar.f27925h = numValueOf3;
        jVar.f27926i = iOptInt4 != Integer.MIN_VALUE ? numValueOf4 : null;
        jVar.f27927j = UnitDisplayType.fromValue(jSONObject.optString("unitDisplayType"));
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("filterApi");
        if (jSONArrayOptJSONArray != null) {
            for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                int iOptInt5 = jSONArrayOptJSONArray.optInt(i5, Integer.MIN_VALUE);
                if (iOptInt5 != Integer.MIN_VALUE) {
                    jVar.f27928k.add(Integer.valueOf(iOptInt5));
                }
            }
        }
        return jVar;
    }
}
