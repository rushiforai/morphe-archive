package com.bytedance.adsdk.ycx;

import java.lang.reflect.Array;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dy implements xkz {
    @Override // com.bytedance.adsdk.ycx.xkz
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public Integer ycx(JSONObject jSONObject, Object[] objArr) {
        Object obj;
        if (objArr != null && objArr.length != 0 && (obj = objArr[0]) != null) {
            if (obj instanceof String) {
                return Integer.valueOf(((String) obj).length());
            }
            if (obj instanceof Set) {
                return Integer.valueOf(((Set) obj).size());
            }
            if (obj instanceof List) {
                return Integer.valueOf(((List) obj).size());
            }
            if (obj instanceof Map) {
                return Integer.valueOf(((Map) obj).size());
            }
            if (obj.getClass().isArray()) {
                return Integer.valueOf(Array.getLength(obj));
            }
            if (obj instanceof Number) {
                return Integer.valueOf(obj.toString().length());
            }
            if (obj instanceof JSONObject) {
                return Integer.valueOf(((JSONObject) obj).length());
            }
            if (obj instanceof JSONArray) {
                return Integer.valueOf(((JSONArray) obj).length());
            }
        }
        return 0;
    }
}
