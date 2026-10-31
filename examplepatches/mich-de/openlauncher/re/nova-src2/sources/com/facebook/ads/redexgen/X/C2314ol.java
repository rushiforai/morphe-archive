package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.ol, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2314ol {
    public static byte[] A03;
    public final int A00;
    public final int A01;
    public final C1735fE A02;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 75);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{-27, -29, -12, -26, -27, -16, -10, 12, 10, 27, 13, 18, 23, 13};
    }

    public C2314ol(int i5, int i11, C1735fE c1735fE) {
        this.A01 = i5;
        this.A00 = i11;
        this.A02 = c1735fE;
    }

    public final int A02() {
        return this.A01;
    }

    public final C1735fE A03() {
        return this.A02;
    }

    public final Map<String, String> A04() {
        HashMap map = new HashMap();
        StringBuilder sbAppend = new StringBuilder().append(this.A01);
        String strA00 = A00(0, 0, 12);
        map.put(A00(7, 7, 94), sbAppend.append(strA00).toString());
        map.put(A00(0, 7, 55), this.A00 + strA00);
        return map;
    }
}
