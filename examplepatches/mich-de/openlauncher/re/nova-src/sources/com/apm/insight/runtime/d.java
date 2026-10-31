package com.apm.insight.runtime;

import java.util.HashMap;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    private static HashMap<String, d> f21874a = new HashMap<>();

    /* renamed from: b, reason: collision with root package name */
    private JSONObject f21875b = null;

    /* renamed from: c, reason: collision with root package name */
    private JSONObject f21876c = null;

    /* renamed from: d, reason: collision with root package name */
    private boolean f21877d = false;

    /* renamed from: e, reason: collision with root package name */
    private String f21878e;

    private d(JSONObject jSONObject, String str) {
        this.f21878e = str;
        a(jSONObject);
        f21874a.put(this.f21878e, this);
        com.apm.insight.a.a((Object) "after update aid ".concat(String.valueOf(str)));
    }

    private void a(JSONObject jSONObject) {
        JSONObject jSONObjectOptJSONObject;
        this.f21875b = jSONObject;
        if (jSONObject == null || (jSONObjectOptJSONObject = jSONObject.optJSONObject("error_module")) == null) {
            return;
        }
        this.f21877d = jSONObjectOptJSONObject.optInt("switcher") == 1 && jSONObjectOptJSONObject.optInt("err_sampling_rate") == 1;
    }

    public static JSONObject b(String str) {
        d dVar = f21874a.get(str);
        if (dVar != null) {
            return dVar.f21875b;
        }
        return null;
    }

    public static d c(String str) {
        return f21874a.get(str);
    }

    public static long d(String str) {
        d dVar = f21874a.get(str);
        if (dVar == null) {
            return 3600000L;
        }
        try {
            return Long.decode(com.apm.insight.a.a(dVar.f21875b, "over_all", "get_settings_interval")).longValue() * 1000;
        } catch (Throwable unused) {
            return 3600000L;
        }
    }

    public static boolean e(String str) {
        JSONObject jSONObject;
        d dVar = f21874a.get(str);
        return (dVar == null || (jSONObject = dVar.f21875b) == null || 1 != com.apm.insight.a.a(jSONObject, 0, "crash_module", "switcher")) ? false : true;
    }

    public static boolean f(String str) {
        JSONObject jSONObject;
        d dVar = f21874a.get(str);
        return (dVar == null || (jSONObject = dVar.f21875b) == null || 1 != com.apm.insight.a.a(jSONObject, 0, "crash_module", "switcher")) ? false : true;
    }

    public static boolean g(String str) {
        JSONObject jSONObject;
        d dVar = f21874a.get(str);
        return (dVar == null || (jSONObject = dVar.f21875b) == null || 1 != com.apm.insight.a.a(jSONObject, 0, "crash_module", "switcher")) ? false : true;
    }

    public final boolean a() {
        if (this.f21875b == null) {
            return false;
        }
        return this.f21877d;
    }

    public static boolean a(String str) {
        return f21874a.get(str) != null;
    }

    public static void a(String str, JSONObject jSONObject) {
        d dVar = f21874a.get(str);
        if (dVar != null) {
            dVar.a(jSONObject);
        } else {
            new d(jSONObject, str);
        }
    }
}
