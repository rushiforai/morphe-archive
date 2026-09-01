package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b68 implements ikc {
    public final /* synthetic */ c68 a;

    public b68(c68 c68Var) {
        this.a = c68Var;
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return this.a.a.b();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        c68 c68Var = this.a;
        if (g76.L(c68Var.g, this)) {
            c68Var.g = null;
        }
    }

    @Override // defpackage.ikc
    public final long q0(kz0 kz0Var, long j) {
        kz0Var.getClass();
        if (j < 0) {
            ywb.g(ho2.D(j, "byteCount < 0: "));
            return 0L;
        }
        c68 c68Var = this.a;
        if (!g76.L(c68Var.g, this)) {
            ygf.f("closed");
            return 0L;
        }
        long jF = c68Var.f(j);
        if (jF == 0) {
            return -1L;
        }
        return c68Var.a.q0(kz0Var, jF);
    }
}
