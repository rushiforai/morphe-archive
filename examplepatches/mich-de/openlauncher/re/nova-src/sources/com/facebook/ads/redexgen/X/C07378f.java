package com.facebook.ads.redexgen.X;

import android.net.Uri;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.EOFException;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.8f, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07378f implements Q9 {
    public static String[] A07 = {"NSnLbilPUjcTj06JzEIfGMXhD0l0FhYd", "u7qJdEPLTAj1fLwFI4TIDcQPHh319i", "xHHK7pKSUEJecMw3", "xs1tR1jlgWpWX8uOT6x8GXo2ahz15pgx", "t6B5NiVvuJ632Xc1TESSqSbMpRgb08am", "nCicYR5x", "d", "EcttRbUZvqemmwRQ23UaNYmwdCvKctKD"};
    public int A00;
    public int A01;
    public long A02;
    public byte[] A03;
    public final long A04;
    public final TE A05;
    public final byte[] A06;

    public C07378f(TE te2, long j11, long j12) {
        this(te2, j11, j12, false);
    }

    public C07378f(TE te2, long j11, long j12, boolean z11) {
        this.A05 = te2;
        this.A02 = j11;
        this.A04 = j12;
        this.A03 = new byte[SQLiteDatabase.OPEN_FULLMUTEX];
        this.A06 = new byte[androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT];
    }

    private int A00(int i5) {
        int bytesSkipped = Math.min(this.A00, i5);
        A05(bytesSkipped);
        return bytesSkipped;
    }

    private int A01(byte[] bArr, int i5, int i11) {
        if (this.A00 == 0) {
            return 0;
        }
        int iMin = Math.min(this.A00, i11);
        System.arraycopy(this.A03, 0, bArr, i5, iMin);
        A05(iMin);
        return iMin;
    }

    private int A02(byte[] bArr, int i5, int i11, int i12, boolean z11) throws IOException {
        if (!Thread.interrupted()) {
            int i13 = this.A05.read(bArr, i5 + i12, i11 - i12);
            if (i13 == -1) {
                if (i12 == 0 && z11) {
                    return -1;
                }
                throw new EOFException();
            }
            return i12 + i13;
        }
        throw new InterruptedIOException();
    }

    private void A03(int i5) {
        if (i5 != -1) {
            this.A02 += i5;
        }
    }

    private void A04(int i5) {
        int i11 = this.A01 + i5;
        int requiredLength = this.A03.length;
        if (i11 > requiredLength) {
            int requiredLength2 = this.A03.length;
            int requiredLength3 = 524288 + i11;
            int newPeekCapacity = N1.A07(requiredLength2 * 2, SQLiteDatabase.OPEN_FULLMUTEX + i11, requiredLength3);
            this.A03 = Arrays.copyOf(this.A03, newPeekCapacity);
        }
    }

    private void A05(int i5) {
        this.A00 -= i5;
        this.A01 = 0;
        byte[] bArr = this.A03;
        if (this.A00 < this.A03.length - 524288) {
            bArr = new byte[this.A00 + SQLiteDatabase.OPEN_FULLMUTEX];
        }
        byte[] newPeekBuffer = this.A03;
        System.arraycopy(newPeekBuffer, i5, bArr, 0, this.A00);
        this.A03 = bArr;
    }

    public final boolean A06(int i5, boolean z11) throws IOException {
        int iA00 = A00(i5);
        while (iA00 < i5 && iA00 != -1) {
            int bytesSkipped = this.A06.length;
            iA00 = A02(this.A06, -iA00, Math.min(i5, bytesSkipped + iA00), iA00, z11);
        }
        A03(iA00);
        return iA00 != -1;
    }

    @Override // com.facebook.ads.redexgen.X.Q9
    public final void A4X(int i5) throws IOException {
        A4Y(i5, false);
    }

    @Override // com.facebook.ads.redexgen.X.Q9
    public final boolean A4Y(int i5, boolean z11) throws IOException {
        A04(i5);
        int iA02 = this.A00 - this.A01;
        while (iA02 < i5) {
            iA02 = A02(this.A03, this.A01, i5, iA02, z11);
            if (iA02 == -1) {
                return false;
            }
            int bytesPeeked = this.A01;
            this.A00 = bytesPeeked + iA02;
        }
        int i11 = this.A01 + i5;
        if (A07[7].charAt(14) == 'S') {
            throw new RuntimeException();
        }
        A07[3] = "xqdMk2X1jm5MI0pfv80L2ComanMZ0Kqm";
        this.A01 = i11;
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.Q9
    public final long A90() {
        return this.A04;
    }

    @Override // com.facebook.ads.redexgen.X.Q9
    public final long A9L() {
        return this.A02 + this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.Q9
    public final long A9Q() {
        return this.A02;
    }

    @Override // com.facebook.ads.redexgen.X.Q9
    public final Uri AA2() {
        return this.A05.AA2();
    }

    @Override // com.facebook.ads.redexgen.X.Q9
    public final int AI5(byte[] bArr, int i5, int i11) throws IOException {
        int iMin;
        A04(i11);
        int bytesPeeked = this.A00 - this.A01;
        if (bytesPeeked == 0) {
            iMin = A02(this.A03, this.A01, i11, 0, true);
            if (iMin == -1) {
                return -1;
            }
            int peekBufferRemainingBytes = this.A00;
            this.A00 = peekBufferRemainingBytes + iMin;
        } else {
            iMin = Math.min(i11, bytesPeeked);
        }
        byte[] bArr2 = this.A03;
        int peekBufferRemainingBytes2 = this.A01;
        System.arraycopy(bArr2, peekBufferRemainingBytes2, bArr, i5, iMin);
        int peekBufferRemainingBytes3 = this.A01;
        this.A01 = peekBufferRemainingBytes3 + iMin;
        return iMin;
    }

    @Override // com.facebook.ads.redexgen.X.Q9
    public final void AI6(byte[] bArr, int i5, int i11) throws IOException {
        AI7(bArr, i5, i11, false);
    }

    @Override // com.facebook.ads.redexgen.X.Q9
    public final boolean AI7(byte[] bArr, int i5, int i11, boolean z11) throws IOException {
        if (!A4Y(i11, z11)) {
            return false;
        }
        System.arraycopy(this.A03, this.A01 - i11, bArr, i5, i11);
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.Q9
    public final boolean AIe(byte[] bArr, int i5, int i11, boolean z11) throws IOException {
        int iA01 = A01(bArr, i5, i11);
        while (iA01 < i11 && iA01 != -1) {
            iA01 = A02(bArr, i5, i11, iA01, z11);
        }
        A03(iA01);
        return iA01 != -1;
    }

    @Override // com.facebook.ads.redexgen.X.Q9
    public final void AK3() {
        this.A01 = 0;
    }

    @Override // com.facebook.ads.redexgen.X.Q9
    public final int ALI(int i5) throws IOException {
        int iA00 = A00(i5);
        if (iA00 == 0) {
            byte[] bArr = this.A06;
            int bytesSkipped = this.A06.length;
            iA00 = A02(bArr, 0, Math.min(i5, bytesSkipped), 0, true);
        }
        A03(iA00);
        if (A07[7].charAt(14) == 'S') {
            throw new RuntimeException();
        }
        A07[7] = "NijKbpcTSG97VPyZ2VOYyVvidztZu1Gm";
        return iA00;
    }

    @Override // com.facebook.ads.redexgen.X.Q9
    public final void ALL(int i5) throws IOException {
        A06(i5, false);
    }

    @Override // com.facebook.ads.redexgen.X.Q9, com.facebook.ads.redexgen.X.KR
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        int bytesRead = A01(bArr, i5, i11);
        if (bytesRead == 0) {
            bytesRead = A02(bArr, i5, i11, 0, true);
        }
        A03(bytesRead);
        return bytesRead;
    }

    @Override // com.facebook.ads.redexgen.X.Q9
    public final void readFully(byte[] bArr, int i5, int i11) throws IOException {
        AIe(bArr, i5, i11, false);
    }
}
