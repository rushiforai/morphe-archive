package m90;

import java.io.Closeable;
import java.io.Flushable;

/* loaded from: classes.dex */
public interface h0 extends Closeable, Flushable {
    void Z(g gVar, long j11);

    @Override // java.io.Closeable, java.lang.AutoCloseable
    void close();

    void flush();

    l0 timeout();
}
