package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.nI, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC2226nI {
    A05(0),
    A04(1);

    public static byte[] A01;
    public static String[] A02 = {"oiwcgQDD2Kh2jNi2Ca2cNMgwHOvPe1SO", "yCbh3JWABSPWXJzi8IqNfGSw4JUwRc1Z", "TDKikcySDZ1IILIigFVmatsXCwa", "mxQFgn0FH0MMkOxHpkkDQyVpPhA2Zhda", "dru3glT9ekJ0g4QSSusKvICYyzfTBGaa", "dAZiojPQaZCECwqg1LvdEmP9Ue6", "ejQSO991EpDhDVu4zMofsruN7P1", "5bejy9B"};
    public final int A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = (bArrCopyOfRange[i13] - i12) - 117;
            String[] strArr = A02;
            if (strArr[0].charAt(4) != strArr[4].charAt(4)) {
                throw new RuntimeException();
            }
            A02[3] = "h3cU3OwhzzGY5RqiQjzUPbB5XZb13N8z";
            bArrCopyOfRange[i13] = (byte) i14;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-62, -61, -60, -61, -48, -48, -61, -62, -7, -3, -3, -11, -12, -7, -15, 4, -11};
    }

    static {
        A01();
    }

    EnumC2226nI(int i5) {
        this.A00 = i5;
    }
}
