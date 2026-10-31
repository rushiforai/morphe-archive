package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.2A, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C2A {
    public static byte[] A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{29, 85, 73, 72, 82, 31, 47, 50, 41, 47, 58, 62, 35, 37, 36};
    }

    public static final void A02(Throwable th2, Throwable th3) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        C1h.A09(th2, A00(0, 6, 92));
        C1h.A09(th3, A00(6, 9, 55));
        if (th2 != th3) {
            C1n.A02.A05(th2, th3);
        }
    }
}
