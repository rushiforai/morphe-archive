package defpackage;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a86 extends nqb implements Runnable {
    public final z76 b;
    public final b86 c;
    public final AtomicBoolean d = new AtomicBoolean();
    public final g22 a = new g22(0);

    public a86(z76 z76Var) {
        b86 b86Var;
        b86 b86Var2;
        this.b = z76Var;
        if (z76Var.c.b) {
            b86Var2 = c86.e;
        } else {
            while (true) {
                if (z76Var.b.isEmpty()) {
                    b86Var = new b86(z76Var.f);
                    z76Var.c.a(b86Var);
                    break;
                } else {
                    b86Var = (b86) z76Var.b.poll();
                    if (b86Var != null) {
                        break;
                    }
                }
            }
            b86Var2 = b86Var;
        }
        this.c = b86Var2;
    }

    @Override // defpackage.nqb
    public final sh3 a(Runnable runnable, long j, TimeUnit timeUnit) {
        return this.a.b ? ay3.INSTANCE : this.c.c(runnable, j, timeUnit, this.a);
    }

    @Override // defpackage.sh3
    public final void dispose() {
        if (this.d.compareAndSet(false, true)) {
            this.a.dispose();
            if (c86.f) {
                this.c.c(this, 0L, TimeUnit.NANOSECONDS, null);
                return;
            }
            z76 z76Var = this.b;
            z76Var.getClass();
            long jNanoTime = System.nanoTime() + z76Var.a;
            b86 b86Var = this.c;
            b86Var.c = jNanoTime;
            z76Var.b.offer(b86Var);
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        z76 z76Var = this.b;
        z76Var.getClass();
        long jNanoTime = System.nanoTime() + z76Var.a;
        b86 b86Var = this.c;
        b86Var.c = jNanoTime;
        z76Var.b.offer(b86Var);
    }
}
