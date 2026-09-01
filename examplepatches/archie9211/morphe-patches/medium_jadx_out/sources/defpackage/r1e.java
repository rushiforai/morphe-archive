package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r1e extends fdb implements ikc {
    public final fn7 c;
    public final long d;

    public r1e(fn7 fn7Var, long j) {
        this.c = fn7Var;
        this.d = j;
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return fmd.d;
    }

    @Override // defpackage.fdb
    public final long f() {
        return this.d;
    }

    @Override // defpackage.fdb
    public final fn7 m() {
        return this.c;
    }

    @Override // defpackage.ikc
    public final long q0(kz0 kz0Var, long j) {
        kz0Var.getClass();
        throw new IllegalStateException("Unreadable ResponseBody! These Response objects have bodies that are stripped:\n * Response.cacheResponse\n * Response.networkResponse\n * Response.priorResponse\n * EventSourceListener\n * WebSocketListener\n(It is safe to call contentType() and contentLength() on these response bodies.)");
    }

    @Override // defpackage.fdb
    public final zz0 v0() {
        return new yua(this);
    }

    @Override // defpackage.fdb, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
    }
}
