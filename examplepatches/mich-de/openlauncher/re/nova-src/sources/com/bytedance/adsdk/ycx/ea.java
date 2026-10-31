package com.bytedance.adsdk.ycx;

import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ea implements xkz {
    @Override // com.bytedance.adsdk.ycx.xkz
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public Boolean ycx(JSONObject jSONObject, Object[] objArr) throws NumberFormatException {
        if (objArr == null || objArr.length <= 0) {
            return Boolean.FALSE;
        }
        try {
            Double.parseDouble(String.valueOf(objArr[0]));
            return Boolean.TRUE;
        } catch (NumberFormatException unused) {
            return Boolean.FALSE;
        }
    }
}
