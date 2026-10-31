package com.fyber.inneractive.sdk.config;

import com.fyber.inneractive.sdk.config.enums.Orientation;
import com.fyber.inneractive.sdk.config.enums.Skip;
import com.fyber.inneractive.sdk.config.enums.TapAction;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class y0 implements com.fyber.inneractive.sdk.util.b1 {

    /* renamed from: a, reason: collision with root package name */
    public Boolean f27954a;

    /* renamed from: b, reason: collision with root package name */
    public Integer f27955b;

    /* renamed from: c, reason: collision with root package name */
    public Integer f27956c;

    /* renamed from: d, reason: collision with root package name */
    public Boolean f27957d;

    /* renamed from: e, reason: collision with root package name */
    public Orientation f27958e;

    /* renamed from: f, reason: collision with root package name */
    public Integer f27959f;

    /* renamed from: g, reason: collision with root package name */
    public Integer f27960g;

    /* renamed from: h, reason: collision with root package name */
    public Skip f27961h;

    /* renamed from: i, reason: collision with root package name */
    public TapAction f27962i;

    /* renamed from: j, reason: collision with root package name */
    public UnitDisplayType f27963j;

    /* renamed from: k, reason: collision with root package name */
    public List f27964k;

    public y0() {
        Boolean bool = Boolean.TRUE;
        this.f27954a = bool;
        this.f27955b = 5000;
        this.f27956c = 0;
        this.f27957d = bool;
        this.f27959f = 0;
        this.f27960g = 2048;
        this.f27961h = Skip.fromValue(0);
        this.f27964k = new ArrayList();
    }

    @Override // com.fyber.inneractive.sdk.util.b1
    public final JSONObject a() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "autoPlay", this.f27954a);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "maxBitrate", this.f27955b);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "minBitrate", this.f27956c);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "muted", this.f27957d);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "orientation", this.f27958e);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "padding", this.f27959f);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "pivotBitrate", this.f27960g);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "skip", this.f27961h);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "tapAction", this.f27962i);
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "unitDisplayType", this.f27963j);
        JSONArray jSONArray = new JSONArray();
        List<Integer> list = this.f27964k;
        if (list != null) {
            for (Integer num : list) {
                if (num != null) {
                    jSONArray.put(num);
                }
            }
        }
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "filterApi", jSONArray);
        return jSONObject;
    }
}
