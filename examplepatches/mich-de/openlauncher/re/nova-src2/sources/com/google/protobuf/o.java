package com.google.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.nio.ByteBuffer;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class o extends p {

    /* renamed from: c, reason: collision with root package name */
    public final ByteBuffer f34925c;

    /* renamed from: d, reason: collision with root package name */
    public final long f34926d;

    /* renamed from: e, reason: collision with root package name */
    public long f34927e;

    /* renamed from: f, reason: collision with root package name */
    public long f34928f;

    /* renamed from: g, reason: collision with root package name */
    public final long f34929g;

    /* renamed from: h, reason: collision with root package name */
    public int f34930h;

    /* renamed from: i, reason: collision with root package name */
    public int f34931i;

    /* renamed from: j, reason: collision with root package name */
    public int f34932j = LayoutNode.NotPlacedPlaceOrder;

    public o(ByteBuffer byteBuffer, boolean z11) {
        this.f34925c = byteBuffer;
        long jI = m2.f34911c.i(m2.f34915g, byteBuffer);
        this.f34926d = jI;
        this.f34927e = byteBuffer.limit() + jI;
        long jPosition = jI + byteBuffer.position();
        this.f34928f = jPosition;
        this.f34929g = jPosition;
    }

    public static boolean J() {
        return m2.f34912d;
    }

    @Override // com.google.protobuf.p
    public final int A() {
        return p.c(w());
    }

    @Override // com.google.protobuf.p
    public final long B() {
        return p.d(M());
    }

    @Override // com.google.protobuf.p
    public final String C() throws InvalidProtocolBufferException {
        int iW = w();
        if (iW > 0) {
            long j11 = this.f34927e;
            long j12 = this.f34928f;
            if (iW <= ((int) (j11 - j12))) {
                byte[] bArr = new byte[iW];
                long j13 = iW;
                m2.f34911c.c(j12, bArr, j13);
                String str = new String(bArr, a1.f34808a);
                this.f34928f += j13;
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
            long j11 = this.f34927e;
            long j12 = this.f34928f;
            if (iW <= ((int) (j11 - j12))) {
                int i5 = (int) (j12 - this.f34926d);
                k kVar = o2.f34936a;
                kVar.getClass();
                ByteBuffer byteBuffer = this.f34925c;
                String strA = byteBuffer.hasArray() ? kVar.a(byteBuffer.arrayOffset() + i5, iW, byteBuffer.array()) : byteBuffer.isDirect() ? k.b(byteBuffer, i5, iW) : k.b(byteBuffer, i5, iW);
                this.f34928f += iW;
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
            this.f34931i = 0;
            return 0;
        }
        int iW = w();
        this.f34931i = iW;
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
        return M();
    }

    @Override // com.google.protobuf.p
    public final boolean H(int i5) throws InvalidProtocolBufferException {
        int i11 = i5 & 7;
        int i12 = 0;
        if (i11 != 0) {
            if (i11 == 1) {
                P(8);
                return true;
            }
            if (i11 == 2) {
                P(w());
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
            P(4);
            return true;
        }
        if (((int) (this.f34927e - this.f34928f)) >= 10) {
            while (i12 < 10) {
                long j11 = this.f34928f;
                this.f34928f = j11 + 1;
                if (m2.f34911c.e(j11) < 0) {
                    i12++;
                }
            }
            throw InvalidProtocolBufferException.d();
        }
        while (i12 < 10) {
            long j12 = this.f34928f;
            if (j12 == this.f34927e) {
                throw InvalidProtocolBufferException.g();
            }
            this.f34928f = j12 + 1;
            if (m2.f34911c.e(j12) < 0) {
                i12++;
            }
        }
        throw InvalidProtocolBufferException.d();
        return true;
    }

    public final int K() throws InvalidProtocolBufferException {
        long j11 = this.f34928f;
        if (this.f34927e - j11 < 4) {
            throw InvalidProtocolBufferException.g();
        }
        this.f34928f = 4 + j11;
        l2 l2Var = m2.f34911c;
        return ((l2Var.e(j11 + 3) & 255) << 24) | (l2Var.e(j11) & 255) | ((l2Var.e(1 + j11) & 255) << 8) | ((l2Var.e(2 + j11) & 255) << 16);
    }

    public final long L() throws InvalidProtocolBufferException {
        long j11 = this.f34928f;
        if (this.f34927e - j11 < 8) {
            throw InvalidProtocolBufferException.g();
        }
        this.f34928f = 8 + j11;
        l2 l2Var = m2.f34911c;
        return ((l2Var.e(j11 + 7) & 255) << 56) | (l2Var.e(j11) & 255) | ((l2Var.e(1 + j11) & 255) << 8) | ((l2Var.e(2 + j11) & 255) << 16) | ((l2Var.e(3 + j11) & 255) << 24) | ((l2Var.e(4 + j11) & 255) << 32) | ((l2Var.e(5 + j11) & 255) << 40) | ((l2Var.e(6 + j11) & 255) << 48);
    }

    public final long M() {
        long j11;
        long j12;
        long j13;
        int i5;
        long j14 = this.f34928f;
        if (this.f34927e != j14) {
            long j15 = 1 + j14;
            l2 l2Var = m2.f34911c;
            byte bE = l2Var.e(j14);
            if (bE >= 0) {
                this.f34928f = j15;
                return bE;
            }
            if (this.f34927e - j15 >= 9) {
                long j16 = 2 + j14;
                int iE = (l2Var.e(j15) << 7) ^ bE;
                if (iE >= 0) {
                    long j17 = 3 + j14;
                    int iE2 = iE ^ (l2Var.e(j16) << 14);
                    if (iE2 >= 0) {
                        j11 = iE2 ^ 16256;
                    } else {
                        j16 = j14 + 4;
                        int iE3 = iE2 ^ (l2Var.e(j17) << 21);
                        if (iE3 < 0) {
                            i5 = (-2080896) ^ iE3;
                        } else {
                            j17 = 5 + j14;
                            long jE = iE3 ^ (l2Var.e(j16) << 28);
                            if (jE < 0) {
                                long j18 = 6 + j14;
                                long jE2 = jE ^ (l2Var.e(j17) << 35);
                                if (jE2 < 0) {
                                    j12 = -34093383808L;
                                } else {
                                    j17 = 7 + j14;
                                    jE = jE2 ^ (l2Var.e(j18) << 42);
                                    if (jE >= 0) {
                                        j13 = 4363953127296L;
                                    } else {
                                        j18 = 8 + j14;
                                        jE2 = jE ^ (l2Var.e(j17) << 49);
                                        if (jE2 >= 0) {
                                            long j19 = j14 + 9;
                                            long jE3 = (jE2 ^ (l2Var.e(j18) << 56)) ^ 71499008037633920L;
                                            if (jE3 < 0) {
                                                long j21 = j14 + 10;
                                                if (l2Var.e(j19) >= 0) {
                                                    j16 = j21;
                                                    j11 = jE3;
                                                }
                                            } else {
                                                j11 = jE3;
                                                j16 = j19;
                                            }
                                            this.f34928f = j16;
                                            return j11;
                                        }
                                        j12 = -558586000294016L;
                                    }
                                }
                                j11 = j12 ^ jE2;
                                j16 = j18;
                                this.f34928f = j16;
                                return j11;
                            }
                            j13 = 266354560;
                            j11 = j13 ^ jE;
                        }
                    }
                    j16 = j17;
                    this.f34928f = j16;
                    return j11;
                }
                i5 = iE ^ (-128);
                j11 = i5;
                this.f34928f = j16;
                return j11;
            }
        }
        return N();
    }

    public final long N() throws InvalidProtocolBufferException {
        long j11 = 0;
        for (int i5 = 0; i5 < 64; i5 += 7) {
            long j12 = this.f34928f;
            if (j12 == this.f34927e) {
                throw InvalidProtocolBufferException.g();
            }
            this.f34928f = 1 + j12;
            j11 |= (r3 & AbstractJsonLexerKt.TC_INVALID) << i5;
            if ((m2.f34911c.e(j12) & 128) == 0) {
                return j11;
            }
        }
        throw InvalidProtocolBufferException.d();
    }

    public final void O() {
        long j11 = this.f34927e + this.f34930h;
        this.f34927e = j11;
        int i5 = (int) (j11 - this.f34929g);
        int i11 = this.f34932j;
        if (i5 <= i11) {
            this.f34930h = 0;
            return;
        }
        int i12 = i5 - i11;
        this.f34930h = i12;
        this.f34927e = j11 - i12;
    }

    public final void P(int i5) throws InvalidProtocolBufferException {
        if (i5 >= 0) {
            long j11 = this.f34927e;
            long j12 = this.f34928f;
            if (i5 <= ((int) (j11 - j12))) {
                this.f34928f = j12 + i5;
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
        if (this.f34931i != i5) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // com.google.protobuf.p
    public final int e() {
        int i5 = this.f34932j;
        if (i5 == Integer.MAX_VALUE) {
            return -1;
        }
        return i5 - f();
    }

    @Override // com.google.protobuf.p
    public final int f() {
        return (int) (this.f34928f - this.f34929g);
    }

    @Override // com.google.protobuf.p
    public final boolean g() {
        return this.f34928f == this.f34927e;
    }

    @Override // com.google.protobuf.p
    public final void j(int i5) {
        this.f34932j = i5;
        O();
    }

    @Override // com.google.protobuf.p
    public final int k(int i5) throws InvalidProtocolBufferException {
        if (i5 < 0) {
            throw InvalidProtocolBufferException.e();
        }
        int iF = f() + i5;
        int i11 = this.f34932j;
        if (iF > i11) {
            throw InvalidProtocolBufferException.g();
        }
        this.f34932j = iF;
        O();
        return i11;
    }

    @Override // com.google.protobuf.p
    public final boolean l() {
        return M() != 0;
    }

    @Override // com.google.protobuf.p
    public final j m() throws InvalidProtocolBufferException {
        int iW = w();
        if (iW > 0) {
            long j11 = this.f34927e;
            long j12 = this.f34928f;
            if (iW <= ((int) (j11 - j12))) {
                byte[] bArr = new byte[iW];
                long j13 = iW;
                m2.f34911c.c(j12, bArr, j13);
                this.f34928f += j13;
                j jVar = l.f34884b;
                return new j(bArr);
            }
        }
        if (iW == 0) {
            return l.f34884b;
        }
        if (iW < 0) {
            throw InvalidProtocolBufferException.e();
        }
        throw InvalidProtocolBufferException.g();
    }

    @Override // com.google.protobuf.p
    public final double n() {
        return Double.longBitsToDouble(L());
    }

    @Override // com.google.protobuf.p
    public final int o() {
        return w();
    }

    @Override // com.google.protobuf.p
    public final int p() {
        return K();
    }

    @Override // com.google.protobuf.p
    public final long q() {
        return L();
    }

    @Override // com.google.protobuf.p
    public final float r() {
        return Float.intBitsToFloat(K());
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
        return M();
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

    /* JADX WARN: Code restructure failed: missing block: B:33:0x0091, code lost:
    
        if (r4.e(r8) < 0) goto L34;
     */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0099 A[PHI: r6
      0x0099: PHI (r6v7 long) = (r6v6 long), (r6v8 long), (r6v10 long) binds: [B:25:0x006d, B:29:0x0080, B:33:0x0091] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.google.protobuf.p
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int w() {
        int i5;
        long j11 = this.f34928f;
        if (this.f34927e != j11) {
            long j12 = 1 + j11;
            l2 l2Var = m2.f34911c;
            byte bE = l2Var.e(j11);
            if (bE >= 0) {
                this.f34928f = j12;
                return bE;
            }
            if (this.f34927e - j12 >= 9) {
                long j13 = 2 + j11;
                int iE = (l2Var.e(j12) << 7) ^ bE;
                if (iE < 0) {
                    i5 = iE ^ (-128);
                } else {
                    long j14 = 3 + j11;
                    int iE2 = iE ^ (l2Var.e(j13) << 14);
                    if (iE2 >= 0) {
                        i5 = iE2 ^ 16256;
                    } else {
                        j13 = j11 + 4;
                        int iE3 = iE2 ^ (l2Var.e(j14) << 21);
                        if (iE3 < 0) {
                            i5 = (-2080896) ^ iE3;
                        } else {
                            j14 = 5 + j11;
                            byte bE2 = l2Var.e(j13);
                            int i11 = (iE3 ^ (bE2 << 28)) ^ 266354560;
                            if (bE2 < 0) {
                                j13 = j11 + 6;
                                if (l2Var.e(j14) < 0) {
                                    j14 = 7 + j11;
                                    if (l2Var.e(j13) < 0) {
                                        j13 = j11 + 8;
                                        if (l2Var.e(j14) < 0) {
                                            long j15 = 9 + j11;
                                            if (l2Var.e(j13) < 0) {
                                                j13 = j11 + 10;
                                            } else {
                                                i5 = i11;
                                                j13 = j15;
                                            }
                                        } else {
                                            i5 = i11;
                                        }
                                    }
                                }
                            }
                            i5 = i11;
                        }
                    }
                    j13 = j14;
                }
                this.f34928f = j13;
                return i5;
            }
        }
        return (int) N();
    }

    @Override // com.google.protobuf.p
    public final int y() {
        return K();
    }

    @Override // com.google.protobuf.p
    public final long z() {
        return L();
    }
}
