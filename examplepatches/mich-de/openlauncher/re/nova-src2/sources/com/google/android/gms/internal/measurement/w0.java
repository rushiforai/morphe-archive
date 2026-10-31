package com.google.android.gms.internal.measurement;

import androidx.compose.ui.node.LayoutNode;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class w0 extends y0 {

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f33170d;

    /* renamed from: f, reason: collision with root package name */
    public int f33172f;

    /* renamed from: h, reason: collision with root package name */
    public int f33174h;

    /* renamed from: i, reason: collision with root package name */
    public int f33175i = LayoutNode.NotPlacedPlaceOrder;

    /* renamed from: e, reason: collision with root package name */
    public int f33171e = 0;

    /* renamed from: g, reason: collision with root package name */
    public int f33173g = 0;

    public /* synthetic */ w0(byte[] bArr) {
        this.f33170d = bArr;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int A() {
        return M();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int B() {
        return M();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int C() {
        return J();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final long D() {
        return K();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int E() {
        return y0.j(M());
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final long F() {
        return y0.k(H());
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int G() {
        return M();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final long H() {
        long j11;
        long j12;
        long j13;
        int i5 = this.f33173g;
        int i11 = this.f33171e;
        if (i11 != i5) {
            int i12 = i5 + 1;
            byte[] bArr = this.f33170d;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                this.f33173g = i12;
                return b11;
            }
            if (i11 - i12 >= 9) {
                int i13 = i5 + 2;
                int i14 = (bArr[i12] << 7) ^ b11;
                if (i14 < 0) {
                    j11 = i14 ^ (-128);
                } else {
                    int i15 = i5 + 3;
                    int i16 = (bArr[i13] << 14) ^ i14;
                    if (i16 >= 0) {
                        j11 = i16 ^ 16256;
                    } else {
                        int i17 = i5 + 4;
                        int i18 = i16 ^ (bArr[i15] << 21);
                        if (i18 < 0) {
                            long j14 = (-2080896) ^ i18;
                            i13 = i17;
                            j11 = j14;
                        } else {
                            i15 = i5 + 5;
                            long j15 = i18 ^ (bArr[i17] << 28);
                            if (j15 >= 0) {
                                j12 = 266354560;
                            } else {
                                int i19 = i5 + 6;
                                long j16 = j15 ^ (bArr[i15] << 35);
                                if (j16 < 0) {
                                    j13 = -34093383808L;
                                } else {
                                    i15 = i5 + 7;
                                    j15 = j16 ^ (bArr[i19] << 42);
                                    if (j15 >= 0) {
                                        j12 = 4363953127296L;
                                    } else {
                                        i19 = i5 + 8;
                                        j16 = j15 ^ (bArr[i15] << 49);
                                        if (j16 < 0) {
                                            j13 = -558586000294016L;
                                        } else {
                                            i15 = i5 + 9;
                                            j15 = j16 ^ (bArr[i19] << 56);
                                            if (j15 >= 0) {
                                                j12 = 71499008037633920L;
                                            } else {
                                                int i21 = i5 + 10;
                                                long j17 = j15 ^ (bArr[i15] << 63);
                                                if (j17 >= 0) {
                                                    j11 = j17 ^ (-9151873028817141888L);
                                                    i13 = i21;
                                                }
                                            }
                                        }
                                    }
                                }
                                j11 = j16 ^ j13;
                                i13 = i19;
                            }
                            j11 = j15 ^ j12;
                        }
                    }
                    i13 = i15;
                }
                this.f33173g = i13;
                return j11;
            }
        }
        return I();
    }

    public final long I() throws zzaeh {
        long j11 = 0;
        for (int i5 = 0; i5 < 64; i5 += 7) {
            int i11 = this.f33173g;
            if (i11 == this.f33171e) {
                throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
            this.f33173g = i11 + 1;
            j11 |= (r3 & AbstractJsonLexerKt.TC_INVALID) << i5;
            if ((this.f33170d[i11] & 128) == 0) {
                return j11;
            }
        }
        throw new zzaeh("CodedInputStream encountered a malformed varint.");
    }

    public final int J() throws zzaeh {
        int i5 = this.f33173g;
        if (this.f33171e - i5 < 4) {
            throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        this.f33173g = i5 + 4;
        byte[] bArr = this.f33170d;
        int i11 = bArr[i5] & 255;
        int i12 = bArr[i5 + 1] & 255;
        int i13 = bArr[i5 + 2] & 255;
        return ((bArr[i5 + 3] & 255) << 24) | (i12 << 8) | i11 | (i13 << 16);
    }

    public final long K() throws zzaeh {
        int i5 = this.f33173g;
        if (this.f33171e - i5 < 8) {
            throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        this.f33173g = i5 + 8;
        byte[] bArr = this.f33170d;
        long j11 = bArr[i5];
        long j12 = bArr[i5 + 2];
        long j13 = bArr[i5 + 3];
        return ((bArr[i5 + 6] & 255) << 48) | (j11 & 255) | ((bArr[i5 + 1] & 255) << 8) | ((j12 & 255) << 16) | ((j13 & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 7] & 255) << 56);
    }

    public final byte[] L(int i5) throws zzaeh {
        if (i5 > 0) {
            int i11 = this.f33171e;
            int i12 = this.f33173g;
            if (i5 <= i11 - i12) {
                int i13 = i5 + i12;
                this.f33173g = i13;
                return Arrays.copyOfRange(this.f33170d, i12, i13);
            }
        }
        if (i5 > 0) {
            throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        if (i5 == 0) {
            return w1.f33176a;
        }
        throw new zzaeh("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
    }

    public final int M() {
        int i5;
        int i11 = this.f33173g;
        int i12 = this.f33171e;
        if (i12 != i11) {
            int i13 = i11 + 1;
            byte[] bArr = this.f33170d;
            byte b11 = bArr[i11];
            if (b11 >= 0) {
                this.f33173g = i13;
                return b11;
            }
            if (i12 - i13 >= 9) {
                int i14 = i11 + 2;
                int i15 = (bArr[i13] << 7) ^ b11;
                if (i15 < 0) {
                    i5 = i15 ^ (-128);
                } else {
                    int i16 = i11 + 3;
                    int i17 = (bArr[i14] << 14) ^ i15;
                    if (i17 >= 0) {
                        i5 = i17 ^ 16256;
                    } else {
                        int i18 = i11 + 4;
                        int i19 = i17 ^ (bArr[i16] << 21);
                        if (i19 < 0) {
                            i5 = (-2080896) ^ i19;
                        } else {
                            i16 = i11 + 5;
                            byte b12 = bArr[i18];
                            int i21 = (i19 ^ (b12 << 28)) ^ 266354560;
                            if (b12 < 0) {
                                i18 = i11 + 6;
                                if (bArr[i16] < 0) {
                                    i16 = i11 + 7;
                                    if (bArr[i18] < 0) {
                                        i18 = i11 + 8;
                                        if (bArr[i16] < 0) {
                                            i16 = i11 + 9;
                                            if (bArr[i18] < 0) {
                                                int i22 = i11 + 10;
                                                if (bArr[i16] >= 0) {
                                                    i14 = i22;
                                                    i5 = i21;
                                                }
                                            }
                                        }
                                    }
                                }
                                i5 = i21;
                            }
                            i5 = i21;
                        }
                        i14 = i18;
                    }
                    i14 = i16;
                }
                this.f33173g = i14;
                return i5;
            }
        }
        return (int) I();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int a(int i5) throws zzaeh {
        if (i5 < 0) {
            throw new zzaeh("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        int i11 = i5 + this.f33173g;
        if (i11 < 0) {
            throw new zzaeh("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
        }
        int i12 = this.f33175i;
        if (i11 > i12) {
            throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        this.f33175i = i11;
        int i13 = this.f33171e + this.f33172f;
        this.f33171e = i13;
        if (i13 <= i11) {
            this.f33172f = 0;
            return i12;
        }
        int i14 = i13 - i11;
        this.f33172f = i14;
        this.f33171e = i13 - i14;
        return i12;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final void b(int i5) {
        this.f33175i = i5;
        int i11 = this.f33171e + this.f33172f;
        this.f33171e = i11;
        if (i11 <= i5) {
            this.f33172f = 0;
            return;
        }
        int i12 = i11 - i5;
        this.f33172f = i12;
        this.f33171e = i11 - i12;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int c() {
        int i5 = this.f33175i;
        if (i5 == Integer.MAX_VALUE) {
            return -1;
        }
        return i5 - this.f33173g;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final boolean d() {
        return this.f33173g == this.f33171e;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int e() {
        return this.f33173g;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int f(int i5, int i11, byte[] bArr) {
        if ((bArr.length - i5) - i11 < 0 || (i5 | i11) < 0) {
            throw new IndexOutOfBoundsException();
        }
        if (i11 == 0) {
            return 0;
        }
        int iMin = Math.min(i11, this.f33171e - this.f33173g);
        if (iMin == 0) {
            return -1;
        }
        System.arraycopy(this.f33170d, this.f33173g, bArr, i5, iMin);
        this.f33173g += iMin;
        return iMin;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final void g(int i5) throws zzaeh {
        if (i5 >= 0) {
            int i11 = this.f33171e;
            int i12 = this.f33173g;
            if (i5 <= i11 - i12) {
                this.f33173g = i12 + i5;
                return;
            }
        }
        if (i5 >= 0) {
            throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        throw new zzaeh("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int l() throws zzaeh {
        if (d()) {
            this.f33174h = 0;
            return 0;
        }
        int iM = M();
        this.f33174h = iM;
        if ((iM >>> 3) != 0) {
            return iM;
        }
        throw new zzaeh("Protocol message contained an invalid tag (zero).");
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final void m(int i5) throws zzaeh {
        if (this.f33174h != i5) {
            throw new zzaeh("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final boolean n(int i5) throws zzaeh {
        int i11 = i5 & 7;
        int i12 = 0;
        if (i11 != 0) {
            if (i11 == 1) {
                g(8);
                return true;
            }
            if (i11 == 2) {
                g(M());
                return true;
            }
            if (i11 == 3) {
                i();
                m(((i5 >>> 3) << 3) | 4);
                return true;
            }
            if (i11 == 4) {
                if (this.f33239b == 0) {
                    m(0);
                }
                return false;
            }
            if (i11 != 5) {
                throw new zzaeg();
            }
            g(4);
            return true;
        }
        int i13 = this.f33171e - this.f33173g;
        byte[] bArr = this.f33170d;
        if (i13 >= 10) {
            while (i12 < 10) {
                int i14 = this.f33173g;
                this.f33173g = i14 + 1;
                if (bArr[i14] < 0) {
                    i12++;
                }
            }
            throw new zzaeh("CodedInputStream encountered a malformed varint.");
        }
        while (i12 < 10) {
            int i15 = this.f33173g;
            if (i15 == this.f33171e) {
                throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
            this.f33173g = i15 + 1;
            if (bArr[i15] < 0) {
                i12++;
            }
        }
        throw new zzaeh("CodedInputStream encountered a malformed varint.");
        return true;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final double o() {
        return Double.longBitsToDouble(K());
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final float p() {
        return Float.intBitsToFloat(J());
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final long q() {
        return H();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final long r() {
        return H();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int s() {
        return M();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final long t() {
        return K();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int u() {
        return J();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final boolean v() {
        return H() != 0;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final String w() throws zzaeh {
        int iM = M();
        if (iM > 0) {
            int i5 = this.f33171e;
            int i11 = this.f33173g;
            if (iM <= i5 - i11) {
                String str = new String(this.f33170d, i11, iM, StandardCharsets.UTF_8);
                this.f33173g += iM;
                return str;
            }
        }
        if (iM == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iM < 0) {
            throw new zzaeh("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final String x() throws zzaeh {
        int iM = M();
        if (iM > 0) {
            int i5 = this.f33171e;
            int i11 = this.f33173g;
            if (iM <= i5 - i11) {
                String strD = f3.d(this.f33170d, i11, iM);
                this.f33173g += iM;
                return strD;
            }
        }
        if (iM == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iM <= 0) {
            throw new zzaeh("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final u0 y() throws zzaeh {
        int iM = M();
        if (iM > 0) {
            int i5 = this.f33171e;
            int i11 = this.f33173g;
            if (iM <= i5 - i11) {
                u0 u0VarL = v0.l(i11, iM, this.f33170d);
                this.f33173g += iM;
                return u0VarL;
            }
        }
        if (iM == 0) {
            return v0.f33120b;
        }
        byte[] bArrL = L(iM);
        u0 u0Var = v0.f33120b;
        return bArrL.length == 0 ? v0.f33120b : new u0(bArrL);
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final byte[] z() {
        return L(M());
    }
}
