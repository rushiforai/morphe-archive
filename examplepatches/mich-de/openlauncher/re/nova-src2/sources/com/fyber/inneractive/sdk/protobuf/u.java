package com.fyber.inneractive.sdk.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class u extends w {

    /* renamed from: e, reason: collision with root package name */
    public final InputStream f30905e;

    /* renamed from: f, reason: collision with root package name */
    public final byte[] f30906f;

    /* renamed from: g, reason: collision with root package name */
    public int f30907g;

    /* renamed from: h, reason: collision with root package name */
    public int f30908h;

    /* renamed from: i, reason: collision with root package name */
    public int f30909i;

    /* renamed from: j, reason: collision with root package name */
    public int f30910j;

    /* renamed from: k, reason: collision with root package name */
    public int f30911k;

    /* renamed from: l, reason: collision with root package name */
    public int f30912l = LayoutNode.NotPlacedPlaceOrder;

    public u(InputStream inputStream) {
        Charset charset = l1.f30847a;
        if (inputStream == null) {
            throw new NullPointerException("input");
        }
        this.f30905e = inputStream;
        this.f30906f = new byte[androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT];
        this.f30907g = 0;
        this.f30909i = 0;
        this.f30911k = 0;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final void a(int i5) {
        if (this.f30910j != i5) {
            throw new n1("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int b() {
        return this.f30911k + this.f30909i;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final void c(int i5) {
        this.f30912l = i5;
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
            if (this.f30907g - this.f30909i >= 10) {
                while (i12 < 10) {
                    byte[] bArr = this.f30906f;
                    int i13 = this.f30909i;
                    this.f30909i = i13 + 1;
                    if (bArr[i13] < 0) {
                        i12++;
                    }
                }
                throw new n1("CodedInputStream encountered a malformed varint.");
            }
            while (i12 < 10) {
                if (this.f30909i == this.f30907g) {
                    i(1);
                }
                byte[] bArr2 = this.f30906f;
                int i14 = this.f30909i;
                this.f30909i = i14 + 1;
                if (bArr2[i14] < 0) {
                    i12++;
                }
            }
            throw new n1("CodedInputStream encountered a malformed varint.");
            return true;
        }
        if (i11 == 1) {
            j(8);
            return true;
        }
        if (i11 == 2) {
            j(m());
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
            j(4);
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

    /* JADX WARN: Removed duplicated region for block: B:48:0x00a0 A[PHI: r3
      0x00a0: PHI (r3v13 int) = (r3v12 int), (r3v15 int) binds: [B:25:0x0053, B:29:0x005f] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.fyber.inneractive.sdk.protobuf.w
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int m() throws n1 {
        int i5;
        int i11 = this.f30909i;
        int i12 = this.f30907g;
        if (i12 != i11) {
            byte[] bArr = this.f30906f;
            int i13 = i11 + 1;
            byte b11 = bArr[i11];
            if (b11 >= 0) {
                this.f30909i = i13;
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
                this.f30909i = i14;
                return i5;
            }
        }
        long j11 = 0;
        for (int i24 = 0; i24 < 64; i24 += 7) {
            if (this.f30909i == this.f30907g) {
                i(1);
            }
            byte[] bArr2 = this.f30906f;
            int i25 = this.f30909i;
            this.f30909i = i25 + 1;
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
            int i5 = this.f30907g;
            int i11 = this.f30909i;
            if (iM <= i5 - i11) {
                String str = new String(this.f30906f, i11, iM, l1.f30847a);
                this.f30909i += iM;
                return str;
            }
        }
        if (iM == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iM > this.f30907g) {
            return new String(f(iM), l1.f30847a);
        }
        i(iM);
        String str2 = new String(this.f30906f, this.f30909i, iM, l1.f30847a);
        this.f30909i += iM;
        return str2;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final String s() throws IOException {
        byte[] bArrF;
        int iM = m();
        int i5 = this.f30909i;
        int i11 = this.f30907g;
        if (iM <= i11 - i5 && iM > 0) {
            bArrF = this.f30906f;
            this.f30909i = i5 + iM;
        } else {
            if (iM == 0) {
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            i5 = 0;
            if (iM <= i11) {
                i(iM);
                bArrF = this.f30906f;
                this.f30909i = iM;
            } else {
                bArrF = f(iM);
            }
        }
        return d4.f30786a.a(bArrF, i5, iM);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int t() throws n1 {
        if (c()) {
            this.f30910j = 0;
            return 0;
        }
        int iM = m();
        this.f30910j = iM;
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
        int i5 = this.f30909i;
        if (this.f30907g - i5 < 4) {
            i(4);
            i5 = this.f30909i;
        }
        byte[] bArr = this.f30906f;
        this.f30909i = i5 + 4;
        return ((bArr[i5 + 3] & 255) << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
    }

    public final long x() throws n1 {
        int i5 = this.f30909i;
        if (this.f30907g - i5 < 8) {
            i(8);
            i5 = this.f30909i;
        }
        byte[] bArr = this.f30906f;
        this.f30909i = i5 + 8;
        return ((bArr[i5 + 7] & 255) << 56) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 6] & 255) << 48);
    }

    public final long y() throws n1 {
        long j11;
        long j12;
        long j13;
        int i5 = this.f30909i;
        int i11 = this.f30907g;
        long j14 = 0;
        if (i11 != i5) {
            byte[] bArr = this.f30906f;
            int i12 = i5 + 1;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                this.f30909i = i12;
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
                this.f30909i = i13;
                return j11;
            }
        }
        for (int i22 = 0; i22 < 64; i22 += 7) {
            if (this.f30909i == this.f30907g) {
                i(1);
            }
            byte[] bArr2 = this.f30906f;
            int i23 = this.f30909i;
            this.f30909i = i23 + 1;
            j14 |= (r1 & AbstractJsonLexerKt.TC_INVALID) << i22;
            if ((bArr2[i23] & 128) == 0) {
                return j14;
            }
        }
        throw new n1("CodedInputStream encountered a malformed varint.");
    }

    public final void z() {
        int i5 = this.f30907g + this.f30908h;
        this.f30907g = i5;
        int i11 = this.f30911k + i5;
        int i12 = this.f30912l;
        if (i11 <= i12) {
            this.f30908h = 0;
            return;
        }
        int i13 = i11 - i12;
        this.f30908h = i13;
        this.f30907g = i5 - i13;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int d(int i5) throws n1 {
        if (i5 < 0) {
            throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        int i11 = this.f30911k + this.f30909i + i5;
        int i12 = this.f30912l;
        if (i11 > i12) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        this.f30912l = i11;
        z();
        return i12;
    }

    public final byte[] f(int i5) throws IOException {
        byte[] bArrG = g(i5);
        if (bArrG != null) {
            return bArrG;
        }
        int i11 = this.f30909i;
        int i12 = this.f30907g;
        int length = i12 - i11;
        this.f30911k += i12;
        this.f30909i = 0;
        this.f30907g = 0;
        ArrayList arrayListH = h(i5 - length);
        byte[] bArr = new byte[i5];
        System.arraycopy(this.f30906f, i11, bArr, 0, length);
        Iterator it = arrayListH.iterator();
        while (it.hasNext()) {
            byte[] bArr2 = (byte[]) it.next();
            System.arraycopy(bArr2, 0, bArr, length, bArr2.length);
            length += bArr2.length;
        }
        return bArr;
    }

    public final byte[] g(int i5) throws IOException {
        if (i5 == 0) {
            return l1.f30848b;
        }
        if (i5 < 0) {
            throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        int i11 = this.f30911k;
        int i12 = this.f30909i;
        int i13 = i11 + i12 + i5;
        if (i13 - this.f30930c > 0) {
            throw new n1("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit.");
        }
        int i14 = this.f30912l;
        if (i13 > i14) {
            j((i14 - i11) - i12);
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        int i15 = this.f30907g - i12;
        int i16 = i5 - i15;
        if (i16 >= 4096 && i16 > this.f30905e.available()) {
            return null;
        }
        byte[] bArr = new byte[i5];
        System.arraycopy(this.f30906f, this.f30909i, bArr, 0, i15);
        this.f30911k += this.f30907g;
        this.f30909i = 0;
        this.f30907g = 0;
        while (i15 < i5) {
            int i17 = this.f30905e.read(bArr, i15, i5 - i15);
            if (i17 == -1) {
                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
            this.f30911k += i17;
            i15 += i17;
        }
        return bArr;
    }

    public final ArrayList h(int i5) throws IOException {
        ArrayList arrayList = new ArrayList();
        while (i5 > 0) {
            int iMin = Math.min(i5, androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT);
            byte[] bArr = new byte[iMin];
            int i11 = 0;
            while (i11 < iMin) {
                int i12 = this.f30905e.read(bArr, i11, iMin - i11);
                if (i12 == -1) {
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                this.f30911k += i12;
                i11 += i12;
            }
            i5 -= iMin;
            arrayList.add(bArr);
        }
        return arrayList;
    }

    public final void i(int i5) throws n1 {
        if (k(i5)) {
            return;
        }
        if (i5 <= (this.f30930c - this.f30911k) - this.f30909i) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        throw new n1("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit.");
    }

    public final void j(int i5) throws n1 {
        int i11 = this.f30907g;
        int i12 = this.f30909i;
        int i13 = i11 - i12;
        if (i5 <= i13 && i5 >= 0) {
            this.f30909i = i12 + i5;
            return;
        }
        if (i5 < 0) {
            throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        int i14 = this.f30911k;
        int i15 = i14 + i12;
        int i16 = i15 + i5;
        int i17 = this.f30912l;
        if (i16 > i17) {
            j((i17 - i14) - i12);
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        this.f30911k = i15;
        this.f30907g = 0;
        this.f30909i = 0;
        while (i13 < i5) {
            try {
                long j11 = i5 - i13;
                long jSkip = this.f30905e.skip(j11);
                if (jSkip < 0 || jSkip > j11) {
                    throw new IllegalStateException(this.f30905e.getClass() + "#skip returned invalid result: " + jSkip + "\nThe InputStream implementation is buggy.");
                }
                if (jSkip == 0) {
                    break;
                } else {
                    i13 += (int) jSkip;
                }
            } finally {
                this.f30911k += i13;
                z();
            }
        }
        if (i13 >= i5) {
            return;
        }
        int i18 = this.f30907g;
        int i19 = i18 - this.f30909i;
        this.f30909i = i18;
        i(1);
        while (true) {
            int i21 = i5 - i19;
            int i22 = this.f30907g;
            if (i21 <= i22) {
                this.f30909i = i21;
                return;
            } else {
                i19 += i22;
                this.f30909i = i22;
                i(1);
            }
        }
    }

    public final boolean k(int i5) throws IOException {
        int i11 = this.f30909i;
        int i12 = i11 + i5;
        int i13 = this.f30907g;
        if (i12 <= i13) {
            throw new IllegalStateException(b.c0.i(i5, "refillBuffer() called when ", " bytes were already available in buffer"));
        }
        int i14 = this.f30930c;
        int i15 = this.f30911k;
        if (i5 > (i14 - i15) - i11 || i15 + i11 + i5 > this.f30912l) {
            return false;
        }
        if (i11 > 0) {
            if (i13 > i11) {
                byte[] bArr = this.f30906f;
                System.arraycopy(bArr, i11, bArr, 0, i13 - i11);
            }
            this.f30911k += i11;
            this.f30907g -= i11;
            this.f30909i = 0;
        }
        InputStream inputStream = this.f30905e;
        byte[] bArr2 = this.f30906f;
        int i16 = this.f30907g;
        int i17 = inputStream.read(bArr2, i16, Math.min(bArr2.length - i16, (this.f30930c - this.f30911k) - i16));
        if (i17 == 0 || i17 < -1 || i17 > this.f30906f.length) {
            throw new IllegalStateException(this.f30905e.getClass() + "#read(byte[]) returned invalid result: " + i17 + "\nThe InputStream implementation is buggy.");
        }
        if (i17 <= 0) {
            return false;
        }
        this.f30907g += i17;
        z();
        if (this.f30907g >= i5) {
            return true;
        }
        return k(i5);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final boolean c() {
        return this.f30909i == this.f30907g && !k(1);
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
            this.f30912l = iD;
            z();
            return;
        }
        throw new n1("Protocol message had too many levels of nesting.  May be malicious.  Use CodedInputStream.setRecursionLimit() to increase the depth limit.");
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final q e() throws IOException {
        int iM = m();
        int i5 = this.f30907g;
        int i11 = this.f30909i;
        if (iM <= i5 - i11 && iM > 0) {
            byte[] bArr = this.f30906f;
            q qVar = s.f30889b;
            s.a(i11, i11 + iM, bArr.length);
            q qVar2 = new q(s.f30890c.a(bArr, i11, iM));
            this.f30909i += iM;
            return qVar2;
        }
        if (iM == 0) {
            return s.f30889b;
        }
        byte[] bArrG = g(iM);
        if (bArrG != null) {
            int length = bArrG.length;
            s.a(0, length, bArrG.length);
            return new q(s.f30890c.a(bArrG, 0, length));
        }
        int i12 = this.f30909i;
        int i13 = this.f30907g;
        int length2 = i13 - i12;
        this.f30911k += i13;
        this.f30909i = 0;
        this.f30907g = 0;
        ArrayList arrayListH = h(iM - length2);
        byte[] bArr2 = new byte[iM];
        System.arraycopy(this.f30906f, i12, bArr2, 0, length2);
        Iterator it = arrayListH.iterator();
        while (it.hasNext()) {
            byte[] bArr3 = (byte[]) it.next();
            System.arraycopy(bArr3, 0, bArr2, length2, bArr3.length);
            length2 += bArr3.length;
        }
        q qVar3 = s.f30889b;
        return new q(bArr2);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w
    public final int a() {
        int i5 = this.f30912l;
        if (i5 == Integer.MAX_VALUE) {
            return -1;
        }
        return i5 - (this.f30911k + this.f30909i);
    }
}
