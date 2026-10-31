package m90;

import b.u4;
import java.io.InterruptedIOException;
import java.util.concurrent.TimeUnit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public class l0 {

    /* renamed from: d, reason: collision with root package name */
    public static final k0 f76140d = new k0();

    /* renamed from: a, reason: collision with root package name */
    public boolean f76141a;

    /* renamed from: b, reason: collision with root package name */
    public long f76142b;

    /* renamed from: c, reason: collision with root package name */
    public long f76143c;

    public l0 a() {
        this.f76141a = false;
        return this;
    }

    public l0 b() {
        this.f76143c = 0L;
        return this;
    }

    public long c() {
        if (this.f76141a) {
            return this.f76142b;
        }
        throw new IllegalStateException("No deadline");
    }

    public l0 d(long j11) {
        this.f76141a = true;
        this.f76142b = j11;
        return this;
    }

    public boolean e() {
        return this.f76141a;
    }

    public void f() throws InterruptedIOException {
        if (Thread.currentThread().isInterrupted()) {
            throw new InterruptedIOException("interrupted");
        }
        if (this.f76141a && this.f76142b - System.nanoTime() <= 0) {
            throw new InterruptedIOException("deadline reached");
        }
    }

    public l0 g(long j11, TimeUnit unit) {
        Intrinsics.g(unit, "unit");
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "timeout < 0: ").toString());
        }
        this.f76143c = unit.toNanos(j11);
        return this;
    }
}
