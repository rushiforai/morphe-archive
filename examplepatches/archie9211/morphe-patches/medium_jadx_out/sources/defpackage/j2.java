package defpackage;

import java.util.Locale;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import java.util.concurrent.locks.LockSupport;
import java.util.logging.Level;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class j2 implements d37 {
    public static final boolean d = Boolean.parseBoolean(System.getProperty("guava.concurrent.generate_cancellation_cause", "false"));
    public static final Logger e = Logger.getLogger(j2.class.getName());
    public static final o7f f;
    public static final Object g;
    public volatile Object a;
    public volatile f2 b;
    public volatile i2 c;

    static {
        o7f h2Var;
        try {
            h2Var = new g2(AtomicReferenceFieldUpdater.newUpdater(i2.class, Thread.class, "a"), AtomicReferenceFieldUpdater.newUpdater(i2.class, i2.class, "b"), AtomicReferenceFieldUpdater.newUpdater(j2.class, i2.class, "c"), AtomicReferenceFieldUpdater.newUpdater(j2.class, f2.class, "b"), AtomicReferenceFieldUpdater.newUpdater(j2.class, Object.class, "a"));
            th = null;
        } catch (Throwable th) {
            th = th;
            h2Var = new h2();
        }
        f = h2Var;
        if (th != null) {
            e.log(Level.SEVERE, "SafeAtomicHelper is broken!", th);
        }
        g = new Object();
    }

    public static void e(j2 j2Var) {
        i2 i2Var;
        f2 f2Var;
        f2 f2Var2;
        f2 f2Var3;
        do {
            i2Var = j2Var.c;
        } while (!f.p(j2Var, i2Var, i2.c));
        while (true) {
            f2Var = null;
            if (i2Var == null) {
                break;
            }
            Thread thread = i2Var.a;
            if (thread != null) {
                i2Var.a = null;
                LockSupport.unpark(thread);
            }
            i2Var = i2Var.b;
        }
        j2Var.d();
        do {
            f2Var2 = j2Var.b;
        } while (!f.n(j2Var, f2Var2, f2.d));
        while (true) {
            f2Var3 = f2Var;
            f2Var = f2Var2;
            if (f2Var == null) {
                break;
            }
            f2Var2 = f2Var.c;
            f2Var.c = f2Var3;
        }
        while (f2Var3 != null) {
            f2 f2Var4 = f2Var3.c;
            f(f2Var3.a, f2Var3.b);
            f2Var3 = f2Var4;
        }
    }

    public static void f(Runnable runnable, Executor executor) {
        try {
            executor.execute(runnable);
        } catch (RuntimeException e2) {
            e.log(Level.SEVERE, "RuntimeException while executing runnable " + runnable + " with executor " + executor, (Throwable) e2);
        }
    }

    public static Object g(Object obj) throws ExecutionException {
        if (obj instanceof c2) {
            Throwable th = ((c2) obj).b;
            CancellationException cancellationException = new CancellationException("Task was cancelled.");
            cancellationException.initCause(th);
            throw cancellationException;
        }
        if (obj instanceof e2) {
            throw new ExecutionException(((e2) obj).a);
        }
        if (obj == g) {
            return null;
        }
        return obj;
    }

    public static Object h(Future future) {
        Object obj;
        boolean z = false;
        while (true) {
            try {
                obj = future.get();
                break;
            } catch (InterruptedException unused) {
                z = true;
            } catch (Throwable th) {
                if (z) {
                    Thread.currentThread().interrupt();
                }
                throw th;
            }
        }
        if (z) {
            Thread.currentThread().interrupt();
        }
        return obj;
    }

    @Override // defpackage.d37
    public final void a(Runnable runnable, Executor executor) {
        executor.getClass();
        f2 f2Var = this.b;
        f2 f2Var2 = f2.d;
        if (f2Var != f2Var2) {
            f2 f2Var3 = new f2(runnable, executor);
            do {
                f2Var3.c = f2Var;
                if (f.n(this, f2Var, f2Var3)) {
                    return;
                } else {
                    f2Var = this.b;
                }
            } while (f2Var != f2Var2);
        }
        f(runnable, executor);
    }

    public final void c(StringBuilder sb) {
        try {
            Object objH = h(this);
            sb.append("SUCCESS, result=[");
            sb.append(objH == this ? "this future" : String.valueOf(objH));
            sb.append("]");
        } catch (CancellationException unused) {
            sb.append("CANCELLED");
        } catch (RuntimeException e2) {
            sb.append("UNKNOWN, cause=[");
            sb.append(e2.getClass());
            sb.append(" thrown from get()]");
        } catch (ExecutionException e3) {
            sb.append("FAILURE, cause=[");
            sb.append(e3.getCause());
            sb.append("]");
        }
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z) {
        Object obj = this.a;
        if (obj == null) {
            if (f.o(this, obj, d ? new c2(new CancellationException("Future.cancel() was called."), z) : z ? c2.c : c2.d)) {
                e(this);
                return true;
            }
        }
        return false;
    }

    @Override // java.util.concurrent.Future
    public final Object get(long j, TimeUnit timeUnit) throws InterruptedException, TimeoutException {
        i2 i2Var = i2.c;
        long nanos = timeUnit.toNanos(j);
        if (Thread.interrupted()) {
            throw new InterruptedException();
        }
        Object obj = this.a;
        if (obj != null) {
            return g(obj);
        }
        long jNanoTime = nanos > 0 ? System.nanoTime() + nanos : 0L;
        if (nanos >= 1000) {
            i2 i2Var2 = this.c;
            if (i2Var2 != i2Var) {
                i2 i2Var3 = new i2();
                do {
                    o7f o7fVar = f;
                    o7fVar.F(i2Var3, i2Var2);
                    if (o7fVar.p(this, i2Var2, i2Var3)) {
                        while (true) {
                            LockSupport.parkNanos(this, nanos);
                            if (Thread.interrupted()) {
                                j(i2Var3);
                                throw new InterruptedException();
                            }
                            Object obj2 = this.a;
                            if (obj2 != null) {
                                return g(obj2);
                            }
                            long jNanoTime2 = jNanoTime - System.nanoTime();
                            if (jNanoTime2 < 1000) {
                                j(i2Var3);
                                nanos = jNanoTime2;
                                break;
                            }
                            nanos = jNanoTime2;
                        }
                    } else {
                        i2Var2 = this.c;
                    }
                } while (i2Var2 != i2Var);
            }
            return g(this.a);
        }
        while (nanos > 0) {
            Object obj3 = this.a;
            if (obj3 != null) {
                return g(obj3);
            }
            if (Thread.interrupted()) {
                throw new InterruptedException();
            }
            nanos = jNanoTime - System.nanoTime();
        }
        String string = toString();
        String string2 = timeUnit.toString();
        Locale locale = Locale.ROOT;
        String lowerCase = string2.toLowerCase(locale);
        StringBuilder sbD = b09.D("Waited ", " ", j);
        sbD.append(timeUnit.toString().toLowerCase(locale));
        String string3 = sbD.toString();
        if (nanos + 1000 < 0) {
            String strConcat = string3.concat(" (plus ");
            long j2 = -nanos;
            long jConvert = timeUnit.convert(j2, TimeUnit.NANOSECONDS);
            long nanos2 = j2 - timeUnit.toNanos(jConvert);
            boolean z = jConvert == 0 || nanos2 > 1000;
            if (jConvert > 0) {
                String strConcat2 = strConcat + jConvert + " " + lowerCase;
                if (z) {
                    strConcat2 = strConcat2.concat(",");
                }
                strConcat = strConcat2.concat(" ");
            }
            if (z) {
                strConcat = b09.x(strConcat, " nanoseconds ", nanos2);
            }
            string3 = strConcat.concat("delay)");
        }
        if (isDone()) {
            throw new TimeoutException(string3.concat(" but future completed as timeout expired"));
        }
        throw new TimeoutException(ev6.x(string3, " for ", string));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public String i() {
        if (!(this instanceof ScheduledFuture)) {
            return null;
        }
        return "remaining delay=[" + ((ScheduledFuture) this).getDelay(TimeUnit.MILLISECONDS) + " ms]";
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.a instanceof c2;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return this.a != null;
    }

    public final void j(i2 i2Var) {
        i2Var.a = null;
        while (true) {
            i2 i2Var2 = this.c;
            if (i2Var2 == i2.c) {
                return;
            }
            i2 i2Var3 = null;
            while (i2Var2 != null) {
                i2 i2Var4 = i2Var2.b;
                if (i2Var2.a != null) {
                    i2Var3 = i2Var2;
                } else if (i2Var3 != null) {
                    i2Var3.b = i2Var4;
                    if (i2Var3.a == null) {
                        break;
                    }
                } else if (!f.p(this, i2Var2, i2Var4)) {
                    break;
                }
                i2Var2 = i2Var4;
            }
            return;
        }
    }

    public boolean k(Object obj) {
        if (obj == null) {
            obj = g;
        }
        if (!f.o(this, null, obj)) {
            return false;
        }
        e(this);
        return true;
    }

    public boolean l(Throwable th) {
        if (!f.o(this, null, new e2(th))) {
            return false;
        }
        e(this);
        return true;
    }

    public final String toString() {
        String strI;
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("[status=");
        if (this.a instanceof c2) {
            sb.append("CANCELLED");
        } else if (isDone()) {
            c(sb);
        } else {
            try {
                strI = i();
            } catch (RuntimeException e2) {
                strI = "Exception thrown from implementation: " + e2.getClass();
            }
            if (strI != null && !strI.isEmpty()) {
                sb.append("PENDING, info=[");
                sb.append(strI);
                sb.append("]");
            } else if (isDone()) {
                c(sb);
            } else {
                sb.append("PENDING");
            }
        }
        sb.append("]");
        return sb.toString();
    }

    public void d() {
    }

    @Override // java.util.concurrent.Future
    public final Object get() throws InterruptedException {
        Object obj;
        i2 i2Var = i2.c;
        if (!Thread.interrupted()) {
            Object obj2 = this.a;
            if (obj2 != null) {
                return g(obj2);
            }
            i2 i2Var2 = this.c;
            if (i2Var2 != i2Var) {
                i2 i2Var3 = new i2();
                do {
                    o7f o7fVar = f;
                    o7fVar.F(i2Var3, i2Var2);
                    if (o7fVar.p(this, i2Var2, i2Var3)) {
                        do {
                            LockSupport.park(this);
                            if (!Thread.interrupted()) {
                                obj = this.a;
                            } else {
                                j(i2Var3);
                                throw new InterruptedException();
                            }
                        } while (obj == null);
                        return g(obj);
                    }
                    i2Var2 = this.c;
                } while (i2Var2 != i2Var);
            }
            return g(this.a);
        }
        throw new InterruptedException();
    }
}
