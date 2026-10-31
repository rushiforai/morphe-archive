package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.1m, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C05831m {
    public static byte[] A00;
    public static final Integer A01;
    public static final C05831m A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 81);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{-7, -22, -15, 5, -17, -12, -6, -60, -47, -57, -43, -46, -52, -57, -111, -46, -42, -111, -91, -40, -52, -49, -57, -121, -71, -88, -75, -74, -84, -78, -79};
    }

    static {
        Integer num;
        A01();
        A02 = new C05831m();
        Integer num2 = null;
        try {
            Object obj = Class.forName(A00(7, 24, 18)).getField(A00(0, 7, 85)).get(null);
            num = obj instanceof Integer ? (Integer) obj : null;
        } catch (Throwable unused) {
            num = null;
        }
        if (num != null) {
            if (num.intValue() > 0) {
                num2 = num;
            }
        }
        A01 = num2;
    }
}
