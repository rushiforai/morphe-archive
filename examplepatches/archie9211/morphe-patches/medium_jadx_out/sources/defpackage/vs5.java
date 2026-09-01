package defpackage;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.util.TimeZone;
import okhttp3.internal.http2.StreamResetException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vs5 implements ikc {
    public final long a;
    public boolean b;
    public final kz0 c = new kz0();
    public final kz0 d = new kz0();
    public boolean e;
    public final /* synthetic */ xs5 f;

    public vs5(xs5 xs5Var, long j, boolean z) {
        this.f = xs5Var;
        this.a = j;
        this.b = z;
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return this.f.j;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        long j;
        xs5 xs5Var = this.f;
        synchronized (xs5Var) {
            this.e = true;
            kz0 kz0Var = this.d;
            j = kz0Var.b;
            kz0Var.B();
            xs5Var.notifyAll();
        }
        if (j > 0) {
            xs5 xs5Var2 = this.f;
            TimeZone timeZone = ggf.a;
            xs5Var2.b.I(j);
        }
        this.f.a();
    }

    @Override // defpackage.ikc
    public final long q0(kz0 kz0Var, long j) throws Throwable {
        boolean z;
        Throwable streamResetException;
        long j2;
        long jQ0;
        kz0Var.getClass();
        long j3 = 0;
        if (j < 0) {
            ywb.g(ho2.D(j, "byteCount < 0: "));
            return 0L;
        }
        while (true) {
            xs5 xs5Var = this.f;
            synchronized (xs5Var) {
                xs5Var.b.getClass();
                us5 us5Var = xs5Var.i;
                z = true;
                boolean z2 = us5Var.c || us5Var.a;
                if (z2) {
                    xs5Var.j.i();
                }
                try {
                    if (xs5Var.g() == null || this.b) {
                        streamResetException = null;
                    } else {
                        streamResetException = xs5Var.m;
                        if (streamResetException == null) {
                            b14 b14VarG = xs5Var.g();
                            b14VarG.getClass();
                            streamResetException = new StreamResetException(b14VarG);
                        }
                    }
                    if (this.e) {
                        throw new IOException("stream closed");
                    }
                    kz0 kz0Var2 = this.d;
                    long j4 = kz0Var2.b;
                    if (j4 > j3) {
                        jQ0 = kz0Var2.q0(kz0Var, Math.min(j, j4));
                        dud.c(xs5Var.c, jQ0, 0L, 2);
                        long jB = xs5Var.c.b();
                        if (streamResetException == null) {
                            j2 = j3;
                            if (jB >= xs5Var.b.q.a() / 2) {
                                xs5Var.b.Q(xs5Var.a, jB);
                                dud.c(xs5Var.c, 0L, jB, 1);
                            }
                        } else {
                            j2 = j3;
                        }
                        z = false;
                    } else {
                        j2 = j3;
                        if (this.b || streamResetException != null) {
                            z = false;
                        } else {
                            try {
                                xs5Var.wait();
                            } catch (InterruptedException unused) {
                                Thread.currentThread().interrupt();
                                throw new InterruptedIOException();
                            }
                        }
                        jQ0 = -1;
                    }
                } finally {
                    if (z2) {
                        xs5Var.j.l();
                    }
                }
            }
            this.f.b.p.getClass();
            if (!z) {
                if (jQ0 != -1) {
                    return jQ0;
                }
                if (streamResetException == null) {
                    return -1L;
                }
                throw streamResetException;
            }
            j3 = j2;
        }
    }
}
