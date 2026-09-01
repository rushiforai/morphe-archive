package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class w05 implements ikc {
    public final ikc a;

    public w05(ikc ikcVar) {
        ikcVar.getClass();
        this.a = ikcVar;
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return this.a.b();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.a.close();
    }

    @Override // defpackage.ikc
    public long q0(kz0 kz0Var, long j) {
        kz0Var.getClass();
        return this.a.q0(kz0Var, j);
    }

    public final String toString() {
        return getClass().getSimpleName() + '(' + this.a + ')';
    }
}
