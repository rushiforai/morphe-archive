package com.bytedance.adsdk.ycx;

import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jc implements xkz {
    @Override // com.bytedance.adsdk.ycx.xkz
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public Boolean ycx(JSONObject jSONObject, Object[] objArr) {
        if (objArr != null && objArr.length >= 2) {
            Object obj = objArr[0];
            Object obj2 = objArr[1];
            if (obj2 == null) {
                return Boolean.FALSE;
            }
            if (obj instanceof String) {
                return Boolean.valueOf(((String) obj).contains(String.valueOf(obj2)));
            }
            if (obj instanceof JSONArray) {
                JSONArray jSONArray = (JSONArray) obj;
                if (jSONArray.length() > 0) {
                    return Boolean.valueOf(ycx(jSONArray, obj2));
                }
            }
        }
        return Boolean.FALSE;
    }

    private boolean ycx(JSONArray jSONArray, Object obj) {
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            try {
                if (jSONArray.get(i5).equals(obj)) {
                    return true;
                }
            } catch (Throwable unused) {
            }
        }
        return false;
    }
}
