package com.bytedance.adsdk.ycx;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx implements xkz {
    @Override // com.bytedance.adsdk.ycx.xkz
    public Object ycx(JSONObject jSONObject, Object[] objArr) {
        if (objArr == null || objArr.length != 2) {
            return null;
        }
        JSONArray jSONArray = new JSONArray();
        try {
            JSONArray jSONArrayYcx = ycx(objArr[0]);
            if (jSONArrayYcx != null) {
                int i5 = Integer.parseInt(String.valueOf(objArr[1]));
                for (int i11 = 0; i11 < jSONArrayYcx.length(); i11 += i5) {
                    JSONObject jSONObject2 = new JSONObject();
                    JSONArray jSONArray2 = new JSONArray();
                    for (int i12 = 0; i12 < i5; i12++) {
                        int i13 = i11 + i12;
                        if (i13 >= jSONArrayYcx.length()) {
                            break;
                        }
                        jSONArray2.put(jSONArrayYcx.opt(i13));
                    }
                    jSONObject2.put("$chunk", jSONArray2);
                    jSONArray.put(jSONObject2);
                }
            }
        } catch (Throwable unused) {
        }
        return jSONArray;
    }

    private JSONArray ycx(Object obj) {
        if (obj instanceof JSONArray) {
            return (JSONArray) obj;
        }
        if (obj != null && obj.getClass().isArray()) {
            JSONArray jSONArray = new JSONArray();
            for (Object obj2 : (Object[]) obj) {
                jSONArray.put(obj2);
            }
            return jSONArray;
        }
        try {
            return new JSONArray(String.valueOf(obj));
        } catch (JSONException unused) {
            return null;
        }
    }
}
