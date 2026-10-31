package com.bytedance.sdk.component.adexpress.dynamic.lud;

import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj {
    public static JSONObject ycx(JSONObject jSONObject, JSONObject jSONObject2) throws JSONException {
        JSONObject jSONObject3 = new JSONObject();
        if (jSONObject2 == null || jSONObject2.length() <= 0 || jSONObject == null) {
            return jSONObject;
        }
        try {
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                Object objOpt = jSONObject.opt(next);
                Object objOpt2 = jSONObject2.opt(next);
                if (objOpt2 == null || objOpt2 == JSONObject.NULL) {
                    jSONObject3.put(next, objOpt);
                } else if ((objOpt instanceof JSONObject) && (objOpt2 instanceof JSONObject)) {
                    jSONObject3.put(next, ycx((JSONObject) objOpt, (JSONObject) objOpt2));
                } else if ((objOpt instanceof JSONArray) && (objOpt2 instanceof JSONArray)) {
                    jSONObject3.put(next, ycx((JSONArray) objOpt, (JSONArray) objOpt2));
                } else {
                    jSONObject3.put(next, objOpt2);
                }
            }
            Iterator<String> itKeys2 = jSONObject2.keys();
            while (itKeys2.hasNext()) {
                String next2 = itKeys2.next();
                if (!jSONObject.has(next2)) {
                    jSONObject3.put(next2, jSONObject2.opt(next2));
                }
            }
            return jSONObject3;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "f+crkzaoYMuT", "X+sohS65e8CFZdVXiRK0", 44);
            return jSONObject3;
        }
    }

    private static JSONArray ycx(JSONArray jSONArray, JSONArray jSONArray2) throws JSONException {
        if (jSONArray2 == null || jSONArray2.length() <= 0) {
            return jSONArray;
        }
        if (jSONArray == null || jSONArray.length() <= 0) {
            return null;
        }
        JSONArray jSONArray3 = new JSONArray();
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            try {
                Object objOpt = jSONArray.opt(i5);
                Object objOpt2 = jSONArray2.opt(i5);
                if (objOpt2 != null && objOpt2 != JSONObject.NULL) {
                    if ((objOpt instanceof JSONObject) && (objOpt2 instanceof JSONObject)) {
                        jSONArray3.put(i5, ycx((JSONObject) objOpt, (JSONObject) objOpt2));
                    } else if ((objOpt instanceof JSONArray) && (objOpt2 instanceof JSONArray)) {
                        jSONArray3.put(i5, ycx((JSONArray) objOpt, (JSONArray) objOpt2));
                    } else {
                        jSONArray3.put(i5, objOpt2);
                    }
                } else {
                    jSONArray3.put(i5, objOpt);
                }
            } catch (JSONException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "f+crkzaoYMuT", "X+sohS65e8CFYORyojCyOlr3", 75);
                return jSONArray3;
            }
        }
        return jSONArray3;
    }
}
