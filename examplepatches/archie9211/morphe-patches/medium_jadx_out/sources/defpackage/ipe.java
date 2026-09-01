package defpackage;

import android.os.Looper;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicLong;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ipe {
    public static final ExecutorService a;

    static {
        i23 i23Var = new i23(new AtomicLong(1L));
        ThreadPoolExecutor.DiscardPolicy discardPolicy = new ThreadPoolExecutor.DiscardPolicy();
        ExecutorService executorServiceUnconfigurableExecutorService = Executors.unconfigurableExecutorService(new ThreadPoolExecutor(1, 1, 0L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue(), i23Var, discardPolicy));
        Runtime.getRuntime().addShutdownHook(new Thread(new x44(1, executorServiceUnconfigurableExecutorService), "Crashlytics Shutdown Hook for awaitEvenIfOnMainThread task continuation executor"));
        a = executorServiceUnconfigurableExecutorService;
    }

    public static void a(jrg jrgVar) throws InterruptedException, TimeoutException {
        CountDownLatch countDownLatch = new CountDownLatch(1);
        jrgVar.f(a, new o19(12, countDownLatch));
        Looper mainLooper = Looper.getMainLooper();
        Looper looperMyLooper = Looper.myLooper();
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        if (mainLooper == looperMyLooper) {
            countDownLatch.await(3000L, timeUnit);
        } else {
            countDownLatch.await(4000L, timeUnit);
        }
        if (jrgVar.k()) {
            jrgVar.i();
        } else {
            if (jrgVar.d) {
                throw new CancellationException("Task is already canceled");
            }
            if (!jrgVar.j()) {
                throw new TimeoutException();
            }
            throw new IllegalStateException(jrgVar.h());
        }
    }
}
