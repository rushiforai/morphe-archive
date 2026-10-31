package com.google.android.gms.internal.play_billing;

import java.util.Locale;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import java.util.concurrent.locks.LockSupport;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public class t5 implements n1 {

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f33540d = Boolean.parseBoolean(System.getProperty("guava.concurrent.generate_cancellation_cause", "false"));

    /* renamed from: e, reason: collision with root package name */
    public static final Logger f33541e = Logger.getLogger(t5.class.getName());

    /* renamed from: f, reason: collision with root package name */
    public static final cl.k0 f33542f;

    /* renamed from: g, reason: collision with root package name */
    public static final Object f33543g;

    /* renamed from: a, reason: collision with root package name */
    public volatile Object f33544a;

    /* renamed from: b, reason: collision with root package name */
    public volatile p3 f33545b;

    /* renamed from: c, reason: collision with root package name */
    public volatile s5 f33546c;

    static {
        cl.k0 r5Var;
        try {
            r5Var = new t4(AtomicReferenceFieldUpdater.newUpdater(s5.class, Thread.class, "a"), AtomicReferenceFieldUpdater.newUpdater(s5.class, s5.class, "b"), AtomicReferenceFieldUpdater.newUpdater(t5.class, s5.class, "c"), AtomicReferenceFieldUpdater.newUpdater(t5.class, p3.class, "b"), AtomicReferenceFieldUpdater.newUpdater(t5.class, Object.class, "a"));
            th = null;
        } catch (Throwable th2) {
            th = th2;
            r5Var = new r5();
        }
        Throwable th3 = th;
        f33542f = r5Var;
        if (th3 != null) {
            f33541e.logp(Level.SEVERE, "com.android.billingclient.util.concurrent.AbstractResolvableFuture", "<clinit>", "SafeAtomicHelper is broken!", th3);
        }
        f33543g = new Object();
    }

    public static void d(t5 t5Var) {
        s5 s5Var;
        cl.k0 k0Var;
        p3 p3Var;
        p3 p3Var2;
        p3 p3Var3;
        do {
            s5Var = t5Var.f33546c;
            k0Var = f33542f;
        } while (!k0Var.b0(t5Var, s5Var, s5.f33524c));
        while (true) {
            p3Var = null;
            if (s5Var == null) {
                break;
            }
            Thread thread = s5Var.f33525a;
            if (thread != null) {
                s5Var.f33525a = null;
                LockSupport.unpark(thread);
            }
            s5Var = s5Var.f33526b;
        }
        do {
            p3Var2 = t5Var.f33545b;
        } while (!k0Var.Z(t5Var, p3Var2, p3.f33477d));
        while (true) {
            p3Var3 = p3Var;
            p3Var = p3Var2;
            if (p3Var == null) {
                break;
            }
            p3Var2 = p3Var.f33480c;
            p3Var.f33480c = p3Var3;
        }
        while (p3Var3 != null) {
            Runnable runnable = p3Var3.f33478a;
            p3 p3Var4 = p3Var3.f33480c;
            f(runnable, p3Var3.f33479b);
            p3Var3 = p3Var4;
        }
    }

    public static void f(Runnable runnable, Executor executor) {
        try {
            executor.execute(runnable);
        } catch (RuntimeException e3) {
            f33541e.logp(Level.SEVERE, "com.android.billingclient.util.concurrent.AbstractResolvableFuture", "executeListener", b.c0.m("RuntimeException while executing runnable ", String.valueOf(runnable), " with executor ", String.valueOf(executor)), (Throwable) e3);
        }
    }

    public static final Object h(Object obj) throws ExecutionException {
        if (obj instanceof c2) {
            Throwable th2 = ((c2) obj).f33367a;
            CancellationException cancellationException = new CancellationException("Task was cancelled.");
            cancellationException.initCause(th2);
            throw cancellationException;
        }
        if (obj instanceof d3) {
            throw new ExecutionException(((d3) obj).f33373a);
        }
        if (obj == f33543g) {
            return null;
        }
        return obj;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public String a() {
        if (this instanceof ScheduledFuture) {
            return h6.c1.o(((ScheduledFuture) this).getDelay(TimeUnit.MILLISECONDS), "remaining delay=[", " ms]");
        }
        return null;
    }

    @Override // com.google.android.gms.internal.play_billing.n1
    public final void c(Runnable runnable, Executor executor) {
        executor.getClass();
        p3 p3Var = this.f33545b;
        p3 p3Var2 = p3.f33477d;
        if (p3Var != p3Var2) {
            p3 p3Var3 = new p3(runnable, executor);
            do {
                p3Var3.f33480c = p3Var;
                if (f33542f.Z(this, p3Var, p3Var3)) {
                    return;
                } else {
                    p3Var = this.f33545b;
                }
            } while (p3Var != p3Var2);
        }
        f(runnable, executor);
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z11) {
        Object obj = this.f33544a;
        if (obj != null) {
            return false;
        }
        if (!f33542f.a0(this, obj, f33540d ? new c2(new CancellationException("Future.cancel() was called.")) : z11 ? c2.f33365b : c2.f33366c)) {
            return false;
        }
        d(this);
        return true;
    }

    public final void e(StringBuilder sb2) {
        Object obj;
        boolean z11 = false;
        while (true) {
            try {
                try {
                    obj = get();
                    break;
                } catch (InterruptedException unused) {
                    z11 = true;
                } catch (Throwable th2) {
                    if (z11) {
                        Thread.currentThread().interrupt();
                    }
                    throw th2;
                }
            } catch (CancellationException unused2) {
                sb2.append("CANCELLED");
                return;
            } catch (RuntimeException e3) {
                sb2.append("UNKNOWN, cause=[");
                sb2.append(e3.getClass());
                sb2.append(" thrown from get()]");
                return;
            } catch (ExecutionException e11) {
                sb2.append("FAILURE, cause=[");
                sb2.append(e11.getCause());
                sb2.append("]");
                return;
            }
        }
        if (z11) {
            Thread.currentThread().interrupt();
        }
        sb2.append("SUCCESS, result=[");
        sb2.append(obj == this ? "this future" : String.valueOf(obj));
        sb2.append("]");
    }

    public final void g(s5 s5Var) {
        s5Var.f33525a = null;
        while (true) {
            s5 s5Var2 = this.f33546c;
            if (s5Var2 != s5.f33524c) {
                s5 s5Var3 = null;
                while (s5Var2 != null) {
                    s5 s5Var4 = s5Var2.f33526b;
                    if (s5Var2.f33525a != null) {
                        s5Var3 = s5Var2;
                    } else if (s5Var3 != null) {
                        s5Var3.f33526b = s5Var4;
                        if (s5Var3.f33525a == null) {
                            break;
                        }
                    } else if (!f33542f.b0(this, s5Var2, s5Var4)) {
                        break;
                    }
                    s5Var2 = s5Var4;
                }
                return;
            }
            return;
        }
    }

    @Override // java.util.concurrent.Future
    public final Object get() throws InterruptedException {
        Object obj;
        if (Thread.interrupted()) {
            throw new InterruptedException();
        }
        Object obj2 = this.f33544a;
        if (obj2 != null) {
            return h(obj2);
        }
        s5 s5Var = this.f33546c;
        s5 s5Var2 = s5.f33524c;
        if (s5Var != s5Var2) {
            s5 s5Var3 = new s5();
            do {
                cl.k0 k0Var = f33542f;
                k0Var.W(s5Var3, s5Var);
                if (k0Var.b0(this, s5Var, s5Var3)) {
                    do {
                        LockSupport.park(this);
                        if (Thread.interrupted()) {
                            g(s5Var3);
                            throw new InterruptedException();
                        }
                        obj = this.f33544a;
                    } while (obj == null);
                    return h(obj);
                }
                s5Var = this.f33546c;
            } while (s5Var != s5Var2);
        }
        return h(this.f33544a);
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.f33544a instanceof c2;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return this.f33544a != null;
    }

    public final String toString() {
        String strConcat;
        StringBuilder sb2 = new StringBuilder();
        sb2.append(super.toString());
        sb2.append("[status=");
        if (this.f33544a instanceof c2) {
            sb2.append("CANCELLED");
        } else if (isDone()) {
            e(sb2);
        } else {
            try {
                strConcat = a();
            } catch (RuntimeException e3) {
                strConcat = "Exception thrown from implementation: ".concat(String.valueOf(e3.getClass()));
            }
            if (strConcat != null && !strConcat.isEmpty()) {
                b.c0.C(sb2, "PENDING, info=[", strConcat, "]");
            } else if (isDone()) {
                e(sb2);
            } else {
                sb2.append("PENDING");
            }
        }
        sb2.append("]");
        return sb2.toString();
    }

    @Override // java.util.concurrent.Future
    public final Object get(long j11, TimeUnit timeUnit) throws InterruptedException, TimeoutException {
        long nanos = timeUnit.toNanos(j11);
        if (!Thread.interrupted()) {
            Object obj = this.f33544a;
            if (obj != null) {
                return h(obj);
            }
            long jNanoTime = nanos > 0 ? System.nanoTime() + nanos : 0L;
            if (nanos >= 1000) {
                s5 s5Var = this.f33546c;
                s5 s5Var2 = s5.f33524c;
                if (s5Var != s5Var2) {
                    s5 s5Var3 = new s5();
                    do {
                        cl.k0 k0Var = f33542f;
                        k0Var.W(s5Var3, s5Var);
                        if (k0Var.b0(this, s5Var, s5Var3)) {
                            do {
                                LockSupport.parkNanos(this, nanos);
                                if (!Thread.interrupted()) {
                                    Object obj2 = this.f33544a;
                                    if (obj2 != null) {
                                        return h(obj2);
                                    }
                                    nanos = jNanoTime - System.nanoTime();
                                } else {
                                    g(s5Var3);
                                    throw new InterruptedException();
                                }
                            } while (nanos >= 1000);
                            g(s5Var3);
                        } else {
                            s5Var = this.f33546c;
                        }
                    } while (s5Var != s5Var2);
                }
                return h(this.f33544a);
            }
            while (nanos > 0) {
                Object obj3 = this.f33544a;
                if (obj3 != null) {
                    return h(obj3);
                }
                if (!Thread.interrupted()) {
                    nanos = jNanoTime - System.nanoTime();
                } else {
                    throw new InterruptedException();
                }
            }
            String string = toString();
            String string2 = timeUnit.toString();
            Locale locale = Locale.ROOT;
            String lowerCase = string2.toLowerCase(locale);
            String strConcat = "Waited " + j11 + " " + timeUnit.toString().toLowerCase(locale);
            if (nanos + 1000 < 0) {
                String strConcat2 = strConcat.concat(" (plus ");
                long j12 = -nanos;
                long jConvert = timeUnit.convert(j12, TimeUnit.NANOSECONDS);
                long nanos2 = j12 - timeUnit.toNanos(jConvert);
                boolean z11 = true;
                if (jConvert != 0 && nanos2 <= 1000) {
                    z11 = false;
                }
                if (jConvert > 0) {
                    String strConcat3 = strConcat2 + jConvert + " " + lowerCase;
                    if (z11) {
                        strConcat3 = strConcat3.concat(",");
                    }
                    strConcat2 = strConcat3.concat(" ");
                }
                if (z11) {
                    strConcat2 = strConcat2 + nanos2 + " nanoseconds ";
                }
                strConcat = strConcat2.concat("delay)");
            }
            if (isDone()) {
                throw new TimeoutException(strConcat.concat(" but future completed as timeout expired"));
            }
            throw new TimeoutException(b.u4.m(strConcat, " for ", string));
        }
        throw new InterruptedException();
    }
}
