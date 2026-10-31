package com.bytedance.adsdk.ycx;

import android.text.TextUtils;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt implements xkz {
    @Override // com.bytedance.adsdk.ycx.xkz
    public Object ycx(JSONObject jSONObject, Object[] objArr) {
        if (objArr != null && objArr.length > 0) {
            for (Object obj : objArr) {
                String strValueOf = String.valueOf(obj);
                if (!TextUtils.isEmpty(strValueOf) && !TextUtils.equals(strValueOf, AbstractJsonLexerKt.NULL)) {
                    return strValueOf;
                }
            }
        }
        return null;
    }
}
