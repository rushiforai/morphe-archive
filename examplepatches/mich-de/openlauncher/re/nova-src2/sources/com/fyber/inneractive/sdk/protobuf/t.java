package com.fyber.inneractive.sdk.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.io.IOException;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class t extends w {

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f30893e;

    /* renamed from: f, reason: collision with root package name */
    public int f30894f;

    /* renamed from: g, reason: collision with root package name */
    public int f30895g;

    /* renamed from: h, reason: collision with root package name */
    public int f30896h;

    /* renamed from: i, reason: collision with root package name */
    public final int f30897i;

    /* renamed from: j, reason: collision with root package name */
    public int f30898j;

    /* renamed from: k, reason: collision with root package name */
    public int f30899k = LayoutNode.NotPlacedPlaceOrder;

    public t(byte[] bArr, int i5, int i11, boolean z11) {
        this.f30893e = bArr;
        this.f30894f = i11 + i5;
        this.f30896h = i5;
        this.f30897i = i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final void a(int i5) throws n1 {
        if (this.f30898j != i5) {
            throw new n1("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int b() {
        return this.f30896h - this.f30897i;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final void c(int i5) {
        this.f30899k = i5;
        z();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final boolean d() {
        return y() != 0;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final boolean e(int i5) throws n1 {
        int iT;
        int i11 = i5 & 7;
        int i12 = 0;
        if (i11 == 0) {
            if (this.f30894f - this.f30896h >= 10) {
                while (i12 < 10) {
                    byte[] bArr = this.f30893e;
                    int i13 = this.f30896h;
                    this.f30896h = i13 + 1;
                    if (bArr[i13] < 0) {
                        i12++;
                    }
                }
                throw new n1("CodedInputStream encountered a malformed varint.");
            }
            while (i12 < 10) {
                int i14 = this.f30896h;
                if (i14 == this.f30894f) {
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                byte[] bArr2 = this.f30893e;
                this.f30896h = i14 + 1;
                if (bArr2[i14] < 0) {
                    i12++;
                }
            }
            throw new n1("CodedInputStream encountered a malformed varint.");
            return true;
        }
        if (i11 == 1) {
            f(8);
            return true;
        }
        if (i11 == 2) {
            f(m());
            return true;
        }
        if (i11 == 3) {
            do {
                iT = t();
                if (iT == 0) {
                    break;
                }
            } while (e(iT));
            a(((i5 >>> 3) << 3) | 4);
            return true;
        }
        if (i11 == 4) {
            return false;
        }
        if (i11 == 5) {
            f(4);
            return true;
        }
        int i15 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final double f() {
        return Double.longBitsToDouble(x());
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int g() {
        return m();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int h() {
        return w();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final long i() {
        return x();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final float j() {
        return Float.intBitsToFloat(w());
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int k() {
        return m();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final long l() {
        return y();
    }

    /* JADX WARN: Removed duplicated region for block: B:49:0x00a2 A[PHI: r3
      0x00a2: PHI (r3v11 int) = (r3v10 int), (r3v13 int) binds: [B:25:0x0053, B:29:0x005f] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.fyber.inneractive.sdk.protobuf.w
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int m() throws n1 {
        int i5;
        int i11 = this.f30896h;
        int i12 = this.f30894f;
        if (i12 != i11) {
            byte[] bArr = this.f30893e;
            int i13 = i11 + 1;
            byte b11 = bArr[i11];
            if (b11 >= 0) {
                this.f30896h = i13;
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
                            i14 = i18;
                        } else {
                            i16 = i11 + 5;
                            byte b12 = bArr[i18];
                            int i21 = (i19 ^ (b12 << 28)) ^ 266354560;
                            if (b12 < 0) {
                                int i22 = i11 + 6;
                                if (bArr[i16] < 0) {
                                    i16 = i11 + 7;
                                    if (bArr[i22] < 0) {
                                        i22 = i11 + 8;
                                        if (bArr[i16] < 0) {
                                            i16 = i11 + 9;
                                            if (bArr[i22] < 0) {
                                                int i23 = i11 + 10;
                                                if (bArr[i16] >= 0) {
                                                    i16 = i23;
                                                }
                                            }
                                        } else {
                                            i16 = i22;
                                        }
                                    }
                                }
                            }
                            i5 = i21;
                        }
                    }
                    i14 = i16;
                }
                this.f30896h = i14;
                return i5;
            }
        }
        long j11 = 0;
        for (int i24 = 0; i24 < 64; i24 += 7) {
            int i25 = this.f30896h;
            if (i25 == this.f30894f) {
                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
            byte[] bArr2 = this.f30893e;
            this.f30896h = i25 + 1;
            j11 |= (r3 & AbstractJsonLexerKt.TC_INVALID) << i24;
            if ((bArr2[i25] & 128) == 0) {
                return (int) j11;
            }
        }
        throw new n1("CodedInputStream encountered a malformed varint.");
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int n() {
        return w();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final long o() {
        return x();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int p() {
        return w.b(m());
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final long q() {
        return w.a(y());
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final String r() throws n1 {
        int iM = m();
        if (iM > 0) {
            int i5 = this.f30894f;
            int i11 = this.f30896h;
            if (iM <= i5 - i11) {
                String str = new String(this.f30893e, i11, iM, l1.f30847a);
                this.f30896h += iM;
                return str;
            }
        }
        if (iM == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iM < 0) {
            throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final String s() throws n1 {
        int iM = m();
        if (iM > 0) {
            int i5 = this.f30894f;
            int i11 = this.f30896h;
            if (iM <= i5 - i11) {
                String strA = d4.f30786a.a(this.f30893e, i11, iM);
                this.f30896h += iM;
                return strA;
            }
        }
        if (iM == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iM <= 0) {
            throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int t() throws n1 {
        if (c()) {
            this.f30898j = 0;
            return 0;
        }
        int iM = m();
        this.f30898j = iM;
        if ((iM >>> 3) != 0) {
            return iM;
        }
        throw new n1("Protocol message contained an invalid tag (zero).");
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int u() {
        return m();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final long v() {
        return y();
    }

    public final int w() throws n1 {
        int i5 = this.f30896h;
        if (this.f30894f - i5 < 4) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        byte[] bArr = this.f30893e;
        this.f30896h = i5 + 4;
        return ((bArr[i5 + 3] & 255) << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
    }

    public final long x() throws n1 {
        int i5 = this.f30896h;
        if (this.f30894f - i5 < 8) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        byte[] bArr = this.f30893e;
        this.f30896h = i5 + 8;
        return ((bArr[i5 + 7] & 255) << 56) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 6] & 255) << 48);
    }

    public final long y() throws n1 {
        long j11;
        long j12;
        long j13;
        int i5 = this.f30896h;
        int i11 = this.f30894f;
        long j14 = 0;
        if (i11 != i5) {
            byte[] bArr = this.f30893e;
            int i12 = i5 + 1;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                this.f30896h = i12;
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
                        i13 = i15;
                    } else {
                        int i17 = i5 + 4;
                        int i18 = i16 ^ (bArr[i15] << 21);
                        if (i18 < 0) {
                            j11 = (-2080896) ^ i18;
                            i13 = i17;
                        } else {
                            long j15 = i18;
                            i13 = i5 + 5;
                            long j16 = j15 ^ (bArr[i17] << 28);
                            if (j16 >= 0) {
                                j13 = 266354560;
                            } else {
                                int i19 = i5 + 6;
                                long j17 = j16 ^ (bArr[i13] << 35);
                                if (j17 < 0) {
                                    j12 = -34093383808L;
                                } else {
                                    i13 = i5 + 7;
                                    j16 = j17 ^ (bArr[i19] << 42);
                                    if (j16 >= 0) {
                                        j13 = 4363953127296L;
                                    } else {
                                        i19 = i5 + 8;
                                        j17 = j16 ^ (bArr[i13] << 49);
                                        if (j17 < 0) {
                                            j12 = -558586000294016L;
                                        } else {
                                            i13 = i5 + 9;
                                            long j18 = (j17 ^ (bArr[i19] << 56)) ^ 71499008037633920L;
                                            if (j18 < 0) {
                                                int i21 = i5 + 10;
                                                if (bArr[i13] >= 0) {
                                                    i13 = i21;
                                                }
                                            }
                                            j11 = j18;
                                        }
                                    }
                                }
                                j11 = j17 ^ j12;
                                i13 = i19;
                            }
                            j11 = j13 ^ j16;
                        }
                    }
                }
                this.f30896h = i13;
                return j11;
            }
        }
        for (int i22 = 0; i22 < 64; i22 += 7) {
            int i23 = this.f30896h;
            if (i23 == this.f30894f) {
                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
            byte[] bArr2 = this.f30893e;
            this.f30896h = i23 + 1;
            j14 |= (r1 & AbstractJsonLexerKt.TC_INVALID) << i22;
            if ((bArr2[i23] & 128) == 0) {
                return j14;
            }
        }
        throw new n1("CodedInputStream encountered a malformed varint.");
    }

    public final void z() {
        int i5 = this.f30894f + this.f30895g;
        this.f30894f = i5;
        int i11 = i5 - this.f30897i;
        int i12 = this.f30899k;
        if (i11 <= i12) {
            this.f30895g = 0;
            return;
        }
        int i13 = i11 - i12;
        this.f30895g = i13;
        this.f30894f = i5 - i13;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int d(int i5) {
        if (i5 < 0) {
            throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        int i11 = (this.f30896h - this.f30897i) + i5;
        int i12 = this.f30899k;
        if (i11 > i12) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        this.f30899k = i11;
        z();
        return i12;
    }

    public final void f(int i5) throws n1 {
        if (i5 >= 0) {
            int i11 = this.f30894f;
            int i12 = this.f30896h;
            if (i5 <= i11 - i12) {
                this.f30896h = i12 + i5;
                return;
            }
        }
        if (i5 >= 0) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final boolean c() {
        return this.f30896h == this.f30894f;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final void a(int i5, c2 c2Var, h0 h0Var) throws IOException {
        int i11 = this.f30928a;
        if (i11 < this.f30929b) {
            this.f30928a = i11 + 1;
            ((t0) c2Var).a(this, h0Var);
            a((i5 << 3) | 4);
            this.f30928a--;
            return;
        }
        throw new n1("Protocol message had too many levels of nesting.  May be malicious.  Use CodedInputStream.setRecursionLimit() to increase the depth limit.");
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final void a(c2 c2Var, h0 h0Var) throws IOException {
        int iM = m();
        if (this.f30928a < this.f30929b) {
            int iD = d(iM);
            this.f30928a++;
            ((t0) c2Var).a(this, h0Var);
            a(0);
            this.f30928a--;
            this.f30899k = iD;
            z();
            return;
        }
        throw new n1("Protocol message had too many levels of nesting.  May be malicious.  Use CodedInputStream.setRecursionLimit() to increase the depth limit.");
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0040  */
    @Override // com.fyber.inneractive.sdk.protobuf.w
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final q e() throws n1 {
        byte[] bArrCopyOfRange;
        int iM = m();
        if (iM > 0) {
            int i5 = this.f30894f;
            int i11 = this.f30896h;
            if (iM <= i5 - i11) {
                byte[] bArr = this.f30893e;
                q qVar = s.f30889b;
                s.a(i11, i11 + iM, bArr.length);
                q qVar2 = new q(s.f30890c.a(bArr, i11, iM));
                this.f30896h += iM;
                return qVar2;
            }
        }
        if (iM == 0) {
            return s.f30889b;
        }
        if (iM > 0) {
            int i12 = this.f30894f;
            int i13 = this.f30896h;
            if (iM <= i12 - i13) {
                int i14 = iM + i13;
                this.f30896h = i14;
                bArrCopyOfRange = Arrays.copyOfRange(this.f30893e, i13, i14);
            } else {
                if (iM > 0) {
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                if (iM == 0) {
                    bArrCopyOfRange = l1.f30848b;
                } else {
                    throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                }
            }
        }
        q qVar3 = s.f30889b;
        return new q(bArrCopyOfRange);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int a() {
        int i5 = this.f30899k;
        if (i5 == Integer.MAX_VALUE) {
            return -1;
        }
        return i5 - (this.f30896h - this.f30897i);
    }
}
