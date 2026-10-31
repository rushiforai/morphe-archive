package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class ZG {
    public static String[] A04 = {"6cfK2SEhcNY0t6O61IIkSh1cdjy9AVTs", "S6FRotj9S3LxkYZUIYwX0cdvC", "aXgbMraHzHmVfTDwRL7UINjwNdtKq6Qj", "iwRpyNVSDVb4jhaYl22seJzB5", "e1e9fmI8GHnDflnZGyuKFj4jIKXXBLJn", "dhtXRyTgGs6WTpWM7DETJJzdxUR7SZQj", "eCD6AOTXSD0hJrKWNappBoXtCFtNYv7T", "WMy6pEJ0P9VZ7a"};
    public int A00;
    public int A01;
    public int A02;
    public byte[] A03;

    public ZG(byte[] bArr, int i5, int i11) {
        A08(bArr, i5, i11);
    }

    private int A00() {
        int i5 = 0;
        while (true) {
            boolean zA0A = A0A();
            if (A04[4].charAt(18) == 't') {
                throw new RuntimeException();
            }
            A04[7] = "eugSG2kUTvqB10uBRDPWNd";
            if (!zA0A) {
                i5++;
            } else {
                int i11 = (1 << i5) - 1;
                int leadingZeros = i5 > 0 ? A05(i5) : 0;
                return i11 + leadingZeros;
            }
        }
    }

    private void A01() {
        AbstractC1062Ln.A08(this.A02 >= 0 && (this.A02 < this.A01 || (this.A02 == this.A01 && this.A00 == 0)));
    }

    private boolean A02(int i5) {
        return 2 <= i5 && i5 < this.A01 && this.A03[i5] == 3 && this.A03[i5 + (-2)] == 0 && this.A03[i5 + (-1)] == 0;
    }

    public final int A03() {
        int iA00 = A00();
        int codeNum = iA00 % 2;
        int i5 = codeNum == 0 ? -1 : 1;
        int codeNum2 = iA00 + 1;
        return i5 * (codeNum2 / 2);
    }

    public final int A04() {
        return A00();
    }

    public final int A05(int i5) {
        int i11 = 0;
        int returnValue = this.A00;
        this.A00 = returnValue + i5;
        while (true) {
            int returnValue2 = this.A00;
            if (returnValue2 <= 8) {
                break;
            }
            int returnValue3 = this.A00;
            this.A00 = returnValue3 - 8;
            byte[] bArr = this.A03;
            int returnValue4 = this.A02;
            int i12 = bArr[returnValue4] & 255;
            int returnValue5 = this.A00;
            i11 |= i12 << returnValue5;
            int i13 = this.A02;
            int returnValue6 = this.A02;
            if (!A02(returnValue6 + 1)) {
                i = 1;
            }
            this.A02 = i13 + i;
        }
        byte[] bArr2 = this.A03;
        int returnValue7 = this.A02;
        int i14 = bArr2[returnValue7] & 255;
        int returnValue8 = this.A00;
        int i15 = i11 | (i14 >> (8 - returnValue8));
        int returnValue9 = (-1) >>> (32 - i5);
        int i16 = i15 & returnValue9;
        int returnValue10 = this.A00;
        if (returnValue10 == 8) {
            this.A00 = 0;
            int i17 = this.A02;
            int returnValue11 = this.A02;
            this.A02 = i17 + (A02(returnValue11 + 1) ? 2 : 1);
        }
        A01();
        return i16;
    }

    public final void A06() {
        int i5 = this.A00 + 1;
        this.A00 = i5;
        if (i5 == 8) {
            this.A00 = 0;
            this.A02 += A02(this.A02 + 1) ? 2 : 1;
        }
        A01();
    }

    /* JADX WARN: Incorrect condition in loop: B:7:0x0026 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A07(int i5) {
        int i11 = this.A02;
        int i12 = i5 / 8;
        int oldByteOffset = this.A02;
        this.A02 = oldByteOffset + i12;
        int numBytes = this.A00;
        int oldByteOffset2 = i12 * 8;
        this.A00 = numBytes + (i5 - oldByteOffset2);
        int numBytes2 = this.A00;
        if (numBytes2 > 7) {
            int oldByteOffset3 = this.A02;
            this.A02 = oldByteOffset3 + 1;
            int oldByteOffset4 = this.A00;
            this.A00 = oldByteOffset4 - 8;
        }
        int numBytes3 = i11 + 1;
        while (numBytes3 <= oldByteOffset) {
            if (A02(numBytes3)) {
                int oldByteOffset5 = this.A02;
                this.A02 = oldByteOffset5 + 1;
                numBytes3 += 2;
            }
            numBytes3++;
        }
        A01();
    }

    public final void A08(byte[] bArr, int i5, int i11) {
        this.A03 = bArr;
        this.A02 = i5;
        this.A01 = i11;
        this.A00 = 0;
        A01();
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0009 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A09() {
        int i5 = this.A02;
        int leadingZeros = this.A00;
        int i11 = 0;
        while (initialBitOffset < initialByteOffset && !A0A()) {
            i11++;
        }
        int initialBitOffset = this.A02;
        int initialByteOffset = this.A01;
        boolean hitLimit = initialBitOffset == initialByteOffset;
        this.A02 = i5;
        this.A00 = leadingZeros;
        int initialBitOffset2 = A04[7].length();
        if (initialBitOffset2 == 20) {
            throw new RuntimeException();
        }
        A04[4] = "qlgz1R2XdR7h8Rrer08PAKYmOrQRjfIL";
        if (hitLimit) {
            return false;
        }
        int initialByteOffset2 = i11 * 2;
        return A0B(initialByteOffset2 + 1);
    }

    public final boolean A0A() {
        boolean returnValue = (this.A03[this.A02] & (128 >> this.A00)) != 0;
        A06();
        return returnValue;
    }

    public final boolean A0B(int i5) {
        int numBytes = this.A02;
        int oldByteOffset = i5 / 8;
        int i11 = this.A02 + oldByteOffset;
        int newBitOffset = (this.A00 + i5) - (oldByteOffset * 8);
        if (newBitOffset > 7) {
            i11++;
            newBitOffset -= 8;
        }
        int i12 = numBytes + 1;
        while (i12 <= i11 && i11 < this.A01) {
            if (A02(i12)) {
                i11++;
                int numBytes2 = A04[5].charAt(21);
                if (numBytes2 == 117) {
                    throw new RuntimeException();
                }
                String[] strArr = A04;
                strArr[2] = "qNIfVaT7niohBV4nPcXHWNnwvet2BOdk";
                strArr[6] = "8WraZM4RorbcJSgLTXU1u2Z8JWtChySX";
                i12 += 2;
            }
            i12++;
        }
        if (i11 >= this.A01) {
            return i11 == this.A01 && newBitOffset == 0;
        }
        return true;
    }
}
