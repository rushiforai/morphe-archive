package m90;

import java.io.InterruptedIOException;
import java.util.concurrent.TimeUnit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class p extends l0 {

    /* renamed from: e, reason: collision with root package name */
    public l0 f76150e;

    public p(l0 delegate) {
        Intrinsics.g(delegate, "delegate");
        this.f76150e = delegate;
    }

    @Override // m90.l0
    public final l0 a() {
        return this.f76150e.a();
    }

    @Override // m90.l0
    public final l0 b() {
        return this.f76150e.b();
    }

    @Override // m90.l0
    public final long c() {
        return this.f76150e.c();
    }

    @Override // m90.l0
    public final l0 d(long j11) {
        return this.f76150e.d(j11);
    }

    @Override // m90.l0
    public final boolean e() {
        return this.f76150e.e();
    }

    @Override // m90.l0
    public final void f() throws InterruptedIOException {
        this.f76150e.f();
    }

    @Override // m90.l0
    public final l0 g(long j11, TimeUnit timeUnit) {
        TimeUnit unit = TimeUnit.MILLISECONDS;
        Intrinsics.g(unit, "unit");
        return this.f76150e.g(j11, unit);
    }
}
