package com.facebook.ads.redexgen.X;

import java.io.EOFException;
import java.io.IOException;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Ow, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1148Ow implements InterfaceC1495bK {
    public static byte[] A0C;
    public static String[] A0D = {"pxXqv8XZ1lv3V3TAiNOu4b32SOCX", "IvhjJM88lAoY0Iv4NSmRB0oJb2wBlvep", "KOXuPCAYUg9ZwuQJjGNJqxUqaLdBgsU9", "pPbt2WhJKpCWaEhP4rilJIRVEuPil6gJ", "QO6j9E86YRYSdRU1dSMlNXT9TQkwCzG1", "gzLdA0AJppetxdsiu", "rYSr0TiCLEg", "0oeUFKSTvhO7Epcmu"};
    public int A00;
    public long A01;
    public long A02;
    public long A03;
    public long A04;
    public long A05;
    public long A06;
    public long A07;
    public final long A08;
    public final long A09;
    public final C1494bJ A0A;
    public final AbstractC1498bN A0B;

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 5);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        A0C = new byte[]{-71, -38, -117, -38, -46, -46, -117, -37, -52, -46, -48, -117, -50, -52, -39, -117, -51, -48, -117, -47, -38, -32, -39, -49, -103};
    }

    static {
        A08();
    }

    public C1148Ow(AbstractC1498bN abstractC1498bN, long j11, long j12, long j13, long j14, boolean z11) {
        AbstractC1062Ln.A07(j11 >= 0 && j12 > j11);
        this.A0B = abstractC1498bN;
        this.A09 = j11;
        this.A08 = j12;
        if (j13 == j12 - j11 || z11) {
            this.A07 = j14;
            this.A00 = 4;
        } else {
            this.A00 = 0;
        }
        this.A0A = new C1494bJ();
    }

    private long A00(Q9 q92) throws IOException {
        if (this.A04 == this.A01) {
            return -1L;
        }
        long jA9Q = q92.A9Q();
        if (this.A0A.A04(q92, this.A01)) {
            this.A0A.A05(q92, false);
            q92.AK3();
            long j11 = this.A06 - this.A0A.A05;
            int i5 = this.A0A.A01;
            String[] strArr = A0D;
            if (strArr[2].charAt(1) == strArr[4].charAt(1)) {
                A0D[0] = "j4F1uB3VO7nGScrsD42BkqddT8o7";
                int pageSize = i5 + this.A0A.A00;
                if (0 <= j11) {
                    String[] strArr2 = A0D;
                    if (strArr2[1].charAt(6) != strArr2[3].charAt(6)) {
                        A0D[6] = "BFBkQlcfNzz";
                        if (j11 < 72000) {
                            return -1L;
                        }
                    }
                }
                if (j11 >= 0) {
                    this.A04 = q92.A9Q() + pageSize;
                    this.A05 = this.A0A.A05;
                } else {
                    this.A01 = jA9Q;
                    this.A02 = this.A0A.A05;
                }
                if (this.A01 - this.A04 < 100000) {
                    this.A01 = this.A04;
                    return this.A04;
                }
                long jA9Q2 = q92.A9Q() - (pageSize * (j11 <= 0 ? 2L : 1L));
                long j12 = (this.A01 - this.A04) * j11;
                long currentPosition = this.A02;
                return N1.A0T(jA9Q2 + (j12 / (currentPosition - this.A05)), this.A04, this.A01 - 1);
            }
        } else if (this.A04 != jA9Q) {
            long j13 = this.A04;
            String[] strArr3 = A0D;
            if (strArr3[5].length() == strArr3[7].length()) {
                String[] strArr4 = A0D;
                strArr4[5] = "ZEZcJDudWr2f0D2oU";
                strArr4[7] = "H1vsfBkcR7OLJUG4g";
                return j13;
            }
        } else {
            throw new IOException(A07(0, 25, 102));
        }
        throw new RuntimeException();
    }

    private final long A01(Q9 q92) throws IOException {
        this.A0A.A02();
        if (this.A0A.A03(q92)) {
            this.A0A.A05(q92, false);
            q92.ALL(this.A0A.A01 + this.A0A.A00);
            long j11 = this.A0A.A05;
            while ((this.A0A.A04 & 4) != 4 && this.A0A.A03(q92) && q92.A9Q() < this.A08) {
                if (!this.A0A.A05(q92, true) || !AbstractC1385Yx.A02(q92, this.A0A.A01 + this.A0A.A00)) {
                    return j11;
                }
                j11 = this.A0A.A05;
            }
            return j11;
        }
        throw new EOFException();
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1495bK
    /* renamed from: A05, reason: merged with bridge method [inline-methods] */
    public final P1 A68() {
        C1492bH c1492bH = null;
        if (this.A07 != 0) {
            return new P1(this);
        }
        return null;
    }

    private void A09(Q9 q92) throws IOException {
        while (true) {
            this.A0A.A03(q92);
            this.A0A.A05(q92, false);
            if (this.A0A.A05 > this.A06) {
                q92.AK3();
                return;
            }
            q92.ALL(this.A0A.A01 + this.A0A.A00);
            long jA9Q = q92.A9Q();
            if (A0D[0].length() != 28) {
                throw new RuntimeException();
            }
            String[] strArr = A0D;
            strArr[5] = "UiaJRTLcs1IqfyThs";
            strArr[7] = "JvJRO8g745V0qqbtm";
            this.A04 = jA9Q;
            this.A05 = this.A0A.A05;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1495bK
    public final long AIa(Q9 q92) throws IOException {
        switch (this.A00) {
            case 0:
                this.A03 = q92.A9Q();
                this.A00 = 1;
                long j11 = this.A08 - 65307;
                if (j11 > this.A03) {
                    return j11;
                }
            case 1:
                long jA01 = A01(q92);
                if (A0D[0].length() != 28) {
                    this.A07 = jA01;
                    this.A00 = 4;
                    return this.A03;
                }
                String[] strArr = A0D;
                strArr[2] = "XOVhCwVBkB4cmNhHRmEpfZl2KOPkU4BK";
                strArr[4] = "cOO16OsTShhrr75VuwDUlTlxDPGBlV6N";
                this.A07 = jA01;
                this.A00 = 4;
                return this.A03;
            case 2:
                long jA00 = A00(q92);
                String[] strArr2 = A0D;
                if (strArr2[2].charAt(1) != strArr2[4].charAt(1)) {
                    throw new RuntimeException();
                }
                A0D[6] = "dYXJNgIcoJn";
                if (jA00 != -1) {
                    return jA00;
                }
                this.A00 = 3;
            case 3:
                A09(q92);
                this.A00 = 4;
                return -(this.A05 + 2);
            case 4:
                return -1L;
            default:
                throw new IllegalStateException();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1495bK
    public final void ALV(long j11) {
        this.A06 = N1.A0T(j11, 0L, this.A07 - 1);
        this.A00 = 2;
        this.A04 = this.A09;
        this.A01 = this.A08;
        this.A05 = 0L;
        this.A02 = this.A07;
    }
}
