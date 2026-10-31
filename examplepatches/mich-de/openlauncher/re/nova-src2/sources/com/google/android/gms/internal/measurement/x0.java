package com.google.android.gms.internal.measurement;

import androidx.compose.ui.node.LayoutNode;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class x0 extends y0 {

    /* renamed from: d, reason: collision with root package name */
    public final InputStream f33207d;

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f33208e;

    /* renamed from: f, reason: collision with root package name */
    public int f33209f;

    /* renamed from: g, reason: collision with root package name */
    public int f33210g;

    /* renamed from: h, reason: collision with root package name */
    public int f33211h;

    /* renamed from: i, reason: collision with root package name */
    public int f33212i;

    /* renamed from: j, reason: collision with root package name */
    public int f33213j;

    /* renamed from: k, reason: collision with root package name */
    public int f33214k = LayoutNode.NotPlacedPlaceOrder;

    public /* synthetic */ x0(InputStream inputStream, int i5) {
        this.f33207d = inputStream;
        this.f33208e = new byte[i5 < 8 ? 8 : i5];
        this.f33209f = 0;
        this.f33211h = 0;
        this.f33213j = 0;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int A() {
        return G();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int B() {
        return G();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int C() {
        return P();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final long D() {
        return Q();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int E() {
        return y0.j(G());
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final long F() {
        return y0.k(H());
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int G() {
        int i5;
        int i11 = this.f33211h;
        int i12 = this.f33209f;
        if (i12 != i11) {
            int i13 = i11 + 1;
            byte[] bArr = this.f33208e;
            byte b11 = bArr[i11];
            if (b11 >= 0) {
                this.f33211h = i13;
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
                this.f33211h = i14;
                return i5;
            }
        }
        return (int) O();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final long H() {
        long j11;
        long j12;
        long j13;
        int i5 = this.f33211h;
        int i11 = this.f33209f;
        if (i11 != i5) {
            int i12 = i5 + 1;
            byte[] bArr = this.f33208e;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                this.f33211h = i12;
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
                this.f33211h = i13;
                return j11;
            }
        }
        return O();
    }

    public final void I() {
        int i5 = this.f33209f + this.f33210g;
        this.f33209f = i5;
        int i11 = this.f33213j + i5;
        int i12 = this.f33214k;
        if (i11 <= i12) {
            this.f33210g = 0;
            return;
        }
        int i13 = i11 - i12;
        this.f33210g = i13;
        this.f33209f = i5 - i13;
    }

    public final void J(int i5) throws zzaeh {
        if (K(i5)) {
            return;
        }
        if (i5 <= (LayoutNode.NotPlacedPlaceOrder - this.f33213j) - this.f33211h) {
            throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        throw new zzaeh("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
    }

    public final boolean K(int i5) throws IOException {
        InputStream inputStream = this.f33207d;
        int i11 = this.f33211h;
        int i12 = i11 + i5;
        int i13 = this.f33209f;
        if (i12 <= i13) {
            StringBuilder sb2 = new StringBuilder(String.valueOf(i5).length() + 66);
            sb2.append("refillBuffer() called when ");
            sb2.append(i5);
            sb2.append(" bytes were already available in buffer");
            throw new IllegalStateException(sb2.toString());
        }
        int i14 = this.f33213j;
        if (i5 > (LayoutNode.NotPlacedPlaceOrder - i14) - i11 || i14 + i11 + i5 > this.f33214k) {
            return false;
        }
        byte[] bArr = this.f33208e;
        if (i11 > 0) {
            if (i13 > i11) {
                System.arraycopy(bArr, i11, bArr, 0, i13 - i11);
            }
            i14 = this.f33213j + i11;
            this.f33213j = i14;
            i13 = this.f33209f - i11;
            this.f33209f = i13;
            this.f33211h = 0;
        }
        try {
            int i15 = inputStream.read(bArr, i13, Math.min(bArr.length - i13, (LayoutNode.NotPlacedPlaceOrder - i14) - i13));
            if (i15 != 0 && i15 >= -1 && i15 <= bArr.length) {
                if (i15 <= 0) {
                    return false;
                }
                this.f33209f += i15;
                I();
                return this.f33209f >= i5 || K(i5);
            }
            String strValueOf = String.valueOf(inputStream.getClass());
            StringBuilder sb3 = new StringBuilder(String.valueOf(i15).length() + strValueOf.length() + 39 + 41);
            sb3.append(strValueOf);
            sb3.append("#read(byte[]) returned invalid result: ");
            sb3.append(i15);
            sb3.append("\nThe InputStream implementation is buggy.");
            throw new IllegalStateException(sb3.toString());
        } catch (zzaeh e3) {
            e3.f33302a = true;
            throw e3;
        }
    }

    public final byte[] L(int i5) throws IOException {
        byte[] bArrM = M(i5);
        if (bArrM != null) {
            return bArrM;
        }
        int i11 = this.f33211h;
        int i12 = this.f33209f;
        int i13 = i12 - i11;
        this.f33213j += i12;
        this.f33211h = 0;
        this.f33209f = 0;
        ArrayList arrayListN = N(i5 - i13);
        byte[] bArr = new byte[i5];
        System.arraycopy(this.f33208e, i11, bArr, 0, i13);
        Iterator it = arrayListN.iterator();
        while (it.hasNext()) {
            byte[] bArr2 = (byte[]) it.next();
            int length = bArr2.length;
            System.arraycopy(bArr2, 0, bArr, i13, length);
            i13 += length;
        }
        return bArr;
    }

    public final byte[] M(int i5) throws IOException {
        if (i5 == 0) {
            return w1.f33176a;
        }
        int i11 = this.f33213j;
        int i12 = this.f33211h;
        int i13 = i11 + i12 + i5;
        if ((-2147483647) + i13 > 0) {
            throw new zzaeh("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
        }
        int i14 = this.f33214k;
        if (i13 > i14) {
            g((i14 - i11) - i12);
            throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        int i15 = this.f33209f - i12;
        int i16 = i5 - i15;
        InputStream inputStream = this.f33207d;
        if (i16 >= 4096) {
            try {
                if (i16 > inputStream.available()) {
                    return null;
                }
            } catch (zzaeh e3) {
                e3.f33302a = true;
                throw e3;
            }
        }
        byte[] bArr = new byte[i5];
        System.arraycopy(this.f33208e, this.f33211h, bArr, 0, i15);
        this.f33213j += this.f33209f;
        this.f33211h = 0;
        this.f33209f = 0;
        while (i15 < i5) {
            try {
                int i17 = inputStream.read(bArr, i15, i5 - i15);
                if (i17 == -1) {
                    throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                this.f33213j += i17;
                i15 += i17;
            } catch (zzaeh e11) {
                e11.f33302a = true;
                throw e11;
            }
        }
        return bArr;
    }

    public final ArrayList N(int i5) throws IOException {
        ArrayList arrayList = new ArrayList();
        while (i5 > 0) {
            int iMin = Math.min(i5, androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT);
            byte[] bArr = new byte[iMin];
            int i11 = 0;
            while (i11 < iMin) {
                try {
                    int i12 = this.f33207d.read(bArr, i11, iMin - i11);
                    if (i12 == -1) {
                        throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                    }
                    this.f33213j += i12;
                    i11 += i12;
                } catch (zzaeh e3) {
                    e3.f33302a = true;
                    throw e3;
                }
            }
            i5 -= iMin;
            arrayList.add(bArr);
        }
        return arrayList;
    }

    public final long O() throws zzaeh {
        long j11 = 0;
        for (int i5 = 0; i5 < 64; i5 += 7) {
            if (this.f33211h == this.f33209f) {
                J(1);
            }
            int i11 = this.f33211h;
            this.f33211h = i11 + 1;
            j11 |= (r3 & AbstractJsonLexerKt.TC_INVALID) << i5;
            if ((this.f33208e[i11] & 128) == 0) {
                return j11;
            }
        }
        throw new zzaeh("CodedInputStream encountered a malformed varint.");
    }

    public final int P() throws zzaeh {
        int i5 = this.f33211h;
        if (this.f33209f - i5 < 4) {
            J(4);
            i5 = this.f33211h;
        }
        this.f33211h = i5 + 4;
        byte[] bArr = this.f33208e;
        int i11 = bArr[i5] & 255;
        int i12 = bArr[i5 + 1] & 255;
        int i13 = bArr[i5 + 2] & 255;
        return ((bArr[i5 + 3] & 255) << 24) | (i12 << 8) | i11 | (i13 << 16);
    }

    public final long Q() throws zzaeh {
        int i5 = this.f33211h;
        if (this.f33209f - i5 < 8) {
            J(8);
            i5 = this.f33211h;
        }
        this.f33211h = i5 + 8;
        byte[] bArr = this.f33208e;
        long j11 = bArr[i5];
        long j12 = bArr[i5 + 2];
        long j13 = bArr[i5 + 3];
        return ((bArr[i5 + 6] & 255) << 48) | (j11 & 255) | ((bArr[i5 + 1] & 255) << 8) | ((j12 & 255) << 16) | ((j13 & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 7] & 255) << 56);
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int a(int i5) throws zzaeh {
        if (i5 < 0) {
            throw new zzaeh("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        int i11 = this.f33213j + this.f33211h + i5;
        if (i11 < 0) {
            throw new zzaeh("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
        }
        int i12 = this.f33214k;
        if (i11 > i12) {
            throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        this.f33214k = i11;
        I();
        return i12;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final void b(int i5) {
        this.f33214k = i5;
        I();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int c() {
        int i5 = this.f33214k;
        if (i5 == Integer.MAX_VALUE) {
            return -1;
        }
        return i5 - (this.f33213j + this.f33211h);
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final boolean d() {
        return this.f33211h == this.f33209f && !K(1);
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int e() {
        return this.f33213j + this.f33211h;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int f(int i5, int i11, byte[] bArr) throws IOException {
        if ((bArr.length - i5) - i11 < 0 || (i5 | i11) < 0) {
            throw new IndexOutOfBoundsException();
        }
        if (i11 == 0) {
            return 0;
        }
        int i12 = this.f33209f;
        int i13 = this.f33211h;
        int i14 = i12 - i13;
        if (i14 > 0) {
            int iMin = Math.min(i11, i14);
            System.arraycopy(this.f33208e, this.f33211h, bArr, i5, iMin);
            this.f33211h += iMin;
            return iMin;
        }
        int iMin2 = Math.min(i11, (this.f33214k - this.f33213j) - i13);
        if (iMin2 <= 0) {
            return -1;
        }
        try {
            int i15 = this.f33207d.read(bArr, i5, iMin2);
            if (i15 != -1) {
                this.f33213j += i15;
            }
            return i15;
        } catch (zzaeh e3) {
            e3.f33302a = true;
            throw e3;
        }
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final void g(int i5) throws zzaeh {
        InputStream inputStream = this.f33207d;
        int i11 = this.f33209f;
        int i12 = this.f33211h;
        int i13 = i11 - i12;
        if (i5 <= i13 && i5 >= 0) {
            this.f33211h = i12 + i5;
            return;
        }
        if (i5 < 0) {
            throw new zzaeh("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        int i14 = this.f33213j;
        int i15 = i14 + i12;
        int i16 = this.f33214k;
        if (i15 + i5 > i16) {
            g((i16 - i14) - i12);
            throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        this.f33213j = i15;
        this.f33209f = 0;
        this.f33211h = 0;
        while (i13 < i5) {
            long j11 = i5 - i13;
            try {
                try {
                    long jSkip = inputStream.skip(j11);
                    if (jSkip < 0 || jSkip > j11) {
                        String strValueOf = String.valueOf(inputStream.getClass());
                        StringBuilder sb2 = new StringBuilder(strValueOf.length() + 31 + String.valueOf(jSkip).length() + 41);
                        sb2.append(strValueOf);
                        sb2.append("#skip returned invalid result: ");
                        sb2.append(jSkip);
                        sb2.append("\nThe InputStream implementation is buggy.");
                        throw new IllegalStateException(sb2.toString());
                    }
                    if (jSkip == 0) {
                        break;
                    } else {
                        i13 += (int) jSkip;
                    }
                } catch (zzaeh e3) {
                    e3.f33302a = true;
                    throw e3;
                }
            } catch (Throwable th2) {
                this.f33213j += i13;
                I();
                throw th2;
            }
        }
        this.f33213j += i13;
        I();
        if (i13 >= i5) {
            return;
        }
        int i17 = this.f33209f;
        int i18 = i17 - this.f33211h;
        this.f33211h = i17;
        J(1);
        while (true) {
            int i19 = i5 - i18;
            int i21 = this.f33209f;
            if (i19 <= i21) {
                this.f33211h = i19;
                return;
            } else {
                i18 += i21;
                this.f33211h = i21;
                J(1);
            }
        }
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int l() throws zzaeh {
        if (d()) {
            this.f33212i = 0;
            return 0;
        }
        int iG = G();
        this.f33212i = iG;
        if ((iG >>> 3) != 0) {
            return iG;
        }
        throw new zzaeh("Protocol message contained an invalid tag (zero).");
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final void m(int i5) throws zzaeh {
        if (this.f33212i != i5) {
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
                g(G());
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
        int i13 = this.f33209f - this.f33211h;
        byte[] bArr = this.f33208e;
        if (i13 >= 10) {
            while (i12 < 10) {
                int i14 = this.f33211h;
                this.f33211h = i14 + 1;
                if (bArr[i14] < 0) {
                    i12++;
                }
            }
            throw new zzaeh("CodedInputStream encountered a malformed varint.");
        }
        while (i12 < 10) {
            if (this.f33211h == this.f33209f) {
                J(1);
            }
            int i15 = this.f33211h;
            this.f33211h = i15 + 1;
            if (bArr[i15] < 0) {
                i12++;
            }
        }
        throw new zzaeh("CodedInputStream encountered a malformed varint.");
        return true;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final double o() {
        return Double.longBitsToDouble(Q());
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final float p() {
        return Float.intBitsToFloat(P());
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
        return G();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final long t() {
        return Q();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final int u() {
        return P();
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final boolean v() {
        return H() != 0;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final String w() throws zzaeh {
        int iG = G();
        byte[] bArr = this.f33208e;
        if (iG > 0) {
            int i5 = this.f33209f;
            int i11 = this.f33211h;
            if (iG <= i5 - i11) {
                String str = new String(bArr, i11, iG, StandardCharsets.UTF_8);
                this.f33211h += iG;
                return str;
            }
        }
        if (iG == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iG < 0) {
            throw new zzaeh("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        if (iG > this.f33209f) {
            return new String(L(iG), StandardCharsets.UTF_8);
        }
        J(iG);
        String str2 = new String(bArr, this.f33211h, iG, StandardCharsets.UTF_8);
        this.f33211h += iG;
        return str2;
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final String x() throws IOException {
        int iG = G();
        int i5 = this.f33211h;
        int i11 = this.f33209f;
        int i12 = i11 - i5;
        byte[] bArrL = this.f33208e;
        if (iG <= i12 && iG > 0) {
            this.f33211h = i5 + iG;
        } else {
            if (iG == 0) {
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            if (iG < 0) {
                throw new zzaeh("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            }
            i5 = 0;
            if (iG <= i11) {
                J(iG);
                this.f33211h = iG;
            } else {
                bArrL = L(iG);
            }
        }
        return f3.d(bArrL, i5, iG);
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final u0 y() throws IOException {
        int iG = G();
        int i5 = this.f33209f;
        int i11 = this.f33211h;
        int i12 = i5 - i11;
        byte[] bArr = this.f33208e;
        if (iG <= i12 && iG > 0) {
            u0 u0VarL = v0.l(i11, iG, bArr);
            this.f33211h += iG;
            return u0VarL;
        }
        if (iG == 0) {
            return v0.f33120b;
        }
        if (iG < 0) {
            throw new zzaeh("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        byte[] bArrM = M(iG);
        if (bArrM != null) {
            return v0.l(0, bArrM.length, bArrM);
        }
        int i13 = this.f33211h;
        int i14 = this.f33209f;
        int i15 = i14 - i13;
        this.f33213j += i14;
        this.f33211h = 0;
        this.f33209f = 0;
        ArrayList arrayListN = N(iG - i15);
        byte[] bArr2 = new byte[iG];
        System.arraycopy(bArr, i13, bArr2, 0, i15);
        Iterator it = arrayListN.iterator();
        while (it.hasNext()) {
            byte[] bArr3 = (byte[]) it.next();
            int length = bArr3.length;
            System.arraycopy(bArr3, 0, bArr2, i15, length);
            i15 += length;
        }
        try {
            u0 u0Var = v0.f33120b;
            return iG == 0 ? v0.f33120b : new u0(bArr2);
        } catch (zzaeh e3) {
            throw new AssertionError("Expected no InvalidProtocolBufferException as data UTF8 validity is not checked.", e3);
        }
    }

    @Override // com.google.android.gms.internal.measurement.y0
    public final byte[] z() throws zzaeh {
        int iG = G();
        int i5 = this.f33209f;
        int i11 = this.f33211h;
        if (iG > i5 - i11 || iG <= 0) {
            if (iG >= 0) {
                return L(iG);
            }
            throw new zzaeh("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        byte[] bArrCopyOfRange = Arrays.copyOfRange(this.f33208e, i11, i11 + iG);
        this.f33211h += iG;
        return bArrCopyOfRange;
    }
}
