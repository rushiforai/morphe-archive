package defpackage;

import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xua implements xz0 {
    public final bfc a;
    public final kz0 b;
    public boolean c;

    public xua(bfc bfcVar) {
        bfcVar.getClass();
        this.a = bfcVar;
        this.b = new kz0();
    }

    @Override // defpackage.xz0
    public final xz0 A(long j) {
        if (this.c) {
            ygf.f("closed");
            return null;
        }
        this.b.O0(dm2.V(j));
        f();
        return this;
    }

    @Override // defpackage.xz0
    public final xz0 C0(h21 h21Var) {
        h21Var.getClass();
        if (this.c) {
            ygf.f("closed");
            return null;
        }
        this.b.J0(h21Var);
        f();
        return this;
    }

    @Override // defpackage.xz0
    public final xz0 F(int i) {
        if (this.c) {
            ygf.f("closed");
            return null;
        }
        this.b.N0(dm2.U(i));
        f();
        return this;
    }

    @Override // defpackage.xz0
    public final long J(ikc ikcVar) {
        ikcVar.getClass();
        long j = 0;
        while (true) {
            long jQ0 = ikcVar.q0(this.b, 8192L);
            if (jQ0 == -1) {
                return j;
            }
            j += jQ0;
            f();
        }
    }

    @Override // defpackage.xz0
    public final xz0 W(int i, byte[] bArr) {
        if (this.c) {
            ygf.f("closed");
            return null;
        }
        this.b.write(bArr, 0, i);
        f();
        return this;
    }

    @Override // defpackage.xz0
    public final xz0 Y(String str) {
        str.getClass();
        if (this.c) {
            ygf.f("closed");
            return null;
        }
        this.b.R0(str);
        f();
        return this;
    }

    @Override // defpackage.xz0
    public final kz0 a() {
        return this.b;
    }

    @Override // defpackage.bfc
    public final fmd b() {
        return this.a.b();
    }

    @Override // defpackage.bfc
    public final void c0(kz0 kz0Var, long j) {
        kz0Var.getClass();
        if (this.c) {
            ygf.f("closed");
        } else {
            this.b.c0(kz0Var, j);
            f();
        }
    }

    @Override // defpackage.bfc, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        bfc bfcVar = this.a;
        if (this.c) {
            return;
        }
        try {
            kz0 kz0Var = this.b;
            long j = kz0Var.b;
            if (j > 0) {
                bfcVar.c0(kz0Var, j);
            }
            th = null;
        } catch (Throwable th) {
            th = th;
        }
        try {
            bfcVar.close();
        } catch (Throwable th2) {
            if (th == null) {
                th = th2;
            }
        }
        this.c = true;
        if (th != null) {
            throw th;
        }
    }

    @Override // defpackage.xz0
    public final xz0 e0(int i, int i2, String str) {
        str.getClass();
        if (this.c) {
            ygf.f("closed");
            return null;
        }
        this.b.Q0(i, i2, str);
        f();
        return this;
    }

    public final xz0 f() {
        if (this.c) {
            ygf.f("closed");
            return null;
        }
        kz0 kz0Var = this.b;
        long jD = kz0Var.D();
        if (jD > 0) {
            this.a.c0(kz0Var, jD);
        }
        return this;
    }

    @Override // defpackage.bfc, java.io.Flushable
    public final void flush() {
        if (this.c) {
            ygf.f("closed");
            return;
        }
        kz0 kz0Var = this.b;
        long j = kz0Var.b;
        bfc bfcVar = this.a;
        if (j > 0) {
            bfcVar.c0(kz0Var, j);
        }
        bfcVar.flush();
    }

    @Override // java.nio.channels.Channel
    public final boolean isOpen() {
        return !this.c;
    }

    public final xz0 m(int i) {
        if (this.c) {
            ygf.f("closed");
            return null;
        }
        this.b.N0(i);
        f();
        return this;
    }

    public final String toString() {
        return "buffer(" + this.a + ')';
    }

    @Override // defpackage.xz0
    public final xz0 write(byte[] bArr) {
        bArr.getClass();
        if (this.c) {
            ygf.f("closed");
            return null;
        }
        this.b.write(bArr, 0, bArr.length);
        f();
        return this;
    }

    @Override // defpackage.xz0
    public final xz0 writeByte(int i) {
        if (this.c) {
            ygf.f("closed");
            return null;
        }
        this.b.K0(i);
        f();
        return this;
    }

    @Override // defpackage.xz0
    public final xz0 y(int i) {
        if (this.c) {
            ygf.f("closed");
            return null;
        }
        this.b.S0(i);
        f();
        return this;
    }

    @Override // defpackage.xz0
    public final xz0 y0(long j) {
        if (this.c) {
            ygf.f("closed");
            return null;
        }
        this.b.L0(j);
        f();
        return this;
    }

    @Override // java.nio.channels.WritableByteChannel
    public final int write(ByteBuffer byteBuffer) {
        byteBuffer.getClass();
        if (!this.c) {
            int iWrite = this.b.write(byteBuffer);
            f();
            return iWrite;
        }
        ygf.f("closed");
        return 0;
    }
}
