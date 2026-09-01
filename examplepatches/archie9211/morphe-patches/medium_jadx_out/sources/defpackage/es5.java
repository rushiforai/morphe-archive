package defpackage;

import java.io.IOException;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class es5 extends cs5 {
    public long e;
    public boolean f;
    public final /* synthetic */ hs5 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public es5(hs5 hs5Var, qt5 qt5Var) {
        super(hs5Var, qt5Var);
        qt5Var.getClass();
        this.g = hs5Var;
        this.e = -1L;
        this.f = true;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        boolean zG;
        if (this.c) {
            return;
        }
        if (this.f) {
            TimeZone timeZone = ggf.a;
            TimeUnit.MILLISECONDS.getClass();
            try {
                zG = ggf.g(this, 100);
            } catch (IOException unused) {
                zG = false;
            }
            if (!zG) {
                this.g.b.e();
                f(hs5.f);
            }
        }
        this.c = true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:51:0x00ea, code lost:
    
        if (r16.f == false) goto L52;
     */
    @Override // defpackage.cs5, defpackage.ikc
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long q0(defpackage.kz0 r17, long r18) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 337
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.es5.q0(kz0, long):long");
    }
}
