package com.apm.insight.runtime;

import java.util.concurrent.ConcurrentLinkedQueue;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class a {
    static {
        new ConcurrentLinkedQueue();
    }

    public static boolean a(Object obj) {
        String strB = com.apm.insight.entity.b.b(obj);
        if (strB != null) {
            return d.a(strB);
        }
        return false;
    }

    public static boolean b(Object obj) {
        d dVarC;
        String strB = com.apm.insight.entity.b.b(obj);
        if (strB == null || (dVarC = d.c(strB)) == null) {
            return false;
        }
        return dVarC.a();
    }

    public static boolean c() {
        return a("custom_event_settings", "npth_simple_setting", "disable_looper_monitor") == 1;
    }

    public static boolean d() {
        return a("custom_event_settings", "npth_simple_setting", "enable_all_thread_stack_native") == 1;
    }

    public static boolean e() {
        return a("custom_event_settings", "npth_simple_setting", "anr_with_traces_txt") == 1;
    }

    public static boolean f() {
        return a("custom_event_settings", "npth_simple_setting", "upload_crash_crash") == 1;
    }

    public static boolean g() {
        return a("custom_event_settings", "npth_simple_setting", "force_apm_crash") == 1;
    }

    public static boolean h() {
        return a("custom_event_settings", "npth_simple_setting", "enable_anr_all_process_trace") == 1;
    }

    private static JSONObject i() {
        return d.b(com.apm.insight.e.a().e());
    }

    public static boolean c(String str) {
        if (!d.a(str)) {
            com.apm.insight.k.a.b();
        }
        return d.f(str);
    }

    public static void a(JSONArray jSONArray, boolean z11) {
        if (jSONArray == null) {
            return;
        }
        com.apm.insight.a.a("apmconfig", "fromnet " + z11 + " : " + jSONArray);
        if (z11) {
            com.apm.insight.k.j.f();
        }
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            try {
                JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                String next = jSONObjectOptJSONObject.keys().next();
                JSONObject jSONObjectOptJSONObject2 = jSONObjectOptJSONObject.optJSONObject(next);
                com.apm.insight.a.a((Object) ("update config " + next + " : " + jSONObjectOptJSONObject2));
                d.a(next, jSONObjectOptJSONObject2);
                if (z11) {
                    com.apm.insight.k.j.a(next);
                }
            } catch (Throwable unused) {
            }
        }
        k.a(a(jSONArray, String.valueOf(com.apm.insight.e.a().e())));
        if (z11) {
            com.apm.insight.k.j.a(jSONArray);
        }
    }

    public static JSONArray b() {
        String[] strArr = {"custom_event_settings", "npth_simple_setting", "max_utm_thread_ignore"};
        JSONObject jSONObjectB = com.apm.insight.a.b(i(), strArr);
        if (jSONObjectB == null) {
            return null;
        }
        JSONArray jSONArrayOptJSONArray = jSONObjectB.optJSONArray(strArr[2]);
        com.apm.insight.a.a("ApmConfig", "normal get configArray: " + strArr[2] + " : " + jSONArrayOptJSONArray);
        return jSONArrayOptJSONArray;
    }

    public static boolean b(String str) {
        if (!d.a(str)) {
            com.apm.insight.k.a.b();
        }
        return d.g(str);
    }

    private static JSONObject a(JSONArray jSONArray, String str) {
        if (jSONArray != null && jSONArray.length() != 0) {
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5).optJSONObject(str);
                if (jSONObjectOptJSONObject != null) {
                    return jSONObjectOptJSONObject;
                }
            }
        }
        return null;
    }

    public static boolean a() {
        return l.e();
    }

    public static String a(JSONObject jSONObject) {
        JSONObject jSONObjectOptJSONObject;
        if (jSONObject == null || (jSONObjectOptJSONObject = jSONObject.optJSONObject("exception_modules")) == null) {
            return null;
        }
        return jSONObjectOptJSONObject.optString("npth");
    }

    public static int a(String... strArr) {
        return com.apm.insight.a.a(i(), -1, strArr);
    }

    public static int a(int i5, String... strArr) {
        return com.apm.insight.a.a(i(), i5, strArr);
    }

    public static boolean a(String str) {
        if (!d.a(str)) {
            com.apm.insight.k.a.b();
        }
        return d.e(str);
    }
}
