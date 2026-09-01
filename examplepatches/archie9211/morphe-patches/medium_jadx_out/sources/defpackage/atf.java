package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class atf extends up1 {
    public final ByteArrayInputStream d;
    public final byte[] e;
    public int f;
    public int g;
    public int h;
    public int i;
    public int j;
    public int k;

    public atf(ByteArrayInputStream byteArrayInputStream) {
        super(3, (byte) 0);
        this.k = Integer.MAX_VALUE;
        byte[] bArr = ztf.a;
        this.d = byteArrayInputStream;
        this.e = new byte[4096];
        this.f = 0;
        this.h = 0;
        this.j = 0;
    }

    @Override // defpackage.up1
    public final String B0() throws IOException {
        int iF0 = F0();
        int i = this.h;
        int i2 = this.f;
        int i3 = i2 - i;
        byte[] bArrE0 = this.e;
        if (iF0 <= i3 && iF0 > 0) {
            this.h = i + iF0;
        } else {
            if (iF0 == 0) {
                return "";
            }
            if (iF0 < 0) {
                throw zzale.e();
            }
            i = 0;
            if (iF0 <= i2) {
                K0(iF0);
                this.h = iF0;
            } else {
                bArrE0 = E0(iF0);
            }
        }
        return fp7.s(bArrE0, i, iF0);
    }

    @Override // defpackage.up1
    public final boolean C0() {
        return this.h == this.f && !M0(1);
    }

    @Override // defpackage.up1
    public final boolean D0() {
        return H0() != 0;
    }

    public final byte[] E0(int i) throws IOException {
        byte[] bArrN0 = N0(i);
        if (bArrN0 != null) {
            return bArrN0;
        }
        int i2 = this.h;
        int i3 = this.f;
        int length = i3 - i2;
        this.j += i3;
        this.h = 0;
        this.f = 0;
        ArrayList<byte[]> arrayListJ0 = J0(i - length);
        byte[] bArr = new byte[i];
        System.arraycopy(this.e, i2, bArr, 0, length);
        for (byte[] bArr2 : arrayListJ0) {
            System.arraycopy(bArr2, 0, bArr, length, bArr2.length);
            length += bArr2.length;
        }
        return bArr;
    }

    public final int F0() {
        int i;
        int i2 = this.h;
        int i3 = this.f;
        if (i3 != i2) {
            int i4 = i2 + 1;
            byte[] bArr = this.e;
            byte b = bArr[i2];
            if (b >= 0) {
                this.h = i4;
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
                this.h = i5;
                return i;
            }
        }
        return (int) O0();
    }

    public final long G0() throws zzale {
        int i = this.h;
        if (this.f - i < 8) {
            K0(8);
            i = this.h;
        }
        this.h = i + 8;
        byte[] bArr = this.e;
        return ((((long) bArr[i + 1]) & 255) << 8) | (((long) bArr[i]) & 255) | ((((long) bArr[i + 2]) & 255) << 16) | ((((long) bArr[i + 3]) & 255) << 24) | ((((long) bArr[i + 4]) & 255) << 32) | ((((long) bArr[i + 5]) & 255) << 40) | ((((long) bArr[i + 6]) & 255) << 48) | ((((long) bArr[i + 7]) & 255) << 56);
    }

    public final long H0() {
        long j;
        long j2;
        long j3;
        long j4;
        int i = this.h;
        int i2 = this.f;
        if (i2 != i) {
            int i3 = i + 1;
            byte[] bArr = this.e;
            byte b = bArr[i];
            if (b >= 0) {
                this.h = i3;
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
                this.h = i4;
                return j;
            }
        }
        return O0();
    }

    public final void I0() {
        int i = this.f + this.g;
        this.f = i;
        int i2 = this.j + i;
        int i3 = this.k;
        if (i2 <= i3) {
            this.g = 0;
            return;
        }
        int i4 = i2 - i3;
        this.g = i4;
        this.f = i - i4;
    }

    public final ArrayList J0(int i) throws IOException {
        ArrayList arrayList = new ArrayList();
        while (i > 0) {
            int iMin = Math.min(i, 4096);
            byte[] bArr = new byte[iMin];
            int i2 = 0;
            while (i2 < iMin) {
                try {
                    int i3 = this.d.read(bArr, i2, iMin - i2);
                    if (i3 == -1) {
                        throw zzale.g();
                    }
                    this.j += i3;
                    i2 += i3;
                } catch (zzale e) {
                    e.a = true;
                    throw e;
                }
            }
            i -= iMin;
            arrayList.add(bArr);
        }
        return arrayList;
    }

    @Override // defpackage.up1
    public final double K() {
        return Double.longBitsToDouble(G0());
    }

    public final void K0(int i) throws zzale {
        if (M0(i)) {
            return;
        }
        if (i <= (Integer.MAX_VALUE - this.j) - this.h) {
            throw zzale.g();
        }
        throw new zzale("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
    }

    public final void L0(int i) throws zzale {
        ByteArrayInputStream byteArrayInputStream = this.d;
        int i2 = this.f;
        int i3 = this.h;
        int i4 = i2 - i3;
        if (i <= i4 && i >= 0) {
            this.h = i3 + i;
            return;
        }
        if (i < 0) {
            throw zzale.e();
        }
        int i5 = this.j;
        int i6 = i5 + i3;
        int i7 = i6 + i;
        int i8 = this.k;
        if (i7 > i8) {
            L0((i8 - i5) - i3);
            throw zzale.g();
        }
        this.j = i6;
        this.f = 0;
        this.h = 0;
        while (i4 < i) {
            long j = i - i4;
            try {
                try {
                    long jSkip = byteArrayInputStream.skip(j);
                    if (jSkip >= 0 && jSkip <= j) {
                        if (jSkip == 0) {
                            break;
                        } else {
                            i4 += (int) jSkip;
                        }
                    } else {
                        throw new IllegalStateException(String.valueOf(byteArrayInputStream.getClass()) + "#skip returned invalid result: " + jSkip + "\nThe InputStream implementation is buggy.");
                    }
                } catch (zzale e) {
                    e.a = true;
                    throw e;
                }
            } catch (Throwable th) {
                this.j += i4;
                I0();
                throw th;
            }
        }
        this.j += i4;
        I0();
        if (i4 >= i) {
            return;
        }
        int i9 = this.f;
        int i10 = i9 - this.h;
        this.h = i9;
        K0(1);
        while (true) {
            int i11 = i - i10;
            int i12 = this.f;
            if (i11 <= i12) {
                this.h = i11;
                return;
            } else {
                i10 += i12;
                this.h = i12;
                K0(1);
            }
        }
    }

    public final boolean M0(int i) throws IOException {
        ByteArrayInputStream byteArrayInputStream = this.d;
        int i2 = this.h;
        int i3 = i2 + i;
        int i4 = this.f;
        if (i3 <= i4) {
            ygf.f(ev6.w("refillBuffer() called when ", i, " bytes were already available in buffer"));
            return false;
        }
        int i5 = this.j;
        if (i <= (Integer.MAX_VALUE - i5) - i2 && i5 + i2 + i <= this.k) {
            byte[] bArr = this.e;
            if (i2 > 0) {
                if (i4 > i2) {
                    System.arraycopy(bArr, i2, bArr, 0, i4 - i2);
                }
                i5 = this.j + i2;
                this.j = i5;
                i4 = this.f - i2;
                this.f = i4;
                this.h = 0;
            }
            try {
                int i6 = byteArrayInputStream.read(bArr, i4, Math.min(bArr.length - i4, (Integer.MAX_VALUE - i5) - i4));
                if (i6 == 0 || i6 < -1 || i6 > bArr.length) {
                    throw new IllegalStateException(String.valueOf(byteArrayInputStream.getClass()) + "#read(byte[]) returned invalid result: " + i6 + "\nThe InputStream implementation is buggy.");
                }
                if (i6 > 0) {
                    this.f += i6;
                    I0();
                    if (this.f >= i || M0(i)) {
                        return true;
                    }
                }
            } catch (zzale e) {
                e.a = true;
                throw e;
            }
        }
        return false;
    }

    public final byte[] N0(int i) throws IOException {
        if (i == 0) {
            return ztf.a;
        }
        if (i < 0) {
            throw zzale.e();
        }
        int i2 = this.j;
        int i3 = this.h;
        int i4 = i2 + i3 + i;
        if (i4 - Integer.MAX_VALUE > 0) {
            throw new zzale("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
        }
        int i5 = this.k;
        if (i4 > i5) {
            L0((i5 - i2) - i3);
            throw zzale.g();
        }
        int i6 = this.f - i3;
        int i7 = i - i6;
        ByteArrayInputStream byteArrayInputStream = this.d;
        if (i7 >= 4096) {
            try {
                if (i7 > byteArrayInputStream.available()) {
                    return null;
                }
            } catch (zzale e) {
                e.a = true;
                throw e;
            }
        }
        byte[] bArr = new byte[i];
        System.arraycopy(this.e, this.h, bArr, 0, i6);
        this.j += this.f;
        this.h = 0;
        this.f = 0;
        while (i6 < i) {
            try {
                int i8 = byteArrayInputStream.read(bArr, i6, i - i6);
                if (i8 == -1) {
                    throw zzale.g();
                }
                this.j += i8;
                i6 += i8;
            } catch (zzale e2) {
                e2.a = true;
                throw e2;
            }
        }
        return bArr;
    }

    public final long O0() throws zzale {
        long j = 0;
        for (int i = 0; i < 64; i += 7) {
            if (this.h == this.f) {
                K0(1);
            }
            int i2 = this.h;
            this.h = i2 + 1;
            byte b = this.e[i2];
            j |= ((long) (b & 127)) << i;
            if ((b & 128) == 0) {
                return j;
            }
        }
        throw zzale.d();
    }

    public final int P0() throws zzale {
        int i = this.h;
        if (this.f - i < 4) {
            K0(4);
            i = this.h;
        }
        this.h = i + 4;
        byte[] bArr = this.e;
        return ((bArr[i + 3] & 255) << 24) | (bArr[i] & 255) | ((bArr[i + 1] & 255) << 8) | ((bArr[i + 2] & 255) << 16);
    }

    @Override // defpackage.up1
    public final float R() {
        return Float.intBitsToFloat(P0());
    }

    @Override // defpackage.up1
    public final int S(int i) throws zzale {
        if (i < 0) {
            throw zzale.e();
        }
        int i2 = this.j + this.h + i;
        if (i2 < 0) {
            throw new zzale("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
        }
        int i3 = this.k;
        if (i2 > i3) {
            throw zzale.g();
        }
        this.k = i2;
        I0();
        return i3;
    }

    @Override // defpackage.up1
    public final int V() {
        return this.j + this.h;
    }

    @Override // defpackage.up1
    public final void X(int i) throws zzale {
        if (this.i != i) {
            throw new zzale("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // defpackage.up1
    public final int Z() {
        return F0();
    }

    @Override // defpackage.up1
    public final void a0(int i) {
        this.k = i;
        I0();
    }

    @Override // defpackage.up1
    public final int b0() {
        return P0();
    }

    @Override // defpackage.up1
    public final int d0() {
        return F0();
    }

    @Override // defpackage.up1
    public final int f0() {
        return P0();
    }

    @Override // defpackage.up1
    public final int g0() {
        int iF0 = F0();
        return (-(iF0 & 1)) ^ (iF0 >>> 1);
    }

    @Override // defpackage.up1
    public final int i0() throws zzale {
        if (C0()) {
            this.i = 0;
            return 0;
        }
        int iF0 = F0();
        this.i = iF0;
        if ((iF0 >>> 3) != 0) {
            return iF0;
        }
        throw zzale.b();
    }

    @Override // defpackage.up1
    public final int j0() {
        return F0();
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

    @Override // defpackage.up1
    public final rsf x0() throws IOException {
        int iF0 = F0();
        int i = this.f;
        int i2 = this.h;
        int i3 = i - i2;
        byte[] bArr = this.e;
        if (iF0 <= i3 && iF0 > 0) {
            rsf rsfVarT = hsf.t(bArr, i2, iF0);
            this.h += iF0;
            return rsfVarT;
        }
        if (iF0 == 0) {
            return hsf.b;
        }
        if (iF0 < 0) {
            throw zzale.e();
        }
        byte[] bArrN0 = N0(iF0);
        if (bArrN0 != null) {
            return hsf.t(bArrN0, 0, bArrN0.length);
        }
        int i4 = this.h;
        int i5 = this.f;
        int length = i5 - i4;
        this.j += i5;
        this.h = 0;
        this.f = 0;
        ArrayList<byte[]> arrayListJ0 = J0(iF0 - length);
        byte[] bArr2 = new byte[iF0];
        System.arraycopy(bArr, i4, bArr2, 0, length);
        for (byte[] bArr3 : arrayListJ0) {
            System.arraycopy(bArr3, 0, bArr2, length, bArr3.length);
            length += bArr3.length;
        }
        try {
            rsf rsfVar = hsf.b;
            return iF0 == 0 ? hsf.b : new rsf(bArr2);
        } catch (zzale e) {
            throw new AssertionError("Expected no InvalidProtocolBufferException as data UTF8 validity is not checked.", e);
        }
    }

    @Override // defpackage.up1
    public final String z0() throws zzale {
        int iF0 = F0();
        byte[] bArr = this.e;
        if (iF0 > 0) {
            int i = this.f;
            int i2 = this.h;
            if (iF0 <= i - i2) {
                String str = new String(bArr, i2, iF0, StandardCharsets.UTF_8);
                this.h += iF0;
                return str;
            }
        }
        if (iF0 == 0) {
            return "";
        }
        if (iF0 < 0) {
            throw zzale.e();
        }
        if (iF0 > this.f) {
            return new String(E0(iF0), StandardCharsets.UTF_8);
        }
        K0(iF0);
        String str2 = new String(bArr, this.h, iF0, StandardCharsets.UTF_8);
        this.h += iF0;
        return str2;
    }
}
