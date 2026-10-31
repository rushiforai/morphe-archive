package com.apm.insight.runtime;

import android.text.TextUtils;
import java.io.File;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    private static JSONObject f21897a = new JSONObject();

    public static void a(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            String strA = a.a(jSONObject);
            File file = new File(com.apm.insight.l.j.j(com.apm.insight.e.g()), "apminsight/configCrash/configNative");
            if (strA == null) {
                f21897a = new JSONObject();
                return;
            }
            JSONObject jSONObject2 = new JSONObject(strA);
            f21897a = jSONObject2;
            com.apm.insight.l.f.a(file, b(jSONObject2));
        } catch (JSONException unused) {
        } catch (Throwable th2) {
            com.apm.insight.c.a();
            j.a(th2, "NPTH_CATCH");
        }
    }

    private static JSONObject b(JSONObject jSONObject) throws JSONException {
        Iterator<String> itKeys = jSONObject.keys();
        e eVar = new e();
        JSONObject jSONObject2 = new JSONObject();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            if (!"configType".equals(next)) {
                JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject(next);
                if (jSONObjectOptJSONObject == null) {
                    com.apm.insight.c.a();
                    j.a(new IllegalArgumentException("err config with key: ".concat(String.valueOf(next))), "NPTH_CATCH");
                } else if (a(jSONObjectOptJSONObject.optJSONArray("disable"), eVar)) {
                    com.apm.insight.a.a((Object) "match diable ".concat(String.valueOf(next)));
                } else {
                    JSONArray jSONArrayB = b(jSONObjectOptJSONObject.optJSONArray("enable"), eVar);
                    if (com.apm.insight.a.a(jSONArrayB)) {
                        com.apm.insight.a.a((Object) "not match ".concat(String.valueOf(next)));
                    } else {
                        try {
                            jSONObject2.put(next, new JSONObject().put("enable", jSONArrayB));
                        } catch (JSONException unused) {
                        }
                    }
                }
            }
        }
        return jSONObject2;
    }

    public static boolean a(String str, e eVar) {
        JSONObject jSONObjectOptJSONObject;
        JSONObject jSONObject = f21897a;
        if (jSONObject == null || (jSONObjectOptJSONObject = jSONObject.optJSONObject(str)) == null || a(jSONObjectOptJSONObject.optJSONArray("disable"), eVar)) {
            return false;
        }
        return a(jSONObjectOptJSONObject.optJSONArray("enable"), eVar);
    }

    private static boolean a(JSONArray jSONArray, e eVar) {
        if (com.apm.insight.a.a(jSONArray)) {
            return false;
        }
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
            if (jSONObjectOptJSONObject == null) {
                com.apm.insight.c.a();
                j.a(new IllegalArgumentException("err config: ".concat(String.valueOf(jSONArray))), "NPTH_CATCH");
            } else if (a(jSONObjectOptJSONObject, eVar)) {
                return true;
            }
        }
        return false;
    }

    private static JSONArray b(JSONArray jSONArray, e eVar) {
        JSONArray jSONArray2 = new JSONArray();
        if (!com.apm.insight.a.a(jSONArray)) {
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                if (jSONObjectOptJSONObject == null) {
                    com.apm.insight.c.a();
                    j.a(new IllegalArgumentException("err config: ".concat(String.valueOf(jSONArray))), "NPTH_CATCH");
                } else if (a(jSONObjectOptJSONObject, eVar)) {
                    jSONArray2.put(jSONObjectOptJSONObject);
                }
            }
        }
        return jSONArray2;
    }

    private static boolean a(JSONObject jSONObject, e eVar) {
        Iterator<String> itKeys = jSONObject.keys();
        boolean z11 = false;
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            if (!TextUtils.isEmpty(next)) {
                if (next.startsWith("header_")) {
                    if (!a(jSONObject.optJSONObject(next), eVar.b(next.substring(7)))) {
                        com.apm.insight.a.a((Object) "not match ".concat(next));
                        return false;
                    }
                } else if (next.startsWith("java_")) {
                    if (!a(jSONObject.optJSONObject(next), eVar.a(next.substring(5)))) {
                        com.apm.insight.a.a((Object) "not match ".concat(next));
                        return false;
                    }
                } else {
                    com.apm.insight.a.a((Object) "no rules match ".concat(next));
                }
                z11 = true;
            }
        }
        return z11;
    }

    private static boolean a(JSONObject jSONObject, Object obj) {
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("values");
        if (jSONArrayOptJSONArray.length() == 0) {
            return false;
        }
        String strOptString = jSONObject.optString("op");
        String strValueOf = String.valueOf(obj);
        if (strOptString.equals("=")) {
            return strValueOf.equals(String.valueOf(jSONArrayOptJSONArray.opt(0)));
        }
        if (strOptString.equals("in")) {
            for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                if (String.valueOf(jSONArrayOptJSONArray.opt(i5)).equals(strValueOf)) {
                    return true;
                }
            }
        }
        return false;
    }
}
