package cl;

import com.google.android.gms.internal.measurement.k2;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.LockSupport;

/* loaded from: classes.dex */
public abstract class c1 extends AtomicReference implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public static final b1 f19989a = new b1();

    /* renamed from: b, reason: collision with root package name */
    public static final b1 f19990b = new b1();

    public abstract void a(Throwable th2);

    public abstract void b(Object obj);

    public final void c() {
        b1 b1Var = f19990b;
        b1 b1Var2 = f19989a;
        Runnable runnable = (Runnable) get();
        if (runnable instanceof Thread) {
            a1 a1Var = new a1(this);
            a1.a(a1Var, Thread.currentThread());
            if (compareAndSet(runnable, a1Var)) {
                try {
                    ((Thread) runnable).interrupt();
                } finally {
                    if (((Runnable) getAndSet(b1Var2)) == b1Var) {
                        LockSupport.unpark((Thread) runnable);
                    }
                }
            }
        }
    }

    public abstract boolean d();

    public abstract Object e();

    public abstract String f();

    public final void g(Thread thread) {
        Runnable runnable = (Runnable) get();
        a1 a1Var = null;
        boolean z11 = false;
        int i5 = 0;
        while (true) {
            boolean z12 = runnable instanceof a1;
            b1 b1Var = f19990b;
            if (!z12 && runnable != b1Var) {
                break;
            }
            if (z12) {
                a1Var = (a1) runnable;
            }
            i5++;
            if (i5 <= 1000) {
                Thread.yield();
            } else if (runnable == b1Var || compareAndSet(runnable, b1Var)) {
                z11 = Thread.interrupted() || z11;
                LockSupport.park(a1Var);
            }
            runnable = (Runnable) get();
        }
        if (z11) {
            thread.interrupt();
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        Thread threadCurrentThread = Thread.currentThread();
        Object objE = null;
        if (compareAndSet(null, threadCurrentThread)) {
            boolean zD = d();
            b1 b1Var = f19989a;
            if (!zD) {
                try {
                    objE = e();
                } catch (Throwable th2) {
                    try {
                        com.google.android.gms.internal.consent_sdk.k0.C(th2);
                        if (!compareAndSet(threadCurrentThread, b1Var)) {
                            g(threadCurrentThread);
                        }
                        if (zD) {
                            return;
                        }
                        a(th2);
                        return;
                    } finally {
                        if (!compareAndSet(threadCurrentThread, b1Var)) {
                            g(threadCurrentThread);
                        }
                        if (!zD) {
                            b(null);
                        }
                    }
                }
            }
        }
    }

    @Override // java.util.concurrent.atomic.AtomicReference
    public final String toString() {
        String str;
        Runnable runnable = (Runnable) get();
        if (runnable == f19989a) {
            str = "running=[DONE]";
        } else if (runnable instanceof a1) {
            str = "running=[INTERRUPTED]";
        } else if (runnable instanceof Thread) {
            str = "running=[RUNNING ON " + ((Thread) runnable).getName() + "]";
        } else {
            str = "running=[NOT STARTED YET]";
        }
        StringBuilder sbK = k2.k(str, ", ");
        sbK.append(f());
        return sbK.toString();
    }
}
