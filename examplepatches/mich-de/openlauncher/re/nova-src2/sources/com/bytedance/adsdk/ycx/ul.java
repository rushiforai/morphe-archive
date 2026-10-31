package com.bytedance.adsdk.ycx;

import android.text.TextUtils;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ul implements xkz {
    @Override // com.bytedance.adsdk.ycx.xkz
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public String ycx(JSONObject jSONObject, Object[] objArr) {
        if (objArr == null || objArr.length < 2) {
            return null;
        }
        String strValueOf = String.valueOf(objArr[0]);
        if (TextUtils.isEmpty(strValueOf)) {
            return null;
        }
        try {
            JSONObject jSONObject2 = new JSONObject(strValueOf);
            String strValueOf2 = String.valueOf(objArr[1]);
            if (TextUtils.isEmpty(strValueOf2)) {
                return null;
            }
            Object objYcx = com.bytedance.adsdk.ycx.zb.ycx.ycx(strValueOf2).ycx(jSONObject2);
            if (objYcx != null && !TextUtils.isEmpty(String.valueOf(objYcx))) {
                return String.valueOf(objYcx);
            }
            if (objArr.length >= 3) {
                return String.valueOf(objArr[2]);
            }
            return null;
        } catch (JSONException unused) {
            return null;
        }
    }
}
