package androidx.datastore.preferences.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class k extends a5.l1 {

    /* renamed from: c, reason: collision with root package name */
    public final InputStream f14338c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f14339d;

    /* renamed from: e, reason: collision with root package name */
    public int f14340e;

    /* renamed from: f, reason: collision with root package name */
    public int f14341f;

    /* renamed from: g, reason: collision with root package name */
    public int f14342g;

    /* renamed from: h, reason: collision with root package name */
    public int f14343h;

    /* renamed from: i, reason: collision with root package name */
    public int f14344i;

    /* renamed from: j, reason: collision with root package name */
    public int f14345j = LayoutNode.NotPlacedPlaceOrder;

    public k(InputStream inputStream) {
        b0.a(inputStream, "input");
        this.f14338c = inputStream;
        this.f14339d = new byte[androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT];
        this.f14340e = 0;
        this.f14342g = 0;
        this.f14344i = 0;
    }

    @Override // a5.l1
    public final int A() {
        return K();
    }

    @Override // a5.l1
    public final long B() {
        return L();
    }

    @Override // a5.l1
    public final boolean C(int i5) throws InvalidProtocolBufferException {
        int i11 = i5 & 7;
        int i12 = 0;
        if (i11 != 0) {
            if (i11 == 1) {
                P(8);
                return true;
            }
            if (i11 == 2) {
                P(K());
                return true;
            }
            if (i11 == 3) {
                E();
                a(((i5 >>> 3) << 3) | 4);
                return true;
            }
            if (i11 == 4) {
                return false;
            }
            if (i11 != 5) {
                throw InvalidProtocolBufferException.b();
            }
            P(4);
            return true;
        }
        int i13 = this.f14340e - this.f14342g;
        byte[] bArr = this.f14339d;
        if (i13 >= 10) {
            while (i12 < 10) {
                int i14 = this.f14342g;
                this.f14342g = i14 + 1;
                if (bArr[i14] < 0) {
                    i12++;
                }
            }
            throw InvalidProtocolBufferException.c();
        }
        while (i12 < 10) {
            if (this.f14342g == this.f14340e) {
                O(1);
            }
            int i15 = this.f14342g;
            this.f14342g = i15 + 1;
            if (bArr[i15] < 0) {
                i12++;
            }
        }
        throw InvalidProtocolBufferException.c();
        return true;
    }

    public final byte[] F(int i5) throws IOException {
        byte[] bArrG = G(i5);
        if (bArrG != null) {
            return bArrG;
        }
        int i11 = this.f14342g;
        int i12 = this.f14340e;
        int length = i12 - i11;
        this.f14344i += i12;
        this.f14342g = 0;
        this.f14340e = 0;
        ArrayList arrayListH = H(i5 - length);
        byte[] bArr = new byte[i5];
        System.arraycopy(this.f14339d, i11, bArr, 0, length);
        Iterator it = arrayListH.iterator();
        while (it.hasNext()) {
            byte[] bArr2 = (byte[]) it.next();
            System.arraycopy(bArr2, 0, bArr, length, bArr2.length);
            length += bArr2.length;
        }
        return bArr;
    }

    public final byte[] G(int i5) throws IOException {
        if (i5 == 0) {
            return b0.f14279b;
        }
        if (i5 < 0) {
            throw InvalidProtocolBufferException.d();
        }
        int i11 = this.f14344i;
        int i12 = this.f14342g;
        int i13 = i11 + i12 + i5;
        if (i13 - LayoutNode.NotPlacedPlaceOrder > 0) {
            throw new InvalidProtocolBufferException("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit.");
        }
        int i14 = this.f14345j;
        if (i13 > i14) {
            P((i14 - i11) - i12);
            throw InvalidProtocolBufferException.e();
        }
        int i15 = this.f14340e - i12;
        int i16 = i5 - i15;
        InputStream inputStream = this.f14338c;
        if (i16 >= 4096) {
            try {
                if (i16 > inputStream.available()) {
                    return null;
                }
            } catch (InvalidProtocolBufferException e3) {
                e3.f14273a = true;
                throw e3;
            }
        }
        byte[] bArr = new byte[i5];
        System.arraycopy(this.f14339d, this.f14342g, bArr, 0, i15);
        this.f14344i += this.f14340e;
        this.f14342g = 0;
        this.f14340e = 0;
        while (i15 < i5) {
            try {
                int i17 = inputStream.read(bArr, i15, i5 - i15);
                if (i17 == -1) {
                    throw InvalidProtocolBufferException.e();
                }
                this.f14344i += i17;
                i15 += i17;
            } catch (InvalidProtocolBufferException e11) {
                e11.f14273a = true;
                throw e11;
            }
        }
        return bArr;
    }

    public final ArrayList H(int i5) throws IOException {
        ArrayList arrayList = new ArrayList();
        while (i5 > 0) {
            int iMin = Math.min(i5, androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT);
            byte[] bArr = new byte[iMin];
            int i11 = 0;
            while (i11 < iMin) {
                int i12 = this.f14338c.read(bArr, i11, iMin - i11);
                if (i12 == -1) {
                    throw InvalidProtocolBufferException.e();
                }
                this.f14344i += i12;
                i11 += i12;
            }
            i5 -= iMin;
            arrayList.add(bArr);
        }
        return arrayList;
    }

    public final int I() throws InvalidProtocolBufferException {
        int i5 = this.f14342g;
        if (this.f14340e - i5 < 4) {
            O(4);
            i5 = this.f14342g;
        }
        this.f14342g = i5 + 4;
        byte[] bArr = this.f14339d;
        return ((bArr[i5 + 3] & 255) << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
    }

    public final long J() throws InvalidProtocolBufferException {
        int i5 = this.f14342g;
        if (this.f14340e - i5 < 8) {
            O(8);
            i5 = this.f14342g;
        }
        this.f14342g = i5 + 8;
        byte[] bArr = this.f14339d;
        return ((bArr[i5 + 7] & 255) << 56) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 6] & 255) << 48);
    }

    public final int K() {
        int i5;
        int i11 = this.f14342g;
        int i12 = this.f14340e;
        if (i12 != i11) {
            int i13 = i11 + 1;
            byte[] bArr = this.f14339d;
            byte b11 = bArr[i11];
            if (b11 >= 0) {
                this.f14342g = i13;
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
                this.f14342g = i14;
                return i5;
            }
        }
        return (int) M();
    }

    public final long L() {
        long j11;
        long j12;
        long j13;
        long j14;
        int i5 = this.f14342g;
        int i11 = this.f14340e;
        if (i11 != i5) {
            int i12 = i5 + 1;
            byte[] bArr = this.f14339d;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                this.f14342g = i12;
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
                this.f14342g = i13;
                return j11;
            }
        }
        return M();
    }

    public final long M() throws InvalidProtocolBufferException {
        long j11 = 0;
        for (int i5 = 0; i5 < 64; i5 += 7) {
            if (this.f14342g == this.f14340e) {
                O(1);
            }
            int i11 = this.f14342g;
            this.f14342g = i11 + 1;
            j11 |= (r3 & AbstractJsonLexerKt.TC_INVALID) << i5;
            if ((this.f14339d[i11] & 128) == 0) {
                return j11;
            }
        }
        throw InvalidProtocolBufferException.c();
    }

    public final void N() {
        int i5 = this.f14340e + this.f14341f;
        this.f14340e = i5;
        int i11 = this.f14344i + i5;
        int i12 = this.f14345j;
        if (i11 <= i12) {
            this.f14341f = 0;
            return;
        }
        int i13 = i11 - i12;
        this.f14341f = i13;
        this.f14340e = i5 - i13;
    }

    public final void O(int i5) throws InvalidProtocolBufferException {
        if (Q(i5)) {
            return;
        }
        if (i5 <= (LayoutNode.NotPlacedPlaceOrder - this.f14344i) - this.f14342g) {
            throw InvalidProtocolBufferException.e();
        }
        throw new InvalidProtocolBufferException("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit.");
    }

    public final void P(int i5) throws InvalidProtocolBufferException {
        int i11 = this.f14340e;
        int i12 = this.f14342g;
        if (i5 <= i11 - i12 && i5 >= 0) {
            this.f14342g = i12 + i5;
            return;
        }
        InputStream inputStream = this.f14338c;
        if (i5 < 0) {
            throw InvalidProtocolBufferException.d();
        }
        int i13 = this.f14344i;
        int i14 = i13 + i12;
        int i15 = i14 + i5;
        int i16 = this.f14345j;
        if (i15 > i16) {
            P((i16 - i13) - i12);
            throw InvalidProtocolBufferException.e();
        }
        this.f14344i = i14;
        int i17 = i11 - i12;
        this.f14340e = 0;
        this.f14342g = 0;
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
                    e3.f14273a = true;
                    throw e3;
                }
            } catch (Throwable th2) {
                this.f14344i += i17;
                N();
                throw th2;
            }
        }
        this.f14344i += i17;
        N();
        if (i17 >= i5) {
            return;
        }
        int i18 = this.f14340e;
        int i19 = i18 - this.f14342g;
        this.f14342g = i18;
        O(1);
        while (true) {
            int i21 = i5 - i19;
            int i22 = this.f14340e;
            if (i21 <= i22) {
                this.f14342g = i21;
                return;
            } else {
                i19 += i22;
                this.f14342g = i22;
                O(1);
            }
        }
    }

    public final boolean Q(int i5) throws IOException {
        InputStream inputStream = this.f14338c;
        int i11 = this.f14342g;
        int i12 = i11 + i5;
        int i13 = this.f14340e;
        if (i12 <= i13) {
            throw new IllegalStateException(b.c0.i(i5, "refillBuffer() called when ", " bytes were already available in buffer"));
        }
        int i14 = this.f14344i;
        if (i5 <= (LayoutNode.NotPlacedPlaceOrder - i14) - i11 && i14 + i11 + i5 <= this.f14345j) {
            byte[] bArr = this.f14339d;
            if (i11 > 0) {
                if (i13 > i11) {
                    System.arraycopy(bArr, i11, bArr, 0, i13 - i11);
                }
                this.f14344i += i11;
                this.f14340e -= i11;
                this.f14342g = 0;
            }
            int i15 = this.f14340e;
            try {
                int i16 = inputStream.read(bArr, i15, Math.min(bArr.length - i15, (LayoutNode.NotPlacedPlaceOrder - this.f14344i) - i15));
                if (i16 == 0 || i16 < -1 || i16 > bArr.length) {
                    throw new IllegalStateException(inputStream.getClass() + "#read(byte[]) returned invalid result: " + i16 + "\nThe InputStream implementation is buggy.");
                }
                if (i16 > 0) {
                    this.f14340e += i16;
                    N();
                    if (this.f14340e >= i5) {
                        return true;
                    }
                    return Q(i5);
                }
            } catch (InvalidProtocolBufferException e3) {
                e3.f14273a = true;
                throw e3;
            }
        }
        return false;
    }

    @Override // a5.l1
    public final void a(int i5) throws InvalidProtocolBufferException {
        if (this.f14343h != i5) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // a5.l1
    public final int b() {
        return this.f14344i + this.f14342g;
    }

    @Override // a5.l1
    public final boolean c() {
        return this.f14342g == this.f14340e && !Q(1);
    }

    @Override // a5.l1
    public final void h(int i5) {
        this.f14345j = i5;
        N();
    }

    @Override // a5.l1
    public final int i(int i5) throws InvalidProtocolBufferException {
        if (i5 < 0) {
            throw InvalidProtocolBufferException.d();
        }
        int i11 = this.f14344i + this.f14342g + i5;
        if (i11 < 0) {
            throw new InvalidProtocolBufferException("Failed to parse the message.");
        }
        int i12 = this.f14345j;
        if (i11 > i12) {
            throw InvalidProtocolBufferException.e();
        }
        this.f14345j = i11;
        N();
        return i12;
    }

    @Override // a5.l1
    public final boolean j() {
        return L() != 0;
    }

    @Override // a5.l1
    public final h k() throws IOException {
        int iK = K();
        int i5 = this.f14340e;
        int i11 = this.f14342g;
        int i12 = i5 - i11;
        byte[] bArr = this.f14339d;
        if (iK <= i12 && iK > 0) {
            h hVarE = h.e(i11, iK, bArr);
            this.f14342g += iK;
            return hVarE;
        }
        if (iK == 0) {
            return h.f14324c;
        }
        if (iK < 0) {
            throw InvalidProtocolBufferException.d();
        }
        byte[] bArrG = G(iK);
        if (bArrG != null) {
            return h.e(0, bArrG.length, bArrG);
        }
        int i13 = this.f14342g;
        int i14 = this.f14340e;
        int length = i14 - i13;
        this.f14344i += i14;
        this.f14342g = 0;
        this.f14340e = 0;
        ArrayList arrayListH = H(iK - length);
        byte[] bArr2 = new byte[iK];
        System.arraycopy(bArr, i13, bArr2, 0, length);
        Iterator it = arrayListH.iterator();
        while (it.hasNext()) {
            byte[] bArr3 = (byte[]) it.next();
            System.arraycopy(bArr3, 0, bArr2, length, bArr3.length);
            length += bArr3.length;
        }
        h hVar = h.f14324c;
        return new h(bArr2);
    }

    @Override // a5.l1
    public final double l() {
        return Double.longBitsToDouble(J());
    }

    @Override // a5.l1
    public final int m() {
        return K();
    }

    @Override // a5.l1
    public final int n() {
        return I();
    }

    @Override // a5.l1
    public final long o() {
        return J();
    }

    @Override // a5.l1
    public final float p() {
        return Float.intBitsToFloat(I());
    }

    @Override // a5.l1
    public final int q() {
        return K();
    }

    @Override // a5.l1
    public final long r() {
        return L();
    }

    @Override // a5.l1
    public final int s() {
        return I();
    }

    @Override // a5.l1
    public final long t() {
        return J();
    }

    @Override // a5.l1
    public final int v() {
        int iK = K();
        return (-(iK & 1)) ^ (iK >>> 1);
    }

    @Override // a5.l1
    public final long w() {
        long jL = L();
        return (-(jL & 1)) ^ (jL >>> 1);
    }

    @Override // a5.l1
    public final String x() throws InvalidProtocolBufferException {
        int iK = K();
        byte[] bArr = this.f14339d;
        if (iK > 0) {
            int i5 = this.f14340e;
            int i11 = this.f14342g;
            if (iK <= i5 - i11) {
                String str = new String(bArr, i11, iK, b0.f14278a);
                this.f14342g += iK;
                return str;
            }
        }
        if (iK == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iK < 0) {
            throw InvalidProtocolBufferException.d();
        }
        if (iK > this.f14340e) {
            return new String(F(iK), b0.f14278a);
        }
        O(iK);
        String str2 = new String(bArr, this.f14342g, iK, b0.f14278a);
        this.f14342g += iK;
        return str2;
    }

    @Override // a5.l1
    public final String y() throws IOException {
        int iK = K();
        int i5 = this.f14342g;
        int i11 = this.f14340e;
        int i12 = i11 - i5;
        byte[] bArrF = this.f14339d;
        if (iK <= i12 && iK > 0) {
            this.f14342g = i5 + iK;
        } else {
            if (iK == 0) {
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            if (iK < 0) {
                throw InvalidProtocolBufferException.d();
            }
            i5 = 0;
            if (iK <= i11) {
                O(iK);
                this.f14342g = iK;
            } else {
                bArrF = F(iK);
            }
        }
        return q1.f14388a.K(i5, iK, bArrF);
    }

    @Override // a5.l1
    public final int z() throws InvalidProtocolBufferException {
        if (c()) {
            this.f14343h = 0;
            return 0;
        }
        int iK = K();
        this.f14343h = iK;
        if ((iK >>> 3) != 0) {
            return iK;
        }
        throw new InvalidProtocolBufferException("Protocol message contained an invalid tag (zero).");
    }
}
