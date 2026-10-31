package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Yo, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1376Yo {
    public static byte[] A04;
    public C1371Yi A00;
    public final int A01;
    public final QL A02;
    public final InterfaceC1375Yn A03;

    static {
        A05();
    }

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A04 = new byte[]{51, 20, 12, 27, 22, 19, 30, 90, 25, 27, 9, 31};
    }

    public AbstractC1376Yo(InterfaceC1372Yj interfaceC1372Yj, InterfaceC1375Yn interfaceC1375Yn, long j11, long j12, long j13, long j14, long j15, long j16, int i5) {
        this.A03 = interfaceC1375Yn;
        this.A01 = i5;
        this.A02 = new QL(interfaceC1372Yj, j11, j12, j13, j14, j15, j16);
    }

    private final int A02(Q9 q92, long j11, ZH zh2) {
        if (j11 == q92.A9Q()) {
            return 0;
        }
        zh2.A00 = j11;
        return 1;
    }

    private final C1371Yi A03(long j11) {
        return new C1371Yi(j11, this.A02.A05(j11), this.A02.A05, this.A02.A02, this.A02.A04, this.A02.A01, this.A02.A00);
    }

    private final void A06(boolean z11, long j11) {
        this.A00 = null;
        this.A03.AGz();
    }

    private final boolean A07(Q9 q92, long j11) throws IOException {
        long jA9Q = j11 - q92.A9Q();
        if (jA9Q >= 0 && jA9Q <= 262144) {
            q92.ALL((int) jA9Q);
            return true;
        }
        return false;
    }

    public final int A08(Q9 q92, ZH zh2) throws IOException {
        while (true) {
            C1371Yi c1371Yi = (C1371Yi) AbstractC1062Ln.A02(this.A00);
            long jA01 = c1371Yi.A01();
            long jA00 = c1371Yi.A00();
            long jA02 = c1371Yi.A02();
            if (jA00 - jA01 <= this.A01) {
                A06(false, jA01);
                return A02(q92, jA01, zh2);
            }
            if (!A07(q92, jA02)) {
                return A02(q92, jA02, zh2);
            }
            q92.AK3();
            C1373Yl c1373YlAKE = this.A03.AKE(q92, c1371Yi.A04());
            switch (c1373YlAKE.A00) {
                case -3:
                    A06(false, jA02);
                    return A02(q92, jA02, zh2);
                case -2:
                    c1371Yi.A0D(c1373YlAKE.A02, c1373YlAKE.A01);
                    break;
                case -1:
                    c1371Yi.A0C(c1373YlAKE.A02, c1373YlAKE.A01);
                    break;
                case 0:
                    A07(q92, c1373YlAKE.A01);
                    long floorPosition = c1373YlAKE.A01;
                    A06(true, floorPosition);
                    return A02(q92, c1373YlAKE.A01, zh2);
                default:
                    throw new IllegalStateException(A04(0, 12, 4));
            }
        }
    }

    public final QL A09() {
        return this.A02;
    }

    public final void A0A(long j11) {
        if (this.A00 != null && this.A00.A03() == j11) {
            return;
        }
        this.A00 = A03(j11);
    }

    public final boolean A0B() {
        return this.A00 != null;
    }
}
