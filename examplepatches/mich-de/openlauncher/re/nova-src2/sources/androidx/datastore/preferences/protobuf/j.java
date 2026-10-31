package androidx.datastore.preferences.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class j extends a5.l1 {

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f14329c;

    /* renamed from: d, reason: collision with root package name */
    public int f14330d;

    /* renamed from: e, reason: collision with root package name */
    public int f14331e;

    /* renamed from: f, reason: collision with root package name */
    public int f14332f;

    /* renamed from: g, reason: collision with root package name */
    public final int f14333g;

    /* renamed from: h, reason: collision with root package name */
    public int f14334h;

    /* renamed from: i, reason: collision with root package name */
    public int f14335i = LayoutNode.NotPlacedPlaceOrder;

    public j(byte[] bArr, int i5, int i11, boolean z11) {
        this.f14329c = bArr;
        this.f14330d = i11 + i5;
        this.f14332f = i5;
        this.f14333g = i5;
    }

    @Override // a5.l1
    public final int A() {
        return H();
    }

    @Override // a5.l1
    public final long B() {
        return I();
    }

    @Override // a5.l1
    public final boolean C(int i5) throws InvalidProtocolBufferException {
        int i11 = i5 & 7;
        int i12 = 0;
        if (i11 != 0) {
            if (i11 == 1) {
                L(8);
                return true;
            }
            if (i11 == 2) {
                L(H());
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
            L(4);
            return true;
        }
        int i13 = this.f14330d - this.f14332f;
        byte[] bArr = this.f14329c;
        if (i13 >= 10) {
            while (i12 < 10) {
                int i14 = this.f14332f;
                this.f14332f = i14 + 1;
                if (bArr[i14] < 0) {
                    i12++;
                }
            }
            throw InvalidProtocolBufferException.c();
        }
        while (i12 < 10) {
            int i15 = this.f14332f;
            if (i15 == this.f14330d) {
                throw InvalidProtocolBufferException.e();
            }
            this.f14332f = i15 + 1;
            if (bArr[i15] < 0) {
                i12++;
            }
        }
        throw InvalidProtocolBufferException.c();
        return true;
    }

    public final int F() throws InvalidProtocolBufferException {
        int i5 = this.f14332f;
        if (this.f14330d - i5 < 4) {
            throw InvalidProtocolBufferException.e();
        }
        this.f14332f = i5 + 4;
        byte[] bArr = this.f14329c;
        return ((bArr[i5 + 3] & 255) << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
    }

    public final long G() throws InvalidProtocolBufferException {
        int i5 = this.f14332f;
        if (this.f14330d - i5 < 8) {
            throw InvalidProtocolBufferException.e();
        }
        this.f14332f = i5 + 8;
        byte[] bArr = this.f14329c;
        return ((bArr[i5 + 7] & 255) << 56) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 6] & 255) << 48);
    }

    public final int H() {
        int i5;
        int i11 = this.f14332f;
        int i12 = this.f14330d;
        if (i12 != i11) {
            int i13 = i11 + 1;
            byte[] bArr = this.f14329c;
            byte b11 = bArr[i11];
            if (b11 >= 0) {
                this.f14332f = i13;
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
                this.f14332f = i14;
                return i5;
            }
        }
        return (int) J();
    }

    public final long I() {
        long j11;
        long j12;
        long j13;
        long j14;
        int i5 = this.f14332f;
        int i11 = this.f14330d;
        if (i11 != i5) {
            int i12 = i5 + 1;
            byte[] bArr = this.f14329c;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                this.f14332f = i12;
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
                this.f14332f = i13;
                return j11;
            }
        }
        return J();
    }

    public final long J() throws InvalidProtocolBufferException {
        long j11 = 0;
        for (int i5 = 0; i5 < 64; i5 += 7) {
            int i11 = this.f14332f;
            if (i11 == this.f14330d) {
                throw InvalidProtocolBufferException.e();
            }
            this.f14332f = i11 + 1;
            j11 |= (r3 & AbstractJsonLexerKt.TC_INVALID) << i5;
            if ((this.f14329c[i11] & 128) == 0) {
                return j11;
            }
        }
        throw InvalidProtocolBufferException.c();
    }

    public final void K() {
        int i5 = this.f14330d + this.f14331e;
        this.f14330d = i5;
        int i11 = i5 - this.f14333g;
        int i12 = this.f14335i;
        if (i11 <= i12) {
            this.f14331e = 0;
            return;
        }
        int i13 = i11 - i12;
        this.f14331e = i13;
        this.f14330d = i5 - i13;
    }

    public final void L(int i5) throws InvalidProtocolBufferException {
        if (i5 >= 0) {
            int i11 = this.f14330d;
            int i12 = this.f14332f;
            if (i5 <= i11 - i12) {
                this.f14332f = i12 + i5;
                return;
            }
        }
        if (i5 >= 0) {
            throw InvalidProtocolBufferException.e();
        }
        throw InvalidProtocolBufferException.d();
    }

    @Override // a5.l1
    public final void a(int i5) throws InvalidProtocolBufferException {
        if (this.f14334h != i5) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // a5.l1
    public final int b() {
        return this.f14332f - this.f14333g;
    }

    @Override // a5.l1
    public final boolean c() {
        return this.f14332f == this.f14330d;
    }

    @Override // a5.l1
    public final void h(int i5) {
        this.f14335i = i5;
        K();
    }

    @Override // a5.l1
    public final int i(int i5) throws InvalidProtocolBufferException {
        if (i5 < 0) {
            throw InvalidProtocolBufferException.d();
        }
        int iB = b() + i5;
        if (iB < 0) {
            throw new InvalidProtocolBufferException("Failed to parse the message.");
        }
        int i11 = this.f14335i;
        if (iB > i11) {
            throw InvalidProtocolBufferException.e();
        }
        this.f14335i = iB;
        K();
        return i11;
    }

    @Override // a5.l1
    public final boolean j() {
        return I() != 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x002f  */
    @Override // a5.l1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final h k() throws InvalidProtocolBufferException {
        byte[] bArrCopyOfRange;
        int iH = H();
        byte[] bArr = this.f14329c;
        if (iH > 0) {
            int i5 = this.f14330d;
            int i11 = this.f14332f;
            if (iH <= i5 - i11) {
                h hVarE = h.e(i11, iH, bArr);
                this.f14332f += iH;
                return hVarE;
            }
        }
        if (iH == 0) {
            return h.f14324c;
        }
        if (iH > 0) {
            int i12 = this.f14330d;
            int i13 = this.f14332f;
            if (iH <= i12 - i13) {
                int i14 = iH + i13;
                this.f14332f = i14;
                bArrCopyOfRange = Arrays.copyOfRange(bArr, i13, i14);
            } else {
                if (iH > 0) {
                    throw InvalidProtocolBufferException.e();
                }
                if (iH != 0) {
                    throw InvalidProtocolBufferException.d();
                }
                bArrCopyOfRange = b0.f14279b;
            }
        }
        h hVar = h.f14324c;
        return new h(bArrCopyOfRange);
    }

    @Override // a5.l1
    public final double l() {
        return Double.longBitsToDouble(G());
    }

    @Override // a5.l1
    public final int m() {
        return H();
    }

    @Override // a5.l1
    public final int n() {
        return F();
    }

    @Override // a5.l1
    public final long o() {
        return G();
    }

    @Override // a5.l1
    public final float p() {
        return Float.intBitsToFloat(F());
    }

    @Override // a5.l1
    public final int q() {
        return H();
    }

    @Override // a5.l1
    public final long r() {
        return I();
    }

    @Override // a5.l1
    public final int s() {
        return F();
    }

    @Override // a5.l1
    public final long t() {
        return G();
    }

    @Override // a5.l1
    public final int v() {
        int iH = H();
        return (-(iH & 1)) ^ (iH >>> 1);
    }

    @Override // a5.l1
    public final long w() {
        long jI = I();
        return (-(jI & 1)) ^ (jI >>> 1);
    }

    @Override // a5.l1
    public final String x() throws InvalidProtocolBufferException {
        int iH = H();
        if (iH > 0) {
            int i5 = this.f14330d;
            int i11 = this.f14332f;
            if (iH <= i5 - i11) {
                String str = new String(this.f14329c, i11, iH, b0.f14278a);
                this.f14332f += iH;
                return str;
            }
        }
        if (iH == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iH < 0) {
            throw InvalidProtocolBufferException.d();
        }
        throw InvalidProtocolBufferException.e();
    }

    @Override // a5.l1
    public final String y() throws InvalidProtocolBufferException {
        int iH = H();
        if (iH > 0) {
            int i5 = this.f14330d;
            int i11 = this.f14332f;
            if (iH <= i5 - i11) {
                String strK = q1.f14388a.K(i11, iH, this.f14329c);
                this.f14332f += iH;
                return strK;
            }
        }
        if (iH == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iH <= 0) {
            throw InvalidProtocolBufferException.d();
        }
        throw InvalidProtocolBufferException.e();
    }

    @Override // a5.l1
    public final int z() throws InvalidProtocolBufferException {
        if (c()) {
            this.f14334h = 0;
            return 0;
        }
        int iH = H();
        this.f14334h = iH;
        if ((iH >>> 3) != 0) {
            return iH;
        }
        throw new InvalidProtocolBufferException("Protocol message contained an invalid tag (zero).");
    }
}
