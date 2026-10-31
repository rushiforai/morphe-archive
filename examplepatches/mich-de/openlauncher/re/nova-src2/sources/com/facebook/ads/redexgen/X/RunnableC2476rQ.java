package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.rQ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2476rQ implements Runnable {
    public static byte[] A01;
    public final /* synthetic */ C07076z A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 17);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-49, -30, -35, -34, -24, -55, -27, -38, -14, -37, -38, -36, -28, -66, -21, -21, -24, -21};
    }

    public RunnableC2476rQ(C07076z c07076z) {
        this.A00 = c07076z;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A00.A07.A0c(10);
            ((AbstractC0902Fd) this.A00.A00).A08.A0F().A3x(A00(0, 18, 104), this.A00.A00.A01);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
