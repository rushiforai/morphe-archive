package defpackage;

import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class y26 implements ikc {
    public final InputStream a;
    public final fmd b;

    public y26(InputStream inputStream, fmd fmdVar) {
        inputStream.getClass();
        this.a = inputStream;
        this.b = fmdVar;
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return this.b;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.a.close();
    }

    @Override // defpackage.ikc
    public final long q0(kz0 kz0Var, long j) throws IOException {
        kz0Var.getClass();
        if (j == 0) {
            return 0L;
        }
        if (j < 0) {
            ywb.g(ho2.D(j, "byteCount < 0: "));
            return 0L;
        }
        try {
            this.b.f();
            iwb iwbVarI0 = kz0Var.I0(1);
            int i = this.a.read(iwbVarI0.a, iwbVarI0.c, (int) Math.min(j, 8192 - iwbVarI0.c));
            if (i != -1) {
                iwbVarI0.c += i;
                long j2 = i;
                kz0Var.b += j2;
                return j2;
            }
            if (iwbVarI0.b != iwbVarI0.c) {
                return -1L;
            }
            kz0Var.a = iwbVarI0.a();
            lwb.a(iwbVarI0);
            return -1L;
        } catch (AssertionError e) {
            if (dgf.a(e)) {
                throw new IOException(e);
            }
            throw e;
        }
    }

    public final String toString() {
        return "source(" + this.a + ')';
    }
}
