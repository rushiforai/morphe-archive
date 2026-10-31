package com.bytedance.adsdk.ycx;

import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ry implements xkz {
    @Override // com.bytedance.adsdk.ycx.xkz
    public Object ycx(JSONObject jSONObject, Object[] objArr) {
        if (objArr == null || objArr.length < 2) {
            return null;
        }
        int i5 = 0;
        Object obj = objArr[0];
        Object obj2 = objArr[1];
        if (obj == null || !(obj2 instanceof String)) {
            return null;
        }
        String str = (String) obj2;
        StringBuilder sb2 = new StringBuilder();
        if (obj instanceof JSONArray) {
            JSONArray jSONArray = (JSONArray) obj;
            while (i5 < jSONArray.length()) {
                if (i5 > 0) {
                    sb2.append(str);
                }
                sb2.append(String.valueOf(jSONArray.opt(i5)));
                i5++;
            }
        } else {
            if (!obj.getClass().isArray()) {
                return String.valueOf(obj);
            }
            Object[] objArr2 = (Object[]) obj;
            while (i5 < objArr2.length) {
                if (i5 > 0) {
                    sb2.append(str);
                }
                sb2.append(String.valueOf(objArr2[i5]));
                i5++;
            }
        }
        return sb2.toString();
    }
}
