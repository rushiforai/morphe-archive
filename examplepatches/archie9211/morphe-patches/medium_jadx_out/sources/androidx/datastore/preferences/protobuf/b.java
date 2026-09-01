package androidx.datastore.preferences.protobuf;

import defpackage.uoe;
import defpackage.up1;
import defpackage.x56;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b extends up1 {
    public final byte[] d;
    public int e;
    public int f;
    public int g;
    public final int h;
    public int i;
    public int j;

    public b(byte[] bArr, int i, int i2, boolean z) {
        super(0, (byte) 0);
        this.j = Integer.MAX_VALUE;
        this.d = bArr;
        this.e = i2 + i;
        this.g = i;
        this.h = i;
    }

    @Override // defpackage.up1
    public final long A() {
        return H0();
    }

    @Override // defpackage.up1
    public final boolean B(int i) throws InvalidProtocolBufferException {
        int i2 = i & 7;
        int i3 = 0;
        if (i2 != 0) {
            if (i2 == 1) {
                K0(8);
                return true;
            }
            if (i2 == 2) {
                K0(G0());
                return true;
            }
            if (i2 == 3) {
                C();
                a(((i >>> 3) << 3) | 4);
                return true;
            }
            if (i2 == 4) {
                return false;
            }
            if (i2 != 5) {
                throw InvalidProtocolBufferException.b();
            }
            K0(4);
            return true;
        }
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
            throw InvalidProtocolBufferException.c();
        }
        while (i3 < 10) {
            int i6 = this.g;
            if (i6 == this.e) {
                throw InvalidProtocolBufferException.e();
            }
            this.g = i6 + 1;
            if (bArr[i6] < 0) {
                i3++;
            }
        }
        throw InvalidProtocolBufferException.c();
        return true;
    }

    public final int E0() throws InvalidProtocolBufferException {
        int i = this.g;
        if (this.e - i < 4) {
            throw InvalidProtocolBufferException.e();
        }
        this.g = i + 4;
        byte[] bArr = this.d;
        return ((bArr[i + 3] & 255) << 24) | (bArr[i] & 255) | ((bArr[i + 1] & 255) << 8) | ((bArr[i + 2] & 255) << 16);
    }

    public final long F0() throws InvalidProtocolBufferException {
        int i = this.g;
        if (this.e - i < 8) {
            throw InvalidProtocolBufferException.e();
        }
        this.g = i + 8;
        byte[] bArr = this.d;
        return ((((long) bArr[i + 1]) & 255) << 8) | (((long) bArr[i]) & 255) | ((((long) bArr[i + 2]) & 255) << 16) | ((((long) bArr[i + 3]) & 255) << 24) | ((((long) bArr[i + 4]) & 255) << 32) | ((((long) bArr[i + 5]) & 255) << 40) | ((((long) bArr[i + 6]) & 255) << 48) | ((((long) bArr[i + 7]) & 255) << 56);
    }

    public final int G0() {
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
        return (int) I0();
    }

    public final long H0() {
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
        return I0();
    }

    public final long I0() throws InvalidProtocolBufferException {
        long j = 0;
        for (int i = 0; i < 64; i += 7) {
            int i2 = this.g;
            if (i2 == this.e) {
                throw InvalidProtocolBufferException.e();
            }
            this.g = i2 + 1;
            byte b = this.d[i2];
            j |= ((long) (b & 127)) << i;
            if ((b & 128) == 0) {
                return j;
            }
        }
        throw InvalidProtocolBufferException.c();
    }

    public final void J0() {
        int i = this.e + this.f;
        this.e = i;
        int i2 = i - this.h;
        int i3 = this.j;
        if (i2 <= i3) {
            this.f = 0;
            return;
        }
        int i4 = i2 - i3;
        this.f = i4;
        this.e = i - i4;
    }

    public final void K0(int i) throws InvalidProtocolBufferException {
        if (i >= 0) {
            int i2 = this.e;
            int i3 = this.g;
            if (i <= i2 - i3) {
                this.g = i3 + i;
                return;
            }
        }
        if (i >= 0) {
            throw InvalidProtocolBufferException.e();
        }
        throw InvalidProtocolBufferException.d();
    }

    @Override // defpackage.up1
    public final void a(int i) throws InvalidProtocolBufferException {
        if (this.i != i) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // defpackage.up1
    public final int b() {
        return this.g - this.h;
    }

    @Override // defpackage.up1
    public final boolean c() {
        return this.g == this.e;
    }

    @Override // defpackage.up1
    public final void h(int i) {
        this.j = i;
        J0();
    }

    @Override // defpackage.up1
    public final int i(int i) {
        if (i < 0) {
            throw InvalidProtocolBufferException.d();
        }
        int iB = b() + i;
        if (iB < 0) {
            throw new InvalidProtocolBufferException("Failed to parse the message.");
        }
        int i2 = this.j;
        if (iB > i2) {
            throw InvalidProtocolBufferException.e();
        }
        this.j = iB;
        J0();
        return i2;
    }

    @Override // defpackage.up1
    public final boolean j() {
        return H0() != 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x002f  */
    @Override // defpackage.up1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.d21 k() throws androidx.datastore.preferences.protobuf.InvalidProtocolBufferException {
        /*
            r4 = this;
            int r0 = r4.G0()
            byte[] r1 = r4.d
            if (r0 <= 0) goto L19
            int r2 = r4.e
            int r3 = r4.g
            int r2 = r2 - r3
            if (r0 > r2) goto L19
            d21 r1 = defpackage.d21.f(r1, r3, r0)
            int r2 = r4.g
            int r2 = r2 + r0
            r4.g = r2
            return r1
        L19:
            if (r0 != 0) goto L1e
            d21 r4 = defpackage.d21.c
            return r4
        L1e:
            if (r0 <= 0) goto L2f
            int r2 = r4.e
            int r3 = r4.g
            int r2 = r2 - r3
            if (r0 > r2) goto L2f
            int r0 = r0 + r3
            r4.g = r0
            byte[] r4 = java.util.Arrays.copyOfRange(r1, r3, r0)
            goto L35
        L2f:
            if (r0 > 0) goto L42
            if (r0 != 0) goto L3d
            byte[] r4 = defpackage.x56.b
        L35:
            d21 r0 = defpackage.d21.c
            d21 r0 = new d21
            r0.<init>(r4)
            return r0
        L3d:
            androidx.datastore.preferences.protobuf.InvalidProtocolBufferException r4 = androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.d()
            throw r4
        L42:
            androidx.datastore.preferences.protobuf.InvalidProtocolBufferException r4 = androidx.datastore.preferences.protobuf.InvalidProtocolBufferException.e()
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.datastore.preferences.protobuf.b.k():d21");
    }

    @Override // defpackage.up1
    public final double l() {
        return Double.longBitsToDouble(F0());
    }

    @Override // defpackage.up1
    public final int m() {
        return G0();
    }

    @Override // defpackage.up1
    public final int n() {
        return E0();
    }

    @Override // defpackage.up1
    public final long o() {
        return F0();
    }

    @Override // defpackage.up1
    public final float p() {
        return Float.intBitsToFloat(E0());
    }

    @Override // defpackage.up1
    public final int q() {
        return G0();
    }

    @Override // defpackage.up1
    public final long r() {
        return H0();
    }

    @Override // defpackage.up1
    public final int s() {
        return E0();
    }

    @Override // defpackage.up1
    public final long t() {
        return F0();
    }

    @Override // defpackage.up1
    public final int u() {
        int iG0 = G0();
        return (-(iG0 & 1)) ^ (iG0 >>> 1);
    }

    @Override // defpackage.up1
    public final long v() {
        long jH0 = H0();
        return (-(jH0 & 1)) ^ (jH0 >>> 1);
    }

    @Override // defpackage.up1
    public final String w() throws InvalidProtocolBufferException {
        int iG0 = G0();
        if (iG0 > 0) {
            int i = this.e;
            int i2 = this.g;
            if (iG0 <= i - i2) {
                String str = new String(this.d, i2, iG0, x56.a);
                this.g += iG0;
                return str;
            }
        }
        if (iG0 == 0) {
            return "";
        }
        if (iG0 < 0) {
            throw InvalidProtocolBufferException.d();
        }
        throw InvalidProtocolBufferException.e();
    }

    @Override // defpackage.up1
    public final String x() throws InvalidProtocolBufferException {
        int iG0 = G0();
        if (iG0 > 0) {
            int i = this.e;
            int i2 = this.g;
            if (iG0 <= i - i2) {
                String strM = uoe.a.m(this.d, i2, iG0);
                this.g += iG0;
                return strM;
            }
        }
        if (iG0 == 0) {
            return "";
        }
        if (iG0 <= 0) {
            throw InvalidProtocolBufferException.d();
        }
        throw InvalidProtocolBufferException.e();
    }

    @Override // defpackage.up1
    public final int y() throws InvalidProtocolBufferException {
        if (c()) {
            this.i = 0;
            return 0;
        }
        int iG0 = G0();
        this.i = iG0;
        if ((iG0 >>> 3) != 0) {
            return iG0;
        }
        throw new InvalidProtocolBufferException("Protocol message contained an invalid tag (zero).");
    }

    @Override // defpackage.up1
    public final int z() {
        return G0();
    }
}
