package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class v05 implements bfc {
    public final bfc a;

    public v05(bfc bfcVar) {
        bfcVar.getClass();
        this.a = bfcVar;
    }

    @Override // defpackage.bfc
    public final fmd b() {
        return this.a.b();
    }

    @Override // defpackage.bfc
    public void c0(kz0 kz0Var, long j) {
        kz0Var.getClass();
        this.a.c0(kz0Var, j);
    }

    @Override // defpackage.bfc, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        this.a.close();
    }

    @Override // defpackage.bfc, java.io.Flushable
    public void flush() {
        this.a.flush();
    }

    public final String toString() {
        return getClass().getSimpleName() + '(' + this.a + ')';
    }
}
