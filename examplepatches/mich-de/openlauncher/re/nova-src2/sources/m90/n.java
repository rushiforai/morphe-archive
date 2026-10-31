package m90;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public abstract class n implements h0 {

    /* renamed from: a, reason: collision with root package name */
    public final h0 f76149a;

    public n(h0 delegate) {
        Intrinsics.g(delegate, "delegate");
        this.f76149a = delegate;
    }

    @Override // m90.h0
    public void Z(g source, long j11) {
        Intrinsics.g(source, "source");
        this.f76149a.Z(source, j11);
    }

    @Override // m90.h0, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        this.f76149a.close();
    }

    @Override // m90.h0, java.io.Flushable
    public void flush() {
        this.f76149a.flush();
    }

    @Override // m90.h0
    public final l0 timeout() {
        return this.f76149a.timeout();
    }

    public final String toString() {
        return getClass().getSimpleName() + '(' + this.f76149a + ')';
    }
}
