package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.mB, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2157mB {
    public static HashMap<String, String> A00;
    public static byte[] A01;

    static {
        A02();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 101);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A01 = new byte[]{63, 46, 46, 60, 43, 55, 50, 58, 118, 103, 103, 121, 118, 122, 114, 27, 10, 10, 12, 31, 8, 9, 14, 25, 2, 8, 0, 9, 47, 45, 38, 39, 46, 15, 19, 53, 41, 44, 63, 40, 41, 101, 114, 125, 114, 101, 106, 126, 119, 100, 115, 114, 104, 110, 111, 126, 104, 126, 126, 100, 98, 99, 114, 100, 105, 51, 60, 54, 32, 61, 59, 54};
    }

    public static synchronized Map<String, String> A01(C2095lA c2095lA) {
        if (A00 != null) {
            return new HashMap(A00);
        }
        A00 = new HashMap<>();
        A00.put(A00(22, 6, 41), c2095lA.getPackageName());
        A03(c2095lA, A00, null);
        return new HashMap(A00);
    }

    public static synchronized void A03(C2095lA c2095lA, Map<String, String> map, String str) {
        map.put(A00(41, 3, 83), A00(65, 7, 55));
        map.put(A00(44, 11, 68), c2095lA.A05().AA6());
        map.put(A00(33, 2, 37), c2095lA.A05().AA5());
        map.put(A00(35, 6, 31), C2137lq.A04);
        C2137lq c2137lq = new C2137lq(c2095lA, str);
        map.put(A00(15, 7, 63), c2137lq.A06());
        map.put(A00(8, 7, 82), c2137lq.A05());
        map.put(A00(0, 8, 27), String.valueOf(c2137lq.A04()));
        map.put(A00(28, 5, 7), c2137lq.A0A());
        map.put(A00(55, 10, 72), c2095lA.A09().A02());
    }
}
