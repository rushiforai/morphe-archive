package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gs5 extends cs5 {
    public boolean e;

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        if (this.c) {
            return;
        }
        if (!this.e) {
            f(hs5.f);
        }
        this.c = true;
    }

    @Override // defpackage.cs5, defpackage.ikc
    public final long q0(kz0 kz0Var, long j) throws IOException {
        kz0Var.getClass();
        if (j < 0) {
            ywb.g(ho2.D(j, "byteCount < 0: "));
            return 0L;
        }
        if (this.c) {
            ygf.f("closed");
            return 0L;
        }
        if (this.e) {
            return -1L;
        }
        long jQ0 = super.q0(kz0Var, j);
        if (jQ0 != -1) {
            return jQ0;
        }
        this.e = true;
        f(yi5.b);
        return -1L;
    }
}
