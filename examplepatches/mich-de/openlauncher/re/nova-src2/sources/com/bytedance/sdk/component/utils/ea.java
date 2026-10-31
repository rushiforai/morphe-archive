package com.bytedance.sdk.component.utils;

import java.io.UnsupportedEncodingException;

/* loaded from: classes2.dex */
public class ea {
    private static final byte[] ycx = ycx("VP8X");

    private static byte[] ycx(String str) {
        try {
            return str.getBytes("ASCII");
        } catch (UnsupportedEncodingException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "cuMskgaQZsaEf8NUgAI=", "Wv0unAqecNOFWQ==", 14);
            return new byte[1];
        }
    }

    public static boolean ycx(byte[] bArr, int i5) {
        try {
            boolean zYcx = ycx(bArr, i5 + 12, ycx);
            int i11 = i5 + 20;
            if (bArr.length <= i11) {
                return false;
            }
            return zYcx && ((bArr[i11] & 2) == 2);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "cuMskgaQZsaEf8NUgAI=", "Uv0MmwqxaNOFTuBYjgGILVrqKIc=", 30);
            return false;
        }
    }

    private static boolean ycx(byte[] bArr, int i5, byte[] bArr2) {
        if (bArr2 == null || bArr == null || bArr2.length + i5 > bArr.length) {
            return false;
        }
        for (int i11 = 0; i11 < bArr2.length; i11++) {
            if (bArr[i11 + i5] != bArr2[i11]) {
                return false;
            }
        }
        return true;
    }
}
