package m90;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class f implements h0 {
    @Override // m90.h0
    public final void Z(g source, long j11) {
        Intrinsics.g(source, "source");
        source.skip(j11);
    }

    @Override // m90.h0, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
    }

    @Override // m90.h0, java.io.Flushable
    public final void flush() {
    }

    @Override // m90.h0
    public final l0 timeout() {
        return l0.f76140d;
    }
}
