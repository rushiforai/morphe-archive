package defpackage;

import java.io.EOFException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cc2 implements bfc {
    public long a;

    @Override // defpackage.bfc
    public final fmd b() {
        return fmd.d;
    }

    @Override // defpackage.bfc
    public final void c0(kz0 kz0Var, long j) throws EOFException {
        kz0Var.getClass();
        kz0Var.skip(j);
        this.a += j;
    }

    @Override // defpackage.bfc, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
    }

    @Override // defpackage.bfc, java.io.Flushable
    public final void flush() {
    }
}
