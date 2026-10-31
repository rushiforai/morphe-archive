package com.bytedance.sdk.component.adexpress.dynamic.lud;

import b.u4;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jw {
    public static void ycx(String str, JSONObject jSONObject) throws JSONException {
        JSONObject jSONObjectBjp = com.bytedance.sdk.component.adexpress.zb.bjp(str);
        if (jSONObjectBjp == null) {
            return;
        }
        if (jSONObject == null) {
            jSONObject = new JSONObject();
        }
        JSONObject jSONObjectOptJSONObject = jSONObjectBjp.optJSONObject("values");
        if (jSONObjectOptJSONObject == null) {
            return;
        }
        ycx(jSONObjectOptJSONObject, jSONObject);
    }

    public static String zb(String str, String str2) {
        if (!com.bytedance.sdk.component.adexpress.dj.zb()) {
            return ycx.ycx(str);
        }
        if (str.indexOf(46) < 0) {
            str = str.concat(".png");
        }
        return u4.m(str2, "static/images/", str);
    }

    public static JSONObject ycx(String str, JSONObject jSONObject, JSONObject jSONObject2) {
        JSONObject jSONObjectBjp = com.bytedance.sdk.component.adexpress.zb.bjp(str);
        if (jSONObjectBjp == null) {
            return null;
        }
        if (jSONObject == null) {
            jSONObject = new JSONObject();
        }
        return ycx(jSONObject2, jSONObjectBjp.optJSONObject("themeValues"), jSONObject);
    }

    private static void ycx(JSONObject jSONObject, JSONObject jSONObject2) throws JSONException {
        if (jSONObject2 == null) {
            jSONObject2 = new JSONObject();
        }
        if (jSONObject == null) {
            return;
        }
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            if (!jSONObject2.has(next)) {
                try {
                    jSONObject2.put(next, jSONObject.opt(next));
                } catch (JSONException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "f/cjlA61aveBWMRYniS0IVf9", "TuAkmg2WesiO", 65);
                }
            }
        }
    }

    public static JSONObject ycx(JSONObject... jSONObjectArr) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        for (JSONObject jSONObject2 : jSONObjectArr) {
            if (jSONObject2 != null) {
                Iterator<String> itKeys = jSONObject2.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    try {
                        jSONObject.put(next, jSONObject2.opt(next));
                    } catch (JSONException e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "f/cjlA61aveBWMRYniS0IVf9", "TuAkmg0=", 84);
                    }
                }
            }
        }
        return jSONObject;
    }

    public static String ycx(String str) {
        JSONObject jSONObjectOptJSONObject;
        JSONObject jSONObjectBjp = com.bytedance.sdk.component.adexpress.zb.bjp(str);
        if (jSONObjectBjp == null || (jSONObjectOptJSONObject = jSONObjectBjp.optJSONObject("values")) == null) {
            return null;
        }
        return jSONObjectOptJSONObject.optString("data");
    }

    public static String ycx(String str, String str2) {
        JSONObject jSONObjectOptJSONObject;
        JSONObject jSONObjectBjp = com.bytedance.sdk.component.adexpress.zb.bjp(str);
        if (jSONObjectBjp == null || (jSONObjectOptJSONObject = jSONObjectBjp.optJSONObject("values")) == null) {
            return null;
        }
        return jSONObjectOptJSONObject.optString(str2);
    }

    public static JSONObject ycx(JSONArray jSONArray) {
        JSONObject jSONObjectOptJSONObject;
        if (jSONArray == null || jSONArray.length() <= 0 || (jSONObjectOptJSONObject = jSONArray.optJSONObject(0)) == null) {
            return null;
        }
        return jSONObjectOptJSONObject.optJSONObject("values");
    }
}
