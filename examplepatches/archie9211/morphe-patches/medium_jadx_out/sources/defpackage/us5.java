package defpackage;

import java.io.InterruptedIOException;
import java.util.TimeZone;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class us5 implements bfc {
    public final boolean a;
    public final kz0 b = new kz0();
    public boolean c;
    public final /* synthetic */ xs5 d;

    public us5(xs5 xs5Var, boolean z) {
        this.d = xs5Var;
        this.a = z;
    }

    @Override // defpackage.bfc
    public final fmd b() {
        return this.d.k;
    }

    @Override // defpackage.bfc
    public final void c0(kz0 kz0Var, long j) {
        kz0Var.getClass();
        TimeZone timeZone = ggf.a;
        kz0 kz0Var2 = this.b;
        kz0Var2.c0(kz0Var, j);
        while (kz0Var2.b >= 16384) {
            f(false);
        }
    }

    @Override // defpackage.bfc, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        xs5 xs5Var = this.d;
        TimeZone timeZone = ggf.a;
        synchronized (xs5Var) {
            if (this.c) {
                return;
            }
            boolean z = xs5Var.g() == null;
            xs5 xs5Var2 = this.d;
            if (!xs5Var2.i.a) {
                if (this.b.b > 0) {
                    while (this.b.b > 0) {
                        f(true);
                    }
                } else if (z) {
                    xs5Var2.b.L(xs5Var2.a, true, null, 0L);
                }
            }
            xs5 xs5Var3 = this.d;
            synchronized (xs5Var3) {
                this.c = true;
                xs5Var3.notifyAll();
            }
            this.d.b.flush();
            this.d.a();
        }
    }

    /* JADX WARN: Finally extract failed */
    public final void f(boolean z) {
        long jMin;
        boolean z2;
        xs5 xs5Var = this.d;
        synchronized (xs5Var) {
            xs5Var.k.i();
            while (xs5Var.d >= xs5Var.e && !this.a && !this.c && xs5Var.g() == null) {
                try {
                    try {
                        xs5Var.wait();
                    } catch (InterruptedException unused) {
                        Thread.currentThread().interrupt();
                        throw new InterruptedIOException();
                    }
                } catch (Throwable th) {
                    xs5Var.k.l();
                    throw th;
                }
            }
            xs5Var.k.l();
            xs5Var.b();
            jMin = Math.min(xs5Var.e - xs5Var.d, this.b.b);
            xs5Var.d += jMin;
            z2 = z && jMin == this.b.b;
        }
        this.d.k.i();
        try {
            xs5 xs5Var2 = this.d;
            xs5Var2.b.L(xs5Var2.a, z2, this.b, jMin);
        } finally {
            this.d.k.l();
        }
    }

    @Override // defpackage.bfc, java.io.Flushable
    public final void flush() {
        xs5 xs5Var = this.d;
        TimeZone timeZone = ggf.a;
        synchronized (xs5Var) {
            xs5Var.b();
        }
        while (this.b.b > 0) {
            f(false);
            this.d.b.flush();
        }
    }
}
