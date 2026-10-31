package com.google.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class n extends p {

    /* renamed from: c, reason: collision with root package name */
    public final InputStream f34917c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f34918d;

    /* renamed from: e, reason: collision with root package name */
    public int f34919e;

    /* renamed from: f, reason: collision with root package name */
    public int f34920f;

    /* renamed from: g, reason: collision with root package name */
    public int f34921g;

    /* renamed from: h, reason: collision with root package name */
    public int f34922h;

    /* renamed from: i, reason: collision with root package name */
    public int f34923i;

    /* renamed from: j, reason: collision with root package name */
    public int f34924j = LayoutNode.NotPlacedPlaceOrder;

    public n(InputStream inputStream) {
        a1.a(inputStream, "input");
        this.f34917c = inputStream;
        this.f34918d = new byte[androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT];
        this.f34919e = 0;
        this.f34921g = 0;
        this.f34923i = 0;
    }

    @Override // com.google.protobuf.p
    public final int A() {
        return p.c(w());
    }

    @Override // com.google.protobuf.p
    public final long B() {
        return p.d(O());
    }

    @Override // com.google.protobuf.p
    public final String C() throws InvalidProtocolBufferException {
        int iW = w();
        byte[] bArr = this.f34918d;
        if (iW > 0) {
            int i5 = this.f34919e;
            int i11 = this.f34921g;
            if (iW <= i5 - i11) {
                String str = new String(bArr, i11, iW, a1.f34808a);
                this.f34921g += iW;
                return str;
            }
        }
        if (iW == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iW < 0) {
            throw InvalidProtocolBufferException.e();
        }
        if (iW > this.f34919e) {
            return new String(J(iW), a1.f34808a);
        }
        R(iW);
        String str2 = new String(bArr, this.f34921g, iW, a1.f34808a);
        this.f34921g += iW;
        return str2;
    }

    @Override // com.google.protobuf.p
    public final String D() throws IOException {
        int iW = w();
        int i5 = this.f34921g;
        int i11 = this.f34919e;
        int i12 = i11 - i5;
        byte[] bArrJ = this.f34918d;
        if (iW <= i12 && iW > 0) {
            this.f34921g = i5 + iW;
        } else {
            if (iW == 0) {
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            if (iW < 0) {
                throw InvalidProtocolBufferException.e();
            }
            i5 = 0;
            if (iW <= i11) {
                R(iW);
                this.f34921g = iW;
            } else {
                bArrJ = J(iW);
            }
        }
        return o2.f34936a.a(i5, iW, bArrJ);
    }

    @Override // com.google.protobuf.p
    public final int E() throws InvalidProtocolBufferException {
        if (g()) {
            this.f34922h = 0;
            return 0;
        }
        int iW = w();
        this.f34922h = iW;
        if ((iW >>> 3) != 0) {
            return iW;
        }
        throw InvalidProtocolBufferException.a();
    }

    @Override // com.google.protobuf.p
    public final int F() {
        return w();
    }

    @Override // com.google.protobuf.p
    public final long G() {
        return O();
    }

    @Override // com.google.protobuf.p
    public final boolean H(int i5) throws InvalidProtocolBufferException {
        int i11 = i5 & 7;
        int i12 = 0;
        if (i11 != 0) {
            if (i11 == 1) {
                S(8);
                return true;
            }
            if (i11 == 2) {
                S(w());
                return true;
            }
            if (i11 == 3) {
                I();
                a(((i5 >>> 3) << 3) | 4);
                return true;
            }
            if (i11 == 4) {
                return false;
            }
            if (i11 != 5) {
                throw InvalidProtocolBufferException.c();
            }
            S(4);
            return true;
        }
        int i13 = this.f34919e - this.f34921g;
        byte[] bArr = this.f34918d;
        if (i13 >= 10) {
            while (i12 < 10) {
                int i14 = this.f34921g;
                this.f34921g = i14 + 1;
                if (bArr[i14] < 0) {
                    i12++;
                }
            }
            throw InvalidProtocolBufferException.d();
        }
        while (i12 < 10) {
            if (this.f34921g == this.f34919e) {
                R(1);
            }
            int i15 = this.f34921g;
            this.f34921g = i15 + 1;
            if (bArr[i15] < 0) {
                i12++;
            }
        }
        throw InvalidProtocolBufferException.d();
        return true;
    }

    public final byte[] J(int i5) throws IOException {
        byte[] bArrK = K(i5);
        if (bArrK != null) {
            return bArrK;
        }
        int i11 = this.f34921g;
        int i12 = this.f34919e;
        int length = i12 - i11;
        this.f34923i += i12;
        this.f34921g = 0;
        this.f34919e = 0;
        ArrayList arrayListL = L(i5 - length);
        byte[] bArr = new byte[i5];
        System.arraycopy(this.f34918d, i11, bArr, 0, length);
        Iterator it = arrayListL.iterator();
        while (it.hasNext()) {
            byte[] bArr2 = (byte[]) it.next();
            System.arraycopy(bArr2, 0, bArr, length, bArr2.length);
            length += bArr2.length;
        }
        return bArr;
    }

    public final byte[] K(int i5) throws IOException {
        if (i5 == 0) {
            return a1.f34809b;
        }
        if (i5 < 0) {
            throw InvalidProtocolBufferException.e();
        }
        int i11 = this.f34923i;
        int i12 = this.f34921g;
        int i13 = i11 + i12 + i5;
        if (i13 - LayoutNode.NotPlacedPlaceOrder > 0) {
            throw new InvalidProtocolBufferException("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit.");
        }
        int i14 = this.f34924j;
        if (i13 > i14) {
            S((i14 - i11) - i12);
            throw InvalidProtocolBufferException.g();
        }
        int i15 = this.f34919e - i12;
        int i16 = i5 - i15;
        InputStream inputStream = this.f34917c;
        if (i16 >= 4096) {
            try {
                if (i16 > inputStream.available()) {
                    return null;
                }
            } catch (InvalidProtocolBufferException e3) {
                e3.f34804a = true;
                throw e3;
            }
        }
        byte[] bArr = new byte[i5];
        System.arraycopy(this.f34918d, this.f34921g, bArr, 0, i15);
        this.f34923i += this.f34919e;
        this.f34921g = 0;
        this.f34919e = 0;
        while (i15 < i5) {
            try {
                int i17 = inputStream.read(bArr, i15, i5 - i15);
                if (i17 == -1) {
                    throw InvalidProtocolBufferException.g();
                }
                this.f34923i += i17;
                i15 += i17;
            } catch (InvalidProtocolBufferException e11) {
                e11.f34804a = true;
                throw e11;
            }
        }
        return bArr;
    }

    public final ArrayList L(int i5) throws IOException {
        ArrayList arrayList = new ArrayList();
        while (i5 > 0) {
            int iMin = Math.min(i5, androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT);
            byte[] bArr = new byte[iMin];
            int i11 = 0;
            while (i11 < iMin) {
                int i12 = this.f34917c.read(bArr, i11, iMin - i11);
                if (i12 == -1) {
                    throw InvalidProtocolBufferException.g();
                }
                this.f34923i += i12;
                i11 += i12;
            }
            i5 -= iMin;
            arrayList.add(bArr);
        }
        return arrayList;
    }

    public final int M() throws InvalidProtocolBufferException {
        int i5 = this.f34921g;
        if (this.f34919e - i5 < 4) {
            R(4);
            i5 = this.f34921g;
        }
        this.f34921g = i5 + 4;
        byte[] bArr = this.f34918d;
        return ((bArr[i5 + 3] & 255) << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
    }

    public final long N() throws InvalidProtocolBufferException {
        int i5 = this.f34921g;
        if (this.f34919e - i5 < 8) {
            R(8);
            i5 = this.f34921g;
        }
        this.f34921g = i5 + 8;
        byte[] bArr = this.f34918d;
        return ((bArr[i5 + 7] & 255) << 56) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 6] & 255) << 48);
    }

    public final long O() {
        long j11;
        long j12;
        long j13;
        long j14;
        int i5 = this.f34921g;
        int i11 = this.f34919e;
        if (i11 != i5) {
            int i12 = i5 + 1;
            byte[] bArr = this.f34918d;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                this.f34921g = i12;
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
                            j14 = (-2080896) ^ i18;
                        } else {
                            long j15 = i18;
                            i13 = i5 + 5;
                            long j16 = j15 ^ (bArr[i17] << 28);
                            if (j16 >= 0) {
                                j13 = 266354560;
                            } else {
                                i17 = i5 + 6;
                                long j17 = j16 ^ (bArr[i13] << 35);
                                if (j17 < 0) {
                                    j12 = -34093383808L;
                                } else {
                                    i13 = i5 + 7;
                                    j16 = j17 ^ (bArr[i17] << 42);
                                    if (j16 >= 0) {
                                        j13 = 4363953127296L;
                                    } else {
                                        i17 = i5 + 8;
                                        j17 = j16 ^ (bArr[i13] << 49);
                                        if (j17 < 0) {
                                            j12 = -558586000294016L;
                                        } else {
                                            i13 = i5 + 9;
                                            long j18 = (j17 ^ (bArr[i17] << 56)) ^ 71499008037633920L;
                                            if (j18 < 0) {
                                                int i19 = i5 + 10;
                                                if (bArr[i13] >= 0) {
                                                    i13 = i19;
                                                }
                                            }
                                            j11 = j18;
                                        }
                                    }
                                }
                                j14 = j12 ^ j17;
                            }
                            j11 = j13 ^ j16;
                        }
                        i13 = i17;
                        j11 = j14;
                    }
                }
                this.f34921g = i13;
                return j11;
            }
        }
        return P();
    }

    public final long P() throws InvalidProtocolBufferException {
        long j11 = 0;
        for (int i5 = 0; i5 < 64; i5 += 7) {
            if (this.f34921g == this.f34919e) {
                R(1);
            }
            int i11 = this.f34921g;
            this.f34921g = i11 + 1;
            j11 |= (r3 & AbstractJsonLexerKt.TC_INVALID) << i5;
            if ((this.f34918d[i11] & 128) == 0) {
                return j11;
            }
        }
        throw InvalidProtocolBufferException.d();
    }

    public final void Q() {
        int i5 = this.f34919e + this.f34920f;
        this.f34919e = i5;
        int i11 = this.f34923i + i5;
        int i12 = this.f34924j;
        if (i11 <= i12) {
            this.f34920f = 0;
            return;
        }
        int i13 = i11 - i12;
        this.f34920f = i13;
        this.f34919e = i5 - i13;
    }

    public final void R(int i5) throws InvalidProtocolBufferException {
        if (T(i5)) {
            return;
        }
        if (i5 <= (LayoutNode.NotPlacedPlaceOrder - this.f34923i) - this.f34921g) {
            throw InvalidProtocolBufferException.g();
        }
        throw new InvalidProtocolBufferException("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit.");
    }

    public final void S(int i5) throws InvalidProtocolBufferException {
        int i11 = this.f34919e;
        int i12 = this.f34921g;
        if (i5 <= i11 - i12 && i5 >= 0) {
            this.f34921g = i12 + i5;
            return;
        }
        InputStream inputStream = this.f34917c;
        if (i5 < 0) {
            throw InvalidProtocolBufferException.e();
        }
        int i13 = this.f34923i;
        int i14 = i13 + i12;
        int i15 = i14 + i5;
        int i16 = this.f34924j;
        if (i15 > i16) {
            S((i16 - i13) - i12);
            throw InvalidProtocolBufferException.g();
        }
        this.f34923i = i14;
        int i17 = i11 - i12;
        this.f34919e = 0;
        this.f34921g = 0;
        while (i17 < i5) {
            long j11 = i5 - i17;
            try {
                try {
                    long jSkip = inputStream.skip(j11);
                    if (jSkip < 0 || jSkip > j11) {
                        throw new IllegalStateException(inputStream.getClass() + "#skip returned invalid result: " + jSkip + "\nThe InputStream implementation is buggy.");
                    }
                    if (jSkip == 0) {
                        break;
                    } else {
                        i17 += (int) jSkip;
                    }
                } catch (InvalidProtocolBufferException e3) {
                    e3.f34804a = true;
                    throw e3;
                }
            } catch (Throwable th2) {
                this.f34923i += i17;
                Q();
                throw th2;
            }
        }
        this.f34923i += i17;
        Q();
        if (i17 >= i5) {
            return;
        }
        int i18 = this.f34919e;
        int i19 = i18 - this.f34921g;
        this.f34921g = i18;
        R(1);
        while (true) {
            int i21 = i5 - i19;
            int i22 = this.f34919e;
            if (i21 <= i22) {
                this.f34921g = i21;
                return;
            } else {
                i19 += i22;
                this.f34921g = i22;
                R(1);
            }
        }
    }

    public final boolean T(int i5) throws IOException {
        InputStream inputStream = this.f34917c;
        int i11 = this.f34921g;
        int i12 = i11 + i5;
        int i13 = this.f34919e;
        if (i12 <= i13) {
            throw new IllegalStateException(b.c0.i(i5, "refillBuffer() called when ", " bytes were already available in buffer"));
        }
        int i14 = this.f34923i;
        if (i5 <= (LayoutNode.NotPlacedPlaceOrder - i14) - i11 && i14 + i11 + i5 <= this.f34924j) {
            byte[] bArr = this.f34918d;
            if (i11 > 0) {
                if (i13 > i11) {
                    System.arraycopy(bArr, i11, bArr, 0, i13 - i11);
                }
                this.f34923i += i11;
                this.f34919e -= i11;
                this.f34921g = 0;
            }
            int i15 = this.f34919e;
            try {
                int i16 = inputStream.read(bArr, i15, Math.min(bArr.length - i15, (LayoutNode.NotPlacedPlaceOrder - this.f34923i) - i15));
                if (i16 == 0 || i16 < -1 || i16 > bArr.length) {
                    throw new IllegalStateException(inputStream.getClass() + "#read(byte[]) returned invalid result: " + i16 + "\nThe InputStream implementation is buggy.");
                }
                if (i16 > 0) {
                    this.f34919e += i16;
                    Q();
                    if (this.f34919e >= i5) {
                        return true;
                    }
                    return T(i5);
                }
            } catch (InvalidProtocolBufferException e3) {
                e3.f34804a = true;
                throw e3;
            }
        }
        return false;
    }

    @Override // com.google.protobuf.p
    public final void a(int i5) throws InvalidProtocolBufferException {
        if (this.f34922h != i5) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // com.google.protobuf.p
    public final int e() {
        int i5 = this.f34924j;
        if (i5 == Integer.MAX_VALUE) {
            return -1;
        }
        return i5 - (this.f34923i + this.f34921g);
    }

    @Override // com.google.protobuf.p
    public final int f() {
        return this.f34923i + this.f34921g;
    }

    @Override // com.google.protobuf.p
    public final boolean g() {
        return this.f34921g == this.f34919e && !T(1);
    }

    @Override // com.google.protobuf.p
    public final void j(int i5) {
        this.f34924j = i5;
        Q();
    }

    @Override // com.google.protobuf.p
    public final int k(int i5) throws InvalidProtocolBufferException {
        if (i5 < 0) {
            throw InvalidProtocolBufferException.e();
        }
        int i11 = this.f34923i + this.f34921g + i5;
        if (i11 < 0) {
            throw InvalidProtocolBufferException.f();
        }
        int i12 = this.f34924j;
        if (i11 > i12) {
            throw InvalidProtocolBufferException.g();
        }
        this.f34924j = i11;
        Q();
        return i12;
    }

    @Override // com.google.protobuf.p
    public final boolean l() {
        return O() != 0;
    }

    @Override // com.google.protobuf.p
    public final j m() throws IOException {
        int iW = w();
        int i5 = this.f34919e;
        int i11 = this.f34921g;
        int i12 = i5 - i11;
        byte[] bArr = this.f34918d;
        if (iW <= i12 && iW > 0) {
            j jVarE = l.e(i11, iW, bArr);
            this.f34921g += iW;
            return jVarE;
        }
        if (iW == 0) {
            return l.f34884b;
        }
        if (iW < 0) {
            throw InvalidProtocolBufferException.e();
        }
        byte[] bArrK = K(iW);
        if (bArrK != null) {
            return l.e(0, bArrK.length, bArrK);
        }
        int i13 = this.f34921g;
        int i14 = this.f34919e;
        int length = i14 - i13;
        this.f34923i += i14;
        this.f34921g = 0;
        this.f34919e = 0;
        ArrayList arrayListL = L(iW - length);
        byte[] bArr2 = new byte[iW];
        System.arraycopy(bArr, i13, bArr2, 0, length);
        Iterator it = arrayListL.iterator();
        while (it.hasNext()) {
            byte[] bArr3 = (byte[]) it.next();
            System.arraycopy(bArr3, 0, bArr2, length, bArr3.length);
            length += bArr3.length;
        }
        j jVar = l.f34884b;
        return new j(bArr2);
    }

    @Override // com.google.protobuf.p
    public final double n() {
        return Double.longBitsToDouble(N());
    }

    @Override // com.google.protobuf.p
    public final int o() {
        return w();
    }

    @Override // com.google.protobuf.p
    public final int p() {
        return M();
    }

    @Override // com.google.protobuf.p
    public final long q() {
        return N();
    }

    @Override // com.google.protobuf.p
    public final float r() {
        return Float.intBitsToFloat(M());
    }

    @Override // com.google.protobuf.p
    public final void s(int i5, n1 n1Var, y yVar) throws InvalidProtocolBufferException {
        b();
        this.f34937a++;
        n1Var.mergeFrom(this, yVar);
        a((i5 << 3) | 4);
        this.f34937a--;
    }

    @Override // com.google.protobuf.p
    public final int t() {
        return w();
    }

    @Override // com.google.protobuf.p
    public final long u() {
        return O();
    }

    @Override // com.google.protobuf.p
    public final void v(n1 n1Var, y yVar) throws InvalidProtocolBufferException {
        int iW = w();
        b();
        int iK = k(iW);
        this.f34937a++;
        n1Var.mergeFrom(this, yVar);
        a(0);
        this.f34937a--;
        if (e() != 0) {
            throw InvalidProtocolBufferException.g();
        }
        j(iK);
    }

    @Override // com.google.protobuf.p
    public final int w() {
        int i5;
        int i11 = this.f34921g;
        int i12 = this.f34919e;
        if (i12 != i11) {
            int i13 = i11 + 1;
            byte[] bArr = this.f34918d;
            byte b11 = bArr[i11];
            if (b11 >= 0) {
                this.f34921g = i13;
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
                this.f34921g = i14;
                return i5;
            }
        }
        return (int) P();
    }

    @Override // com.google.protobuf.p
    public final int y() {
        return M();
    }

    @Override // com.google.protobuf.p
    public final long z() {
        return N();
    }
}
