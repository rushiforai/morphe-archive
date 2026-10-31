package ads_mobile_sdk;

import androidx.compose.ui.node.LayoutNode;
import b.k9;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class ru extends com.google.crypto.tink.shaded.protobuf.k {

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f9309e;

    /* renamed from: f, reason: collision with root package name */
    public final int f9310f;

    /* renamed from: g, reason: collision with root package name */
    public int f9311g;

    /* renamed from: j, reason: collision with root package name */
    public int f9313j;

    /* renamed from: k, reason: collision with root package name */
    public int f9314k = LayoutNode.NotPlacedPlaceOrder;

    /* renamed from: h, reason: collision with root package name */
    public int f9312h = 0;

    public ru(byte[] bArr, int i5) {
        this.f9309e = bArr;
        this.f9310f = i5;
        this.f9311g = i5;
    }

    public final long A() throws yi1 {
        long j11;
        long j12;
        long j13;
        int i5 = this.f9312h;
        int i11 = this.f9311g;
        byte[] bArr = this.f9309e;
        long j14 = 0;
        if (i11 != i5) {
            int i12 = i5 + 1;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                this.f9312h = i12;
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
                this.f9312h = i13;
                return j11;
            }
        }
        for (int i22 = 0; i22 < 64; i22 += 7) {
            int i23 = this.f9312h;
            if (i23 == this.f9311g) {
                throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
            this.f9312h = i23 + 1;
            j14 |= (r1 & AbstractJsonLexerKt.TC_INVALID) << i22;
            if ((bArr[i23] & 128) == 0) {
                return j14;
            }
        }
        throw new yi1("CodedInputStream encountered a malformed varint.");
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final void a(int i5) {
        if (this.f9313j != i5) {
            throw new yi1("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int b() {
        return this.f9312h;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final boolean c() {
        return this.f9312h == this.f9311g;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int d(int i5) {
        if (i5 < 0) {
            throw new yi1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        int i11 = this.f9312h;
        int i12 = i11 + i5;
        if (i12 < 0) {
            i12 = LayoutNode.NotPlacedPlaceOrder;
            if (i5 > LayoutNode.NotPlacedPlaceOrder - i11) {
                throw new yi1("Protocol message was too large.  May be malicious.  Use CodedInputStream.setSizeLimit() to increase the size limit. If reading multiple messages, consider resetting the counter between each message using CodedInputStream.resetSizeCounter().");
            }
        }
        int i13 = this.f9314k;
        if (i12 > i13) {
            throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        this.f9314k = i12;
        int i14 = this.f9310f;
        if (i12 <= i14) {
            this.f9311g = i12;
            return i13;
        }
        this.f9311g = i14;
        return i13;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x002f  */
    @Override // com.google.crypto.tink.shaded.protobuf.k
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final qq e() throws yi1 {
        byte[] bArrCopyOfRange;
        int iM = m();
        byte[] bArr = this.f9309e;
        if (iM > 0) {
            int i5 = this.f9311g;
            int i11 = this.f9312h;
            if (iM <= i5 - i11) {
                qq qqVarB = sq.b(i11, iM, bArr);
                this.f9312h += iM;
                return qqVarB;
            }
        }
        if (iM == 0) {
            return sq.f9634b;
        }
        if (iM > 0) {
            int i12 = this.f9311g;
            int i13 = this.f9312h;
            if (iM <= i12 - i13) {
                int i14 = iM + i13;
                this.f9312h = i14;
                bArrCopyOfRange = Arrays.copyOfRange(bArr, i13, i14);
            } else {
                if (iM > 0) {
                    throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                if (iM != 0) {
                    throw new yi1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                }
                bArrCopyOfRange = rb1.f9048a;
            }
        }
        qq qqVar = sq.f9634b;
        return bArrCopyOfRange.length == 0 ? sq.f9634b : new qq(bArrCopyOfRange);
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
        return A();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int m() throws yi1 {
        try {
            int iZ = z();
            if (this.f9312h <= this.f9311g) {
                return iZ;
            }
            throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        } catch (yi1 e3) {
            if (this.f9312h > this.f9311g) {
                throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
            throw e3;
        } catch (IndexOutOfBoundsException unused) {
            throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
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
        return com.google.crypto.tink.shaded.protobuf.k.a(A());
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final String r() throws yi1 {
        int iM = m();
        if (iM > 0) {
            int i5 = this.f9311g;
            int i11 = this.f9312h;
            if (iM <= i5 - i11) {
                String str = new String(this.f9309e, i11, iM, StandardCharsets.UTF_8);
                this.f9312h += iM;
                return str;
            }
        }
        if (iM == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iM < 0) {
            throw new yi1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final String s() throws yi1 {
        int iM = m();
        String strA = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (iM > 0) {
            int i5 = this.f9311g;
            int i11 = this.f9312h;
            if (iM <= i5 - i11) {
                if (iM == 0) {
                    k9 k9Var = vn3.f10832a;
                } else {
                    strA = vn3.f10832a.a(this.f9309e, i11, iM);
                }
                this.f9312h += iM;
                return strA;
            }
        }
        if (iM == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iM <= 0) {
            throw new yi1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int t() throws yi1 {
        if (c()) {
            this.f9313j = 0;
            return 0;
        }
        int iM = m();
        this.f9313j = iM;
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
        return A();
    }

    public final int x() throws yi1 {
        int i5 = this.f9312h;
        if (this.f9311g - i5 < 4) {
            throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        this.f9312h = i5 + 4;
        byte[] bArr = this.f9309e;
        return ((bArr[i5 + 3] & 255) << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
    }

    public final long y() throws yi1 {
        int i5 = this.f9312h;
        if (this.f9311g - i5 < 8) {
            throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        this.f9312h = i5 + 8;
        byte[] bArr = this.f9309e;
        return ((bArr[i5 + 7] & 255) << 56) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 6] & 255) << 48);
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x006c A[PHI: r3
      0x006c: PHI (r3v6 int) = (r3v5 int), (r3v10 int), (r3v12 int) binds: [B:16:0x0041, B:20:0x004d, B:24:0x0059] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int z() throws yi1 {
        int i5 = this.f9312h;
        int i11 = i5 + 1;
        byte[] bArr = this.f9309e;
        int i12 = bArr[i5];
        if (i12 < 0) {
            int i13 = i5 + 2;
            int i14 = (bArr[i11] << 7) ^ i12;
            if (i14 < 0) {
                i12 = i14 ^ (-128);
            } else {
                int i15 = i5 + 3;
                int i16 = i14 ^ (bArr[i13] << 14);
                if (i16 >= 0) {
                    int i17 = i16 ^ 16256;
                    i11 = i15;
                    i12 = i17;
                } else {
                    i13 = i5 + 4;
                    int i18 = i16 ^ (bArr[i15] << 21);
                    if (i18 < 0) {
                        i12 = i18 ^ (-2080896);
                    } else {
                        int i19 = i5 + 5;
                        int i21 = bArr[i13];
                        int i22 = (i18 ^ (i21 << 28)) ^ 266354560;
                        if (i21 < 0) {
                            i13 = i5 + 6;
                            if (bArr[i19] < 0) {
                                i19 = i5 + 7;
                                if (bArr[i13] < 0) {
                                    i13 = i5 + 8;
                                    if (bArr[i19] < 0) {
                                        i19 = i5 + 9;
                                        if (bArr[i13] < 0) {
                                            int i23 = i5 + 10;
                                            if (bArr[i19] < 0) {
                                                throw new yi1("CodedInputStream encountered a malformed varint.");
                                            }
                                            i12 = i22;
                                            i11 = i23;
                                        } else {
                                            int i24 = i19;
                                            i12 = i22;
                                            i11 = i24;
                                        }
                                    }
                                }
                            }
                            i12 = i22;
                        }
                    }
                }
            }
            i11 = i13;
        }
        this.f9312h = i11;
        return i12;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final void c(int i5) {
        this.f9314k = i5;
        int i11 = this.f9310f;
        if (i5 <= i11) {
            this.f9311g = i5;
        } else {
            this.f9311g = i11;
        }
    }

    public final void f(int i5) throws yi1 {
        if (i5 >= 0) {
            int i11 = this.f9311g;
            int i12 = this.f9312h;
            if (i5 <= i11 - i12) {
                this.f9312h = i12 + i5;
                return;
            }
        }
        if (i5 >= 0) {
            throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        throw new yi1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final int a() {
        int i5 = this.f9314k;
        if (i5 == Integer.MAX_VALUE) {
            return -1;
        }
        return i5 - this.f9312h;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final boolean d() {
        return A() != 0;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.k
    public final boolean e(int i5) throws yi1 {
        int i11 = i5 & 7;
        int i12 = 0;
        if (i11 == 0) {
            int i13 = this.f9311g - this.f9312h;
            byte[] bArr = this.f9309e;
            if (i13 >= 10) {
                while (i12 < 10) {
                    int i14 = this.f9312h;
                    this.f9312h = i14 + 1;
                    if (bArr[i14] < 0) {
                        i12++;
                    }
                }
                throw new yi1("CodedInputStream encountered a malformed varint.");
            }
            while (i12 < 10) {
                int i15 = this.f9312h;
                if (i15 != this.f9311g) {
                    this.f9312h = i15 + 1;
                    if (bArr[i15] < 0) {
                        i12++;
                    }
                } else {
                    throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
            }
            throw new yi1("CodedInputStream encountered a malformed varint.");
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
            f(4);
            return true;
        }
        int i16 = yi1.f12028b;
        throw new xi1();
    }
}
