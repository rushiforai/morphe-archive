package com.google.protobuf;

import defpackage.c21;
import defpackage.ev6;
import defpackage.f21;
import defpackage.sp1;
import defpackage.toe;
import defpackage.v56;
import defpackage.ygf;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b extends sp1 {
    public final InputStream c;
    public final byte[] d;
    public int e;
    public int f;
    public int g;
    public int h;
    public int i;
    public int j = Integer.MAX_VALUE;

    public b(InputStream inputStream) {
        v56.a("input", inputStream);
        this.c = inputStream;
        this.d = new byte[4096];
        this.e = 0;
        this.g = 0;
        this.i = 0;
    }

    @Override // defpackage.sp1
    public final int A() {
        return I();
    }

    @Override // defpackage.sp1
    public final long B() {
        return J();
    }

    @Override // defpackage.sp1
    public final boolean C(int i) throws InvalidProtocolBufferException {
        int iZ;
        int i2 = i & 7;
        int i3 = 0;
        if (i2 == 0) {
            int i4 = this.e - this.g;
            byte[] bArr = this.d;
            if (i4 >= 10) {
                while (i3 < 10) {
                    int i5 = this.g;
                    this.g = i5 + 1;
                    if (bArr[i5] < 0) {
                        i3++;
                    }
                }
                throw InvalidProtocolBufferException.d();
            }
            while (i3 < 10) {
                if (this.g == this.e) {
                    M(1);
                }
                int i6 = this.g;
                this.g = i6 + 1;
                if (bArr[i6] < 0) {
                    i3++;
                }
            }
            throw InvalidProtocolBufferException.d();
            return true;
        }
        if (i2 == 1) {
            N(8);
            return true;
        }
        if (i2 == 2) {
            N(I());
            return true;
        }
        if (i2 != 3) {
            if (i2 == 4) {
                return false;
            }
            if (i2 != 5) {
                throw InvalidProtocolBufferException.c();
            }
            N(4);
            return true;
        }
        do {
            iZ = z();
            if (iZ == 0) {
                break;
            }
        } while (C(iZ));
        a(((i >>> 3) << 3) | 4);
        return true;
    }

    public final byte[] D(int i) throws IOException {
        byte[] bArrE = E(i);
        if (bArrE != null) {
            return bArrE;
        }
        int i2 = this.g;
        int i3 = this.e;
        int length = i3 - i2;
        this.i += i3;
        this.g = 0;
        this.e = 0;
        ArrayList<byte[]> arrayListF = F(i - length);
        byte[] bArr = new byte[i];
        System.arraycopy(this.d, i2, bArr, 0, length);
        for (byte[] bArr2 : arrayListF) {
            System.arraycopy(bArr2, 0, bArr, length, bArr2.length);
            length += bArr2.length;
        }
        return bArr;
    }

    public final byte[] E(int i) throws IOException {
        if (i == 0) {
            return v56.b;
        }
        if (i < 0) {
            throw InvalidProtocolBufferException.e();
        }
        int i2 = this.i;
        int i3 = this.g;
        int i4 = i2 + i3 + i;
        if (i4 - Integer.MAX_VALUE > 0) {
            throw new InvalidProtocolBufferException("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit.");
        }
        int i5 = this.j;
        if (i4 > i5) {
            N((i5 - i2) - i3);
            throw InvalidProtocolBufferException.g();
        }
        int i6 = this.e - i3;
        int i7 = i - i6;
        InputStream inputStream = this.c;
        if (i7 >= 4096) {
            try {
                if (i7 > inputStream.available()) {
                    return null;
                }
            } catch (InvalidProtocolBufferException e) {
                e.a = true;
                throw e;
            }
        }
        byte[] bArr = new byte[i];
        System.arraycopy(this.d, this.g, bArr, 0, i6);
        this.i += this.e;
        this.g = 0;
        this.e = 0;
        while (i6 < i) {
            try {
                int i8 = inputStream.read(bArr, i6, i - i6);
                if (i8 == -1) {
                    throw InvalidProtocolBufferException.g();
                }
                this.i += i8;
                i6 += i8;
            } catch (InvalidProtocolBufferException e2) {
                e2.a = true;
                throw e2;
            }
        }
        return bArr;
    }

    public final ArrayList F(int i) throws IOException {
        ArrayList arrayList = new ArrayList();
        while (i > 0) {
            int iMin = Math.min(i, 4096);
            byte[] bArr = new byte[iMin];
            int i2 = 0;
            while (i2 < iMin) {
                int i3 = this.c.read(bArr, i2, iMin - i2);
                if (i3 == -1) {
                    throw InvalidProtocolBufferException.g();
                }
                this.i += i3;
                i2 += i3;
            }
            i -= iMin;
            arrayList.add(bArr);
        }
        return arrayList;
    }

    public final int G() throws InvalidProtocolBufferException {
        int i = this.g;
        if (this.e - i < 4) {
            M(4);
            i = this.g;
        }
        this.g = i + 4;
        byte[] bArr = this.d;
        return ((bArr[i + 3] & 255) << 24) | (bArr[i] & 255) | ((bArr[i + 1] & 255) << 8) | ((bArr[i + 2] & 255) << 16);
    }

    public final long H() throws InvalidProtocolBufferException {
        int i = this.g;
        if (this.e - i < 8) {
            M(8);
            i = this.g;
        }
        this.g = i + 8;
        byte[] bArr = this.d;
        return ((((long) bArr[i + 1]) & 255) << 8) | (((long) bArr[i]) & 255) | ((((long) bArr[i + 2]) & 255) << 16) | ((((long) bArr[i + 3]) & 255) << 24) | ((((long) bArr[i + 4]) & 255) << 32) | ((((long) bArr[i + 5]) & 255) << 40) | ((((long) bArr[i + 6]) & 255) << 48) | ((((long) bArr[i + 7]) & 255) << 56);
    }

    public final int I() {
        int i;
        int i2 = this.g;
        int i3 = this.e;
        if (i3 != i2) {
            int i4 = i2 + 1;
            byte[] bArr = this.d;
            byte b = bArr[i2];
            if (b >= 0) {
                this.g = i4;
                return b;
            }
            if (i3 - i4 >= 9) {
                int i5 = i2 + 2;
                int i6 = (bArr[i4] << 7) ^ b;
                if (i6 < 0) {
                    i = i6 ^ (-128);
                } else {
                    int i7 = i2 + 3;
                    int i8 = (bArr[i5] << 14) ^ i6;
                    if (i8 >= 0) {
                        i = i8 ^ 16256;
                    } else {
                        int i9 = i2 + 4;
                        int i10 = i8 ^ (bArr[i7] << 21);
                        if (i10 < 0) {
                            i = (-2080896) ^ i10;
                        } else {
                            i7 = i2 + 5;
                            byte b2 = bArr[i9];
                            int i11 = (i10 ^ (b2 << 28)) ^ 266354560;
                            if (b2 < 0) {
                                i9 = i2 + 6;
                                if (bArr[i7] < 0) {
                                    i7 = i2 + 7;
                                    if (bArr[i9] < 0) {
                                        i9 = i2 + 8;
                                        if (bArr[i7] < 0) {
                                            i7 = i2 + 9;
                                            if (bArr[i9] < 0) {
                                                int i12 = i2 + 10;
                                                if (bArr[i7] >= 0) {
                                                    i5 = i12;
                                                    i = i11;
                                                }
                                            }
                                        }
                                    }
                                }
                                i = i11;
                            }
                            i = i11;
                        }
                        i5 = i9;
                    }
                    i5 = i7;
                }
                this.g = i5;
                return i;
            }
        }
        return (int) K();
    }

    public final long J() {
        long j;
        long j2;
        long j3;
        long j4;
        int i = this.g;
        int i2 = this.e;
        if (i2 != i) {
            int i3 = i + 1;
            byte[] bArr = this.d;
            byte b = bArr[i];
            if (b >= 0) {
                this.g = i3;
                return b;
            }
            if (i2 - i3 >= 9) {
                int i4 = i + 2;
                int i5 = (bArr[i3] << 7) ^ b;
                if (i5 < 0) {
                    j = i5 ^ (-128);
                } else {
                    int i6 = i + 3;
                    int i7 = (bArr[i4] << 14) ^ i5;
                    if (i7 >= 0) {
                        j = i7 ^ 16256;
                        i4 = i6;
                    } else {
                        int i8 = i + 4;
                        int i9 = i7 ^ (bArr[i6] << 21);
                        if (i9 < 0) {
                            j4 = (-2080896) ^ i9;
                        } else {
                            long j5 = i9;
                            i4 = i + 5;
                            long j6 = j5 ^ (((long) bArr[i8]) << 28);
                            if (j6 >= 0) {
                                j3 = 266354560;
                            } else {
                                i8 = i + 6;
                                long j7 = j6 ^ (((long) bArr[i4]) << 35);
                                if (j7 < 0) {
                                    j2 = -34093383808L;
                                } else {
                                    i4 = i + 7;
                                    j6 = j7 ^ (((long) bArr[i8]) << 42);
                                    if (j6 >= 0) {
                                        j3 = 4363953127296L;
                                    } else {
                                        i8 = i + 8;
                                        j7 = j6 ^ (((long) bArr[i4]) << 49);
                                        if (j7 < 0) {
                                            j2 = -558586000294016L;
                                        } else {
                                            i4 = i + 9;
                                            long j8 = (j7 ^ (((long) bArr[i8]) << 56)) ^ 71499008037633920L;
                                            if (j8 < 0) {
                                                int i10 = i + 10;
                                                if (bArr[i4] >= 0) {
                                                    i4 = i10;
                                                }
                                            }
                                            j = j8;
                                        }
                                    }
                                }
                                j4 = j2 ^ j7;
                            }
                            j = j3 ^ j6;
                        }
                        i4 = i8;
                        j = j4;
                    }
                }
                this.g = i4;
                return j;
            }
        }
        return K();
    }

    public final long K() throws InvalidProtocolBufferException {
        long j = 0;
        for (int i = 0; i < 64; i += 7) {
            if (this.g == this.e) {
                M(1);
            }
            int i2 = this.g;
            this.g = i2 + 1;
            byte b = this.d[i2];
            j |= ((long) (b & 127)) << i;
            if ((b & 128) == 0) {
                return j;
            }
        }
        throw InvalidProtocolBufferException.d();
    }

    public final void L() {
        int i = this.e + this.f;
        this.e = i;
        int i2 = this.i + i;
        int i3 = this.j;
        if (i2 <= i3) {
            this.f = 0;
            return;
        }
        int i4 = i2 - i3;
        this.f = i4;
        this.e = i - i4;
    }

    public final void M(int i) throws InvalidProtocolBufferException {
        if (O(i)) {
            return;
        }
        if (i <= (Integer.MAX_VALUE - this.i) - this.g) {
            throw InvalidProtocolBufferException.g();
        }
        throw new InvalidProtocolBufferException("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit.");
    }

    public final void N(int i) throws InvalidProtocolBufferException {
        int i2 = this.e;
        int i3 = this.g;
        if (i <= i2 - i3 && i >= 0) {
            this.g = i3 + i;
            return;
        }
        InputStream inputStream = this.c;
        if (i < 0) {
            throw InvalidProtocolBufferException.e();
        }
        int i4 = this.i;
        int i5 = i4 + i3;
        int i6 = i5 + i;
        int i7 = this.j;
        if (i6 > i7) {
            N((i7 - i4) - i3);
            throw InvalidProtocolBufferException.g();
        }
        this.i = i5;
        int i8 = i2 - i3;
        this.e = 0;
        this.g = 0;
        while (i8 < i) {
            long j = i - i8;
            try {
                try {
                    long jSkip = inputStream.skip(j);
                    if (jSkip < 0 || jSkip > j) {
                        throw new IllegalStateException(inputStream.getClass() + "#skip returned invalid result: " + jSkip + "\nThe InputStream implementation is buggy.");
                    }
                    if (jSkip == 0) {
                        break;
                    } else {
                        i8 += (int) jSkip;
                    }
                } catch (InvalidProtocolBufferException e) {
                    e.a = true;
                    throw e;
                }
            } catch (Throwable th) {
                this.i += i8;
                L();
                throw th;
            }
        }
        this.i += i8;
        L();
        if (i8 >= i) {
            return;
        }
        int i9 = this.e;
        int i10 = i9 - this.g;
        this.g = i9;
        M(1);
        while (true) {
            int i11 = i - i10;
            int i12 = this.e;
            if (i11 <= i12) {
                this.g = i11;
                return;
            } else {
                i10 += i12;
                this.g = i12;
                M(1);
            }
        }
    }

    public final boolean O(int i) throws IOException {
        InputStream inputStream = this.c;
        int i2 = this.g;
        int i3 = i2 + i;
        int i4 = this.e;
        if (i3 <= i4) {
            ygf.f(ev6.w("refillBuffer() called when ", i, " bytes were already available in buffer"));
            return false;
        }
        int i5 = this.i;
        if (i <= (Integer.MAX_VALUE - i5) - i2 && i5 + i2 + i <= this.j) {
            byte[] bArr = this.d;
            if (i2 > 0) {
                if (i4 > i2) {
                    System.arraycopy(bArr, i2, bArr, 0, i4 - i2);
                }
                i5 = this.i + i2;
                this.i = i5;
                i4 = this.e - i2;
                this.e = i4;
                this.g = 0;
            }
            try {
                int i6 = inputStream.read(bArr, i4, Math.min(bArr.length - i4, (Integer.MAX_VALUE - i5) - i4));
                if (i6 == 0 || i6 < -1 || i6 > bArr.length) {
                    throw new IllegalStateException(inputStream.getClass() + "#read(byte[]) returned invalid result: " + i6 + "\nThe InputStream implementation is buggy.");
                }
                if (i6 > 0) {
                    this.e += i6;
                    L();
                    if (this.e >= i) {
                        return true;
                    }
                    return O(i);
                }
            } catch (InvalidProtocolBufferException e) {
                e.a = true;
                throw e;
            }
        }
        return false;
    }

    @Override // defpackage.sp1
    public final void a(int i) throws InvalidProtocolBufferException {
        if (this.h != i) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // defpackage.sp1
    public final int d() {
        return this.i + this.g;
    }

    @Override // defpackage.sp1
    public final boolean e() {
        return this.g == this.e && !O(1);
    }

    @Override // defpackage.sp1
    public final void h(int i) {
        this.j = i;
        L();
    }

    @Override // defpackage.sp1
    public final int i(int i) throws InvalidProtocolBufferException {
        if (i < 0) {
            throw InvalidProtocolBufferException.e();
        }
        int i2 = this.i + this.g + i;
        int i3 = this.j;
        if (i2 > i3) {
            throw InvalidProtocolBufferException.g();
        }
        this.j = i2;
        L();
        return i3;
    }

    @Override // defpackage.sp1
    public final boolean j() {
        return J() != 0;
    }

    @Override // defpackage.sp1
    public final c21 k() throws IOException {
        int I = I();
        int i = this.e;
        int i2 = this.g;
        int i3 = i - i2;
        byte[] bArr = this.d;
        if (I <= i3 && I > 0) {
            c21 c21VarF = f21.f(bArr, i2, I);
            this.g += I;
            return c21VarF;
        }
        if (I == 0) {
            return f21.b;
        }
        byte[] bArrE = E(I);
        if (bArrE != null) {
            return f21.f(bArrE, 0, bArrE.length);
        }
        int i4 = this.g;
        int i5 = this.e;
        int length = i5 - i4;
        this.i += i5;
        this.g = 0;
        this.e = 0;
        ArrayList<byte[]> arrayListF = F(I - length);
        byte[] bArr2 = new byte[I];
        System.arraycopy(bArr, i4, bArr2, 0, length);
        for (byte[] bArr3 : arrayListF) {
            System.arraycopy(bArr3, 0, bArr2, length, bArr3.length);
            length += bArr3.length;
        }
        c21 c21Var = f21.b;
        return new c21(bArr2);
    }

    @Override // defpackage.sp1
    public final double l() {
        return Double.longBitsToDouble(H());
    }

    @Override // defpackage.sp1
    public final int m() {
        return I();
    }

    @Override // defpackage.sp1
    public final int n() {
        return G();
    }

    @Override // defpackage.sp1
    public final long o() {
        return H();
    }

    @Override // defpackage.sp1
    public final float p() {
        return Float.intBitsToFloat(G());
    }

    @Override // defpackage.sp1
    public final int q() {
        return I();
    }

    @Override // defpackage.sp1
    public final long r() {
        return J();
    }

    @Override // defpackage.sp1
    public final int t() {
        return G();
    }

    @Override // defpackage.sp1
    public final long u() {
        return H();
    }

    @Override // defpackage.sp1
    public final int v() {
        return sp1.b(I());
    }

    @Override // defpackage.sp1
    public final long w() {
        return sp1.c(J());
    }

    @Override // defpackage.sp1
    public final String x() throws InvalidProtocolBufferException {
        int I = I();
        byte[] bArr = this.d;
        if (I > 0) {
            int i = this.e;
            int i2 = this.g;
            if (I <= i - i2) {
                String str = new String(bArr, i2, I, v56.a);
                this.g += I;
                return str;
            }
        }
        if (I == 0) {
            return "";
        }
        if (I > this.e) {
            return new String(D(I), v56.a);
        }
        M(I);
        String str2 = new String(bArr, this.g, I, v56.a);
        this.g += I;
        return str2;
    }

    @Override // defpackage.sp1
    public final String y() throws IOException {
        int I = I();
        int i = this.g;
        int i2 = this.e;
        int i3 = i2 - i;
        byte[] bArrD = this.d;
        if (I <= i3 && I > 0) {
            this.g = i + I;
        } else {
            if (I == 0) {
                return "";
            }
            i = 0;
            if (I <= i2) {
                M(I);
                this.g = I;
            } else {
                bArrD = D(I);
            }
        }
        return toe.a.m(bArrD, i, I);
    }

    @Override // defpackage.sp1
    public final int z() throws InvalidProtocolBufferException {
        if (e()) {
            this.h = 0;
            return 0;
        }
        int I = I();
        this.h = I;
        if ((I >>> 3) != 0) {
            return I;
        }
        throw InvalidProtocolBufferException.a();
    }
}
