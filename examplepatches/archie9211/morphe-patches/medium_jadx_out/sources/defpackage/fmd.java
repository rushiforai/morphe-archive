package defpackage;

import java.io.InterruptedIOException;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class fmd {
    public static final emd d = new emd();
    public boolean a;
    public long b;
    public long c;

    public fmd a() {
        this.a = false;
        return this;
    }

    public fmd b() {
        this.c = 0L;
        return this;
    }

    public long c() {
        if (this.a) {
            return this.b;
        }
        ygf.f("No deadline");
        return 0L;
    }

    public fmd d(long j) {
        this.a = true;
        this.b = j;
        return this;
    }

    public boolean e() {
        return this.a;
    }

    public void f() throws InterruptedIOException {
        if (Thread.currentThread().isInterrupted()) {
            throw new InterruptedIOException("interrupted");
        }
        if (this.a && this.b - System.nanoTime() <= 0) {
            throw new InterruptedIOException("deadline reached");
        }
    }

    public fmd g(long j, TimeUnit timeUnit) {
        timeUnit.getClass();
        if (j >= 0) {
            this.c = timeUnit.toNanos(j);
            return this;
        }
        ywb.g(ho2.D(j, "timeout < 0: "));
        return null;
    }

    public long h() {
        return this.c;
    }
}
