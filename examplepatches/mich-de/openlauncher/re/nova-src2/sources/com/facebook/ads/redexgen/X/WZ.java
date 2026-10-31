package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public enum WZ {
    A06,
    A05,
    A03,
    A04;

    public static byte[] A00;
    public static String[] A01 = {"GnEGE3XjLwbxwAmRpdWASVqKG4Smx", "plI8PicwewIJtRtyv2IqP0GXldiY4", "o3n", "9eWKpKv4vmnywefoMbH0", "deojqeyxO2EAIOfEwQVuoaU1K", "64E7HD0YOv2PKNEGwfkEaZx2cCnWSJ", "m7Sd4EcrD2bRnM1eivqFU48itzjejbo", "TwPWkL7XoCgAPsTRDziz0AXOA"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] ^ i12;
            if (A01[2].length() != 3) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[3] = "FzgbUWhLNbUHvl8GDpek";
            strArr[0] = "ENmn6kUqmcwiXfqHpBcLPkyZm1dbr";
            bArrCopyOfRange[i13] = (byte) (i14 ^ 107);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{12, 7, 6, 13, 64, 71, 79, 74, 67, 66, 59, 58, 33, 42, 39, 48, 52, 49, 44, 105, 126, 122, AbstractJsonLexerKt.TC_INVALID, 98};
    }

    static {
        A01();
    }
}
