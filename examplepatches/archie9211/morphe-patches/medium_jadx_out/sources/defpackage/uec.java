package defpackage;

import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class uec extends oqb {
    public static final zmb b;
    public static final ScheduledExecutorService c;
    public final AtomicReference a;

    static {
        ScheduledExecutorService scheduledExecutorServiceNewScheduledThreadPool = Executors.newScheduledThreadPool(0);
        c = scheduledExecutorServiceNewScheduledThreadPool;
        scheduledExecutorServiceNewScheduledThreadPool.shutdown();
        b = new zmb(Math.max(1, Math.min(10, Integer.getInteger("rx2.single-priority", 5).intValue())), "RxSingleScheduler", true);
    }

    public uec() {
        AtomicReference atomicReference = new AtomicReference();
        this.a = atomicReference;
        boolean z = rqb.a;
        ScheduledExecutorService scheduledExecutorServiceNewScheduledThreadPool = Executors.newScheduledThreadPool(1, b);
        if (rqb.a && (scheduledExecutorServiceNewScheduledThreadPool instanceof ScheduledThreadPoolExecutor)) {
            rqb.d.put((ScheduledThreadPoolExecutor) scheduledExecutorServiceNewScheduledThreadPool, scheduledExecutorServiceNewScheduledThreadPool);
        }
        atomicReference.lazySet(scheduledExecutorServiceNewScheduledThreadPool);
    }

    @Override // defpackage.oqb
    public final nqb a() {
        return new tec((ScheduledExecutorService) this.a.get());
    }

    @Override // defpackage.oqb
    public final sh3 b(p0g p0gVar) {
        kqb kqbVar = new kqb(p0gVar);
        try {
            kqbVar.a(((ScheduledExecutorService) this.a.get()).submit(kqbVar));
            return kqbVar;
        } catch (RejectedExecutionException e) {
            ok7.H(e);
            return ay3.INSTANCE;
        }
    }
}
