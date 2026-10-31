package ai;

import java.util.concurrent.Callable;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.Semaphore;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class k1 extends v1 {

    /* renamed from: k, reason: collision with root package name */
    public static final AtomicLong f13068k = new AtomicLong(Long.MIN_VALUE);

    /* renamed from: c, reason: collision with root package name */
    public j1 f13069c;

    /* renamed from: d, reason: collision with root package name */
    public j1 f13070d;

    /* renamed from: e, reason: collision with root package name */
    public final PriorityBlockingQueue f13071e;

    /* renamed from: f, reason: collision with root package name */
    public final LinkedBlockingQueue f13072f;

    /* renamed from: g, reason: collision with root package name */
    public final h1 f13073g;

    /* renamed from: h, reason: collision with root package name */
    public final h1 f13074h;

    /* renamed from: i, reason: collision with root package name */
    public final Object f13075i;

    /* renamed from: j, reason: collision with root package name */
    public final Semaphore f13076j;

    public k1(m1 m1Var) {
        super(m1Var);
        this.f13075i = new Object();
        this.f13076j = new Semaphore(2);
        this.f13071e = new PriorityBlockingQueue();
        this.f13072f = new LinkedBlockingQueue();
        this.f13073g = new h1(this, "Thread death: Uncaught exception on worker thread");
        this.f13074h = new h1(this, "Thread death: Uncaught exception on network thread");
    }

    @Override // ai.u1
    public final void D() {
        if (Thread.currentThread() != this.f13069c) {
            throw new IllegalStateException("Call expected from worker thread");
        }
    }

    @Override // ai.v1
    public final boolean E() {
        return false;
    }

    public final void H() {
        if (Thread.currentThread() != this.f13070d) {
            throw new IllegalStateException("Call expected from network thread");
        }
    }

    public final void I() {
        if (Thread.currentThread() == this.f13069c) {
            throw new IllegalStateException("Call not expected from worker thread");
        }
    }

    public final boolean J() {
        return Thread.currentThread() == this.f13069c;
    }

    public final i1 K(Callable callable) {
        F();
        i1 i1Var = new i1(this, callable, false);
        if (Thread.currentThread() != this.f13069c) {
            Q(i1Var);
            return i1Var;
        }
        if (!this.f13071e.isEmpty()) {
            o0 o0Var = ((m1) this.f13368a).f13138f;
            m1.l(o0Var);
            o0Var.f13193i.a("Callable skipped the worker queue.");
        }
        i1Var.run();
        return i1Var;
    }

    public final i1 L(Callable callable) {
        F();
        i1 i1Var = new i1(this, callable, true);
        if (Thread.currentThread() == this.f13069c) {
            i1Var.run();
            return i1Var;
        }
        Q(i1Var);
        return i1Var;
    }

    public final void M(Runnable runnable) {
        F();
        sg.w.h(runnable);
        Q(new i1(this, runnable, false, "Task exception on worker thread"));
    }

    public final Object N(AtomicReference atomicReference, long j11, String str, Runnable runnable) {
        synchronized (atomicReference) {
            k1 k1Var = ((m1) this.f13368a).f13139g;
            m1.l(k1Var);
            k1Var.M(runnable);
            try {
                atomicReference.wait(j11);
            } catch (InterruptedException unused) {
                o0 o0Var = ((m1) this.f13368a).f13138f;
                m1.l(o0Var);
                m0 m0Var = o0Var.f13193i;
                StringBuilder sb2 = new StringBuilder(str.length() + 24);
                sb2.append("Interrupted waiting for ");
                sb2.append(str);
                m0Var.a(sb2.toString());
                return null;
            }
        }
        Object obj = atomicReference.get();
        if (obj == null) {
            o0 o0Var2 = ((m1) this.f13368a).f13138f;
            m1.l(o0Var2);
            o0Var2.f13193i.a("Timed out waiting for ".concat(str));
        }
        return obj;
    }

    public final void O(Runnable runnable) {
        F();
        Q(new i1(this, runnable, true, "Task exception on worker thread"));
    }

    public final void P(Runnable runnable) {
        F();
        i1 i1Var = new i1(this, runnable, false, "Task exception on network thread");
        synchronized (this.f13075i) {
            try {
                LinkedBlockingQueue linkedBlockingQueue = this.f13072f;
                linkedBlockingQueue.add(i1Var);
                j1 j1Var = this.f13070d;
                if (j1Var == null) {
                    j1 j1Var2 = new j1(this, "Measurement Network", linkedBlockingQueue);
                    this.f13070d = j1Var2;
                    j1Var2.setUncaughtExceptionHandler(this.f13074h);
                    this.f13070d.start();
                } else {
                    Object obj = j1Var.f13024a;
                    synchronized (obj) {
                        obj.notifyAll();
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void Q(i1 i1Var) {
        synchronized (this.f13075i) {
            try {
                PriorityBlockingQueue priorityBlockingQueue = this.f13071e;
                priorityBlockingQueue.add(i1Var);
                j1 j1Var = this.f13069c;
                if (j1Var == null) {
                    j1 j1Var2 = new j1(this, "Measurement Worker", priorityBlockingQueue);
                    this.f13069c = j1Var2;
                    j1Var2.setUncaughtExceptionHandler(this.f13073g);
                    this.f13069c.start();
                } else {
                    Object obj = j1Var.f13024a;
                    synchronized (obj) {
                        obj.notifyAll();
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
