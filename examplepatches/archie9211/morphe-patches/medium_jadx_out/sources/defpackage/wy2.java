package defpackage;

import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.LockSupport;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wy2 extends p34 implements Runnable {
    private static volatile Thread _thread;
    private static volatile int debugStatus;
    public static final wy2 k;
    public static final long l;

    static {
        Long l2;
        wy2 wy2Var = new wy2();
        k = wy2Var;
        wy2Var.K0(false);
        try {
            l2 = Long.getLong("kotlinx.coroutines.DefaultExecutor.keepAlive", 1000L);
        } catch (SecurityException unused) {
            l2 = 1000L;
        }
        l = TimeUnit.MILLISECONDS.toNanos(l2.longValue());
    }

    @Override // defpackage.p34
    public final void N0(Runnable runnable) {
        if (debugStatus == 4) {
            throw new RejectedExecutionException("DefaultExecutor was shut down. This error indicates that Dispatchers.shutdown() was invoked prior to completion of exiting coroutines, leaving coroutines in incomplete state. Please refer to Dispatchers.shutdown documentation for more details");
        }
        super.N0(runnable);
    }

    @Override // defpackage.p34, defpackage.x33
    public final yh3 Q(long j, Runnable runnable, ib2 ib2Var) {
        long j2 = j > 0 ? j >= 9223372036854L ? Long.MAX_VALUE : 1000000 * j : 0L;
        if (j2 >= 4611686018427387903L) {
            return lh8.a;
        }
        long jNanoTime = System.nanoTime();
        m34 m34Var = new m34(runnable, j2 + jNanoTime);
        T0(jNanoTime, m34Var);
        return m34Var;
    }

    @Override // defpackage.p34
    public final Thread Q0() {
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
                thread.setContextClassLoader(k.getClass().getClassLoader());
                thread.setDaemon(true);
                thread.start();
            }
        }
        return thread;
    }

    @Override // defpackage.p34
    public final void S0(long j, n34 n34Var) {
        throw new RejectedExecutionException("DefaultExecutor was shut down. This error indicates that Dispatchers.shutdown() was invoked prior to completion of exiting coroutines, leaving coroutines in incomplete state. Please refer to Dispatchers.shutdown documentation for more details");
    }

    public final synchronized void U0() {
        int i = debugStatus;
        if (i == 2 || i == 3) {
            debugStatus = 3;
            Unsafe unsafe = m80.a;
            unsafe.putObjectVolatile(this, p34.i, (Object) null);
            unsafe.putObjectVolatile(this, p34.g, (Object) null);
            notifyAll();
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean zR0;
        ald.a.set(this);
        try {
            synchronized (this) {
                int i = debugStatus;
                if (i == 2 || i == 3) {
                    if (zR0) {
                        return;
                    } else {
                        return;
                    }
                }
                debugStatus = 1;
                notifyAll();
                long j = Long.MAX_VALUE;
                while (true) {
                    Thread.interrupted();
                    long jL0 = L0();
                    if (jL0 == Long.MAX_VALUE) {
                        long jNanoTime = System.nanoTime();
                        if (j == Long.MAX_VALUE) {
                            j = l + jNanoTime;
                        }
                        long j2 = j - jNanoTime;
                        if (j2 <= 0) {
                            _thread = null;
                            U0();
                            if (R0()) {
                                return;
                            }
                            Q0();
                            return;
                        }
                        if (jL0 > j2) {
                            jL0 = j2;
                        }
                    } else {
                        j = Long.MAX_VALUE;
                    }
                    if (jL0 > 0) {
                        int i2 = debugStatus;
                        if (i2 == 2 || i2 == 3) {
                            _thread = null;
                            U0();
                            if (R0()) {
                                return;
                            }
                            Q0();
                            return;
                        }
                        LockSupport.parkNanos(this, jL0);
                    }
                }
            }
        } finally {
            _thread = null;
            U0();
            if (!R0()) {
                Q0();
            }
        }
    }

    @Override // defpackage.p34, defpackage.k34
    public final void shutdown() {
        debugStatus = 4;
        super.shutdown();
    }

    @Override // defpackage.kb2
    public final String toString() {
        return "DefaultExecutor";
    }
}
