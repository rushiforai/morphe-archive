package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.Xj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1348Xj extends Exception {
    public static byte[] A01;
    public final String A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 20);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{6, 10, 1, 0, 6, 43, 4, 8, 0};
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C1348Xj(String str, Throwable th2) {
        super(th2);
        C1h.A09(str, A00(0, 9, 113));
        this.A00 = str;
    }
}
