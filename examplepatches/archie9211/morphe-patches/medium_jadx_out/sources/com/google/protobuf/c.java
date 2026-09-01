package com.google.protobuf;

import defpackage.aq7;
import defpackage.c21;
import defpackage.f21;
import defpackage.q2e;
import defpackage.r2e;
import defpackage.sp1;
import defpackage.toe;
import defpackage.v56;
import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c extends sp1 {
    public final ByteBuffer c;
    public final long d;
    public long e;
    public long f;
    public final long g;
    public int h;
    public int i;
    public int j = Integer.MAX_VALUE;

    public c(ByteBuffer byteBuffer, boolean z) {
        this.c = byteBuffer;
        q2e q2eVar = r2e.c;
        long j = q2eVar.b.getLong(byteBuffer, r2e.g);
        this.d = j;
        this.e = ((long) byteBuffer.limit()) + j;
        long jPosition = j + ((long) byteBuffer.position());
        this.f = jPosition;
        this.g = jPosition;
    }

    @Override // defpackage.sp1
    public final int A() {
        return F();
    }

    @Override // defpackage.sp1
    public final long B() {
        return G();
    }

    @Override // defpackage.sp1
    public final boolean C(int i) throws InvalidProtocolBufferException {
        int iZ;
        int i2 = i & 7;
        int i3 = 0;
        if (i2 == 0) {
            if (((int) (this.e - this.f)) >= 10) {
                while (i3 < 10) {
                    long j = this.f;
                    this.f = j + 1;
                    if (r2e.c.c(j) < 0) {
                        i3++;
                    }
                }
                throw InvalidProtocolBufferException.d();
            }
            while (i3 < 10) {
                long j2 = this.f;
                if (j2 == this.e) {
                    throw InvalidProtocolBufferException.g();
                }
                this.f = j2 + 1;
                if (r2e.c.c(j2) < 0) {
                    i3++;
                }
            }
            throw InvalidProtocolBufferException.d();
            return true;
        }
        if (i2 == 1) {
            J(8);
            return true;
        }
        if (i2 == 2) {
            J(F());
            return true;
        }
        if (i2 != 3) {
            if (i2 == 4) {
                return false;
            }
            if (i2 != 5) {
                throw InvalidProtocolBufferException.c();
            }
            J(4);
            return true;
        }
        do {
            iZ = z();
            if (iZ == 0) {
                break;
            }
        } while (C(iZ));
        a(((i >>> 3) << 3) | 4);
        return true;
    }

    public final int D() throws InvalidProtocolBufferException {
        long j = this.f;
        if (this.e - j < 4) {
            throw InvalidProtocolBufferException.g();
        }
        this.f = 4 + j;
        q2e q2eVar = r2e.c;
        return ((q2eVar.c(j + 3) & 255) << 24) | (q2eVar.c(j) & 255) | ((q2eVar.c(1 + j) & 255) << 8) | ((q2eVar.c(2 + j) & 255) << 16);
    }

    public final long E() throws InvalidProtocolBufferException {
        long j = this.f;
        if (this.e - j < 8) {
            throw InvalidProtocolBufferException.g();
        }
        this.f = 8 + j;
        q2e q2eVar = r2e.c;
        return ((((long) q2eVar.c(j + 7)) & 255) << 56) | (((long) q2eVar.c(j)) & 255) | ((((long) q2eVar.c(1 + j)) & 255) << 8) | ((((long) q2eVar.c(2 + j)) & 255) << 16) | ((((long) q2eVar.c(3 + j)) & 255) << 24) | ((((long) q2eVar.c(4 + j)) & 255) << 32) | ((((long) q2eVar.c(5 + j)) & 255) << 40) | ((((long) q2eVar.c(6 + j)) & 255) << 48);
    }

    public final int F() {
        int i;
        long j = this.f;
        if (this.e != j) {
            long j2 = 1 + j;
            q2e q2eVar = r2e.c;
            byte bC = q2eVar.c(j);
            if (bC >= 0) {
                this.f = j2;
                return bC;
            }
            if (this.e - j2 >= 9) {
                long j3 = 2 + j;
                int iC = (q2eVar.c(j2) << 7) ^ bC;
                if (iC < 0) {
                    i = iC ^ (-128);
                } else {
                    long j4 = 3 + j;
                    int iC2 = iC ^ (q2eVar.c(j3) << 14);
                    if (iC2 >= 0) {
                        i = iC2 ^ 16256;
                    } else {
                        long j5 = 4 + j;
                        int iC3 = iC2 ^ (q2eVar.c(j4) << 21);
                        if (iC3 < 0) {
                            i = (-2080896) ^ iC3;
                        } else {
                            j4 = 5 + j;
                            byte bC2 = q2eVar.c(j5);
                            int i2 = (iC3 ^ (bC2 << 28)) ^ 266354560;
                            if (bC2 < 0) {
                                j5 = 6 + j;
                                if (q2eVar.c(j4) < 0) {
                                    j4 = 7 + j;
                                    if (q2eVar.c(j5) < 0) {
                                        j5 = 8 + j;
                                        if (q2eVar.c(j4) < 0) {
                                            long j6 = 9 + j;
                                            if (q2eVar.c(j5) < 0) {
                                                long j7 = j + 10;
                                                if (q2eVar.c(j6) >= 0) {
                                                    j3 = j7;
                                                    i = i2;
                                                }
                                            } else {
                                                i = i2;
                                                j3 = j6;
                                            }
                                        }
                                    }
                                }
                                i = i2;
                            }
                            i = i2;
                        }
                        j3 = j5;
                    }
                    j3 = j4;
                }
                this.f = j3;
                return i;
            }
        }
        return (int) H();
    }

    public final long G() {
        long j;
        long j2;
        long j3;
        long j4 = this.f;
        if (this.e != j4) {
            long j5 = 1 + j4;
            q2e q2eVar = r2e.c;
            byte bC = q2eVar.c(j4);
            if (bC >= 0) {
                this.f = j5;
                return bC;
            }
            if (this.e - j5 >= 9) {
                long j6 = 2 + j4;
                int iC = (q2eVar.c(j5) << 7) ^ bC;
                if (iC < 0) {
                    j = iC ^ (-128);
                } else {
                    long j7 = 3 + j4;
                    int iC2 = iC ^ (q2eVar.c(j6) << 14);
                    if (iC2 >= 0) {
                        j = iC2 ^ 16256;
                    } else {
                        long j8 = 4 + j4;
                        int iC3 = iC2 ^ (q2eVar.c(j7) << 21);
                        if (iC3 < 0) {
                            j = (-2080896) ^ iC3;
                            j6 = j8;
                        } else {
                            j7 = 5 + j4;
                            long jC = ((long) iC3) ^ (((long) q2eVar.c(j8)) << 28);
                            if (jC >= 0) {
                                j3 = 266354560;
                            } else {
                                long j9 = 6 + j4;
                                long jC2 = jC ^ (((long) q2eVar.c(j7)) << 35);
                                if (jC2 < 0) {
                                    j2 = -34093383808L;
                                } else {
                                    j7 = 7 + j4;
                                    jC = jC2 ^ (((long) q2eVar.c(j9)) << 42);
                                    if (jC >= 0) {
                                        j3 = 4363953127296L;
                                    } else {
                                        j9 = 8 + j4;
                                        jC2 = jC ^ (((long) q2eVar.c(j7)) << 49);
                                        if (jC2 < 0) {
                                            j2 = -558586000294016L;
                                        } else {
                                            long j10 = 9 + j4;
                                            long jC3 = (jC2 ^ (((long) q2eVar.c(j9)) << 56)) ^ 71499008037633920L;
                                            if (jC3 < 0) {
                                                long j11 = j4 + 10;
                                                if (q2eVar.c(j10) >= 0) {
                                                    j6 = j11;
                                                    j = jC3;
                                                }
                                            } else {
                                                j = jC3;
                                                j6 = j10;
                                            }
                                        }
                                    }
                                }
                                j = j2 ^ jC2;
                                j6 = j9;
                            }
                            j = j3 ^ jC;
                        }
                    }
                    j6 = j7;
                }
                this.f = j6;
                return j;
            }
        }
        return H();
    }

    public final long H() throws InvalidProtocolBufferException {
        long j = 0;
        for (int i = 0; i < 64; i += 7) {
            long j2 = this.f;
            if (j2 == this.e) {
                throw InvalidProtocolBufferException.g();
            }
            this.f = 1 + j2;
            byte bC = r2e.c.c(j2);
            j |= ((long) (bC & 127)) << i;
            if ((bC & 128) == 0) {
                return j;
            }
        }
        throw InvalidProtocolBufferException.d();
    }

    public final void I() {
        long j = this.e + ((long) this.h);
        this.e = j;
        int i = (int) (j - this.g);
        int i2 = this.j;
        if (i <= i2) {
            this.h = 0;
            return;
        }
        int i3 = i - i2;
        this.h = i3;
        this.e = j - ((long) i3);
    }

    public final void J(int i) throws InvalidProtocolBufferException {
        if (i >= 0) {
            long j = this.e;
            long j2 = this.f;
            if (i <= ((int) (j - j2))) {
                this.f = j2 + ((long) i);
                return;
            }
        }
        if (i >= 0) {
            throw InvalidProtocolBufferException.g();
        }
        throw InvalidProtocolBufferException.e();
    }

    @Override // defpackage.sp1
    public final void a(int i) throws InvalidProtocolBufferException {
        if (this.i != i) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
    }

    @Override // defpackage.sp1
    public final int d() {
        return (int) (this.f - this.g);
    }

    @Override // defpackage.sp1
    public final boolean e() {
        return this.f == this.e;
    }

    @Override // defpackage.sp1
    public final void h(int i) {
        this.j = i;
        I();
    }

    @Override // defpackage.sp1
    public final int i(int i) throws InvalidProtocolBufferException {
        if (i < 0) {
            throw InvalidProtocolBufferException.e();
        }
        int iD = d() + i;
        int i2 = this.j;
        if (iD > i2) {
            throw InvalidProtocolBufferException.g();
        }
        this.j = iD;
        I();
        return i2;
    }

    @Override // defpackage.sp1
    public final boolean j() {
        return G() != 0;
    }

    @Override // defpackage.sp1
    public final c21 k() throws InvalidProtocolBufferException {
        int iF = F();
        if (iF > 0) {
            long j = this.e;
            long j2 = this.f;
            if (iF <= ((int) (j - j2))) {
                byte[] bArr = new byte[iF];
                long j3 = iF;
                r2e.c.a(j2, bArr, j3);
                this.f += j3;
                c21 c21Var = f21.b;
                return new c21(bArr);
            }
        }
        if (iF == 0) {
            return f21.b;
        }
        if (iF < 0) {
            throw InvalidProtocolBufferException.e();
        }
        throw InvalidProtocolBufferException.g();
    }

    @Override // defpackage.sp1
    public final double l() {
        return Double.longBitsToDouble(E());
    }

    @Override // defpackage.sp1
    public final int m() {
        return F();
    }

    @Override // defpackage.sp1
    public final int n() {
        return D();
    }

    @Override // defpackage.sp1
    public final long o() {
        return E();
    }

    @Override // defpackage.sp1
    public final float p() {
        return Float.intBitsToFloat(D());
    }

    @Override // defpackage.sp1
    public final int q() {
        return F();
    }

    @Override // defpackage.sp1
    public final long r() {
        return G();
    }

    @Override // defpackage.sp1
    public final int t() {
        return D();
    }

    @Override // defpackage.sp1
    public final long u() {
        return E();
    }

    @Override // defpackage.sp1
    public final int v() {
        return sp1.b(F());
    }

    @Override // defpackage.sp1
    public final long w() {
        return sp1.c(G());
    }

    @Override // defpackage.sp1
    public final String x() throws InvalidProtocolBufferException {
        int iF = F();
        if (iF > 0) {
            long j = this.e;
            long j2 = this.f;
            if (iF <= ((int) (j - j2))) {
                byte[] bArr = new byte[iF];
                long j3 = iF;
                r2e.c.a(j2, bArr, j3);
                String str = new String(bArr, v56.a);
                this.f += j3;
                return str;
            }
        }
        if (iF == 0) {
            return "";
        }
        if (iF < 0) {
            throw InvalidProtocolBufferException.e();
        }
        throw InvalidProtocolBufferException.g();
    }

    @Override // defpackage.sp1
    public final String y() throws InvalidProtocolBufferException {
        int iF = F();
        if (iF > 0) {
            long j = this.e;
            long j2 = this.f;
            if (iF <= ((int) (j - j2))) {
                int i = (int) (j2 - this.d);
                aq7 aq7Var = toe.a;
                aq7Var.getClass();
                ByteBuffer byteBuffer = this.c;
                String strM = byteBuffer.hasArray() ? aq7Var.m(byteBuffer.array(), byteBuffer.arrayOffset() + i, iF) : byteBuffer.isDirect() ? aq7Var.o(byteBuffer, i, iF) : aq7.n(byteBuffer, i, iF);
                this.f += (long) iF;
                return strM;
            }
        }
        if (iF == 0) {
            return "";
        }
        if (iF <= 0) {
            throw InvalidProtocolBufferException.e();
        }
        throw InvalidProtocolBufferException.g();
    }

    @Override // defpackage.sp1
    public final int z() throws InvalidProtocolBufferException {
        if (e()) {
            this.i = 0;
            return 0;
        }
        int iF = F();
        this.i = iF;
        if ((iF >>> 3) != 0) {
            return iF;
        }
        throw InvalidProtocolBufferException.a();
    }
}
