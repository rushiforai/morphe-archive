package defpackage;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yua implements zz0 {
    public final ikc a;
    public final kz0 b;
    public boolean c;

    public yua(ikc ikcVar) {
        ikcVar.getClass();
        this.a = ikcVar;
        this.b = new kz0();
    }

    public final short B() {
        x0(2L);
        return this.b.A0();
    }

    @Override // defpackage.zz0
    public final boolean C(long j, h21 h21Var) {
        h21Var.getClass();
        int iE = h21Var.e();
        if (!this.c) {
            return iE >= 0 && j >= 0 && iE <= h21Var.e() && (iE == 0 || g76.P(this, h21Var, iE, j, j + 1) != -1);
        }
        ygf.f("closed");
        return false;
    }

    public final short D() {
        x0(2L);
        return this.b.E0();
    }

    @Override // defpackage.zz0
    public final InputStream D0() {
        return new iz0(this, 1);
    }

    @Override // defpackage.zz0
    public final boolean H() {
        if (this.c) {
            ygf.f("closed");
            return false;
        }
        kz0 kz0Var = this.b;
        return kz0Var.H() && this.a.q0(kz0Var, 8192L) == -1;
    }

    public final String I(long j) {
        if (j < 0) {
            ywb.g(ho2.D(j, "limit < 0: "));
            return null;
        }
        long j2 = j == Long.MAX_VALUE ? Long.MAX_VALUE : j + 1;
        long jF = f((byte) 10, 0L, j2);
        kz0 kz0Var = this.b;
        if (jF != -1) {
            return b.c(kz0Var, jF);
        }
        if (j2 < Long.MAX_VALUE && request(j2) && kz0Var.L(j2 - 1) == 13 && request(j2 + 1) && kz0Var.L(j2) == 10) {
            return b.c(kz0Var, j2);
        }
        kz0 kz0Var2 = new kz0();
        kz0Var.I(kz0Var2, 0L, Math.min(32L, kz0Var.b));
        throw new EOFException("\\n not found: limit=" + Math.min(kz0Var.b, j) + " content=" + kz0Var2.r(kz0Var2.b).f() + (char) 8230);
    }

    @Override // defpackage.zz0
    public final long O(h21 h21Var) {
        h21Var.getClass();
        long jMax = 0;
        if (this.c) {
            ygf.f("closed");
            return 0L;
        }
        while (true) {
            kz0 kz0Var = this.b;
            long jQ = kz0Var.Q(jMax, h21Var);
            if (jQ != -1) {
                return jQ;
            }
            long j = kz0Var.b;
            if (this.a.q0(kz0Var, 8192L) == -1) {
                return -1L;
            }
            jMax = Math.max(jMax, j);
        }
    }

    @Override // defpackage.zz0
    public final long S(xz0 xz0Var) {
        kz0 kz0Var;
        long j = 0;
        while (true) {
            ikc ikcVar = this.a;
            kz0Var = this.b;
            if (ikcVar.q0(kz0Var, 8192L) == -1) {
                break;
            }
            long jD = kz0Var.D();
            if (jD > 0) {
                j += jD;
                xz0Var.c0(kz0Var, jD);
            }
        }
        long j2 = kz0Var.b;
        if (j2 <= 0) {
            return j;
        }
        long j3 = j + j2;
        xz0Var.c0(kz0Var, j2);
        return j3;
    }

    @Override // defpackage.zz0, defpackage.xz0
    public final kz0 a() {
        return this.b;
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return this.a.b();
    }

    @Override // defpackage.zz0
    public final String b0(Charset charset) {
        charset.getClass();
        ikc ikcVar = this.a;
        kz0 kz0Var = this.b;
        kz0Var.J(ikcVar);
        return kz0Var.F0(kz0Var.b, charset);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable, java.nio.channels.Channel
    public final void close() throws IOException {
        if (this.c) {
            return;
        }
        this.c = true;
        this.a.close();
        this.b.B();
    }

    public final long f(byte b, long j, long j2) {
        if (this.c) {
            ygf.f("closed");
            return 0L;
        }
        if (0 > j2) {
            ywb.g(ho2.D(j2, "fromIndex=0 toIndex="));
            return 0L;
        }
        long jMax = 0;
        while (jMax < j2) {
            kz0 kz0Var = this.b;
            byte b2 = b;
            long j3 = j2;
            long jN = kz0Var.N(b2, jMax, j3);
            if (jN != -1) {
                return jN;
            }
            long j4 = kz0Var.b;
            if (j4 >= j3 || this.a.q0(kz0Var, 8192L) == -1) {
                break;
            }
            jMax = Math.max(jMax, j4);
            b = b2;
            j2 = j3;
        }
        return -1L;
    }

    @Override // defpackage.zz0
    public final String h0() {
        return I(Long.MAX_VALUE);
    }

    @Override // defpackage.zz0
    public final int i0() {
        x0(4L);
        return this.b.i0();
    }

    @Override // java.nio.channels.Channel
    public final boolean isOpen() {
        return !this.c;
    }

    public final void m(kz0 kz0Var, long j) throws EOFException {
        kz0 kz0Var2 = this.b;
        try {
            x0(j);
            long j2 = kz0Var2.b;
            if (j2 >= j) {
                kz0Var.c0(kz0Var2, j);
            } else {
                kz0Var.c0(kz0Var2, j2);
                ay0.b();
            }
        } catch (EOFException e) {
            kz0Var.J(kz0Var2);
            throw e;
        }
    }

    @Override // defpackage.zz0
    public final String o(long j) {
        x0(j);
        return this.b.F0(j, wk1.a);
    }

    public final int p() {
        x0(4L);
        return this.b.p0();
    }

    @Override // defpackage.zz0
    public final yua peek() {
        return new yua(new x79(this));
    }

    @Override // defpackage.ikc
    public final long q0(kz0 kz0Var, long j) {
        kz0Var.getClass();
        if (j < 0) {
            ywb.g(ho2.D(j, "byteCount < 0: "));
            return 0L;
        }
        if (this.c) {
            ygf.f("closed");
            return 0L;
        }
        kz0 kz0Var2 = this.b;
        if (kz0Var2.b == 0) {
            if (j == 0) {
                return 0L;
            }
            if (this.a.q0(kz0Var2, 8192L) == -1) {
                return -1L;
            }
        }
        return kz0Var2.q0(kz0Var, Math.min(j, kz0Var2.b));
    }

    @Override // defpackage.zz0
    public final h21 r(long j) {
        x0(j);
        return this.b.r(j);
    }

    @Override // defpackage.zz0
    public final long r0() {
        x0(8L);
        return this.b.r0();
    }

    @Override // java.nio.channels.ReadableByteChannel
    public final int read(ByteBuffer byteBuffer) {
        byteBuffer.getClass();
        kz0 kz0Var = this.b;
        if (kz0Var.b == 0 && this.a.q0(kz0Var, 8192L) == -1) {
            return -1;
        }
        return kz0Var.read(byteBuffer);
    }

    @Override // defpackage.zz0
    public final byte readByte() {
        x0(1L);
        return this.b.readByte();
    }

    @Override // defpackage.zz0
    public final boolean request(long j) {
        kz0 kz0Var;
        if (j < 0) {
            ywb.g(ho2.D(j, "byteCount < 0: "));
            return false;
        }
        if (this.c) {
            ygf.f("closed");
            return false;
        }
        do {
            kz0Var = this.b;
            if (kz0Var.b >= j) {
                return true;
            }
        } while (this.a.q0(kz0Var, 8192L) != -1);
        return false;
    }

    @Override // defpackage.zz0
    public final void skip(long j) throws EOFException {
        if (this.c) {
            ygf.f("closed");
            return;
        }
        while (j > 0) {
            kz0 kz0Var = this.b;
            if (kz0Var.b == 0 && this.a.q0(kz0Var, 8192L) == -1) {
                ay0.b();
                return;
            } else {
                long jMin = Math.min(j, kz0Var.b);
                kz0Var.skip(jMin);
                j -= jMin;
            }
        }
    }

    public final String toString() {
        return "buffer(" + this.a + ')';
    }

    @Override // defpackage.zz0
    public final long u0(h21 h21Var) {
        h21Var.getClass();
        return g76.P(this, h21Var, h21Var.e(), 0L, Long.MAX_VALUE);
    }

    @Override // defpackage.zz0
    public final int w(dw8 dw8Var) throws EOFException {
        dw8Var.getClass();
        if (this.c) {
            ygf.f("closed");
            return 0;
        }
        while (true) {
            kz0 kz0Var = this.b;
            int iD = b.d(kz0Var, dw8Var, true);
            if (iD != -2) {
                if (iD != -1) {
                    kz0Var.skip(dw8Var.a[iD].e());
                    return iD;
                }
            } else if (this.a.q0(kz0Var, 8192L) == -1) {
                break;
            }
        }
        return -1;
    }

    @Override // defpackage.zz0
    public final void x0(long j) {
        if (request(j)) {
            return;
        }
        ay0.b();
    }
}
