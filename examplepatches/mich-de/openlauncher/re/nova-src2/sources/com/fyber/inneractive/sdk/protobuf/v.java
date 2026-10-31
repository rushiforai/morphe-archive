package com.fyber.inneractive.sdk.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.io.IOException;
import java.nio.ByteBuffer;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class v extends w {

    /* renamed from: e, reason: collision with root package name */
    public final ByteBuffer f30920e;

    /* renamed from: f, reason: collision with root package name */
    public final long f30921f;

    /* renamed from: g, reason: collision with root package name */
    public long f30922g;

    /* renamed from: h, reason: collision with root package name */
    public long f30923h;

    /* renamed from: i, reason: collision with root package name */
    public final long f30924i;

    /* renamed from: j, reason: collision with root package name */
    public int f30925j;

    /* renamed from: k, reason: collision with root package name */
    public int f30926k;

    /* renamed from: l, reason: collision with root package name */
    public int f30927l = LayoutNode.NotPlacedPlaceOrder;

    public v(ByteBuffer byteBuffer, boolean z11) {
        this.f30920e = byteBuffer;
        long j11 = x3.f30955c.f30941a.getLong(byteBuffer, x3.f30959g);
        this.f30921f = j11;
        this.f30922g = byteBuffer.limit() + j11;
        long jPosition = j11 + byteBuffer.position();
        this.f30923h = jPosition;
        this.f30924i = jPosition;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final void a(int i5) throws n1 {
        if (this.f30926k != i5) {
            throw new n1("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int b() {
        return (int) (this.f30923h - this.f30924i);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final void c(int i5) {
        this.f30927l = i5;
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
            if (((int) (this.f30922g - this.f30923h)) >= 10) {
                while (i12 < 10) {
                    long j11 = this.f30923h;
                    this.f30923h = j11 + 1;
                    if (x3.f30955c.a(j11) < 0) {
                        i12++;
                    }
                }
                throw new n1("CodedInputStream encountered a malformed varint.");
            }
            while (i12 < 10) {
                long j12 = this.f30923h;
                if (j12 == this.f30922g) {
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                this.f30923h = j12 + 1;
                if (x3.f30955c.a(j12) < 0) {
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
        int i13 = n1.f30859a;
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

    /* JADX WARN: Removed duplicated region for block: B:49:0x00cc A[PHI: r6
      0x00cc: PHI (r6v9 long) = (r6v8 long), (r6v12 long) binds: [B:22:0x0064, B:26:0x0076] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.fyber.inneractive.sdk.protobuf.w
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int m() throws n1 {
        int i5;
        long j11 = this.f30923h;
        if (this.f30922g != j11) {
            long j12 = j11 + 1;
            w3 w3Var = x3.f30955c;
            byte bA = w3Var.a(j11);
            if (bA >= 0) {
                this.f30923h = j12;
                return bA;
            }
            if (this.f30922g - j12 >= 9) {
                long j13 = 2 + j11;
                int iA = (w3Var.a(j12) << 7) ^ bA;
                if (iA < 0) {
                    i5 = iA ^ (-128);
                } else {
                    long j14 = 3 + j11;
                    int iA2 = iA ^ (w3Var.a(j13) << 14);
                    if (iA2 >= 0) {
                        i5 = iA2 ^ 16256;
                        j13 = j14;
                    } else {
                        j13 = 4 + j11;
                        int iA3 = iA2 ^ (w3Var.a(j14) << 21);
                        if (iA3 < 0) {
                            i5 = (-2080896) ^ iA3;
                        } else {
                            long j15 = 5 + j11;
                            byte bA2 = w3Var.a(j13);
                            int i11 = (iA3 ^ (bA2 << 28)) ^ 266354560;
                            if (bA2 < 0) {
                                j13 = 6 + j11;
                                if (w3Var.a(j15) < 0) {
                                    j15 = 7 + j11;
                                    if (w3Var.a(j13) < 0) {
                                        j13 = 8 + j11;
                                        if (w3Var.a(j15) < 0) {
                                            long j16 = 9 + j11;
                                            if (w3Var.a(j13) < 0) {
                                                long j17 = j11 + 10;
                                                if (w3Var.a(j16) >= 0) {
                                                    j13 = j17;
                                                }
                                            } else {
                                                j13 = j16;
                                            }
                                        }
                                    } else {
                                        j13 = j15;
                                    }
                                }
                                i5 = i11;
                            }
                        }
                    }
                }
                this.f30923h = j13;
                return i5;
            }
        }
        long j18 = 0;
        for (int i12 = 0; i12 < 64; i12 += 7) {
            long j19 = this.f30923h;
            if (j19 == this.f30922g) {
                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
            this.f30923h = j19 + 1;
            j18 |= (r5 & AbstractJsonLexerKt.TC_INVALID) << i12;
            if ((x3.f30955c.a(j19) & 128) == 0) {
                return (int) j18;
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
            long j11 = this.f30922g;
            long j12 = this.f30923h;
            if (iM <= ((int) (j11 - j12))) {
                byte[] bArr = new byte[iM];
                long j13 = iM;
                x3.f30955c.a(j12, bArr, j13);
                String str = new String(bArr, l1.f30847a);
                this.f30923h += j13;
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
            long j11 = this.f30922g;
            long j12 = this.f30923h;
            if (iM <= ((int) (j11 - j12))) {
                int i5 = (int) (j12 - this.f30921f);
                ByteBuffer byteBuffer = this.f30920e;
                z3 z3Var = d4.f30786a;
                z3Var.getClass();
                String strA = byteBuffer.hasArray() ? z3Var.a(byteBuffer.array(), byteBuffer.arrayOffset() + i5, iM) : byteBuffer.isDirect() ? z3Var.b(byteBuffer, i5, iM) : z3.a(byteBuffer, i5, iM);
                this.f30923h += iM;
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
            this.f30926k = 0;
            return 0;
        }
        int iM = m();
        this.f30926k = iM;
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
        long j11 = this.f30923h;
        if (this.f30922g - j11 < 4) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        this.f30923h = 4 + j11;
        w3 w3Var = x3.f30955c;
        return ((w3Var.a(j11 + 3) & 255) << 24) | (w3Var.a(j11) & 255) | ((w3Var.a(1 + j11) & 255) << 8) | ((w3Var.a(2 + j11) & 255) << 16);
    }

    public final long x() throws n1 {
        long j11 = this.f30923h;
        if (this.f30922g - j11 < 8) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        this.f30923h = 8 + j11;
        w3 w3Var = x3.f30955c;
        return ((w3Var.a(j11 + 7) & 255) << 56) | (w3Var.a(j11) & 255) | ((w3Var.a(1 + j11) & 255) << 8) | ((w3Var.a(2 + j11) & 255) << 16) | ((w3Var.a(3 + j11) & 255) << 24) | ((w3Var.a(4 + j11) & 255) << 32) | ((w3Var.a(5 + j11) & 255) << 40) | ((w3Var.a(6 + j11) & 255) << 48);
    }

    /* JADX WARN: Removed duplicated region for block: B:4:0x000e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long y() throws n1 {
        long j11;
        long j12;
        long j13;
        int i5;
        long j14 = this.f30923h;
        long j15 = 0;
        if (this.f30922g == j14) {
            j11 = 1;
        } else {
            long j16 = j14 + 1;
            w3 w3Var = x3.f30955c;
            byte bA = w3Var.a(j14);
            if (bA >= 0) {
                this.f30923h = j16;
                return bA;
            }
            if (this.f30922g - j16 >= 9) {
                long j17 = 2 + j14;
                int iA = (w3Var.a(j16) << 7) ^ bA;
                if (iA >= 0) {
                    long j18 = 3 + j14;
                    int iA2 = iA ^ (w3Var.a(j17) << 14);
                    if (iA2 >= 0) {
                        j12 = iA2 ^ 16256;
                        j17 = j18;
                    } else {
                        j17 = 4 + j14;
                        int iA3 = iA2 ^ (w3Var.a(j18) << 21);
                        if (iA3 < 0) {
                            i5 = (-2080896) ^ iA3;
                        } else {
                            j11 = 1;
                            long j19 = j14 + 5;
                            long jA = iA3 ^ (w3Var.a(j17) << 28);
                            if (jA >= 0) {
                                j12 = 266354560 ^ jA;
                                j17 = j19;
                            } else {
                                j17 = j14 + 6;
                                long jA2 = (w3Var.a(j19) << 35) ^ jA;
                                if (jA2 < 0) {
                                    j13 = -34093383808L;
                                } else {
                                    long j21 = 7 + j14;
                                    long jA3 = jA2 ^ (w3Var.a(j17) << 42);
                                    if (jA3 >= 0) {
                                        j12 = 4363953127296L ^ jA3;
                                        j17 = j21;
                                    } else {
                                        j17 = j14 + 8;
                                        jA2 = jA3 ^ (w3Var.a(j21) << 49);
                                        if (jA2 < 0) {
                                            j13 = -558586000294016L;
                                        } else {
                                            long j22 = 9 + j14;
                                            long jA4 = (jA2 ^ (w3Var.a(j17) << 56)) ^ 71499008037633920L;
                                            if (jA4 < 0) {
                                                long j23 = j14 + 10;
                                                if (w3Var.a(j22) >= 0) {
                                                    j17 = j23;
                                                }
                                            } else {
                                                j17 = j22;
                                            }
                                            j12 = jA4;
                                        }
                                    }
                                }
                                j12 = j13 ^ jA2;
                            }
                        }
                    }
                    this.f30923h = j17;
                    return j12;
                }
                i5 = iA ^ (-128);
                j12 = i5;
                this.f30923h = j17;
                return j12;
            }
        }
        for (int i11 = 0; i11 < 64; i11 += 7) {
            long j24 = this.f30923h;
            if (j24 == this.f30922g) {
                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
            this.f30923h = j24 + j11;
            j15 |= (r2 & AbstractJsonLexerKt.TC_INVALID) << i11;
            if ((x3.f30955c.a(j24) & 128) == 0) {
                return j15;
            }
        }
        throw new n1("CodedInputStream encountered a malformed varint.");
    }

    public final void z() {
        long j11 = this.f30922g + this.f30925j;
        this.f30922g = j11;
        int i5 = (int) (j11 - this.f30924i);
        int i11 = this.f30927l;
        if (i5 <= i11) {
            this.f30925j = 0;
            return;
        }
        int i12 = i5 - i11;
        this.f30925j = i12;
        this.f30922g = j11 - i12;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int d(int i5) throws n1 {
        if (i5 < 0) {
            throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        int i11 = i5 + ((int) (this.f30923h - this.f30924i));
        int i12 = this.f30927l;
        if (i11 > i12) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        this.f30927l = i11;
        z();
        return i12;
    }

    public final void f(int i5) throws n1 {
        if (i5 >= 0) {
            long j11 = this.f30922g;
            long j12 = this.f30923h;
            if (i5 <= ((int) (j11 - j12))) {
                this.f30923h = j12 + i5;
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
        return this.f30923h == this.f30922g;
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
            this.f30927l = iD;
            z();
            return;
        }
        throw new n1("Protocol message had too many levels of nesting.  May be malicious.  Use CodedInputStream.setRecursionLimit() to increase the depth limit.");
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final q e() throws n1 {
        int iM = m();
        if (iM > 0) {
            long j11 = this.f30922g;
            long j12 = this.f30923h;
            if (iM <= ((int) (j11 - j12))) {
                byte[] bArr = new byte[iM];
                long j13 = iM;
                x3.f30955c.a(j12, bArr, j13);
                this.f30923h += j13;
                q qVar = s.f30889b;
                return new q(bArr);
            }
        }
        if (iM == 0) {
            return s.f30889b;
        }
        if (iM < 0) {
            throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int a() {
        int i5 = this.f30927l;
        if (i5 == Integer.MAX_VALUE) {
            return -1;
        }
        return i5 - ((int) (this.f30923h - this.f30924i));
    }
}
