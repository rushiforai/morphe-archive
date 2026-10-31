package m90;

import java.io.IOException;
import kotlin.Deprecated;
import kotlin.jvm.JvmName;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public abstract class o implements j0 {

    @NotNull
    private final j0 delegate;

    public o(j0 delegate) {
        Intrinsics.g(delegate, "delegate");
        this.delegate = delegate;
    }

    @Deprecated
    @JvmName
    @NotNull
    /* renamed from: -deprecated_delegate, reason: not valid java name */
    public final j0 m412deprecated_delegate() {
        return this.delegate;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.delegate.close();
    }

    @JvmName
    @NotNull
    public final j0 delegate() {
        return this.delegate;
    }

    @Override // m90.j0
    public long read(g sink, long j11) {
        Intrinsics.g(sink, "sink");
        return this.delegate.read(sink, j11);
    }

    @Override // m90.j0
    @NotNull
    public l0 timeout() {
        return this.delegate.timeout();
    }

    @NotNull
    public String toString() {
        return getClass().getSimpleName() + '(' + this.delegate + ')';
    }
}
