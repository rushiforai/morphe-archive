package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.rC, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2462rC implements Runnable {
    public static byte[] A01;
    public final /* synthetic */ AnonymousClass78 A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 54);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{62, 56, 46, 57, 20, 41, 62, 45, 45, 46, 57, 46, 47, 20, 40, 39, 34, 40, 32, 20, 42, 45, 63, 46, 57, 20, 47, 46, 39, 42, 50};
    }

    public RunnableC2462rC(AnonymousClass78 anonymousClass78) {
        this.A00 = anonymousClass78;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0K(A00(0, 31, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE));
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
