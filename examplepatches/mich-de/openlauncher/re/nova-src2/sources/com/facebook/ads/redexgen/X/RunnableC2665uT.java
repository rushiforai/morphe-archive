package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.uT, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2665uT implements Runnable {
    public static byte[] A01;
    public final /* synthetic */ C06815z A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 43);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-12, 7, 2, 3, 13, -18, 10, -1, 23, 0, -1, 1, 9, -29, 16, 16, 13, 16};
    }

    public RunnableC2665uT(C06815z c06815z) {
        this.A00 = c06815z;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A00.A13(A00(0, 18, 115));
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
