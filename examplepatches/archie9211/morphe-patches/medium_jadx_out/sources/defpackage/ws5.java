package defpackage;

import com.squareup.wire.internal.MathMethodsKt;
import java.net.SocketTimeoutException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ws5 extends q90 {
    public final /* synthetic */ xs5 n;

    public ws5(xs5 xs5Var) {
        this.n = xs5Var;
    }

    @Override // defpackage.q90
    public final void k() {
        this.n.f(b14.CANCEL);
        qs5 qs5Var = this.n.b;
        synchronized (qs5Var) {
            long j = qs5Var.n;
            long j2 = qs5Var.m;
            if (j < j2) {
                return;
            }
            qs5Var.m = j2 + 1;
            qs5Var.o = System.nanoTime() + MathMethodsKt.NANOS_PER_SECOND;
            bgd.c(qs5Var.h, ka1.v(new StringBuilder(), qs5Var.c, " ping"), 0L, new em4(7, qs5Var), 6);
        }
    }

    public final void l() {
        if (j()) {
            throw new SocketTimeoutException("timeout");
        }
    }
}
