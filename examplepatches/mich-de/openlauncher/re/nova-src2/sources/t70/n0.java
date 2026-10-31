package t70;

import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.LockSupport;
import kotlin.coroutines.CoroutineContext;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class n0 extends h1 implements Runnable {

    @Nullable
    private static volatile Thread _thread;
    private static volatile int debugStatus;

    /* renamed from: j, reason: collision with root package name */
    public static final n0 f88840j;

    /* renamed from: k, reason: collision with root package name */
    public static final long f88841k;

    static {
        Long l9;
        n0 n0Var = new n0();
        f88840j = n0Var;
        n0Var.j0(false);
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        try {
            l9 = Long.getLong("kotlinx.coroutines.DefaultExecutor.keepAlive", 1000L);
        } catch (SecurityException unused) {
            l9 = 1000L;
        }
        f88841k = timeUnit.toNanos(l9.longValue());
    }

    @Override // t70.h1, t70.r0
    public final a1 a(long j11, Runnable runnable, CoroutineContext coroutineContext) {
        long j12 = j11 > 0 ? j11 >= 9223372036854L ? Long.MAX_VALUE : 1000000 * j11 : 0L;
        if (j12 >= 4611686018427387903L) {
            return d2.f88784a;
        }
        long jNanoTime = System.nanoTime();
        e1 e1Var = new e1(runnable, j12 + jNanoTime);
        r0(jNanoTime, e1Var);
        return e1Var;
    }

    @Override // t70.i1
    public final Thread i0() {
        Thread thread;
        Thread thread2 = _thread;
        if (thread2 != null) {
            return thread2;
        }
        synchronized (this) {
            thread = _thread;
            if (thread == null) {
                thread = new Thread(this, "kotlinx.coroutines.DefaultExecutor");
                _thread = thread;
                thread.setContextClassLoader(f88840j.getClass().getClassLoader());
                thread.setDaemon(true);
                thread.start();
            }
        }
        return thread;
    }

    @Override // t70.i1
    public final void m0(long j11, f1 f1Var) {
        throw new RejectedExecutionException("DefaultExecutor was shut down. This error indicates that Dispatchers.shutdown() was invoked prior to completion of exiting coroutines, leaving coroutines in incomplete state. Please refer to Dispatchers.shutdown documentation for more details");
    }

    @Override // t70.h1
    public final void n0(Runnable runnable) {
        if (debugStatus == 4) {
            throw new RejectedExecutionException("DefaultExecutor was shut down. This error indicates that Dispatchers.shutdown() was invoked prior to completion of exiting coroutines, leaving coroutines in incomplete state. Please refer to Dispatchers.shutdown documentation for more details");
        }
        super.n0(runnable);
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean zQ0;
        k2.f88812a.set(this);
        try {
            synchronized (this) {
                int i5 = debugStatus;
                if (i5 == 2 || i5 == 3) {
                    if (zQ0) {
                        return;
                    } else {
                        return;
                    }
                }
                debugStatus = 1;
                notifyAll();
                long j11 = Long.MAX_VALUE;
                while (true) {
                    Thread.interrupted();
                    long jK0 = k0();
                    if (jK0 == Long.MAX_VALUE) {
                        long jNanoTime = System.nanoTime();
                        if (j11 == Long.MAX_VALUE) {
                            j11 = f88841k + jNanoTime;
                        }
                        long j12 = j11 - jNanoTime;
                        if (j12 <= 0) {
                            _thread = null;
                            s0();
                            if (q0()) {
                                return;
                            }
                            i0();
                            return;
                        }
                        if (jK0 > j12) {
                            jK0 = j12;
                        }
                    } else {
                        j11 = Long.MAX_VALUE;
                    }
                    if (jK0 > 0) {
                        int i11 = debugStatus;
                        if (i11 == 2 || i11 == 3) {
                            _thread = null;
                            s0();
                            if (q0()) {
                                return;
                            }
                            i0();
                            return;
                        }
                        LockSupport.parkNanos(this, jK0);
                    }
                }
            }
        } finally {
            _thread = null;
            s0();
            if (!q0()) {
                i0();
            }
        }
    }

    public final synchronized void s0() {
        int i5 = debugStatus;
        if (i5 == 2 || i5 == 3) {
            debugStatus = 3;
            h1.f88798g.set(this, null);
            h1.f88799h.set(this, null);
            notifyAll();
        }
    }

    @Override // t70.h1, t70.i1
    public final void shutdown() {
        debugStatus = 4;
        super.shutdown();
    }

    @Override // t70.c0
    public final String toString() {
        return "DefaultExecutor";
    }
}
