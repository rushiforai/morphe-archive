package defpackage;

import java.util.concurrent.Callable;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class ff8 extends nqb {
    public final ScheduledExecutorService a;
    public volatile boolean b;

    public ff8(ThreadFactory threadFactory) {
        boolean z = rqb.a;
        ScheduledExecutorService scheduledExecutorServiceNewScheduledThreadPool = Executors.newScheduledThreadPool(1, threadFactory);
        if (rqb.a && (scheduledExecutorServiceNewScheduledThreadPool instanceof ScheduledThreadPoolExecutor)) {
            rqb.d.put((ScheduledThreadPoolExecutor) scheduledExecutorServiceNewScheduledThreadPool, scheduledExecutorServiceNewScheduledThreadPool);
        }
        this.a = scheduledExecutorServiceNewScheduledThreadPool;
    }

    @Override // defpackage.nqb
    public final sh3 a(Runnable runnable, long j, TimeUnit timeUnit) {
        return this.b ? ay3.INSTANCE : c(runnable, j, timeUnit, null);
    }

    @Override // defpackage.nqb
    public final void b(mq4 mq4Var) {
        a(mq4Var, 0L, null);
    }

    public final lqb c(Runnable runnable, long j, TimeUnit timeUnit, g22 g22Var) {
        lqb lqbVar = new lqb(runnable, g22Var);
        if (g22Var != null && !g22Var.a(lqbVar)) {
            return lqbVar;
        }
        ScheduledExecutorService scheduledExecutorService = this.a;
        try {
            lqbVar.a(j <= 0 ? scheduledExecutorService.submit((Callable) lqbVar) : scheduledExecutorService.schedule((Callable) lqbVar, j, timeUnit));
            return lqbVar;
        } catch (RejectedExecutionException e) {
            if (g22Var != null) {
                g22Var.g(lqbVar);
            }
            ok7.H(e);
            return lqbVar;
        }
    }

    @Override // defpackage.sh3
    public final void dispose() {
        if (this.b) {
            return;
        }
        this.b = true;
        this.a.shutdownNow();
    }
}
