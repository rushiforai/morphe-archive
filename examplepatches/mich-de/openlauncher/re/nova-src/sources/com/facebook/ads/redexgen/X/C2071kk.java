package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.kk, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2071kk {
    public static InterfaceC2072kl A00;
    public static byte[] A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 25);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A01 = new byte[]{-24, -21, -12, -23, -18, -13, -25, -8, -15};
    }

    static {
        A02();
        A00 = null;
    }

    public static void A01() {
        synchronized (C2071kk.class) {
            if (A00 == null) {
                return;
            }
            C2127lg c2127lg = new C2127lg(A00.AJt());
            c2127lg.A05(1);
            C0957Hh c0957HhA00 = AbstractC2094l9.A00();
            if (c0957HhA00 != null) {
                c0957HhA00.A08().ABz(A00(0, 9, 109), 3401, c2127lg);
            }
            A00.reset();
        }
    }

    public static void A03(long j11) {
        if (j11 > 0) {
            A00 = new C0967Hr();
            new C2073km(j11);
        }
    }
}
