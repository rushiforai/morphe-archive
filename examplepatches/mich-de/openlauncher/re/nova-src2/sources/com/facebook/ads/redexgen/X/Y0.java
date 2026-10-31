package com.facebook.ads.redexgen.X;

import android.media.MediaCodec;
import android.os.Build;
import java.io.IOException;
import java.util.Arrays;
import javax.annotation.Nullable;

/* loaded from: assets/audience_network/classes.dex */
public class Y0 {

    @Nullable
    public static Boolean A00;
    public static byte[] A01;
    public static String[] A02 = {"COJT3Ht5GS5DviuoQsY0eUjzIwjorJIa", "KBA3B2vQrMkk1T1ECRHKppGaISS58FLJ", "DIJhqJXHzKoFbLNtnMpoR0mawG1sdcrM", "lXYWj0HqmpfQw5Mbf3kCyocur4fqj8yL", "rF2cAXGN7HDl9dO17vXNMVr3RxlU43pT", "u8sd7ZPm9Uy5FNhmSi9D1hMnSmIC4d5Q", "KrEnRbZlUfY6oyVBQsCbDMbOJFxUCI6c", "6z"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = bArrCopyOfRange[i13];
            if (A02[7].length() == 10) {
                throw new RuntimeException();
            }
            A02[4] = "WWz9zUhHie5KzcqaHj0gFq9CVY8U4TXe";
            bArrCopyOfRange[i13] = (byte) ((b11 - i12) - 116);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{13, 40, 48, 51, 44, 43, -25, 59, 54, -25, 46, 44, 59, -25, 52, 44, 43, 48, 40, -25, 10, 54, 43, 44, 42, -41, -12, 1, -2, -44, 7, -2, -28, 3, -8, -5, 72, 55, 64, 54, 65, 68, 0, 69, 55, 53, -1, 51, 59, 56, 68, 53, -1, 70, 68, 51, 64, 69, 56, 55, 68, -1, 68, 55, 67, 71, 55, 69, 70, 0, 72, 51, 62, 71, 55, -9, -22, -27, -26, -16, -80, -30, -9, -28};
    }

    static {
        A01();
        A00 = null;
    }

    public static boolean A02() throws IOException {
        if (A00 != null) {
            return A00.booleanValue();
        }
        A00 = false;
        try {
            if (Build.VERSION.SDK_INT >= 31) {
                MediaCodec mediaCodecCreateDecoderByType = MediaCodec.createDecoderByType(A00(75, 9, 13));
                try {
                    A00 = Boolean.valueOf(mediaCodecCreateDecoderByType.getSupportedVendorParameters().contains(A00(36, 39, 94)));
                    mediaCodecCreateDecoderByType.release();
                } catch (Throwable th2) {
                    mediaCodecCreateDecoderByType.release();
                    throw th2;
                }
            }
        } catch (IOException e3) {
            YN.A02(A00(25, 11, 27), A00(0, 25, 83), e3);
        }
        boolean zBooleanValue = A00.booleanValue();
        String[] strArr = A02;
        if (strArr[0].charAt(16) != strArr[6].charAt(16)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A02;
        strArr2[2] = "X45FL7aCy4osP7eSkysCa9E9ZIVY3fmt";
        strArr2[3] = "vFq4yMjCczUZK27q7zxp8BZbnmEfjH6e";
        return zBooleanValue;
    }

    public static boolean A03(int i5, int i11) {
        return i5 >= 480 && i11 >= 480 && i5 <= 3840 && i11 <= 2160;
    }
}
