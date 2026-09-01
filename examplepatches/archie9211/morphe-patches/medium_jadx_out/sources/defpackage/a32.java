package defpackage;

import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a32 extends nqb {
    public final g22 a;
    public final g22 b;
    public final g22 c;
    public final c32 d;
    public volatile boolean e;

    public a32(c32 c32Var) {
        this.d = c32Var;
        g22 g22Var = new g22(1);
        this.a = g22Var;
        g22 g22Var2 = new g22(0);
        this.b = g22Var2;
        g22 g22Var3 = new g22(1);
        this.c = g22Var3;
        g22Var3.a(g22Var);
        g22Var3.a(g22Var2);
    }

    @Override // defpackage.nqb
    public final sh3 a(Runnable runnable, long j, TimeUnit timeUnit) {
        return this.e ? ay3.INSTANCE : this.d.c(runnable, j, timeUnit, this.b);
    }

    @Override // defpackage.nqb
    public final void b(mq4 mq4Var) {
        if (this.e) {
            return;
        }
        this.d.c(mq4Var, 0L, TimeUnit.MILLISECONDS, this.a);
    }

    @Override // defpackage.sh3
    public final void dispose() {
        if (this.e) {
            return;
        }
        this.e = true;
        this.c.dispose();
    }
}
