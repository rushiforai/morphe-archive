package defpackage;

import java.io.IOException;
import java.io.OutputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class uw8 implements bfc {
    public final OutputStream a;
    public final fmd b;

    public uw8(OutputStream outputStream, fmd fmdVar) {
        this.a = outputStream;
        this.b = fmdVar;
    }

    @Override // defpackage.bfc
    public final fmd b() {
        return this.b;
    }

    @Override // defpackage.bfc
    public final void c0(kz0 kz0Var, long j) {
        kz0Var.getClass();
        dm2.A(kz0Var.b, 0L, j);
        while (j > 0) {
            this.b.f();
            iwb iwbVar = kz0Var.a;
            iwbVar.getClass();
            int iMin = (int) Math.min(j, iwbVar.c - iwbVar.b);
            this.a.write(iwbVar.a, iwbVar.b, iMin);
            int i = iwbVar.b + iMin;
            iwbVar.b = i;
            long j2 = iMin;
            j -= j2;
            kz0Var.b -= j2;
            if (i == iwbVar.c) {
                kz0Var.a = iwbVar.a();
                lwb.a(iwbVar);
            }
        }
    }

    @Override // defpackage.bfc, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.a.close();
    }

    @Override // defpackage.bfc, java.io.Flushable
    public final void flush() throws IOException {
        this.a.flush();
    }

    public final String toString() {
        return "sink(" + this.a + ')';
    }
}
