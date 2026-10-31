package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* renamed from: com.facebook.ads.redexgen.X.oM, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class EnumC2290oM {
    public static byte[] A00;
    public static String[] A01 = {"VuOovEj", "3eqzG4MpGQsFKmJ1FhAh1Rs0IcmzaMq", "8cPXHFZMAhqCVbZy4MjUAoM8KWnfaV1Q", "pvg87rAUJ4VavSXCfB3", "cAuwKKs5SgmlS2VyUZD8JcNhiRW4eE8b", "84VVqR3", "FSvMC9", "g2tS5KUkBwjmj9FX6fx8zjNZH"};
    public static final /* synthetic */ EnumC2290oM[] A02;
    public static final EnumC2290oM A03;
    public static final EnumC2290oM A04;
    public static final EnumC2290oM A05;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 78);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{-6, -3, 12, -95, -82, -82, -85, -82, -77, -84, -87, -84, -83, -75, -84};
    }

    static {
        A01();
        A05 = new EnumC2290oM(A00(8, 7, 16), 0);
        A04 = new EnumC2290oM(A00(3, 5, 14), 1);
        A03 = new EnumC2290oM(A00(0, 3, 107), 2);
        A02 = A02();
    }

    public EnumC2290oM(String str, int i5) {
    }

    public static /* synthetic */ EnumC2290oM[] A02() {
        EnumC2290oM[] enumC2290oMArr = new EnumC2290oM[3];
        if (A01[7].length() == 23) {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[3] = "nCVJTFbqHQDUH6AeYka";
        strArr[1] = "KzTBah8wNBFEYgBLEYyogGWDRrVA0Hr";
        enumC2290oMArr[0] = A05;
        enumC2290oMArr[1] = A04;
        enumC2290oMArr[2] = A03;
        return enumC2290oMArr;
    }

    public static EnumC2290oM valueOf(String str) {
        return (EnumC2290oM) Enum.valueOf(EnumC2290oM.class, str);
    }

    public static EnumC2290oM[] values() {
        return (EnumC2290oM[]) A02.clone();
    }
}
