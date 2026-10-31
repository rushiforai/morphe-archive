package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.cw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1595cw {
    public static byte[] A09;
    public boolean A03;
    public boolean A04;
    public boolean A05;
    public final int A06;
    public final C1092Ms A08 = new C1092Ms(0);
    public long A01 = -9223372036854775807L;
    public long A02 = -9223372036854775807L;
    public long A00 = -9223372036854775807L;
    public final C1084Mk A07 = new C1084Mk();

    static {
        A06();
    }

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 95);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A09 = new byte[]{-104, -118, -65, -35, -45, -40, -47, -118, -66, -77, -73, -81, -55, -65, -72, -67, -81, -66, -118, -45, -40, -35, -34, -49, -53, -50, -104, 37, 74, 82, 61, 72, 69, 64, -4, 64, 81, 78, 61, 80, 69, 75, 74, 22, -4, 35, 66, 19, 68, 65, 48, 67, 56, 62, 61, 33, 52, 48, 51, 52, 65};
    }

    public C1595cw(int i5) {
        this.A06 = i5;
    }

    private int A00(Q9 q92) {
        this.A07.A0i(N1.A07);
        this.A03 = true;
        q92.AK3();
        return 0;
    }

    private int A01(Q9 q92, ZH zh2, int i5) throws IOException {
        int iMin = (int) Math.min(this.A06, q92.A90());
        if (q92.A9Q() != 0) {
            zh2.A00 = 0;
            return 1;
        }
        this.A07.A0d(iMin);
        q92.AK3();
        q92.AI6(this.A07.A0l(), 0, iMin);
        this.A01 = A03(this.A07, i5);
        this.A04 = true;
        return 0;
    }

    private int A02(Q9 q92, ZH zh2, int i5) throws IOException {
        long inputLength = q92.A90();
        int iMin = (int) Math.min(this.A06, inputLength);
        long inputLength2 = inputLength - iMin;
        if (q92.A9Q() != inputLength2) {
            zh2.A00 = inputLength2;
            return 1;
        }
        this.A07.A0d(iMin);
        q92.AK3();
        q92.AI6(this.A07.A0l(), 0, iMin);
        this.A02 = A04(this.A07, i5);
        this.A05 = true;
        return 0;
    }

    private long A03(C1084Mk c1084Mk, int i5) {
        int iA0A = c1084Mk.A0A();
        for (int iA09 = c1084Mk.A09(); iA09 < iA0A; iA09++) {
            int searchEndPosition = c1084Mk.A0l()[iA09];
            if (searchEndPosition == 71) {
                long jA01 = AbstractC1603d4.A01(c1084Mk, iA09, i5);
                if (jA01 != -9223372036854775807L) {
                    return jA01;
                }
            }
        }
        return -9223372036854775807L;
    }

    private long A04(C1084Mk c1084Mk, int i5) {
        int iA09 = c1084Mk.A09();
        int iA0A = c1084Mk.A0A();
        for (int i11 = iA0A - 188; i11 >= iA09; i11--) {
            if (AbstractC1603d4.A03(c1084Mk.A0l(), iA09, iA0A, i11)) {
                long jA01 = AbstractC1603d4.A01(c1084Mk, i11, i5);
                if (jA01 != -9223372036854775807L) {
                    return jA01;
                }
            }
        }
        return -9223372036854775807L;
    }

    public final int A07(Q9 q92, ZH zh2, int i5) throws IOException {
        if (i5 <= 0) {
            return A00(q92);
        }
        if (!this.A05) {
            return A02(q92, zh2, i5);
        }
        if (this.A02 == -9223372036854775807L) {
            return A00(q92);
        }
        if (!this.A04) {
            return A01(q92, zh2, i5);
        }
        if (this.A01 == -9223372036854775807L) {
            return A00(q92);
        }
        this.A00 = this.A08.A06(this.A02) - this.A08.A06(this.A01);
        if (this.A00 < 0) {
            MV.A07(A05(45, 16, 112), A05(27, 18, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE) + this.A00 + A05(0, 27, 11));
            this.A00 = -9223372036854775807L;
        }
        return A00(q92);
    }

    public final long A08() {
        return this.A00;
    }

    public final C1092Ms A09() {
        return this.A08;
    }

    public final boolean A0A() {
        return this.A03;
    }
}
