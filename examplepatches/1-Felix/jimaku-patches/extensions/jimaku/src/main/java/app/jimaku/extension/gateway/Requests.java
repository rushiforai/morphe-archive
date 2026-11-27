package app.jimaku.extension.gateway;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * The background threads Jimaku's requests run on, to the gateway and to YouTube. A few of them,
 * so a request stuck where it can't be cancelled, as a DNS lookup is, holds up one thread and not
 * every read. They end after a minute without work, so nothing stays while no video is open.
 */
public final class Requests {
    public static final int THREADS = 4;
    private static final long IDLE_SECONDS = 60;

    private Requests() {
    }

    /** A new pool; {@code onFault} hears of an error a request let through, which ends only its thread. */
    public static ExecutorService pool(Thread.UncaughtExceptionHandler onFault) {
        AtomicInteger count = new AtomicInteger();
        ThreadPoolExecutor pool = new ThreadPoolExecutor(THREADS, THREADS, IDLE_SECONDS, TimeUnit.SECONDS, new LinkedBlockingQueue<>(),
                runnable -> {
                    Thread thread = new Thread(runnable, "Jimaku requests " + count.incrementAndGet());
                    thread.setDaemon(true);
                    thread.setUncaughtExceptionHandler(onFault);
                    return thread;
                });
        pool.allowCoreThreadTimeOut(true);
        return pool;
    }
}
