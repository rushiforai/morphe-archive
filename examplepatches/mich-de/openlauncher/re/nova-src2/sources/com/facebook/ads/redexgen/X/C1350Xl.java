package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.Xl, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1350Xl {
    public static byte[] A05;
    public final long A00;
    public final long A01;
    public final C1352Xn A02;
    public final C1351Xm A03;
    public final String A04;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 45);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A05 = new byte[]{-26, -52, -34, -32, -26, -34, -25, -19, -58, -34, -19, -38, -35, -38, -19, -38, -99, -125, -92, -103, -109, -101, -107, -94, -124, -94, -111, -109, -101, -124, -87, -96, -107, -23, -48, -18, -35, -33, -25, -54, -35, -23, -31};
    }

    public C1350Xl(String str, long j11, long j12, C1351Xm c1351Xm, C1352Xn c1352Xn) {
        C1h.A09(str, A00(33, 10, 79));
        C1h.A09(c1351Xm, A00(16, 17, 3));
        C1h.A09(c1352Xn, A00(0, 16, 76));
        this.A04 = str;
        this.A01 = j11;
        this.A00 = j12;
        this.A03 = c1351Xm;
        this.A02 = c1352Xn;
    }
}
