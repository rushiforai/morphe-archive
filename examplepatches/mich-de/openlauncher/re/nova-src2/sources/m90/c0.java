package m90;

import java.nio.ByteBuffer;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c0 implements h {

    /* renamed from: a, reason: collision with root package name */
    public final h0 f76098a;

    /* renamed from: b, reason: collision with root package name */
    public final g f76099b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f76100c;

    public c0(h0 sink) {
        Intrinsics.g(sink, "sink");
        this.f76098a = sink;
        this.f76099b = new g();
    }

    @Override // m90.h
    public final h C(j byteString) {
        Intrinsics.g(byteString, "byteString");
        if (this.f76100c) {
            throw new IllegalStateException("closed");
        }
        this.f76099b.f0(byteString);
        b();
        return this;
    }

    @Override // m90.h
    public final h E(long j11) {
        if (this.f76100c) {
            throw new IllegalStateException("closed");
        }
        this.f76099b.h0(j11);
        b();
        return this;
    }

    @Override // m90.h
    public final long I(j0 j0Var) {
        long j11 = 0;
        while (true) {
            long j12 = ((d) j0Var).read(this.f76099b, 8192L);
            if (j12 == -1) {
                return j11;
            }
            j11 += j12;
            b();
        }
    }

    @Override // m90.h
    public final h T(long j11) {
        if (this.f76100c) {
            throw new IllegalStateException("closed");
        }
        this.f76099b.i0(j11);
        b();
        return this;
    }

    @Override // m90.h
    public final h Y(int i5, int i11, byte[] source) {
        Intrinsics.g(source, "source");
        if (this.f76100c) {
            throw new IllegalStateException("closed");
        }
        this.f76099b.write(source, i5, i11);
        b();
        return this;
    }

    @Override // m90.h0
    public final void Z(g source, long j11) {
        Intrinsics.g(source, "source");
        if (this.f76100c) {
            throw new IllegalStateException("closed");
        }
        this.f76099b.Z(source, j11);
        b();
    }

    public final h a() {
        if (this.f76100c) {
            throw new IllegalStateException("closed");
        }
        g gVar = this.f76099b;
        long j11 = gVar.f76126b;
        if (j11 > 0) {
            this.f76098a.Z(gVar, j11);
        }
        return this;
    }

    public final h b() {
        if (this.f76100c) {
            throw new IllegalStateException("closed");
        }
        g gVar = this.f76099b;
        long jD = gVar.d();
        if (jD > 0) {
            this.f76098a.Z(gVar, jD);
        }
        return this;
    }

    @Override // m90.h0, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        h0 h0Var = this.f76098a;
        if (this.f76100c) {
            return;
        }
        try {
            g gVar = this.f76099b;
            long j11 = gVar.f76126b;
            if (j11 > 0) {
                h0Var.Z(gVar, j11);
            }
            th = null;
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            h0Var.close();
        } catch (Throwable th3) {
            if (th == null) {
                th = th3;
            }
        }
        this.f76100c = true;
        if (th != null) {
            throw th;
        }
    }

    @Override // m90.h, m90.h0, java.io.Flushable
    public final void flush() {
        if (this.f76100c) {
            throw new IllegalStateException("closed");
        }
        g gVar = this.f76099b;
        long j11 = gVar.f76126b;
        h0 h0Var = this.f76098a;
        if (j11 > 0) {
            h0Var.Z(gVar, j11);
        }
        h0Var.flush();
    }

    @Override // m90.h
    public final g i() {
        return this.f76099b;
    }

    @Override // java.nio.channels.Channel
    public final boolean isOpen() {
        return !this.f76100c;
    }

    @Override // m90.h0
    public final l0 timeout() {
        return this.f76098a.timeout();
    }

    public final String toString() {
        return "buffer(" + this.f76098a + ')';
    }

    @Override // m90.h
    public final h u(String string) {
        Intrinsics.g(string, "string");
        if (this.f76100c) {
            throw new IllegalStateException("closed");
        }
        this.f76099b.m0(string);
        b();
        return this;
    }

    @Override // java.nio.channels.WritableByteChannel
    public final int write(ByteBuffer source) {
        Intrinsics.g(source, "source");
        if (this.f76100c) {
            throw new IllegalStateException("closed");
        }
        int iWrite = this.f76099b.write(source);
        b();
        return iWrite;
    }

    @Override // m90.h
    public final h writeByte(int i5) {
        if (this.f76100c) {
            throw new IllegalStateException("closed");
        }
        this.f76099b.g0(i5);
        b();
        return this;
    }

    @Override // m90.h
    public final h writeInt(int i5) {
        if (this.f76100c) {
            throw new IllegalStateException("closed");
        }
        this.f76099b.j0(i5);
        b();
        return this;
    }

    @Override // m90.h
    public final h writeShort(int i5) {
        if (this.f76100c) {
            throw new IllegalStateException("closed");
        }
        this.f76099b.k0(i5);
        b();
        return this;
    }

    @Override // m90.h
    public final h write(byte[] source) {
        Intrinsics.g(source, "source");
        if (!this.f76100c) {
            this.f76099b.write(source, 0, source.length);
            b();
            return this;
        }
        throw new IllegalStateException("closed");
    }
}
