package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* renamed from: com.facebook.ads.redexgen.X.hS, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class EnumC1871hS {
    public static byte[] A00;
    public static String[] A01 = {"5OO1eWJNP7Y3s5cQVhBQzuf4m1TAFPYu", "jypq8Huvx", "jrpdYYVceDk6A6K9eES7EYlVVXbr1rnB", "0AH7qFhs7PL8sRdpBGyIu3", "QWErYf377ArBGiXitK75JQXJw", "6gjozywHn1tStRqNZ4amJv", "kQUf5kbyDrtyo", "1dtSAN9pZ"};
    public static final /* synthetic */ EnumC1871hS[] A02;
    public static final EnumC1871hS A03;
    public static final EnumC1871hS A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 3);
            if (A01[7].length() != 9) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[6] = "4K3nSgRyXAG8o";
            strArr[4] = "A3wHnoq4BiJ6LQy7c3XTOTZiL";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{117, 114, 122, 115, 106, 122, 107, 124, 124, 119, 106, 113, 118, 109, 106};
    }

    static {
        A01();
        A04 = new EnumC1871hS(A00(4, 11, 58), 0);
        A03 = new EnumC1871hS(A00(0, 4, 63), 1);
        A02 = A02();
    }

    public EnumC1871hS(String str, int i5) {
    }

    public static /* synthetic */ EnumC1871hS[] A02() {
        EnumC1871hS[] enumC1871hSArr = new EnumC1871hS[2];
        enumC1871hSArr[0] = A04;
        if (A01[3].length() != 22) {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[5] = "JlDjy95TN7ugX9lllrmiZN";
        strArr[1] = "bmzAisU8h";
        enumC1871hSArr[1] = A03;
        return enumC1871hSArr;
    }

    public static EnumC1871hS valueOf(String str) {
        return (EnumC1871hS) Enum.valueOf(EnumC1871hS.class, str);
    }

    public static EnumC1871hS[] values() {
        return (EnumC1871hS[]) A02.clone();
    }
}
