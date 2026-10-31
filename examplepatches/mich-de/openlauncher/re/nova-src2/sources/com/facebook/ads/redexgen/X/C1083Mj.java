package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Mj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1083Mj {
    public static String[] A04 = {"rMt1I356ueIBDE68MYXbn2EVnvts", "wU", "v2Yv3LzPKZXJhbMNQixR4IBvtNHFoSFU", "6OUSCbqiAH8R5VVPkyB4KttvyMfPytLK", "IemrjtbdoaI1kypKaNW4j3lqR9iFNGi3", "zeNTu4R0nEhCkOkh", "jbfJ1c3LKvoINt", "hdOOjyZmlcyyz5KLyPzSXlLetjOh9QLA"};
    public byte[] A00;
    public int A01;
    public int A02;
    public int A03;

    public C1083Mj() {
    }

    public C1083Mj(byte[] bArr) {
        this(bArr, bArr.length);
    }

    public C1083Mj(byte[] bArr, int i5) {
        this.A00 = bArr;
        this.A02 = i5;
    }

    private void A00() {
        boolean z11;
        if (this.A03 < 0) {
            z11 = false;
        } else {
            if (this.A03 >= this.A02) {
                if (this.A03 == this.A02) {
                    int i5 = this.A01;
                    if (A04[7].charAt(22) != 'L') {
                        throw new RuntimeException();
                    }
                    A04[7] = "pJ56PwA6laSZx6xCuhYEOMLokYheYDwQ";
                    if (i5 == 0) {
                    }
                }
                z11 = false;
            }
            z11 = true;
        }
        AbstractC1062Ln.A08(z11);
    }

    public final int A01() {
        return ((this.A02 - this.A03) * 8) - this.A01;
    }

    public final int A02() {
        AbstractC1062Ln.A08(this.A01 == 0);
        return this.A03;
    }

    public final int A03() {
        return (this.A03 * 8) + this.A01;
    }

    public final int A04(int i5) {
        if (i5 == 0) {
            return 0;
        }
        int i11 = 0;
        this.A01 += i5;
        while (this.A01 > 8) {
            this.A01 -= 8;
            byte[] bArr = this.A00;
            int returnValue = this.A03;
            this.A03 = returnValue + 1;
            int i12 = bArr[returnValue] & 255;
            String[] strArr = A04;
            String str = strArr[4];
            String str2 = strArr[2];
            int returnValue2 = str.charAt(27);
            if (returnValue2 != str2.charAt(27)) {
                throw new RuntimeException();
            }
            A04[3] = "Kphbx3dUgKBlMUErkgsMwgfxOw85NZFA";
            i11 |= i12 << this.A01;
        }
        int returnValue3 = this.A00[this.A03] & 255;
        int i13 = i11 | (returnValue3 >> (8 - this.A01));
        int returnValue4 = 32 - i5;
        int i14 = i13 & ((-1) >>> returnValue4);
        if (this.A01 == 8) {
            this.A01 = 0;
            this.A03++;
        }
        A00();
        return i14;
    }

    public final long A05(int i5) {
        if (i5 > 32) {
            return N1.A0N(A04(i5 - 32), A04(32));
        }
        return N1.A0M(A04(i5));
    }

    public final void A06() {
        if (this.A01 == 0) {
            return;
        }
        this.A01 = 0;
        this.A03++;
        A00();
    }

    public final void A07() {
        int i5 = this.A01 + 1;
        this.A01 = i5;
        if (i5 == 8) {
            this.A01 = 0;
            this.A03++;
        }
        A00();
    }

    public final void A08(int i5) {
        this.A03 = i5 / 8;
        this.A01 = i5 - (this.A03 * 8);
        A00();
    }

    public final void A09(int i5) {
        int i11 = i5 / 8;
        int numBytes = this.A03;
        this.A03 = numBytes + i11;
        int numBytes2 = i11 * 8;
        this.A01 += i5 - numBytes2;
        if (this.A01 > 7) {
            int numBytes3 = this.A03;
            this.A03 = numBytes3 + 1;
            int numBytes4 = this.A01;
            this.A01 = numBytes4 - 8;
        }
        A00();
    }

    public final void A0A(int i5) {
        AbstractC1062Ln.A08(this.A01 == 0);
        this.A03 += i5;
        A00();
    }

    public final void A0B(int i5, int i11) {
        if (i11 < 32) {
            int remainingBitsToRead = 1 << i11;
            i5 &= remainingBitsToRead - 1;
        }
        int remainingBitsToRead2 = this.A01;
        int iMin = Math.min(8 - remainingBitsToRead2, i11);
        int remainingBitsToRead3 = this.A01;
        int firstByteInputBits = (8 - remainingBitsToRead3) - iMin;
        int remainingBitsToRead4 = this.A01;
        int i12 = 65280 >> remainingBitsToRead4;
        int remainingBitsToRead5 = 1 << firstByteInputBits;
        int firstByteBitmask = i12 | (remainingBitsToRead5 - 1);
        byte[] bArr = this.A00;
        int i13 = this.A03;
        byte[] bArr2 = this.A00;
        int remainingBitsToRead6 = this.A03;
        bArr[i13] = (byte) (bArr2[remainingBitsToRead6] & firstByteBitmask);
        int remainingBitsToRead7 = i11 - iMin;
        int firstByteBitmask2 = i5 >>> remainingBitsToRead7;
        byte[] bArr3 = this.A00;
        int i14 = this.A03;
        byte[] bArr4 = this.A00;
        int remainingBitsToRead8 = this.A03;
        bArr3[i14] = (byte) (bArr4[remainingBitsToRead8] | (firstByteBitmask2 << firstByteInputBits));
        int firstByteBitmask3 = i11 - iMin;
        int firstByteRightPaddingSize = this.A03;
        int firstByteRightPaddingSize2 = firstByteRightPaddingSize + 1;
        while (firstByteBitmask3 > 8) {
            int firstByteReadSize = firstByteRightPaddingSize2 + 1;
            int remainingBitsToRead9 = firstByteBitmask3 - 8;
            this.A00[firstByteRightPaddingSize2] = (byte) (i5 >>> remainingBitsToRead9);
            firstByteBitmask3 -= 8;
            firstByteRightPaddingSize2 = firstByteReadSize;
        }
        int lastByteRightPaddingSize = 8 - firstByteBitmask3;
        byte[] bArr5 = this.A00;
        int firstByteReadSize2 = this.A00[firstByteRightPaddingSize2];
        int remainingBitsToRead10 = 1 << lastByteRightPaddingSize;
        bArr5[firstByteRightPaddingSize2] = (byte) (firstByteReadSize2 & (remainingBitsToRead10 - 1));
        int remainingBitsToRead11 = 1 << firstByteBitmask3;
        int i15 = i5 & (remainingBitsToRead11 - 1);
        byte[] bArr6 = this.A00;
        int remainingBitsToRead12 = this.A00[firstByteRightPaddingSize2];
        bArr6[firstByteRightPaddingSize2] = (byte) (remainingBitsToRead12 | (i15 << lastByteRightPaddingSize));
        A09(i11);
        A00();
    }

    public final void A0C(C1084Mk c1084Mk) {
        A0E(c1084Mk.A0l(), c1084Mk.A0A());
        A08(c1084Mk.A09() * 8);
    }

    public final void A0D(byte[] bArr) {
        A0E(bArr, bArr.length);
    }

    public final void A0E(byte[] bArr, int i5) {
        this.A00 = bArr;
        this.A03 = 0;
        this.A01 = 0;
        this.A02 = i5;
    }

    public final void A0F(byte[] bArr, int i5, int i11) {
        int i12 = (i11 >> 3) + i5;
        while (i5 < i12) {
            byte[] bArr2 = this.A00;
            int i13 = this.A03;
            int to2 = i13 + 1;
            this.A03 = to2;
            int i14 = bArr2[i13];
            int to3 = this.A01;
            bArr[i5] = (byte) (i14 << to3);
            byte b11 = bArr[i5];
            byte[] bArr3 = this.A00;
            int to4 = this.A03;
            int i15 = 255 & bArr3[to4];
            int to5 = this.A01;
            bArr[i5] = (byte) ((i15 >> (8 - to5)) | b11);
            i5++;
        }
        int i16 = i11 & 7;
        if (i16 == 0) {
            return;
        }
        int bitsLeft = bArr[i12];
        int to6 = 255 >> i16;
        bArr[i12] = (byte) (bitsLeft & to6);
        int to7 = this.A01;
        if (to7 + i16 > 8) {
            byte b12 = bArr[i12];
            byte[] bArr4 = this.A00;
            int bitsLeft2 = this.A03;
            int to8 = bitsLeft2 + 1;
            this.A03 = to8;
            int bitsLeft3 = bArr4[bitsLeft2] & 255;
            int to9 = this.A01;
            bArr[i12] = (byte) (b12 | (bitsLeft3 << to9));
            int to10 = this.A01;
            this.A01 = to10 - 8;
        }
        int to11 = this.A01;
        this.A01 = to11 + i16;
        byte[] bArr5 = this.A00;
        int to12 = this.A03;
        int i17 = 255 & bArr5[to12];
        int to13 = this.A01;
        int i18 = i17 >> (8 - to13);
        int bitsLeft4 = bArr[i12];
        int to14 = 8 - i16;
        bArr[i12] = (byte) (bitsLeft4 | ((byte) (i18 << to14)));
        int to15 = this.A01;
        if (to15 == 8) {
            this.A01 = 0;
            int to16 = this.A03;
            this.A03 = to16 + 1;
        }
        A00();
    }

    public final void A0G(byte[] bArr, int i5, int i11) {
        AbstractC1062Ln.A08(this.A01 == 0);
        System.arraycopy(this.A00, this.A03, bArr, i5, i11);
        int i12 = this.A03 + i11;
        if (A04[3].charAt(16) != 'k') {
            throw new RuntimeException();
        }
        A04[7] = "YNzhZr5BwzwXOMmsuEZqMlLYdAQhAUBX";
        this.A03 = i12;
        A00();
    }

    public final boolean A0H() {
        boolean returnValue = (this.A00[this.A03] & (128 >> this.A01)) != 0;
        A07();
        return returnValue;
    }
}
