package defpackage;

import com.google.android.recaptcha.internal.zzaek;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class smf extends up1 {
    public final wnf d;
    public final byte[] e;
    public int f;
    public int g;
    public int h;
    public int i;
    public int j;
    public int k;

    public /* synthetic */ smf(wnf wnfVar) {
        super(2, (byte) 0);
        this.k = Integer.MAX_VALUE;
        this.d = wnfVar;
        this.e = new byte[4096];
        this.f = 0;
        this.h = 0;
        this.j = 0;
    }

    @Override // defpackage.up1
    public final long A0() {
        return up1.J(K0());
    }

    @Override // defpackage.up1
    public final int D(int i) throws zzaek {
        if (i < 0) {
            ygf.j("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            return 0;
        }
        int i2 = this.j + this.h + i;
        if (i2 < 0) {
            ygf.j("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
            return 0;
        }
        int i3 = this.k;
        if (i2 > i3) {
            ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            return 0;
        }
        this.k = i2;
        P0();
        return i3;
    }

    @Override // defpackage.up1
    public final void E(int i) {
        this.k = i;
        P0();
    }

    public final void E0(int i) throws zzaek {
        if (F0(i)) {
            return;
        }
        if (i > (Integer.MAX_VALUE - this.j) - this.h) {
            ygf.j("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
        } else {
            ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
    }

    @Override // defpackage.up1
    public final boolean F() {
        return this.h == this.f && !F0(1);
    }

    public final boolean F0(int i) throws zzaek {
        wnf wnfVar = this.d;
        int i2 = this.h;
        int i3 = i2 + i;
        int i4 = this.f;
        if (i3 <= i4) {
            ygf.e("refillBuffer() called when ", String.valueOf(i).length() + 66, " bytes were already available in buffer", i);
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
                int i6 = wnfVar.read(bArr, i4, Math.min(4096 - i4, (Integer.MAX_VALUE - i5) - i4));
                if (i6 == 0 || i6 < -1 || i6 > 4096) {
                    String strValueOf = String.valueOf(wnf.class);
                    StringBuilder sb = new StringBuilder(String.valueOf(i6).length() + strValueOf.length() + 39 + 41);
                    sb.append(strValueOf);
                    sb.append("#read(byte[]) returned invalid result: ");
                    sb.append(i6);
                    sb.append("\nThe InputStream implementation is buggy.");
                    throw new IllegalStateException(sb.toString());
                }
                if (i6 > 0) {
                    this.f += i6;
                    P0();
                    if (this.f >= i || F0(i)) {
                        return true;
                    }
                }
            } catch (zzaek e) {
                e.a = true;
                throw e;
            }
        }
        return false;
    }

    @Override // defpackage.up1
    public final int G() {
        return this.j + this.h;
    }

    public final byte[] G0(int i) throws zzaek {
        byte[] bArrH0 = H0(i);
        if (bArrH0 != null) {
            return bArrH0;
        }
        int i2 = this.h;
        int i3 = this.f;
        int i4 = i3 - i2;
        this.j += i3;
        this.h = 0;
        this.f = 0;
        ArrayList<byte[]> arrayListI0 = I0(i - i4);
        byte[] bArr = new byte[i];
        System.arraycopy(this.e, i2, bArr, 0, i4);
        for (byte[] bArr2 : arrayListI0) {
            int length = bArr2.length;
            System.arraycopy(bArr2, 0, bArr, i4, length);
            i4 += length;
        }
        return bArr;
    }

    public final byte[] H0(int i) throws zzaek {
        if (i == 0) {
            return tnf.a;
        }
        int i2 = this.j;
        int i3 = this.h;
        int i4 = i2 + i3 + i;
        if ((-2147483647) + i4 > 0) {
            ygf.j("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
            return null;
        }
        int i5 = this.k;
        if (i4 > i5) {
            O0((i5 - i2) - i3);
            ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            return null;
        }
        int i6 = this.f - i3;
        int i7 = i - i6;
        wnf wnfVar = this.d;
        if (i7 >= 4096) {
            try {
                if (i7 > wnfVar.available()) {
                    return null;
                }
            } catch (zzaek e) {
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
                int i8 = wnfVar.read(bArr, i6, i - i6);
                if (i8 == -1) {
                    ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                    return null;
                }
                this.j += i8;
                i6 += i8;
            } catch (zzaek e2) {
                e2.a = true;
                throw e2;
            }
        }
        return bArr;
    }

    public final ArrayList I0(int i) throws zzaek {
        ArrayList arrayList = new ArrayList();
        while (i > 0) {
            int iMin = Math.min(i, 4096);
            byte[] bArr = new byte[iMin];
            int i2 = 0;
            while (i2 < iMin) {
                try {
                    int i3 = this.d.read(bArr, i2, iMin - i2);
                    if (i3 == -1) {
                        ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                        return null;
                    }
                    this.j += i3;
                    i2 += i3;
                } catch (zzaek e) {
                    e.a = true;
                    throw e;
                }
            }
            i -= iMin;
            arrayList.add(bArr);
        }
        return arrayList;
    }

    public final int J0() {
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
        return (int) L0();
    }

    public final long K0() {
        long j;
        long j2;
        long j3;
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
                    } else {
                        int i8 = i + 4;
                        int i9 = i7 ^ (bArr[i6] << 21);
                        if (i9 < 0) {
                            long j4 = (-2080896) ^ i9;
                            i4 = i8;
                            j = j4;
                        } else {
                            i6 = i + 5;
                            long j5 = ((long) i9) ^ (((long) bArr[i8]) << 28);
                            if (j5 >= 0) {
                                j2 = 266354560;
                            } else {
                                int i10 = i + 6;
                                long j6 = j5 ^ (((long) bArr[i6]) << 35);
                                if (j6 < 0) {
                                    j3 = -34093383808L;
                                } else {
                                    i6 = i + 7;
                                    j5 = j6 ^ (((long) bArr[i10]) << 42);
                                    if (j5 >= 0) {
                                        j2 = 4363953127296L;
                                    } else {
                                        i10 = i + 8;
                                        j6 = j5 ^ (((long) bArr[i6]) << 49);
                                        if (j6 < 0) {
                                            j3 = -558586000294016L;
                                        } else {
                                            i6 = i + 9;
                                            j5 = j6 ^ (((long) bArr[i10]) << 56);
                                            if (j5 >= 0) {
                                                j2 = 71499008037633920L;
                                            } else {
                                                int i11 = i + 10;
                                                long j7 = j5 ^ (((long) bArr[i6]) << 63);
                                                if (j7 >= 0) {
                                                    j = j7 ^ (-9151873028817141888L);
                                                    i4 = i11;
                                                }
                                            }
                                        }
                                    }
                                }
                                j = j6 ^ j3;
                                i4 = i10;
                            }
                            j = j5 ^ j2;
                        }
                    }
                    i4 = i6;
                }
                this.h = i4;
                return j;
            }
        }
        return L0();
    }

    @Override // defpackage.up1
    public final int L() throws zzaek {
        if (F()) {
            this.i = 0;
            return 0;
        }
        int iJ0 = J0();
        this.i = iJ0;
        if ((iJ0 >>> 3) != 0) {
            return iJ0;
        }
        ygf.j("Protocol message contained an invalid tag (zero).");
        return 0;
    }

    public final long L0() throws zzaek {
        long j = 0;
        for (int i = 0; i < 64; i += 7) {
            if (this.h == this.f) {
                E0(1);
            }
            int i2 = this.h;
            this.h = i2 + 1;
            byte b = this.e[i2];
            j |= ((long) (b & 127)) << i;
            if ((b & 128) == 0) {
                return j;
            }
        }
        ygf.j("CodedInputStream encountered a malformed varint.");
        return 0L;
    }

    public final int M0() throws zzaek {
        int i = this.h;
        if (this.f - i < 4) {
            E0(4);
            i = this.h;
        }
        this.h = i + 4;
        byte[] bArr = this.e;
        int i2 = bArr[i] & 255;
        int i3 = bArr[i + 1] & 255;
        int i4 = bArr[i + 2] & 255;
        return ((bArr[i + 3] & 255) << 24) | (i3 << 8) | i2 | (i4 << 16);
    }

    public final long N0() throws zzaek {
        int i = this.h;
        if (this.f - i < 8) {
            E0(8);
            i = this.h;
        }
        this.h = i + 8;
        byte[] bArr = this.e;
        long j = bArr[i];
        long j2 = (((long) bArr[i + 1]) & 255) << 8;
        long j3 = bArr[i + 2];
        long j4 = bArr[i + 3];
        long j5 = bArr[i + 4];
        return ((((long) bArr[i + 7]) & 255) << 56) | j2 | (j & 255) | ((j3 & 255) << 16) | ((j4 & 255) << 24) | ((j5 & 255) << 32) | ((bArr[i + 5] & 255) << 40) | ((bArr[i + 6] & 255) << 48);
    }

    public final void O0(int i) throws zzaek {
        wnf wnfVar = this.d;
        int i2 = this.f;
        int i3 = this.h;
        int i4 = i2 - i3;
        if (i <= i4 && i >= 0) {
            this.h = i3 + i;
            return;
        }
        if (i < 0) {
            ygf.j("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            return;
        }
        int i5 = this.j;
        int i6 = i5 + i3;
        int i7 = this.k;
        if (i6 + i > i7) {
            O0((i7 - i5) - i3);
            ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            return;
        }
        this.j = i6;
        this.f = 0;
        this.h = 0;
        while (i4 < i) {
            long j = i - i4;
            try {
                try {
                    long jSkip = wnfVar.skip(j);
                    if (jSkip < 0 || jSkip > j) {
                        String strValueOf = String.valueOf(wnf.class);
                        StringBuilder sb = new StringBuilder(strValueOf.length() + 31 + String.valueOf(jSkip).length() + 41);
                        sb.append(strValueOf);
                        sb.append("#skip returned invalid result: ");
                        sb.append(jSkip);
                        sb.append("\nThe InputStream implementation is buggy.");
                        throw new IllegalStateException(sb.toString());
                    }
                    if (jSkip == 0) {
                        break;
                    } else {
                        i4 += (int) jSkip;
                    }
                } catch (zzaek e) {
                    e.a = true;
                    throw e;
                }
            } catch (Throwable th) {
                this.j += i4;
                P0();
                throw th;
            }
        }
        this.j += i4;
        P0();
        if (i4 >= i) {
            return;
        }
        int i8 = this.f;
        int i9 = i8 - this.h;
        this.h = i8;
        E0(1);
        while (true) {
            int i10 = i - i9;
            int i11 = this.f;
            if (i10 <= i11) {
                this.h = i10;
                return;
            } else {
                i9 += i11;
                this.h = i11;
                E0(1);
            }
        }
    }

    public final void P0() {
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

    @Override // defpackage.up1
    public final void T() throws zzaek {
        if (this.i == 0) {
            return;
        }
        ygf.j("Protocol message end-group tag did not match expected tag.");
    }

    @Override // defpackage.up1
    public final double U() {
        return Double.longBitsToDouble(N0());
    }

    @Override // defpackage.up1
    public final float Y() {
        return Float.intBitsToFloat(M0());
    }

    @Override // defpackage.up1
    public final long c0() {
        return K0();
    }

    @Override // defpackage.up1
    public final long e0() {
        return K0();
    }

    @Override // defpackage.up1
    public final int f0() {
        return J0();
    }

    @Override // defpackage.up1
    public final long h0() {
        return N0();
    }

    @Override // defpackage.up1
    public final int i0() {
        return M0();
    }

    @Override // defpackage.up1
    public final boolean k0() {
        return K0() != 0;
    }

    @Override // defpackage.up1
    public final String m0() throws zzaek {
        int iJ0 = J0();
        byte[] bArr = this.e;
        if (iJ0 > 0) {
            int i = this.f;
            int i2 = this.h;
            if (iJ0 <= i - i2) {
                String str = new String(bArr, i2, iJ0, StandardCharsets.UTF_8);
                this.h += iJ0;
                return str;
            }
        }
        if (iJ0 == 0) {
            return "";
        }
        if (iJ0 < 0) {
            ygf.j("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            return null;
        }
        if (iJ0 > this.f) {
            return new String(G0(iJ0), StandardCharsets.UTF_8);
        }
        E0(iJ0);
        String str2 = new String(bArr, this.h, iJ0, StandardCharsets.UTF_8);
        this.h += iJ0;
        return str2;
    }

    @Override // defpackage.up1
    public final String o0() throws zzaek {
        int iJ0 = J0();
        int i = this.h;
        int i2 = this.f;
        int i3 = i2 - i;
        byte[] bArrG0 = this.e;
        if (iJ0 <= i3 && iJ0 > 0) {
            this.h = i + iJ0;
        } else {
            if (iJ0 == 0) {
                return "";
            }
            if (iJ0 < 0) {
                ygf.j("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                return null;
            }
            i = 0;
            if (iJ0 <= i2) {
                E0(iJ0);
                this.h = iJ0;
            } else {
                bArrG0 = G0(iJ0);
            }
        }
        return lpf.c(bArrG0, i, iJ0);
    }

    @Override // defpackage.up1
    public final omf p0() throws zzaek {
        int iJ0 = J0();
        int i = this.f;
        int i2 = this.h;
        int i3 = i - i2;
        byte[] bArr = this.e;
        if (iJ0 <= i3 && iJ0 > 0) {
            omf omfVarD = pmf.D(bArr, i2, iJ0);
            this.h += iJ0;
            return omfVarD;
        }
        if (iJ0 == 0) {
            return pmf.b;
        }
        if (iJ0 < 0) {
            ygf.j("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            return null;
        }
        byte[] bArrH0 = H0(iJ0);
        if (bArrH0 != null) {
            return pmf.D(bArrH0, 0, bArrH0.length);
        }
        int i4 = this.h;
        int i5 = this.f;
        int i6 = i5 - i4;
        this.j += i5;
        this.h = 0;
        this.f = 0;
        ArrayList<byte[]> arrayListI0 = I0(iJ0 - i6);
        byte[] bArr2 = new byte[iJ0];
        System.arraycopy(bArr, i4, bArr2, 0, i6);
        for (byte[] bArr3 : arrayListI0) {
            int length = bArr3.length;
            System.arraycopy(bArr3, 0, bArr2, i6, length);
            i6 += length;
        }
        try {
            return iJ0 == 0 ? pmf.b : new omf(bArr2);
        } catch (zzaek e) {
            throw new AssertionError("Expected no InvalidProtocolBufferException as data UTF8 validity is not checked.", e);
        }
    }

    @Override // defpackage.up1
    public final int q0() {
        return J0();
    }

    @Override // defpackage.up1
    public final int s0() {
        return J0();
    }

    @Override // defpackage.up1
    public final int u0() {
        return M0();
    }

    @Override // defpackage.up1
    public final long w0() {
        return N0();
    }

    @Override // defpackage.up1
    public final int y0() {
        return up1.I(J0());
    }
}
