package sp;

import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class g0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f87579a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f87580b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f87581c;

    public g0(JSONObject jSONObject) {
        this.f87580b = false;
        this.f87581c = false;
        this.f87579a = 0;
        try {
            this.f87580b = jSONObject.optBoolean("AggregateAdmonEvents", false);
            this.f87581c = jSONObject.optBoolean("debug", false);
            this.f87579a = Math.max(0, jSONObject.optInt("AggregateAdmonMinIntervalSeconds", 0));
        } catch (Throwable th2) {
            int i5 = h0.f87584e;
            r0.c(th2);
        }
    }

    public JSONObject a() {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("AggregateAdmonEvents", this.f87580b);
            jSONObject.put("debug", this.f87581c);
            jSONObject.put("AggregateAdmonMinIntervalSeconds", this.f87579a);
            return jSONObject;
        } catch (Throwable th2) {
            int i5 = h0.f87584e;
            r0.c(th2);
            return new JSONObject();
        }
    }

    public g0(int i5, boolean z11, boolean z12) {
        this.f87579a = i5;
        this.f87581c = z11;
        this.f87580b = z12;
    }
}
