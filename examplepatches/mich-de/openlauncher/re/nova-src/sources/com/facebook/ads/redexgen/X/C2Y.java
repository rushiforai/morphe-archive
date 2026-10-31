package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.2Y, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract /* synthetic */ class C2Y {
    public static byte[] A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 101);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{43, 13, 8, 29, 10, 88, 27, 25, 20, 20, 11, 88, 15, 17, 12, 16, 88, 28, 29, 30, 25, 13, 20, 12, 88, 25, 10, 31, 13, 21, 29, 22, 12, 11, 88, 22, 23, 12, 88, 11, 13, 8, 8, 23, 10, 12, 29, 28, 88, 17, 22, 88, 12, 16, 17, 11, 88, 12, 25, 10, 31, 29, 12, 84, 88, 30, 13, 22, 27, 12, 17, 23, 22, 66, 88, 26, 29, 31, 17, 22, 45, 8, 28, 25, 12, 29};
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ void A02(AnonymousClass12 anonymousClass12, long j11, List list, Map map, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException(A00(0, 86, 29));
        }
        if ((i5 & 4) != 0) {
            map = C0X.A02();
        }
        anonymousClass12.A58(j11, list, map);
    }
}
