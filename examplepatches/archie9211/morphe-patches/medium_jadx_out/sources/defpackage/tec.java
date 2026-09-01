package defpackage;

import java.util.concurrent.Callable;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tec extends nqb {
    public final ScheduledExecutorService a;
    public final g22 b = new g22(0);
    public volatile boolean c;

    public tec(ScheduledExecutorService scheduledExecutorService) {
        this.a = scheduledExecutorService;
    }

    @Override // defpackage.nqb
    public final sh3 a(Runnable runnable, long j, TimeUnit timeUnit) {
        if (this.c) {
            return ay3.INSTANCE;
        }
        lqb lqbVar = new lqb(runnable, this.b);
        this.b.a(lqbVar);
        ScheduledExecutorService scheduledExecutorService = this.a;
        try {
            lqbVar.a(j <= 0 ? scheduledExecutorService.submit((Callable) lqbVar) : scheduledExecutorService.schedule((Callable) lqbVar, j, timeUnit));
            return lqbVar;
        } catch (RejectedExecutionException e) {
            dispose();
            ok7.H(e);
            return ay3.INSTANCE;
        }
    }

    @Override // defpackage.sh3
    public final void dispose() {
        if (this.c) {
            return;
        }
        this.c = true;
        this.b.dispose();
    }
}
