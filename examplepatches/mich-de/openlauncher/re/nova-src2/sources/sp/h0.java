package sp;

import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class h0 {

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ int f87584e = 0;

    /* renamed from: a, reason: collision with root package name */
    public final g0 f87585a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f87586b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f87587c;

    /* renamed from: d, reason: collision with root package name */
    public final ex.a f87588d;

    static {
        new b50.d(h0.class.getSimpleName());
    }

    public h0(JSONObject jSONObject) {
        this.f87586b = false;
        this.f87587c = false;
        try {
            if (jSONObject.has("admon_batching")) {
                this.f87585a = new g0(jSONObject.getJSONObject("admon_batching"));
            } else {
                this.f87585a = new g0(new JSONObject());
            }
            if (jSONObject.has("set_sdid_enabled")) {
                this.f87586b = jSONObject.getBoolean("set_sdid_enabled");
            }
            this.f87587c = jSONObject.optBoolean("shouldReportErrors", false);
            if (jSONObject.has("resolve")) {
                this.f87588d = new ex.a(jSONObject.getJSONObject("resolve"));
            } else {
                this.f87588d = new ex.a(new JSONObject());
            }
        } catch (Throwable th2) {
            r0.c(th2);
        }
    }

    public static h0 a() {
        return new h0(new JSONObject());
    }

    public final int b() {
        g0 g0Var = this.f87585a;
        return g0Var == null ? a().b() : g0Var.f87579a;
    }

    public final String c() {
        ex.a aVar = this.f87588d;
        return aVar == null ? a().c() : aVar.f53057b;
    }

    public final boolean d() {
        g0 g0Var = this.f87585a;
        return g0Var == null ? a().d() : g0Var.f87581c;
    }

    public final boolean e() {
        g0 g0Var = this.f87585a;
        return g0Var == null ? a().e() : g0Var.f87580b;
    }

    public final JSONObject f() {
        JSONObject jSONObject;
        try {
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("set_sdid_enabled", this.f87586b);
            jSONObject2.put("shouldReportErrors", this.f87587c);
            g0 g0Var = this.f87585a;
            if (g0Var != null) {
                jSONObject2.put("admon_batching", g0Var.a());
            }
            ex.a aVar = this.f87588d;
            if (aVar != null) {
                String str = aVar.f53057b;
                try {
                    jSONObject = new JSONObject();
                    if (!r0.l(str)) {
                        jSONObject.put("sdid", str);
                    }
                } catch (Throwable th2) {
                    r0.c(th2);
                    jSONObject = new JSONObject();
                }
                jSONObject2.put("resolve", jSONObject);
            }
            return jSONObject2;
        } catch (Throwable th3) {
            r0.c(th3);
            return new JSONObject();
        }
    }
}
