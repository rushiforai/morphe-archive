package com.facebook.ads.redexgen.X;

import java.io.EOFException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class V7 {
    public static String[] A07 = {"mW7OOoPen6v8lIS9gRjPOcLgr19PV69b", "4II", "OpY0PDcxd4YQUiLGm1", "pWnzAU", "iBjHb9", "ttct0QJuk4n7ZDwV2TPNE35XfY4Y", "IcvegCSF7knR6vORhUHkyFsVormUfrvR", "Q8IlWw1jKWrGiTCJkPxPTl0LJBPxPB"};
    public long A00;
    public C1195Rd A01;
    public C1195Rd A02;
    public C1195Rd A03;
    public final int A04;
    public final C1084Mk A05 = new C1084Mk(32);
    public final InterfaceC1327Wm A06;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static C1195Rd A04(C1195Rd c1195Rd, T2 t22, V9 v92, C1084Mk c1084Mk) {
        int iA0M;
        long j11 = v92.A01;
        c1084Mk.A0d(1);
        C1195Rd c1195RdA03 = A03(c1195Rd, j11, c1084Mk.A0l(), 1);
        long j12 = j11 + 1;
        byte b11 = c1084Mk.A0l()[0];
        boolean z11 = (b11 & 128) != 0;
        int i5 = b11 & AbstractJsonLexerKt.TC_INVALID;
        C1114No c1114No = t22.A05;
        if (c1114No.A04 == null) {
            c1114No.A04 = new byte[16];
        } else {
            Arrays.fill(c1114No.A04, (byte) 0);
        }
        C1195Rd c1195RdA032 = A03(c1195RdA03, j12, c1114No.A04, i5);
        long j13 = j12 + i5;
        if (z11) {
            c1084Mk.A0d(2);
            c1195RdA032 = A03(c1195RdA032, j13, c1084Mk.A0l(), 2);
            j13 += 2;
            iA0M = c1084Mk.A0M();
        } else {
            iA0M = 1;
        }
        int[] iArr = c1114No.A06;
        if (iArr == null || iArr.length < iA0M) {
            iArr = new int[iA0M];
        }
        int[] iArr2 = c1114No.A07;
        if (iArr2 == null || iArr2.length < iA0M) {
            iArr2 = new int[iA0M];
        }
        if (z11) {
            int i11 = iA0M * 6;
            c1084Mk.A0d(i11);
            c1195RdA032 = A03(c1195RdA032, j13, c1084Mk.A0l(), i11);
            j13 += i11;
            c1084Mk.A0f(0);
            for (int i12 = 0; i12 < iA0M; i12++) {
                iArr[i12] = c1084Mk.A0M();
                iArr2[i12] = c1084Mk.A0L();
            }
        } else {
            iArr[0] = 0;
            iArr2[0] = v92.A00 - ((int) (j13 - v92.A01));
        }
        ZN zn2 = (ZN) N1.A0f(v92.A02);
        c1114No.A02(iA0M, iArr, iArr2, zn2.A03, c1114No.A04, zn2.A01, zn2.A02, zn2.A00);
        int i13 = (int) (j13 - v92.A01);
        v92.A01 += i13;
        v92.A00 -= i13;
        return c1195RdA032;
    }

    public V7(InterfaceC1327Wm interfaceC1327Wm) {
        this.A06 = interfaceC1327Wm;
        this.A04 = interfaceC1327Wm.A8u();
        this.A01 = new C1195Rd(0L, this.A04);
        this.A02 = this.A01;
        this.A03 = this.A01;
    }

    private int A00(int i5) {
        if (this.A03.A03 == null) {
            this.A03.A03(this.A06.A4Z(), new C1195Rd(this.A03.A00, this.A04));
        }
        return Math.min(i5, (int) (this.A03.A00 - this.A00));
    }

    public static C1195Rd A01(C1195Rd c1195Rd, long j11) {
        while (j11 >= c1195Rd.A00) {
            c1195Rd = c1195Rd.A02;
        }
        return c1195Rd;
    }

    public static C1195Rd A02(C1195Rd c1195Rd, long j11, ByteBuffer byteBuffer, int i5) {
        C1195Rd c1195RdA01 = A01(c1195Rd, j11);
        while (i5 > 0) {
            int remaining = (int) (c1195RdA01.A00 - j11);
            int iMin = Math.min(i5, remaining);
            byte[] bArr = c1195RdA01.A03.A01;
            int remaining2 = c1195RdA01.A00(j11);
            byteBuffer.put(bArr, remaining2, iMin);
            i5 -= iMin;
            j11 += iMin;
            if (j11 == c1195RdA01.A00) {
                c1195RdA01 = c1195RdA01.A02;
            }
        }
        return c1195RdA01;
    }

    public static C1195Rd A03(C1195Rd c1195Rd, long j11, byte[] bArr, int i5) {
        C1195Rd c1195RdA01 = A01(c1195Rd, j11);
        int i11 = i5;
        while (i11 > 0) {
            int iMin = Math.min(i11, (int) (c1195RdA01.A00 - j11));
            byte[] bArr2 = c1195RdA01.A03.A01;
            int toCopy = c1195RdA01.A00(j11);
            int remaining = i5 - i11;
            System.arraycopy(bArr2, toCopy, bArr, remaining, iMin);
            i11 -= iMin;
            j11 += iMin;
            if (j11 == c1195RdA01.A00) {
                c1195RdA01 = c1195RdA01.A02;
            }
        }
        return c1195RdA01;
    }

    public static C1195Rd A05(C1195Rd c1195Rd, T2 t22, V9 v92, C1084Mk c1084Mk) {
        if (t22.A0E()) {
            c1195Rd = A04(c1195Rd, t22, v92, c1084Mk);
        }
        if (t22.A03()) {
            c1084Mk.A0d(4);
            C1195Rd c1195RdA03 = A03(c1195Rd, v92.A01, c1084Mk.A0l(), 4);
            int iA0L = c1084Mk.A0L();
            v92.A01 += 4;
            v92.A00 -= 4;
            t22.A0C(iA0L);
            C1195Rd c1195RdA02 = A02(c1195RdA03, v92.A01, t22.A02, iA0L);
            v92.A01 += iA0L;
            v92.A00 -= iA0L;
            t22.A0D(v92.A00);
            return A02(c1195RdA02, v92.A01, t22.A03, v92.A00);
        }
        t22.A0C(v92.A00);
        return A02(c1195Rd, v92.A01, t22.A02, v92.A00);
    }

    private void A06(int i5) {
        this.A00 += i5;
        if (this.A00 == this.A03.A00) {
            this.A03 = this.A03.A02;
        }
    }

    private void A07(C1195Rd c1195Rd) {
        if (c1195Rd.A03 == null) {
            return;
        }
        this.A06.AIs(c1195Rd);
        c1195Rd.A01();
    }

    public final int A08(KR kr2, int i5, boolean z11) throws IOException {
        int i11 = kr2.read(this.A03.A03.A01, this.A03.A00(this.A00), A00(i5));
        if (i11 == -1) {
            if (z11) {
                return -1;
            }
            throw new EOFException();
        }
        A06(i11);
        return i11;
    }

    public final long A09() {
        return this.A00;
    }

    public final void A0A() {
        A07(this.A01);
        this.A01.A02(0L, this.A04);
        this.A02 = this.A01;
        this.A03 = this.A01;
        this.A00 = 0L;
        this.A06.ALn();
    }

    public final void A0B() {
        this.A02 = this.A01;
    }

    public final void A0C(long j11) {
        if (j11 == -1) {
            return;
        }
        while (j11 >= this.A01.A00) {
            InterfaceC1327Wm interfaceC1327Wm = this.A06;
            C1325Wk c1325Wk = this.A01.A03;
            String[] strArr = A07;
            if (strArr[4].length() != strArr[3].length()) {
                throw new RuntimeException();
            }
            A07[1] = "FHIHsn1zJK";
            interfaceC1327Wm.AIr(c1325Wk);
            this.A01 = this.A01.A01();
        }
        if (this.A02.A01 < this.A01.A01) {
            this.A02 = this.A01;
        }
    }

    public final void A0D(C1084Mk c1084Mk, int i5) {
        while (i5 > 0) {
            int iA00 = A00(i5);
            byte[] bArr = this.A03.A03.A01;
            int bytesAppended = this.A03.A00(this.A00);
            c1084Mk.A0k(bArr, bytesAppended, iA00);
            i5 -= iA00;
            A06(iA00);
        }
    }

    public final void A0E(T2 t22, V9 v92) {
        A05(this.A02, t22, v92, this.A05);
    }

    public final void A0F(T2 t22, V9 v92) {
        this.A02 = A05(this.A02, t22, v92, this.A05);
    }
}
