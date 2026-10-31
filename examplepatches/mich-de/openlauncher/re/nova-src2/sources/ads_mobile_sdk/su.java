package ads_mobile_sdk;

import androidx.compose.ui.node.LayoutNode;
import androidx.recyclerview.widget.u1;
import b.c0;
import b.k9;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class su extends com.google.crypto.tink.shaded.protobuf.k {

    /* renamed from: e, reason: collision with root package name */
    public final InputStream f9684e;

    /* renamed from: f, reason: collision with root package name */
    public final byte[] f9685f;

    /* renamed from: g, reason: collision with root package name */
    public int f9686g;

    /* renamed from: h, reason: collision with root package name */
    public int f9687h;

    /* renamed from: i, reason: collision with root package name */
    public int f9688i;

    /* renamed from: j, reason: collision with root package name */
    public int f9689j;

    /* renamed from: k, reason: collision with root package name */
    public int f9690k;

    /* renamed from: l, reason: collision with root package name */
    public int f9691l = LayoutNode.NotPlacedPlaceOrder;

    public su(InputStream inputStream) {
        rb1.a(inputStream, "input");
        this.f9684e = inputStream;
        this.f9685f = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
        this.f9686g = 0;
        this.f9688i = 0;
        this.f9690k = 0;
    }

    public static boolean a(int i5, int i11, int i12) {
        return i12 < i5 || i11 > i12 - i5;
    }

    public final void A() {
        int i5 = this.f9686g + this.f9687h;
        this.f9686g = i5;
        int i11 = this.f9690k + i5;
        int i12 = this.f9691l;
        if (i11 <= i12) {
            this.f9687h = 0;
            return;
        }
        int i13 = i11 - i12;
        this.f9687h = i13;
        this.f9686g = i5 - i13;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int b() {
        return this.f9690k + this.f9688i;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final boolean c() {
        return this.f9688i == this.f9686g && !l(1);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int d(int i5) throws yi1 {
        if (i5 < 0) {
            throw new yi1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        int i11 = this.f9690k + this.f9688i;
        if (i5 > LayoutNode.NotPlacedPlaceOrder - i11) {
            throw new yi1("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
        }
        if (a(i11, i5, this.f9691l)) {
            throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        int i12 = this.f9691l;
        this.f9691l = i11 + i5;
        A();
        return i12;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final qq e() throws IOException {
        int iM = m();
        int i5 = this.f9686g;
        int i11 = this.f9688i;
        int i12 = i5 - i11;
        byte[] bArr = this.f9685f;
        if (iM <= i12 && iM > 0) {
            qq qqVarB = sq.b(i11, iM, bArr);
            this.f9688i += iM;
            return qqVarB;
        }
        if (iM == 0) {
            return sq.f9634b;
        }
        if (iM < 0) {
            throw new yi1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        byte[] bArrG = g(iM);
        if (bArrG != null) {
            return sq.b(0, bArrG.length, bArrG);
        }
        int i13 = this.f9688i;
        int i14 = this.f9686g;
        int length = i14 - i13;
        this.f9690k += i14;
        this.f9688i = 0;
        this.f9686g = 0;
        ArrayList arrayListH = h(iM - length);
        byte[] bArr2 = new byte[iM];
        System.arraycopy(bArr, i13, bArr2, 0, length);
        Iterator it = arrayListH.iterator();
        while (it.hasNext()) {
            byte[] bArr3 = (byte[]) it.next();
            System.arraycopy(bArr3, 0, bArr2, length, bArr3.length);
            length += bArr3.length;
        }
        qq qqVar = sq.f9634b;
        try {
            return iM == 0 ? sq.f9634b : new qq(bArr2);
        } catch (yi1 e3) {
            throw new AssertionError("Expected no InvalidProtocolBufferException as data UTF8 validity is not checked.", e3);
        }
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final double f() {
        return Double.longBitsToDouble(y());
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int g() {
        return m();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int h() {
        return x();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final long i() {
        return y();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final float j() {
        return Float.intBitsToFloat(x());
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int k() {
        return m();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final long l() {
        return z();
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x009e A[PHI: r3
      0x009e: PHI (r3v10 int) = (r3v9 int), (r3v12 int) binds: [B:25:0x0053, B:29:0x005f] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.google.crypto.tink.shaded.protobuf.k
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int m() throws yi1 {
        int i5;
        int i11 = this.f9688i;
        int i12 = this.f9686g;
        byte[] bArr = this.f9685f;
        if (i12 != i11) {
            int i13 = i11 + 1;
            byte b11 = bArr[i11];
            if (b11 >= 0) {
                this.f9688i = i13;
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
                this.f9688i = i14;
                return i5;
            }
        }
        long j11 = 0;
        for (int i24 = 0; i24 < 64; i24 += 7) {
            if (this.f9688i == this.f9686g) {
                i(1);
            }
            int i25 = this.f9688i;
            this.f9688i = i25 + 1;
            j11 |= (r4 & AbstractJsonLexerKt.TC_INVALID) << i24;
            if ((bArr[i25] & 128) == 0) {
                return (int) j11;
            }
        }
        throw new yi1("CodedInputStream encountered a malformed varint.");
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int n() {
        return x();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final long o() {
        return y();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int p() {
        return com.google.crypto.tink.shaded.protobuf.k.b(m());
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final long q() {
        return com.google.crypto.tink.shaded.protobuf.k.a(z());
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final String r() throws yi1 {
        int iM = m();
        byte[] bArr = this.f9685f;
        if (iM > 0) {
            int i5 = this.f9686g;
            int i11 = this.f9688i;
            if (iM <= i5 - i11) {
                String str = new String(bArr, i11, iM, StandardCharsets.UTF_8);
                this.f9688i += iM;
                return str;
            }
        }
        if (iM == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iM < 0) {
            throw new yi1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        if (iM > this.f9686g) {
            return new String(f(iM), StandardCharsets.UTF_8);
        }
        i(iM);
        String str2 = new String(bArr, this.f9688i, iM, StandardCharsets.UTF_8);
        this.f9688i += iM;
        return str2;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final String s() throws IOException {
        int iM = m();
        int i5 = this.f9688i;
        int i11 = this.f9686g;
        int i12 = i11 - i5;
        byte[] bArrF = this.f9685f;
        if (iM <= i12 && iM > 0) {
            this.f9688i = i5 + iM;
        } else {
            if (iM == 0) {
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            if (iM < 0) {
                throw new yi1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
            }
            i5 = 0;
            if (iM <= i11) {
                i(iM);
                this.f9688i = iM;
            } else {
                bArrF = f(iM);
            }
        }
        if (iM != 0) {
            return vn3.f10832a.a(bArrF, i5, iM);
        }
        k9 k9Var = vn3.f10832a;
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int t() throws yi1 {
        if (c()) {
            this.f9689j = 0;
            return 0;
        }
        int iM = m();
        this.f9689j = iM;
        if ((iM >>> 3) != 0) {
            return iM;
        }
        throw new yi1("Protocol message contained an invalid tag (zero).");
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int u() {
        return m();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final long v() {
        return z();
    }

    public final int x() throws yi1 {
        int i5 = this.f9688i;
        if (this.f9686g - i5 < 4) {
            i(4);
            i5 = this.f9688i;
        }
        this.f9688i = i5 + 4;
        byte[] bArr = this.f9685f;
        return ((bArr[i5 + 3] & 255) << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
    }

    public final long y() throws yi1 {
        int i5 = this.f9688i;
        if (this.f9686g - i5 < 8) {
            i(8);
            i5 = this.f9688i;
        }
        this.f9688i = i5 + 8;
        byte[] bArr = this.f9685f;
        return ((bArr[i5 + 7] & 255) << 56) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 6] & 255) << 48);
    }

    public final long z() throws yi1 {
        long j11;
        long j12;
        long j13;
        int i5 = this.f9688i;
        int i11 = this.f9686g;
        byte[] bArr = this.f9685f;
        long j14 = 0;
        if (i11 != i5) {
            int i12 = i5 + 1;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                this.f9688i = i12;
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
                                j12 = 266354560;
                            } else {
                                int i19 = i5 + 6;
                                long j17 = j16 ^ (bArr[i13] << 35);
                                if (j17 < 0) {
                                    j13 = -34093383808L;
                                } else {
                                    i13 = i5 + 7;
                                    j16 = j17 ^ (bArr[i19] << 42);
                                    if (j16 >= 0) {
                                        j12 = 4363953127296L;
                                    } else {
                                        i19 = i5 + 8;
                                        j17 = j16 ^ (bArr[i13] << 49);
                                        if (j17 < 0) {
                                            j13 = -558586000294016L;
                                        } else {
                                            i13 = i5 + 9;
                                            j16 = j17 ^ (bArr[i19] << 56);
                                            if (j16 >= 0) {
                                                j12 = 71499008037633920L;
                                            } else {
                                                byte b12 = bArr[i13];
                                                long j18 = j16 ^ (b12 << 63);
                                                if (j18 >= 0) {
                                                    int i21 = i5 + 10;
                                                    if (b12 >= 0) {
                                                        j11 = j18 ^ (-9151873028817141888L);
                                                        i13 = i21;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                j11 = j17 ^ j13;
                                i13 = i19;
                            }
                            j11 = j12 ^ j16;
                        }
                    }
                }
                this.f9688i = i13;
                return j11;
            }
        }
        for (int i22 = 0; i22 < 64; i22 += 7) {
            if (this.f9688i == this.f9686g) {
                i(1);
            }
            int i23 = this.f9688i;
            this.f9688i = i23 + 1;
            j14 |= (r1 & AbstractJsonLexerKt.TC_INVALID) << i22;
            if ((bArr[i23] & 128) == 0) {
                return j14;
            }
        }
        throw new yi1("CodedInputStream encountered a malformed varint.");
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final void a(int i5) throws yi1 {
        if (this.f9689j != i5) {
            throw new yi1("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final void c(int i5) {
        this.f9691l = i5;
        A();
    }

    public final byte[] f(int i5) throws IOException {
        byte[] bArrG = g(i5);
        if (bArrG != null) {
            return bArrG;
        }
        int i11 = this.f9688i;
        int i12 = this.f9686g;
        int length = i12 - i11;
        this.f9690k += i12;
        this.f9688i = 0;
        this.f9686g = 0;
        ArrayList arrayListH = h(i5 - length);
        byte[] bArr = new byte[i5];
        System.arraycopy(this.f9685f, i11, bArr, 0, length);
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
            return rb1.f9048a;
        }
        if (i5 < 0) {
            throw new yi1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        int i11 = this.f9690k + this.f9688i;
        if (a(i11, i5, LayoutNode.NotPlacedPlaceOrder)) {
            throw new yi1("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
        }
        if (a(i11, i5, this.f9691l)) {
            int i12 = this.f9691l;
            if (i12 >= i11) {
                j(i12 - i11);
            }
            throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        int i13 = this.f9686g - this.f9688i;
        int i14 = i5 - i13;
        InputStream inputStream = this.f9684e;
        if (i14 >= 4096) {
            try {
                if (i14 > inputStream.available()) {
                    return null;
                }
            } catch (yi1 e3) {
                e3.f12029a = true;
                throw e3;
            }
        }
        byte[] bArr = new byte[i5];
        System.arraycopy(this.f9685f, this.f9688i, bArr, 0, i13);
        this.f9690k += this.f9686g;
        this.f9688i = 0;
        this.f9686g = 0;
        while (i13 < i5) {
            try {
                int i15 = inputStream.read(bArr, i13, i5 - i13);
                if (i15 == -1) {
                    throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                this.f9690k += i15;
                i13 += i15;
            } catch (yi1 e11) {
                e11.f12029a = true;
                throw e11;
            }
        }
        return bArr;
    }

    public final ArrayList h(int i5) throws IOException {
        ArrayList arrayList = new ArrayList();
        while (i5 > 0) {
            int iMin = Math.min(i5, u1.FLAG_APPEARED_IN_PRE_LAYOUT);
            byte[] bArr = new byte[iMin];
            int i11 = 0;
            while (i11 < iMin) {
                try {
                    int i12 = this.f9684e.read(bArr, i11, iMin - i11);
                    if (i12 == -1) {
                        throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                    }
                    this.f9690k += i12;
                    i11 += i12;
                } catch (yi1 e3) {
                    e3.f12029a = true;
                    throw e3;
                }
            }
            i5 -= iMin;
            arrayList.add(bArr);
        }
        return arrayList;
    }

    public final void i(int i5) throws yi1 {
        if (l(i5)) {
            return;
        }
        if (i5 <= (LayoutNode.NotPlacedPlaceOrder - this.f9690k) - this.f9688i) {
            throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        throw new yi1("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
    }

    public final void j(int i5) throws yi1 {
        int i11 = this.f9686g;
        int i12 = this.f9688i;
        if (i5 <= i11 - i12 && i5 >= 0) {
            this.f9688i = i12 + i5;
            return;
        }
        InputStream inputStream = this.f9684e;
        if (i5 < 0) {
            throw new yi1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        int i13 = this.f9690k + i12;
        if (a(i13, i5, LayoutNode.NotPlacedPlaceOrder)) {
            throw new yi1("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
        }
        if (a(i13, i5, this.f9691l)) {
            int i14 = this.f9691l;
            if (i14 >= i13) {
                j(i14 - i13);
            }
            throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        int i15 = this.f9690k;
        int i16 = this.f9688i;
        this.f9690k = i15 + i16;
        int i17 = this.f9686g - i16;
        this.f9686g = 0;
        this.f9688i = 0;
        while (i17 < i5) {
            long j11 = i5 - i17;
            try {
                try {
                    long jSkip = inputStream.skip(j11);
                    if (jSkip < 0 || jSkip > j11) {
                        throw new IllegalStateException(String.valueOf(inputStream.getClass()) + "#skip returned invalid result: " + jSkip + "\nThe InputStream implementation is buggy.");
                    }
                    if (jSkip == 0) {
                        break;
                    } else {
                        i17 += (int) jSkip;
                    }
                } catch (yi1 e3) {
                    e3.f12029a = true;
                    throw e3;
                }
            } catch (Throwable th2) {
                this.f9690k += i17;
                A();
                throw th2;
            }
        }
        this.f9690k += i17;
        A();
        if (i17 >= i5) {
            return;
        }
        int i18 = this.f9686g;
        int i19 = i18 - this.f9688i;
        this.f9688i = i18;
        i(1);
        while (true) {
            int i21 = i5 - i19;
            int i22 = this.f9686g;
            if (i21 <= i22) {
                this.f9688i = i21;
                return;
            } else {
                i19 += i22;
                this.f9688i = i22;
                i(1);
            }
        }
    }

    public final boolean l(int i5) throws IOException {
        InputStream inputStream = this.f9684e;
        int i11 = this.f9688i;
        if (i11 + i5 <= this.f9686g) {
            throw new IllegalStateException(c0.i(i5, "refillBuffer() called when ", " bytes were already available in buffer"));
        }
        int i12 = this.f9690k + i11;
        if (a(i12, i5, LayoutNode.NotPlacedPlaceOrder) || a(i12, i5, this.f9691l)) {
            return false;
        }
        int i13 = this.f9688i;
        byte[] bArr = this.f9685f;
        if (i13 > 0) {
            int i14 = this.f9686g;
            if (i14 > i13) {
                System.arraycopy(bArr, i13, bArr, 0, i14 - i13);
            }
            this.f9690k += i13;
            this.f9686g -= i13;
            this.f9688i = 0;
        }
        int i15 = this.f9686g;
        try {
            int i16 = inputStream.read(bArr, i15, Math.min(bArr.length - i15, (LayoutNode.NotPlacedPlaceOrder - this.f9690k) - i15));
            if (i16 != 0 && i16 >= -1 && i16 <= bArr.length) {
                if (i16 <= 0) {
                    return false;
                }
                this.f9686g += i16;
                A();
                return this.f9686g >= i5 || l(i5);
            }
            throw new IllegalStateException(String.valueOf(inputStream.getClass()) + "#read(byte[]) returned invalid result: " + i16 + "\nThe InputStream implementation is buggy.");
        } catch (yi1 e3) {
            e3.f12029a = true;
            throw e3;
        }
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int a() {
        int i5 = this.f9691l;
        if (i5 == Integer.MAX_VALUE) {
            return -1;
        }
        return i5 - (this.f9690k + this.f9688i);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final boolean d() {
        return z() != 0;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final boolean e(int i5) throws yi1 {
        int i11 = i5 & 7;
        int i12 = 0;
        if (i11 == 0) {
            int i13 = this.f9686g - this.f9688i;
            byte[] bArr = this.f9685f;
            if (i13 >= 10) {
                while (i12 < 10) {
                    int i14 = this.f9688i;
                    this.f9688i = i14 + 1;
                    if (bArr[i14] < 0) {
                        i12++;
                    }
                }
                throw new yi1("CodedInputStream encountered a malformed varint.");
            }
            while (i12 < 10) {
                if (this.f9688i == this.f9686g) {
                    i(1);
                }
                int i15 = this.f9688i;
                this.f9688i = i15 + 1;
                if (bArr[i15] < 0) {
                    i12++;
                }
            }
            throw new yi1("CodedInputStream encountered a malformed varint.");
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
            w();
            a(((i5 >>> 3) << 3) | 4);
            return true;
        }
        if (i11 == 4) {
            if (this.f34622b == 0) {
                a(0);
            }
            return false;
        }
        if (i11 == 5) {
            j(4);
            return true;
        }
        int i16 = yi1.f12028b;
        throw new xi1();
    }
}
