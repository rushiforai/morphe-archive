package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.tJ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2593tJ {
    public static byte[] A08;
    public final long A00;
    public final long A01;
    public final long A02;
    public final long A03;
    public final long A04;
    public final long A05;
    public final long A06;
    public final String A07;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A08, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 17);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A08 = new byte[]{5, 14, 12, 62, 2, 14, 15, 21, 4, 15, 21, 62, 13, 14, 0, 5, 4, 5, 62, 12, 18, 56, 49, 62, 52, 60, 53, 34, 15, 36, 57, 61, 53, 15, 61, 35, 24, 31, 24, 5, 24, 16, 29, 46, 4, 3, 29, 71, 68, 74, 79, 116, 77, 66, 69, 66, 88, 67, 116, 70, 88, 16, 19, 29, 24, 35, 15, 8, 29, 14, 8, 35, 17, 15, 66, 85, 67, 64, 95, 94, 67, 85, 111, 85, 94, 84, 111, 93, 67, 59, 43, 58, 39, 36, 36, 23, 58, 45, 41, 44, 49, 23, 37, 59, 40, 62, 40, 40, 50, 52, 53, 4, 61, 50, 53, 50, 40, 51, 4, 54, 40};
    }

    public C2593tJ(String str, long j11, long j12, long j13, long j14, long j15, long j16, long j17) {
        this.A07 = str;
        this.A01 = j11;
        this.A03 = j12;
        this.A04 = j13;
        this.A00 = j14;
        this.A05 = j15;
        this.A02 = j16;
        this.A06 = j17;
    }

    public final Map<String, String> A02() {
        HashMap map = new HashMap(7);
        map.put(A00(36, 11, 96), this.A07);
        map.put(A00(21, 15, 65), String.valueOf(this.A01));
        map.put(A00(61, 13, 109), String.valueOf(this.A03));
        map.put(A00(74, 15, 33), String.valueOf(this.A04));
        map.put(A00(0, 21, 112), String.valueOf(this.A00));
        map.put(A00(89, 15, 89), String.valueOf(this.A05));
        map.put(A00(47, 14, 58), String.valueOf(this.A02));
        map.put(A00(104, 17, 74), String.valueOf(this.A06));
        return map;
    }
}
