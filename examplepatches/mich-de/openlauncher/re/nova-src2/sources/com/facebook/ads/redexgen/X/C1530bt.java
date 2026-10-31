package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.bt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1530bt {
    public static byte[] A05;
    public final int A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final int A04;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 8);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A05 = new byte[]{19, 39, 14, 19, 12, 0, 21, 91, 55, 60, 54, 41, 46, 59, 40, 46, 48, 55, 58, 47, 38, 42, 59, 38, 42};
    }

    public C1530bt(int i5, int i11, int i12, int i13, int i14) {
        this.A02 = i5;
        this.A00 = i11;
        this.A03 = i12;
        this.A04 = i13;
        this.A01 = i14;
    }

    public static C1530bt A00(String str) {
        int i5 = -1;
        int i11 = -1;
        int i12 = -1;
        int i13 = -1;
        String strA01 = A01(1, 7, 105);
        AbstractC1062Ln.A07(str.startsWith(strA01));
        int startTimeIndex = strA01.length();
        String[] keys = TextUtils.split(str.substring(startTimeIndex), A01(0, 1, 55));
        int i14 = 0;
        while (true) {
            int startTimeIndex2 = keys.length;
            int textIndex = -1;
            if (i14 < startTimeIndex2) {
                String strA012 = XC.A01(keys[i14].trim());
                int startTimeIndex3 = strA012.hashCode();
                switch (startTimeIndex3) {
                    case 100571:
                        if (strA012.equals(A01(8, 3, 90))) {
                            textIndex = 1;
                            break;
                        }
                        break;
                    case 3556653:
                        if (strA012.equals(A01(21, 4, 86))) {
                            textIndex = 3;
                            break;
                        }
                        break;
                    case 109757538:
                        if (strA012.equals(A01(11, 5, 82))) {
                            textIndex = 0;
                            break;
                        }
                        break;
                    case 109780401:
                        if (strA012.equals(A01(16, 5, 75))) {
                            textIndex = 2;
                            break;
                        }
                        break;
                }
                switch (textIndex) {
                    case 0:
                        i5 = i14;
                        break;
                    case 1:
                        i11 = i14;
                        break;
                    case 2:
                        i12 = i14;
                        break;
                    case 3:
                        i13 = i14;
                        break;
                }
                i14++;
            } else {
                if (i5 != -1 && i11 != -1 && i13 != -1) {
                    return new C1530bt(i5, i11, i12, i13, keys.length);
                }
                return null;
            }
        }
    }
}
