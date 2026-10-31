package com.facebook.ads.redexgen.X;

import java.io.Serializable;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0V, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C0V<R> implements InterfaceC05590k<R>, Serializable {
    public static byte[] A01;
    public final int A00;

    static {
        A04();
    }

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 30);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A01 = new byte[]{-19, -32, -23, -33, -32, -19, -57, -36, -24, -35, -33, -36, -49, -22, -50, -17, -19, -28, -23, -30, -93, -87, -87, -87, -92};
    }

    public C0V(int i5) {
        this.A00 = i5;
    }

    public final String toString() {
        String strA01 = AbstractC05791e.A01(this);
        C1h.A08(strA01, A03(0, 25, 93));
        return strA01;
    }
}
