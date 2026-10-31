package com.bytedance.sdk.component.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* loaded from: classes2.dex */
public class dy {
    private static final char[] ycx = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    public static String ycx(String str) throws NoSuchAlgorithmException {
        if (str != null) {
            try {
                if (str.length() != 0) {
                    MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                    messageDigest.update(str.getBytes("UTF-8"));
                    return ycx(messageDigest.digest());
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "dsp4oBe1ZQ==", "Vup4vQak", 25);
            }
        }
        return null;
    }

    public static String ycx(byte[] bArr) {
        if (bArr != null) {
            return ycx(bArr, 0, bArr.length);
        }
        throw new NullPointerException("bytes is null");
    }

    public static String ycx(byte[] bArr, int i5, int i11) {
        if (bArr != null) {
            if (i5 >= 0 && i5 + i11 <= bArr.length) {
                int i12 = i11 * 2;
                char[] cArr = new char[i12];
                int i13 = 0;
                for (int i14 = 0; i14 < i11; i14++) {
                    byte b11 = bArr[i14 + i5];
                    int i15 = i13 + 1;
                    char[] cArr2 = ycx;
                    cArr[i13] = cArr2[(b11 & 255) >> 4];
                    i13 += 2;
                    cArr[i15] = cArr2[b11 & 15];
                }
                return new String(cArr, 0, i12);
            }
            throw new IndexOutOfBoundsException();
        }
        throw new NullPointerException("bytes is null");
    }
}
