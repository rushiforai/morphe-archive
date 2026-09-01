package defpackage;

import com.google.android.recaptcha.internal.zzaek;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class rmf extends up1 {
    public final byte[] d;
    public final int e;
    public int f;
    public int g;
    public final int h;
    public int i;
    public int j;

    public /* synthetic */ rmf(byte[] bArr, int i, int i2) {
        super(2, (byte) 0);
        this.j = Integer.MAX_VALUE;
        this.d = bArr;
        int i3 = i2 + i;
        this.e = i3;
        this.f = i3;
        this.g = i;
        this.h = i;
    }

    @Override // defpackage.up1
    public final long A0() {
        return up1.J(F0());
    }

    @Override // defpackage.up1
    public final int D(int i) throws zzaek {
        if (i < 0) {
            ygf.j("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            return 0;
        }
        int i2 = this.g;
        int i3 = this.h;
        int i4 = (i2 - i3) + i;
        if (i4 < 0) {
            ygf.j("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
            return 0;
        }
        int i5 = this.j;
        if (i4 > i5) {
            ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            return 0;
        }
        this.j = i4;
        int i6 = this.e;
        if (i4 <= i6 - i3) {
            this.f = i4 + i3;
            return i5;
        }
        this.f = i6;
        return i5;
    }

    @Override // defpackage.up1
    public final void E(int i) {
        this.j = i;
        int i2 = this.e;
        int i3 = this.h;
        if (i <= i2 - i3) {
            this.f = i + i3;
        } else {
            this.f = i2;
        }
    }

    public final int E0() {
        int i;
        int i2 = this.g;
        int i3 = this.f;
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
        return (int) G0();
    }

    @Override // defpackage.up1
    public final boolean F() {
        return this.g == this.f;
    }

    public final long F0() {
        long j;
        long j2;
        long j3;
        int i = this.g;
        int i2 = this.f;
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
                this.g = i4;
                return j;
            }
        }
        return G0();
    }

    @Override // defpackage.up1
    public final int G() {
        return this.g - this.h;
    }

    public final long G0() throws zzaek {
        long j = 0;
        for (int i = 0; i < 64; i += 7) {
            int i2 = this.g;
            if (i2 == this.f) {
                ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                return 0L;
            }
            this.g = i2 + 1;
            byte b = this.d[i2];
            j |= ((long) (b & 127)) << i;
            if ((b & 128) == 0) {
                return j;
            }
        }
        ygf.j("CodedInputStream encountered a malformed varint.");
        return 0L;
    }

    public final int H0() throws zzaek {
        int i = this.g;
        if (this.f - i < 4) {
            ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            return 0;
        }
        this.g = i + 4;
        byte[] bArr = this.d;
        int i2 = bArr[i] & 255;
        int i3 = bArr[i + 1] & 255;
        int i4 = bArr[i + 2] & 255;
        return ((bArr[i + 3] & 255) << 24) | (i3 << 8) | i2 | (i4 << 16);
    }

    public final long I0() throws zzaek {
        int i = this.g;
        if (this.f - i < 8) {
            ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            return 0L;
        }
        this.g = i + 8;
        byte[] bArr = this.d;
        long j = bArr[i];
        long j2 = (((long) bArr[i + 1]) & 255) << 8;
        long j3 = bArr[i + 2];
        long j4 = bArr[i + 3];
        long j5 = bArr[i + 4];
        return ((((long) bArr[i + 7]) & 255) << 56) | j2 | (j & 255) | ((j3 & 255) << 16) | ((j4 & 255) << 24) | ((j5 & 255) << 32) | ((bArr[i + 5] & 255) << 40) | ((bArr[i + 6] & 255) << 48);
    }

    @Override // defpackage.up1
    public final int L() throws zzaek {
        if (F()) {
            this.i = 0;
            return 0;
        }
        int iE0 = E0();
        this.i = iE0;
        if ((iE0 >>> 3) != 0) {
            return iE0;
        }
        ygf.j("Protocol message contained an invalid tag (zero).");
        return 0;
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
        return Double.longBitsToDouble(I0());
    }

    @Override // defpackage.up1
    public final float Y() {
        return Float.intBitsToFloat(H0());
    }

    @Override // defpackage.up1
    public final long c0() {
        return F0();
    }

    @Override // defpackage.up1
    public final long e0() {
        return F0();
    }

    @Override // defpackage.up1
    public final int f0() {
        return E0();
    }

    @Override // defpackage.up1
    public final long h0() {
        return I0();
    }

    @Override // defpackage.up1
    public final int i0() {
        return H0();
    }

    @Override // defpackage.up1
    public final boolean k0() {
        return F0() != 0;
    }

    @Override // defpackage.up1
    public final String m0() throws zzaek {
        int iE0 = E0();
        if (iE0 > 0) {
            int i = this.f;
            int i2 = this.g;
            if (iE0 <= i - i2) {
                String str = new String(this.d, i2, iE0, StandardCharsets.UTF_8);
                this.g += iE0;
                return str;
            }
        }
        if (iE0 == 0) {
            return "";
        }
        if (iE0 < 0) {
            ygf.j("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            return null;
        }
        ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        return null;
    }

    @Override // defpackage.up1
    public final omf p0() throws zzaek {
        int iE0 = E0();
        byte[] bArr = this.d;
        if (iE0 > 0) {
            int i = this.f;
            int i2 = this.g;
            if (iE0 <= i - i2) {
                omf omfVarD = pmf.D(bArr, i2, iE0);
                this.g += iE0;
                return omfVarD;
            }
        }
        if (iE0 == 0) {
            return pmf.b;
        }
        if (iE0 > 0) {
            int i3 = this.f;
            int i4 = this.g;
            if (iE0 <= i3 - i4) {
                int i5 = iE0 + i4;
                this.g = i5;
                byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr, i4, i5);
                omf omfVar = pmf.b;
                return bArrCopyOfRange.length == 0 ? pmf.b : new omf(bArrCopyOfRange);
            }
        }
        if (iE0 <= 0) {
            ygf.j("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            return null;
        }
        ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        return null;
    }

    @Override // defpackage.up1
    public final int q0() {
        return E0();
    }

    @Override // defpackage.up1
    public final int s0() {
        return E0();
    }

    @Override // defpackage.up1
    public final int u0() {
        return H0();
    }

    @Override // defpackage.up1
    public final long w0() {
        return I0();
    }

    @Override // defpackage.up1
    public final int y0() {
        return up1.I(E0());
    }

    @Override // defpackage.up1
    public final String o0() throws zzaek {
        int iE0 = E0();
        if (iE0 > 0) {
            int i = this.f;
            int i2 = this.g;
            if (iE0 <= i - i2) {
                String strC = lpf.c(this.d, i2, iE0);
                this.g += iE0;
                return strC;
            }
        }
        if (iE0 == 0) {
            return "";
        }
        if (iE0 <= 0) {
            ygf.j(AEVqIoD.UhceDQJjGn);
            return null;
        }
        ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        return null;
    }
}
