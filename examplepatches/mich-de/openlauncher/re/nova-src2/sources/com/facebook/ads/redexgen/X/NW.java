package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class NW implements InterfaceC1606d7 {
    public static byte[] A08;
    public static String[] A09 = {"JmEbsc8PDIuthiYKkH927G3BUWnJaP", "AoS2xoUqPeDJxRZl9pEgdbhuIqWYsB2Q", "F9cqkCdM8SYm49ifZFpeQEBtOJaYGkWc", "jdTLEoVAH6GIXf3Hn6jlrOvChCkZAAXh", "S7HRxukEAS0DUjdBUU2afpPMC5bFJhxA", "AJVmxyUuXqXRBdqQBLZJH1X0zO", "lnjpNFr4aNvAKLxzoZlBd7PZNaYuCQBL", "JB3FHxgyiSdGs9kxjZQrWdixlPQaTJlo"};
    public int A00;
    public long A01;
    public long A02;
    public final int A03;
    public final VC A04;
    public final InterfaceC1384Yw A05;
    public final ZP A06;
    public final C1608d9 A07;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A08, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A09[5].length() == 31) {
                throw new RuntimeException();
            }
            String[] strArr = A09;
            strArr[1] = "ajAP1O2s8IsFdfezAfqxXs3o2iZOeNt6";
            strArr[6] = "lIP31p4SA4mTRvHnkwRI3tuxM4jTsagG";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
            i13++;
        }
    }

    public static void A01() {
        A08 = new byte[]{21, 14, 73, 65, 90, 20, 14, 103, 90, 82, 71, 65, 86, 71, 70, 2, 64, 78, 77, 65, 73, 2, 81, 75, 88, 71, 24, 2};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1606d7
    public final boolean AKB(Q9 q92, long j11) throws IOException {
        long j12 = j11;
        while (j12 > 0 && this.A00 < this.A03) {
            int iAK7 = this.A06.AK7(q92, (int) Math.min(this.A03 - this.A00, j12), true);
            if (iAK7 == -1) {
                j12 = 0;
            } else {
                this.A00 += iAK7;
                j12 -= iAK7;
            }
        }
        int i5 = this.A07.A02;
        int i11 = this.A00 / i5;
        if (i11 > 0) {
            long jA0U = this.A02 + N1.A0U(this.A01, 1000000L, this.A07.A04);
            int i12 = i11 * i5;
            int i13 = this.A00 - i12;
            this.A06.AKC(jA0U, 1, i12, i13, null);
            this.A01 += i11;
            this.A00 = i13;
        }
        String[] strArr = A09;
        if (strArr[3].charAt(25) == strArr[2].charAt(25)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A09;
        strArr2[1] = "tf7tnqUHUUocL5c3MJMWRmKs6w1tO8Vx";
        strArr2[6] = "teeYafaDrcuEaZLMHqDTHop6vGWCR1YA";
        return j12 <= 0;
    }

    static {
        A01();
    }

    public NW(InterfaceC1384Yw interfaceC1384Yw, ZP zp2, C1608d9 c1608d9, String str, int i5) throws L9 {
        this.A05 = interfaceC1384Yw;
        this.A06 = zp2;
        this.A07 = c1608d9;
        int i11 = (c1608d9.A05 * c1608d9.A01) / 8;
        int bytesPerFrame = c1608d9.A02;
        if (bytesPerFrame == i11) {
            int bytesPerFrame2 = c1608d9.A04;
            int constantBitrate = bytesPerFrame2 * i11 * 8;
            int bytesPerFrame3 = c1608d9.A04;
            this.A03 = Math.max(i11, (bytesPerFrame3 * i11) / 10);
            C1029Ke c1029KeA0j = new C1029Ke().A11(str).A0a(constantBitrate).A0j(constantBitrate);
            int bytesPerFrame4 = this.A03;
            C1029Ke c1029KeA0h = c1029KeA0j.A0h(bytesPerFrame4);
            int bytesPerFrame5 = c1608d9.A05;
            C1029Ke c1029KeA0b = c1029KeA0h.A0b(bytesPerFrame5);
            int bytesPerFrame6 = c1608d9.A04;
            this.A04 = c1029KeA0b.A0m(bytesPerFrame6).A0i(i5).A14();
            return;
        }
        StringBuilder sbAppend = new StringBuilder().append(A00(7, 21, 86)).append(i11).append(A00(0, 7, 90));
        int bytesPerFrame7 = c1608d9.A02;
        throw L9.A01(sbAppend.append(bytesPerFrame7).toString(), null);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1606d7
    public final void AAm(int i5, long j11) {
        this.A05.AKP(new NR(this.A07, 1, i5, j11));
        this.A06.A7E(this.A04);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1606d7
    public final void AK2(long j11) {
        this.A02 = j11;
        this.A00 = 0;
        this.A01 = 0L;
    }
}
