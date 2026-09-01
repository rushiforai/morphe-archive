package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qp8 extends fdb {
    public final fdb c;
    public final yua d;
    public IOException e;

    public qp8(fdb fdbVar) {
        this.c = fdbVar;
        this.d = new yua(new tr0(this, fdbVar.v0()));
    }

    @Override // defpackage.fdb, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.c.close();
    }

    @Override // defpackage.fdb
    public final long f() {
        return this.c.f();
    }

    @Override // defpackage.fdb
    public final fn7 m() {
        return this.c.m();
    }

    @Override // defpackage.fdb
    public final zz0 v0() {
        return this.d;
    }
}
