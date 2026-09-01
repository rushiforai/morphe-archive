package defpackage;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fs5 extends cs5 {
    public long e;
    public final /* synthetic */ hs5 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fs5(hs5 hs5Var, qt5 qt5Var, long j) {
        super(hs5Var, qt5Var);
        qt5Var.getClass();
        this.f = hs5Var;
        this.e = j;
        if (j == 0) {
            f(yi5.b);
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        boolean zG;
        if (this.c) {
            return;
        }
        if (this.e != 0) {
            TimeZone timeZone = ggf.a;
            TimeUnit.MILLISECONDS.getClass();
            try {
                zG = ggf.g(this, 100);
            } catch (IOException unused) {
                zG = false;
            }
            if (!zG) {
                this.f.b.e();
                f(hs5.f);
            }
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
        long j2 = this.e;
        if (j2 == 0) {
            return -1L;
        }
        long jQ0 = super.q0(kz0Var, Math.min(j2, j));
        if (jQ0 == -1) {
            this.f.b.e();
            ProtocolException protocolException = new ProtocolException("unexpected end of stream");
            f(hs5.f);
            throw protocolException;
        }
        long j3 = this.e - jQ0;
        this.e = j3;
        if (j3 == 0) {
            f(yi5.b);
        }
        return jQ0;
    }
}
