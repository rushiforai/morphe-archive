package com.bytedance.adsdk.ycx;

import android.net.Uri;
import android.text.TextUtils;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lud implements xkz {
    @Override // com.bytedance.adsdk.ycx.xkz
    public Object ycx(JSONObject jSONObject, Object[] objArr) {
        if (objArr == null || objArr.length <= 0) {
            return null;
        }
        String strValueOf = String.valueOf(objArr[0]);
        if (TextUtils.isEmpty(strValueOf)) {
            return null;
        }
        return Uri.encode(strValueOf);
    }
}
