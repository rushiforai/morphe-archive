package com.google.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class m extends p {

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f34894c;

    /* renamed from: d, reason: collision with root package name */
    public int f34895d;

    /* renamed from: e, reason: collision with root package name */
    public int f34896e;

    /* renamed from: f, reason: collision with root package name */
    public int f34897f;

    /* renamed from: g, reason: collision with root package name */
    public final int f34898g;

    /* renamed from: h, reason: collision with root package name */
    public int f34899h;

    /* renamed from: i, reason: collision with root package name */
    public int f34900i = LayoutNode.NotPlacedPlaceOrder;

    public m(byte[] bArr, int i5, int i11, boolean z11) {
        this.f34894c = bArr;
        this.f34895d = i11 + i5;
        this.f34897f = i5;
        this.f34898g = i5;
    }

    @Override // com.google.protobuf.p
    public final int A() {
        return p.c(w());
    }

    @Override // com.google.protobuf.p
    public final long B() {
        return p.d(L());
    }

    @Override // com.google.protobuf.p
    public final String C() throws InvalidProtocolBufferException {
        int iW = w();
        if (iW > 0) {
            int i5 = this.f34895d;
            int i11 = this.f34897f;
            if (iW <= i5 - i11) {
                String str = new String(this.f34894c, i11, iW, a1.f34808a);
                this.f34897f += iW;
                return str;
            }
        }
        if (iW == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iW < 0) {
            throw InvalidProtocolBufferException.e();
        }
        throw InvalidProtocolBufferException.g();
    }

    @Override // com.google.protobuf.p
    public final String D() throws InvalidProtocolBufferException {
        int iW = w();
        if (iW > 0) {
            int i5 = this.f34895d;
            int i11 = this.f34897f;
            if (iW <= i5 - i11) {
                String strA = o2.f34936a.a(i11, iW, this.f34894c);
                this.f34897f += iW;
                return strA;
            }
        }
        if (iW == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (iW <= 0) {
            throw InvalidProtocolBufferException.e();
        }
        throw InvalidProtocolBufferException.g();
    }

    @Override // com.google.protobuf.p
    public final int E() throws InvalidProtocolBufferException {
        if (g()) {
            this.f34899h = 0;
            return 0;
        }
        int iW = w();
        this.f34899h = iW;
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
        return L();
    }

    @Override // com.google.protobuf.p
    public final boolean H(int i5) throws InvalidProtocolBufferException {
        int i11 = i5 & 7;
        int i12 = 0;
        if (i11 != 0) {
            if (i11 == 1) {
                O(8);
                return true;
            }
            if (i11 == 2) {
                O(w());
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
            O(4);
            return true;
        }
        int i13 = this.f34895d - this.f34897f;
        byte[] bArr = this.f34894c;
        if (i13 >= 10) {
            while (i12 < 10) {
                int i14 = this.f34897f;
                this.f34897f = i14 + 1;
                if (bArr[i14] < 0) {
                    i12++;
                }
            }
            throw InvalidProtocolBufferException.d();
        }
        while (i12 < 10) {
            int i15 = this.f34897f;
            if (i15 == this.f34895d) {
                throw InvalidProtocolBufferException.g();
            }
            this.f34897f = i15 + 1;
            if (bArr[i15] < 0) {
                i12++;
            }
        }
        throw InvalidProtocolBufferException.d();
        return true;
    }

    public final int J() throws InvalidProtocolBufferException {
        int i5 = this.f34897f;
        if (this.f34895d - i5 < 4) {
            throw InvalidProtocolBufferException.g();
        }
        this.f34897f = i5 + 4;
        byte[] bArr = this.f34894c;
        return ((bArr[i5 + 3] & 255) << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
    }

    public final long K() throws InvalidProtocolBufferException {
        int i5 = this.f34897f;
        if (this.f34895d - i5 < 8) {
            throw InvalidProtocolBufferException.g();
        }
        this.f34897f = i5 + 8;
        byte[] bArr = this.f34894c;
        return ((bArr[i5 + 7] & 255) << 56) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 6] & 255) << 48);
    }

    public final long L() {
        long j11;
        long j12;
        long j13;
        long j14;
        int i5 = this.f34897f;
        int i11 = this.f34895d;
        if (i11 != i5) {
            int i12 = i5 + 1;
            byte[] bArr = this.f34894c;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                this.f34897f = i12;
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
                this.f34897f = i13;
                return j11;
            }
        }
        return M();
    }

    public final long M() throws InvalidProtocolBufferException {
        long j11 = 0;
        for (int i5 = 0; i5 < 64; i5 += 7) {
            int i11 = this.f34897f;
            if (i11 == this.f34895d) {
                throw InvalidProtocolBufferException.g();
            }
            this.f34897f = i11 + 1;
            j11 |= (r3 & AbstractJsonLexerKt.TC_INVALID) << i5;
            if ((this.f34894c[i11] & 128) == 0) {
                return j11;
            }
        }
        throw InvalidProtocolBufferException.d();
    }

    public final void N() {
        int i5 = this.f34895d + this.f34896e;
        this.f34895d = i5;
        int i11 = i5 - this.f34898g;
        int i12 = this.f34900i;
        if (i11 <= i12) {
            this.f34896e = 0;
            return;
        }
        int i13 = i11 - i12;
        this.f34896e = i13;
        this.f34895d = i5 - i13;
    }

    public final void O(int i5) throws InvalidProtocolBufferException {
        if (i5 >= 0) {
            int i11 = this.f34895d;
            int i12 = this.f34897f;
            if (i5 <= i11 - i12) {
                this.f34897f = i12 + i5;
                return;
            }
        }
        if (i5 >= 0) {
            throw InvalidProtocolBufferException.g();
        }
        throw InvalidProtocolBufferException.e();
    }

    @Override // com.google.protobuf.p
    public final void a(int i5) throws InvalidProtocolBufferException {
        if (this.f34899h != i5) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // com.google.protobuf.p
    public final int e() {
        int i5 = this.f34900i;
        if (i5 == Integer.MAX_VALUE) {
            return -1;
        }
        return i5 - f();
    }

    @Override // com.google.protobuf.p
    public final int f() {
        return this.f34897f - this.f34898g;
    }

    @Override // com.google.protobuf.p
    public final boolean g() {
        return this.f34897f == this.f34895d;
    }

    @Override // com.google.protobuf.p
    public final void j(int i5) {
        this.f34900i = i5;
        N();
    }

    @Override // com.google.protobuf.p
    public final int k(int i5) throws InvalidProtocolBufferException {
        if (i5 < 0) {
            throw InvalidProtocolBufferException.e();
        }
        int iF = f() + i5;
        if (iF < 0) {
            throw InvalidProtocolBufferException.f();
        }
        int i11 = this.f34900i;
        if (iF > i11) {
            throw InvalidProtocolBufferException.g();
        }
        this.f34900i = iF;
        N();
        return i11;
    }

    @Override // com.google.protobuf.p
    public final boolean l() {
        return L() != 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x002f  */
    @Override // com.google.protobuf.p
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final j m() throws InvalidProtocolBufferException {
        byte[] bArrCopyOfRange;
        int iW = w();
        byte[] bArr = this.f34894c;
        if (iW > 0) {
            int i5 = this.f34895d;
            int i11 = this.f34897f;
            if (iW <= i5 - i11) {
                j jVarE = l.e(i11, iW, bArr);
                this.f34897f += iW;
                return jVarE;
            }
        }
        if (iW == 0) {
            return l.f34884b;
        }
        if (iW > 0) {
            int i12 = this.f34895d;
            int i13 = this.f34897f;
            if (iW <= i12 - i13) {
                int i14 = iW + i13;
                this.f34897f = i14;
                bArrCopyOfRange = Arrays.copyOfRange(bArr, i13, i14);
            } else {
                if (iW > 0) {
                    throw InvalidProtocolBufferException.g();
                }
                if (iW != 0) {
                    throw InvalidProtocolBufferException.e();
                }
                bArrCopyOfRange = a1.f34809b;
            }
        }
        j jVar = l.f34884b;
        return new j(bArrCopyOfRange);
    }

    @Override // com.google.protobuf.p
    public final double n() {
        return Double.longBitsToDouble(K());
    }

    @Override // com.google.protobuf.p
    public final int o() {
        return w();
    }

    @Override // com.google.protobuf.p
    public final int p() {
        return J();
    }

    @Override // com.google.protobuf.p
    public final long q() {
        return K();
    }

    @Override // com.google.protobuf.p
    public final float r() {
        return Float.intBitsToFloat(J());
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
        return L();
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
        int i11 = this.f34897f;
        int i12 = this.f34895d;
        if (i12 != i11) {
            int i13 = i11 + 1;
            byte[] bArr = this.f34894c;
            byte b11 = bArr[i11];
            if (b11 >= 0) {
                this.f34897f = i13;
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
                this.f34897f = i14;
                return i5;
            }
        }
        return (int) M();
    }

    @Override // com.google.protobuf.p
    public final int y() {
        return J();
    }

    @Override // com.google.protobuf.p
    public final long z() {
        return K();
    }
}
