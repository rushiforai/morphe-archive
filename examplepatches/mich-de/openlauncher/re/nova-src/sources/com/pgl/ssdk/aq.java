package com.pgl.ssdk;

import android.text.TextUtils;
import android.util.Pair;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.component.utils.ycx;

/* loaded from: classes.dex */
public class aq {
    public static Pair<Integer, String> a(String str) {
        Pair<Integer, String> pairCypher4EncryptWithNoWrapBase64 = null;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            pairCypher4EncryptWithNoWrapBase64 = PglCryptUtils.getInstance().cypher4EncryptWithNoWrapBase64(str);
        } catch (Throwable unused) {
        }
        return (pairCypher4EncryptWithNoWrapBase64 == null || ((Integer) pairCypher4EncryptWithNoWrapBase64.first).intValue() != 0 || TextUtils.isEmpty((CharSequence) pairCypher4EncryptWithNoWrapBase64.second)) ? new Pair<>(3, ycx.zb(str)) : new Pair<>(4, pairCypher4EncryptWithNoWrapBase64.second);
    }
}
