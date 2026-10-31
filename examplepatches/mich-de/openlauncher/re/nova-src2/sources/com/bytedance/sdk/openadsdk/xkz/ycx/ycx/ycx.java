package com.bytedance.sdk.openadsdk.xkz.ycx.ycx;

import android.text.TextUtils;
import android.util.Base64;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.nio.charset.StandardCharsets;

/* loaded from: classes2.dex */
public class ycx {
    public static String ycx(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        String strEncodeToString = Base64.encodeToString(ycx(str.getBytes(StandardCharsets.UTF_8)), 0);
        StringBuilder sb2 = new StringBuilder();
        if (str2 == null) {
            str2 = b.f42142b;
        }
        return c0.q(sb2, str2, strEncodeToString);
    }

    public static String zb(String str, String str2) {
        try {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            if (str2 == null) {
                str2 = b.f42142b;
            }
            if (str.startsWith(str2)) {
                str = str.substring(str2.length());
            }
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            return new String(ycx(Base64.decode(str, 0)), StandardCharsets.UTF_8);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PthqsYcKSfthSgA==", "X+suhxqsffSUWN5Tiw==", 64);
            return null;
        }
    }

    private static byte[] ycx(byte[] bArr) {
        if (bArr != null && bArr.length != 0) {
            byte[] bytes = "PAGAdSDK".getBytes(StandardCharsets.UTF_8);
            int length = bytes.length;
            byte[] bArr2 = new byte[bArr.length];
            for (int i5 = 0; i5 < bArr.length; i5++) {
                bArr2[i5] = (byte) (bArr[i5] ^ bytes[i5 % length]);
            }
            return bArr2;
        }
        return new byte[0];
    }
}
