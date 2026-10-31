package com.bytedance.sdk.component.utils;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.MessageDigest;

/* loaded from: classes2.dex */
public class lud {
    private static final char[] ycx = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

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

    public static String ycx(File file) throws IOException {
        FileInputStream fileInputStream;
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            if (messageDigest == null) {
                return null;
            }
            fileInputStream = new FileInputStream(file);
            try {
                byte[] bArr = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
                while (true) {
                    int i5 = fileInputStream.read(bArr, 0, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                    if (i5 > 0) {
                        messageDigest.update(bArr, 0, i5);
                    } else {
                        String strYcx = ycx(messageDigest.digest());
                        try {
                            fileInputStream.close();
                            return strYcx;
                        } catch (Exception e3) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "f+cqkBCoXNOJRsQ=", "Vup4vQak", 82);
                            return strYcx;
                        }
                    }
                }
            } catch (Throwable th2) {
                th = th2;
                try {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "f+cqkBCoXNOJRsQ=", "Vup4vQak", 76);
                    return null;
                } finally {
                    if (fileInputStream != null) {
                        try {
                            fileInputStream.close();
                        } catch (Exception e11) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "f+cqkBCoXNOJRsQ=", "Vup4vQak", 82);
                        }
                    }
                }
            }
        } catch (Throwable th3) {
            th = th3;
            fileInputStream = null;
        }
    }

    public static String ycx(String str) {
        if (str != null) {
            try {
                if (str.length() != 0) {
                    MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                    messageDigest.update(str.getBytes("UTF-8"));
                    return ycx(messageDigest.digest());
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "f+cqkBCoXNOJRsQ=", "Vup4vQak", 99);
            }
        }
        return null;
    }
}
