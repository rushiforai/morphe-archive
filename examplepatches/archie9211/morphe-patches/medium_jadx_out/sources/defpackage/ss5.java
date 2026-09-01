package defpackage;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ss5 implements ikc {
    public final yua a;
    public int b;
    public int c;
    public int d;
    public int e;
    public int f;

    public ss5(yua yuaVar) {
        this.a = yuaVar;
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return this.a.a.b();
    }

    @Override // defpackage.ikc
    public final long q0(kz0 kz0Var, long j) throws IOException {
        int i;
        int iP;
        kz0Var.getClass();
        do {
            int i2 = this.e;
            yua yuaVar = this.a;
            if (i2 == 0) {
                yuaVar.skip(this.f);
                this.f = 0;
                if ((this.c & 4) == 0) {
                    i = this.d;
                    int iO = egf.o(yuaVar);
                    this.e = iO;
                    this.b = iO;
                    int i3 = yuaVar.readByte() & 255;
                    this.c = yuaVar.readByte() & 255;
                    Logger logger = ts5.d;
                    if (logger.isLoggable(Level.FINE)) {
                        h21 h21Var = is5.a;
                        logger.fine(is5.b(true, this.d, this.b, i3, this.c));
                    }
                    iP = yuaVar.p() & Integer.MAX_VALUE;
                    this.d = iP;
                    if (i3 != 9) {
                        throw new IOException(i3 + " != TYPE_CONTINUATION");
                    }
                }
            } else {
                long jQ0 = yuaVar.q0(kz0Var, Math.min(j, i2));
                if (jQ0 != -1) {
                    this.e -= (int) jQ0;
                    return jQ0;
                }
            }
            return -1L;
        } while (iP == i);
        ik4.g("TYPE_CONTINUATION streamId changed");
        return 0L;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
    }
}
