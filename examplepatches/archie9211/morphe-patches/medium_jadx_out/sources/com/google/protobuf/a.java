package com.google.protobuf;

import defpackage.sp1;
import defpackage.toe;
import defpackage.v56;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a extends sp1 {
    public final byte[] c;
    public int d;
    public int e;
    public int f;
    public final int g;
    public int h;
    public int i = Integer.MAX_VALUE;

    public a(byte[] bArr, int i, int i2, boolean z) {
        this.c = bArr;
        this.d = i2 + i;
        this.f = i;
        this.g = i;
    }

    @Override // defpackage.sp1
    public final int A() {
        return F();
    }

    @Override // defpackage.sp1
    public final long B() {
        return G();
    }

    @Override // defpackage.sp1
    public final boolean C(int i) throws InvalidProtocolBufferException {
        int iZ;
        int i2 = i & 7;
        int i3 = 0;
        if (i2 == 0) {
            int i4 = this.d - this.f;
            byte[] bArr = this.c;
            if (i4 >= 10) {
                while (i3 < 10) {
                    int i5 = this.f;
                    this.f = i5 + 1;
                    if (bArr[i5] < 0) {
                        i3++;
                    }
                }
                throw InvalidProtocolBufferException.d();
            }
            while (i3 < 10) {
                int i6 = this.f;
                if (i6 == this.d) {
                    throw InvalidProtocolBufferException.g();
                }
                this.f = i6 + 1;
                if (bArr[i6] < 0) {
                    i3++;
                }
            }
            throw InvalidProtocolBufferException.d();
            return true;
        }
        if (i2 == 1) {
            J(8);
            return true;
        }
        if (i2 == 2) {
            J(F());
            return true;
        }
        if (i2 != 3) {
            if (i2 == 4) {
                return false;
            }
            if (i2 != 5) {
                throw InvalidProtocolBufferException.c();
            }
            J(4);
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

    public final int D() throws InvalidProtocolBufferException {
        int i = this.f;
        if (this.d - i < 4) {
            throw InvalidProtocolBufferException.g();
        }
        this.f = i + 4;
        byte[] bArr = this.c;
        return ((bArr[i + 3] & 255) << 24) | (bArr[i] & 255) | ((bArr[i + 1] & 255) << 8) | ((bArr[i + 2] & 255) << 16);
    }

    public final long E() throws InvalidProtocolBufferException {
        int i = this.f;
        if (this.d - i < 8) {
            throw InvalidProtocolBufferException.g();
        }
        this.f = i + 8;
        byte[] bArr = this.c;
        return ((((long) bArr[i + 1]) & 255) << 8) | (((long) bArr[i]) & 255) | ((((long) bArr[i + 2]) & 255) << 16) | ((((long) bArr[i + 3]) & 255) << 24) | ((((long) bArr[i + 4]) & 255) << 32) | ((((long) bArr[i + 5]) & 255) << 40) | ((((long) bArr[i + 6]) & 255) << 48) | ((((long) bArr[i + 7]) & 255) << 56);
    }

    public final int F() {
        int i;
        int i2 = this.f;
        int i3 = this.d;
        if (i3 != i2) {
            int i4 = i2 + 1;
            byte[] bArr = this.c;
            byte b = bArr[i2];
            if (b >= 0) {
                this.f = i4;
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
                this.f = i5;
                return i;
            }
        }
        return (int) H();
    }

    public final long G() {
        long j;
        long j2;
        long j3;
        long j4;
        int i = this.f;
        int i2 = this.d;
        if (i2 != i) {
            int i3 = i + 1;
            byte[] bArr = this.c;
            byte b = bArr[i];
            if (b >= 0) {
                this.f = i3;
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
                this.f = i4;
                return j;
            }
        }
        return H();
    }

    public final long H() throws InvalidProtocolBufferException {
        long j = 0;
        for (int i = 0; i < 64; i += 7) {
            int i2 = this.f;
            if (i2 == this.d) {
                throw InvalidProtocolBufferException.g();
            }
            this.f = i2 + 1;
            byte b = this.c[i2];
            j |= ((long) (b & 127)) << i;
            if ((b & 128) == 0) {
                return j;
            }
        }
        throw InvalidProtocolBufferException.d();
    }

    public final void I() {
        int i = this.d + this.e;
        this.d = i;
        int i2 = i - this.g;
        int i3 = this.i;
        if (i2 <= i3) {
            this.e = 0;
            return;
        }
        int i4 = i2 - i3;
        this.e = i4;
        this.d = i - i4;
    }

    public final void J(int i) throws InvalidProtocolBufferException {
        if (i >= 0) {
            int i2 = this.d;
            int i3 = this.f;
            if (i <= i2 - i3) {
                this.f = i3 + i;
                return;
            }
        }
        if (i >= 0) {
            throw InvalidProtocolBufferException.g();
        }
        throw InvalidProtocolBufferException.e();
    }

    @Override // defpackage.sp1
    public final void a(int i) throws InvalidProtocolBufferException {
        if (this.h != i) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // defpackage.sp1
    public final int d() {
        return this.f - this.g;
    }

    @Override // defpackage.sp1
    public final boolean e() {
        return this.f == this.d;
    }

    @Override // defpackage.sp1
    public final void h(int i) {
        this.i = i;
        I();
    }

    @Override // defpackage.sp1
    public final int i(int i) throws InvalidProtocolBufferException {
        if (i < 0) {
            throw InvalidProtocolBufferException.e();
        }
        int iD = d() + i;
        if (iD < 0) {
            throw InvalidProtocolBufferException.f();
        }
        int i2 = this.i;
        if (iD > i2) {
            throw InvalidProtocolBufferException.g();
        }
        this.i = iD;
        I();
        return i2;
    }

    @Override // defpackage.sp1
    public final boolean j() {
        return G() != 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x002f  */
    @Override // defpackage.sp1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.c21 k() throws com.google.protobuf.InvalidProtocolBufferException {
        /*
            r4 = this;
            int r0 = r4.F()
            byte[] r1 = r4.c
            if (r0 <= 0) goto L19
            int r2 = r4.d
            int r3 = r4.f
            int r2 = r2 - r3
            if (r0 > r2) goto L19
            c21 r1 = defpackage.f21.f(r1, r3, r0)
            int r2 = r4.f
            int r2 = r2 + r0
            r4.f = r2
            return r1
        L19:
            if (r0 != 0) goto L1e
            c21 r4 = defpackage.f21.b
            return r4
        L1e:
            if (r0 <= 0) goto L2f
            int r2 = r4.d
            int r3 = r4.f
            int r2 = r2 - r3
            if (r0 > r2) goto L2f
            int r0 = r0 + r3
            r4.f = r0
            byte[] r4 = java.util.Arrays.copyOfRange(r1, r3, r0)
            goto L35
        L2f:
            if (r0 > 0) goto L42
            if (r0 != 0) goto L3d
            byte[] r4 = defpackage.v56.b
        L35:
            c21 r0 = defpackage.f21.b
            c21 r0 = new c21
            r0.<init>(r4)
            return r0
        L3d:
            com.google.protobuf.InvalidProtocolBufferException r4 = com.google.protobuf.InvalidProtocolBufferException.e()
            throw r4
        L42:
            com.google.protobuf.InvalidProtocolBufferException r4 = com.google.protobuf.InvalidProtocolBufferException.g()
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.protobuf.a.k():c21");
    }

    @Override // defpackage.sp1
    public final double l() {
        return Double.longBitsToDouble(E());
    }

    @Override // defpackage.sp1
    public final int m() {
        return F();
    }

    @Override // defpackage.sp1
    public final int n() {
        return D();
    }

    @Override // defpackage.sp1
    public final long o() {
        return E();
    }

    @Override // defpackage.sp1
    public final float p() {
        return Float.intBitsToFloat(D());
    }

    @Override // defpackage.sp1
    public final int q() {
        return F();
    }

    @Override // defpackage.sp1
    public final long r() {
        return G();
    }

    @Override // defpackage.sp1
    public final int t() {
        return D();
    }

    @Override // defpackage.sp1
    public final long u() {
        return E();
    }

    @Override // defpackage.sp1
    public final int v() {
        return sp1.b(F());
    }

    @Override // defpackage.sp1
    public final long w() {
        return sp1.c(G());
    }

    @Override // defpackage.sp1
    public final String x() throws InvalidProtocolBufferException {
        int iF = F();
        if (iF > 0) {
            int i = this.d;
            int i2 = this.f;
            if (iF <= i - i2) {
                String str = new String(this.c, i2, iF, v56.a);
                this.f += iF;
                return str;
            }
        }
        if (iF == 0) {
            return "";
        }
        if (iF < 0) {
            throw InvalidProtocolBufferException.e();
        }
        throw InvalidProtocolBufferException.g();
    }

    @Override // defpackage.sp1
    public final String y() throws InvalidProtocolBufferException {
        int iF = F();
        if (iF > 0) {
            int i = this.d;
            int i2 = this.f;
            if (iF <= i - i2) {
                String strM = toe.a.m(this.c, i2, iF);
                this.f += iF;
                return strM;
            }
        }
        if (iF == 0) {
            return "";
        }
        if (iF <= 0) {
            throw InvalidProtocolBufferException.e();
        }
        throw InvalidProtocolBufferException.g();
    }

    @Override // defpackage.sp1
    public final int z() throws InvalidProtocolBufferException {
        if (e()) {
            this.h = 0;
            return 0;
        }
        int iF = F();
        this.h = iF;
        if ((iF >>> 3) != 0) {
            return iF;
        }
        throw InvalidProtocolBufferException.a();
    }
}
