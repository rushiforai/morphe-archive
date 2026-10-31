package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: assets/audience_network/classes.dex */
public final class XJ {
    public static byte[] A00;
    public static String[] A01 = {"9eunqI2YabPp0vh8oGYf0ea4ClI", "9sUHz8AeQ2lABOvzc8rUQJgMJYUEiQiN", "RKMpSx", "XWdqZlP6", "5IaO5P06Tu6YQcFAtPo9c5ctUC", "oOeiD4EsRl1HbgWVw2W16i1wPfjr6GBP", "dA0XKL4W", "CcPSU"};
    public static final /* synthetic */ XJ[] A02;
    public static final XJ A03;
    public static final XJ A04;
    public static final XJ A05;
    public static final XJ A06;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 70);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{-29, -18, -19, -28, -16, -21, -13, -10, -17, -18, -15, -14, -9, 2, -11, -24, -28, -25, -4, -1, -14, -18, -15, 6};
    }

    static {
        A01();
        A06 = new XJ(A00(19, 5, 103), 0);
        A05 = new XJ(A00(10, 9, 93), 1);
        A03 = new XJ(A00(0, 4, 89), 2);
        A04 = new XJ(A00(4, 6, 100), 3);
        A02 = A02();
    }

    public XJ(String $enum$name, int $enum$ordinal) {
    }

    public static /* synthetic */ XJ[] A02() {
        XJ[] xjArr = new XJ[4];
        xjArr[0] = A06;
        xjArr[1] = A05;
        xjArr[2] = A03;
        if (A01[7].length() == 2) {
            throw new RuntimeException();
        }
        A01[2] = "qjxD1b";
        xjArr[3] = A04;
        return xjArr;
    }

    public static XJ valueOf(String name) {
        return (XJ) Enum.valueOf(XJ.class, name);
    }

    public static XJ[] values() {
        return (XJ[]) A02.clone();
    }
}
