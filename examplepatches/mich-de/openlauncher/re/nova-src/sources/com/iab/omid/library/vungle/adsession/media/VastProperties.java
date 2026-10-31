package com.iab.omid.library.vungle.adsession.media;

import com.iab.omid.library.vungle.utils.d;
import com.iab.omid.library.vungle.utils.g;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class VastProperties {

    /* renamed from: a, reason: collision with root package name */
    private final boolean f35156a;

    /* renamed from: b, reason: collision with root package name */
    private final Float f35157b;

    /* renamed from: c, reason: collision with root package name */
    private final boolean f35158c;

    /* renamed from: d, reason: collision with root package name */
    private final Position f35159d;

    private VastProperties(boolean z11, Float f11, boolean z12, Position position) {
        this.f35156a = z11;
        this.f35157b = f11;
        this.f35158c = z12;
        this.f35159d = position;
    }

    public static VastProperties createVastPropertiesForNonSkippableMedia(boolean z11, Position position) {
        g.a(position, "Position is null");
        return new VastProperties(false, null, z11, position);
    }

    public static VastProperties createVastPropertiesForSkippableMedia(float f11, boolean z11, Position position) {
        g.a(position, "Position is null");
        return new VastProperties(true, Float.valueOf(f11), z11, position);
    }

    public JSONObject a() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("skippable", this.f35156a);
            if (this.f35156a) {
                jSONObject.put("skipOffset", this.f35157b);
            }
            jSONObject.put("autoPlay", this.f35158c);
            jSONObject.put("position", this.f35159d);
            return jSONObject;
        } catch (JSONException e3) {
            d.a("VastProperties: JSON error", e3);
            return jSONObject;
        }
    }

    public Position getPosition() {
        return this.f35159d;
    }

    public Float getSkipOffset() {
        return this.f35157b;
    }

    public boolean isAutoPlay() {
        return this.f35158c;
    }

    public boolean isSkippable() {
        return this.f35156a;
    }
}
