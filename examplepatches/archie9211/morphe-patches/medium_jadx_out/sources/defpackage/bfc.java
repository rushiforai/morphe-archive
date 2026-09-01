package defpackage;

import java.io.Closeable;
import java.io.Flushable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public interface bfc extends Closeable, Flushable {
    fmd b();

    void c0(kz0 kz0Var, long j);

    @Override // java.io.Closeable, java.lang.AutoCloseable
    void close();

    void flush();
}
