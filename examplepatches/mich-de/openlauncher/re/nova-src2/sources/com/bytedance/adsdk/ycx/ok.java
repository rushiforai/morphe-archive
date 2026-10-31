package com.bytedance.adsdk.ycx;

import android.text.TextUtils;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ok implements xkz {
    @Override // com.bytedance.adsdk.ycx.xkz
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public Boolean ycx(JSONObject jSONObject, Object[] objArr) {
        if (objArr != null && objArr.length > 0) {
            Object obj = objArr[0];
            if (obj == null) {
                return Boolean.TRUE;
            }
            if (obj instanceof String) {
                return Boolean.valueOf(TextUtils.isEmpty((String) obj));
            }
            if ((obj instanceof Boolean) || (obj instanceof Number)) {
                return Boolean.FALSE;
            }
            if (obj instanceof JSONArray) {
                return Boolean.valueOf(((JSONArray) obj).length() == 0);
            }
        }
        return Boolean.TRUE;
    }
}
