package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* renamed from: com.facebook.ads.redexgen.X.fj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class EnumC1766fj {
    public static byte[] A01;
    public static String[] A02 = {"uWeYqRqj2CFddaK1TEbbXELMXn1", "pwHLR6E7O8pCQEo2Mdq2SIJTtAJsUy1b", "hzLxTv7mFlWS1jMhemum6kg3dZSMAgOI", "fLAfUk9iUPLdjKf71Gd3YKMhyYHXnvWI", "S7n3yA9UQyVOq9dOcIqrhChCL6ten", "TvghY6oRatwNhskHrQ5x3iw7tpebf6gH", "qf5wewW9IstP4QCsRPqhuigoLiQSUPC2", "ByvIinkqPsCgY7QXgHZrWkdUD8Lcf6oa"};
    public static final /* synthetic */ EnumC1766fj[] A03;
    public static final EnumC1766fj A04;
    public static final EnumC1766fj A05;
    public final String A00;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 76);
            String[] strArr = A02;
            if (strArr[2].charAt(31) != strArr[3].charAt(31)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[2] = "lLINjPSI7KynJ6Z03rXFIgcUMrVc0i0I";
            strArr2[3] = "WuF6uC9vMpC4p9fN33UW4I9vqGxizPCI";
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A01 = new byte[]{25, 13, 12, 23, 7, 11, 19, 17, 8, 7, 23, 22, 7, 14, 17, 28, 29, 23, 7, 29, 22, 28, 68, 91, 86, 87, 93, 77, 84, 93, 64, 81, 87, 77, 70, 91, 95, 87, 77, 87, 92, 86};
    }

    static {
        A02();
        String strA01 = A01(0, 22, 20);
        A04 = new EnumC1766fj(strA01, 0, strA01);
        String strA012 = A01(22, 20, 94);
        A05 = new EnumC1766fj(strA012, 1, strA012);
        A03 = A03();
    }

    public EnumC1766fj(String str, int i5, String str2) {
        this.A00 = str2;
    }

    public static EnumC1766fj A00(String str) {
        for (EnumC1766fj enumC1766fj : values()) {
            if (enumC1766fj.A00.equalsIgnoreCase(str)) {
                return enumC1766fj;
            }
        }
        return A04;
    }

    public static /* synthetic */ EnumC1766fj[] A03() {
        EnumC1766fj[] enumC1766fjArr = new EnumC1766fj[2];
        EnumC1766fj enumC1766fj = A04;
        if (A02[4].length() != 29) {
            throw new RuntimeException();
        }
        String[] strArr = A02;
        strArr[6] = "f80i3KOQjsW6P8tLVdIzmwewPXrTfxh0";
        strArr[7] = "jKvyurir8soCACtK72T4v7dMdJCULeIM";
        enumC1766fjArr[0] = enumC1766fj;
        enumC1766fjArr[1] = A05;
        return enumC1766fjArr;
    }

    public static EnumC1766fj valueOf(String str) {
        return (EnumC1766fj) Enum.valueOf(EnumC1766fj.class, str);
    }

    public static EnumC1766fj[] values() {
        return (EnumC1766fj[]) A03.clone();
    }
}
