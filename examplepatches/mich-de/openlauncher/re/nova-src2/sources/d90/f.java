package d90;

import b.u4;
import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class f extends a {

    /* renamed from: d, reason: collision with root package name */
    public boolean f49090d;

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        if (this.f49075b) {
            return;
        }
        if (!this.f49090d) {
            a();
        }
        this.f49075b = true;
    }

    @Override // d90.a, m90.j0
    public final long read(m90.g sink, long j11) throws IOException {
        Intrinsics.g(sink, "sink");
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount < 0: ").toString());
        }
        if (this.f49075b) {
            throw new IllegalStateException("closed");
        }
        if (this.f49090d) {
            return -1L;
        }
        long j12 = super.read(sink, j11);
        if (j12 != -1) {
            return j12;
        }
        this.f49090d = true;
        a();
        return -1L;
    }
}
