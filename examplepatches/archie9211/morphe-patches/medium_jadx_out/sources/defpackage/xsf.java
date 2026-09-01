package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.nio.charset.StandardCharsets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xsf extends up1 {
    public final byte[] d;
    public int e;
    public int f;
    public int g;
    public final int h;
    public int i;
    public int j;

    public xsf(byte[] bArr, int i, int i2) {
        super(3, (byte) 0);
        this.j = Integer.MAX_VALUE;
        this.d = bArr;
        this.e = i2 + i;
        this.g = i;
        this.h = i;
    }

    @Override // defpackage.up1
    public final String B0() throws zzale {
        int iL0 = L0();
        if (iL0 > 0) {
            int i = this.e;
            int i2 = this.g;
            if (iL0 <= i - i2) {
                String strS = fp7.s(this.d, i2, iL0);
                this.g += iL0;
                return strS;
            }
        }
        if (iL0 == 0) {
            return "";
        }
        if (iL0 <= 0) {
            throw zzale.e();
        }
        throw zzale.g();
    }

    @Override // defpackage.up1
    public final boolean C0() {
        return this.g == this.e;
    }

    @Override // defpackage.up1
    public final boolean D0() {
        return H0() != 0;
    }

    public final int E0() {
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
        return (int) J0();
    }

    public final int F0() throws zzale {
        int i = this.g;
        if (this.e - i < 4) {
            throw zzale.g();
        }
        this.g = i + 4;
        byte[] bArr = this.d;
        return ((bArr[i + 3] & 255) << 24) | (bArr[i] & 255) | ((bArr[i + 1] & 255) << 8) | ((bArr[i + 2] & 255) << 16);
    }

    public final long G0() throws zzale {
        int i = this.g;
        if (this.e - i < 8) {
            throw zzale.g();
        }
        this.g = i + 8;
        byte[] bArr = this.d;
        return ((((long) bArr[i + 1]) & 255) << 8) | (((long) bArr[i]) & 255) | ((((long) bArr[i + 2]) & 255) << 16) | ((((long) bArr[i + 3]) & 255) << 24) | ((((long) bArr[i + 4]) & 255) << 32) | ((((long) bArr[i + 5]) & 255) << 40) | ((((long) bArr[i + 6]) & 255) << 48) | ((((long) bArr[i + 7]) & 255) << 56);
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
                                j2 = 266354560;
                            } else {
                                i8 = i + 6;
                                long j7 = j6 ^ (((long) bArr[i4]) << 35);
                                if (j7 < 0) {
                                    j3 = -34093383808L;
                                } else {
                                    i4 = i + 7;
                                    j6 = j7 ^ (((long) bArr[i8]) << 42);
                                    if (j6 >= 0) {
                                        j2 = 4363953127296L;
                                    } else {
                                        i8 = i + 8;
                                        j7 = j6 ^ (((long) bArr[i4]) << 49);
                                        if (j7 < 0) {
                                            j3 = -558586000294016L;
                                        } else {
                                            i4 = i + 9;
                                            j6 = j7 ^ (((long) bArr[i8]) << 56);
                                            if (j6 >= 0) {
                                                j2 = 71499008037633920L;
                                            } else {
                                                int i10 = i + 10;
                                                long j8 = (((long) bArr[i4]) << 63) ^ j6;
                                                if (j8 >= 0) {
                                                    j = j8 ^ (-9151873028817141888L);
                                                    i4 = i10;
                                                }
                                            }
                                        }
                                    }
                                }
                                j4 = j3 ^ j7;
                            }
                            j = j2 ^ j6;
                        }
                        i4 = i8;
                        j = j4;
                    }
                }
                this.g = i4;
                return j;
            }
        }
        return J0();
    }

    public final void I0() {
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

    public final long J0() throws zzale {
        long j = 0;
        for (int i = 0; i < 64; i += 7) {
            int i2 = this.g;
            if (i2 == this.e) {
                throw zzale.g();
            }
            this.g = i2 + 1;
            byte b = this.d[i2];
            j |= ((long) (b & 127)) << i;
            if ((b & 128) == 0) {
                return j;
            }
        }
        throw zzale.d();
    }

    @Override // defpackage.up1
    public final double K() {
        return Double.longBitsToDouble(G0());
    }

    public final int K0() {
        return E0();
    }

    public final int L0() {
        return E0();
    }

    @Override // defpackage.up1
    public final float R() {
        return Float.intBitsToFloat(F0());
    }

    @Override // defpackage.up1
    public final int S(int i) throws zzale {
        if (i < 0) {
            throw zzale.e();
        }
        int iV = V() + i;
        if (iV < 0) {
            throw new zzale("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
        }
        int i2 = this.j;
        if (iV > i2) {
            throw zzale.g();
        }
        this.j = iV;
        I0();
        return i2;
    }

    @Override // defpackage.up1
    public final int V() {
        return this.g - this.h;
    }

    @Override // defpackage.up1
    public final void X(int i) throws zzale {
        if (this.i != i) {
            throw new zzale("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // defpackage.up1
    public final int Z() {
        return K0();
    }

    @Override // defpackage.up1
    public final void a0(int i) {
        this.j = i;
        I0();
    }

    @Override // defpackage.up1
    public final int b0() {
        return F0();
    }

    @Override // defpackage.up1
    public final int d0() {
        return K0();
    }

    @Override // defpackage.up1
    public final int f0() {
        return F0();
    }

    @Override // defpackage.up1
    public final int g0() {
        int iL0 = L0();
        return (-(iL0 & 1)) ^ (iL0 >>> 1);
    }

    @Override // defpackage.up1
    public final int i0() throws zzale {
        if (C0()) {
            this.i = 0;
            return 0;
        }
        int iL0 = L0();
        this.i = iL0;
        if ((iL0 >>> 3) != 0) {
            return iL0;
        }
        throw zzale.b();
    }

    @Override // defpackage.up1
    public final int j0() {
        return L0();
    }

    @Override // defpackage.up1
    public final long l0() {
        return G0();
    }

    @Override // defpackage.up1
    public final long n0() {
        return H0();
    }

    @Override // defpackage.up1
    public final long r0() {
        return G0();
    }

    @Override // defpackage.up1
    public final long t0() {
        return up1.M(H0());
    }

    @Override // defpackage.up1
    public final long v0() {
        return H0();
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x002f  */
    @Override // defpackage.up1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.rsf x0() throws com.google.android.gms.internal.p000firebaseauthapi.zzale {
        /*
            r4 = this;
            int r0 = r4.L0()
            byte[] r1 = r4.d
            if (r0 <= 0) goto L19
            int r2 = r4.e
            int r3 = r4.g
            int r2 = r2 - r3
            if (r0 > r2) goto L19
            rsf r1 = defpackage.hsf.t(r1, r3, r0)
            int r2 = r4.g
            int r2 = r2 + r0
            r4.g = r2
            return r1
        L19:
            if (r0 != 0) goto L1e
            rsf r4 = defpackage.hsf.b
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
            if (r0 > 0) goto L48
            if (r0 != 0) goto L43
            byte[] r4 = defpackage.ztf.a
        L35:
            rsf r0 = defpackage.hsf.b
            int r0 = r4.length
            if (r0 != 0) goto L3d
            rsf r4 = defpackage.hsf.b
            return r4
        L3d:
            rsf r0 = new rsf
            r0.<init>(r4)
            return r0
        L43:
            com.google.android.gms.internal.firebase-auth-api.zzale r4 = com.google.android.gms.internal.p000firebaseauthapi.zzale.e()
            throw r4
        L48:
            com.google.android.gms.internal.firebase-auth-api.zzale r4 = com.google.android.gms.internal.p000firebaseauthapi.zzale.g()
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xsf.x0():rsf");
    }

    @Override // defpackage.up1
    public final String z0() throws zzale {
        int iL0 = L0();
        if (iL0 > 0) {
            int i = this.e;
            int i2 = this.g;
            if (iL0 <= i - i2) {
                String str = new String(this.d, i2, iL0, StandardCharsets.UTF_8);
                this.g += iL0;
                return str;
            }
        }
        if (iL0 == 0) {
            return "";
        }
        if (iL0 < 0) {
            throw zzale.e();
        }
        throw zzale.g();
    }
}
