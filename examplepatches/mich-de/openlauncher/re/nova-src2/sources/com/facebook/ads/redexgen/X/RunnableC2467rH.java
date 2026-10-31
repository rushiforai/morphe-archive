package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.rH, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class RunnableC2467rH implements Runnable {
    public static byte[] A01;
    public final /* synthetic */ C0912Fo A00;

    static {
        A01();
    }

    public RunnableC2467rH(C0912Fo c0912Fo) {
        this.A00 = c0912Fo;
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 5);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-73, -75, -89, -76, -95, -92, -73, -88, -88, -89, -76, -89, -90, -95, -91, -82, -85, -91, -83, -95, -93, -88, -74, -89, -76, -95, -90, -89, -82, -93, -69};
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0D(A00(0, 31, 61));
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
