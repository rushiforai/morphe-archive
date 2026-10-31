package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.1q, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C1q {
    public static byte[] A00;

    static {
        A02();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 120);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{91, 80, 74, 76, 87, 91, 77};
    }

    public static final <E extends Enum<E>> InterfaceC05640p<E> A01(E[] eArr) {
        C1h.A09(eArr, A00(0, 7, 70));
        return new C0K(eArr);
    }
}
