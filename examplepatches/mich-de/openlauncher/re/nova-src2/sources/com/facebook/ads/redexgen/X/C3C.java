package com.facebook.ads.redexgen.X;

import com.google.common.primitives.ElementTypesAreNonnullByDefault;
import java.util.Arrays;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.3C, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C3C {
    public static byte[] A00;
    public static String[] A01 = {"2JWexOJxIb5fEwZmQuoYWf2p11HR2A0p", "GAK6KNrz1gdfUDUz3lOEfM1SfApyvgxT", "6Y2UQkkppvmCej4gXjoGEb9O6sq2p9tP", "Hu6W1M", "O0al11Z5cRGPQ2iJLEuTrw3eGJ0BHpF9", "jYN2locYcliQnskIaskglym2bRSFMWG7", "0C9D6f2YAWYW1V8eXA8NFRKCxyVyToRF", "ZDSWeSvoQtrjkzQqFDUNdKl6phEdSBum"};

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 58);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        byte[] bArr = {24, 34, 35, 119, 56, 49, 119, 37, 54, 57, 48, 50, 109, 119, 114, 36};
        if (A01[0].charAt(22) != '2') {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[2] = "IfLB8qHPPlsLgBe1W0PvwM0Gpb0HNHVP";
        strArr[7] = "RyQ660O2dtPdQHGET8HDLY0E3LznaKIT";
        A00 = bArr;
    }

    static {
        A03();
    }

    public static char A00(byte b12, byte b22) {
        return (char) ((b12 << 8) | (b22 & 255));
    }

    public static char A01(long value) {
        char c11 = (char) value;
        AbstractC1335Wu.A0H(((long) c11) == value, A02(0, 16, 109), value);
        return c11;
    }

    public static boolean A04(char[] array, char target) {
        for (char c11 : array) {
            if (c11 == target) {
                return true;
            }
        }
        return false;
    }
}
