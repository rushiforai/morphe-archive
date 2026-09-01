package defpackage;

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

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ggg implements x0g {
    public static final boolean d = Boolean.parseBoolean(System.getProperty("guava.concurrent.generate_cancellation_cause", "false"));
    public static final Logger e = Logger.getLogger(ggg.class.getName());
    public static final mk7 f;
    public static final Object g;
    public volatile Object a;
    public volatile k6g b;
    public volatile meg c;

    static {
        mk7 qdgVar;
        try {
            qdgVar = new gag(AtomicReferenceFieldUpdater.newUpdater(meg.class, Thread.class, "a"), AtomicReferenceFieldUpdater.newUpdater(meg.class, meg.class, "b"), AtomicReferenceFieldUpdater.newUpdater(ggg.class, meg.class, "c"), AtomicReferenceFieldUpdater.newUpdater(ggg.class, k6g.class, "b"), AtomicReferenceFieldUpdater.newUpdater(ggg.class, Object.class, "a"));
            th = null;
        } catch (Throwable th) {
            th = th;
            qdgVar = new qdg();
        }
        Throwable th2 = th;
        f = qdgVar;
        if (th2 != null) {
            e.logp(Level.SEVERE, "com.android.billingclient.util.concurrent.AbstractResolvableFuture", "<clinit>", "SafeAtomicHelper is broken!", th2);
        }
        g = new Object();
    }

    public static void d(ggg gggVar) {
        meg megVar;
        mk7 mk7Var;
        k6g k6gVar;
        k6g k6gVar2;
        k6g k6gVar3;
        do {
            megVar = gggVar.c;
            mk7Var = f;
        } while (!mk7Var.P(gggVar, megVar, meg.c));
        while (true) {
            k6gVar = null;
            if (megVar == null) {
                break;
            }
            Thread thread = megVar.a;
            if (thread != null) {
                megVar.a = null;
                LockSupport.unpark(thread);
            }
            megVar = megVar.b;
        }
        do {
            k6gVar2 = gggVar.b;
        } while (!mk7Var.N(gggVar, k6gVar2, k6g.d));
        while (true) {
            k6gVar3 = k6gVar;
            k6gVar = k6gVar2;
            if (k6gVar == null) {
                break;
            }
            k6gVar2 = k6gVar.c;
            k6gVar.c = k6gVar3;
        }
        while (k6gVar3 != null) {
            Runnable runnable = k6gVar3.a;
            k6g k6gVar4 = k6gVar3.c;
            f(runnable, k6gVar3.b);
            k6gVar3 = k6gVar4;
        }
    }

    public static void f(Runnable runnable, Executor executor) {
        try {
            executor.execute(runnable);
        } catch (RuntimeException e2) {
            e.logp(Level.SEVERE, "com.android.billingclient.util.concurrent.AbstractResolvableFuture", "executeListener", lv8.r("RuntimeException while executing runnable ", String.valueOf(runnable), " with executor ", String.valueOf(executor)), (Throwable) e2);
        }
    }

    public static final Object h(Object obj) throws ExecutionException {
        if (obj instanceof x1g) {
            Throwable th = ((x1g) obj).a;
            CancellationException cancellationException = new CancellationException("Task was cancelled.");
            cancellationException.initCause(th);
            throw cancellationException;
        }
        if (obj instanceof s4g) {
            throw new ExecutionException(((s4g) obj).a);
        }
        if (obj == g) {
            return null;
        }
        return obj;
    }

    @Override // defpackage.x0g
    public final void b(Runnable runnable, Executor executor) {
        executor.getClass();
        k6g k6gVar = this.b;
        k6g k6gVar2 = k6g.d;
        if (k6gVar != k6gVar2) {
            k6g k6gVar3 = new k6g(runnable, executor);
            do {
                k6gVar3.c = k6gVar;
                if (f.N(this, k6gVar, k6gVar3)) {
                    return;
                } else {
                    k6gVar = this.b;
                }
            } while (k6gVar != k6gVar2);
        }
        f(runnable, executor);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public String c() {
        if (this instanceof ScheduledFuture) {
            return b09.x("remaining delay=[", " ms]", ((ScheduledFuture) this).getDelay(TimeUnit.MILLISECONDS));
        }
        return null;
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z) {
        Object obj = this.a;
        if (obj != null) {
            return false;
        }
        if (!f.O(this, obj, d ? new x1g(new CancellationException("Future.cancel() was called.")) : z ? x1g.b : x1g.c)) {
            return false;
        }
        d(this);
        return true;
    }

    public final void e(StringBuilder sb) {
        Object obj;
        boolean z = false;
        while (true) {
            try {
                try {
                    obj = get();
                    break;
                } catch (InterruptedException unused) {
                    z = true;
                } catch (Throwable th) {
                    if (z) {
                        Thread.currentThread().interrupt();
                    }
                    throw th;
                }
            } catch (CancellationException unused2) {
                sb.append("CANCELLED");
                return;
            } catch (RuntimeException e2) {
                sb.append("UNKNOWN, cause=[");
                sb.append(e2.getClass());
                sb.append(" thrown from get()]");
                return;
            } catch (ExecutionException e3) {
                sb.append("FAILURE, cause=[");
                sb.append(e3.getCause());
                sb.append("]");
                return;
            }
        }
        if (z) {
            Thread.currentThread().interrupt();
        }
        sb.append("SUCCESS, result=[");
        sb.append(obj == this ? "this future" : String.valueOf(obj));
        sb.append("]");
    }

    public final void g(meg megVar) {
        megVar.a = null;
        while (true) {
            meg megVar2 = this.c;
            if (megVar2 != meg.c) {
                meg megVar3 = null;
                while (megVar2 != null) {
                    meg megVar4 = megVar2.b;
                    if (megVar2.a != null) {
                        megVar3 = megVar2;
                    } else if (megVar3 != null) {
                        megVar3.b = megVar4;
                        if (megVar3.a == null) {
                            break;
                        }
                    } else if (!f.P(this, megVar2, megVar4)) {
                        break;
                    }
                    megVar2 = megVar4;
                }
                return;
            }
            return;
        }
    }

    @Override // java.util.concurrent.Future
    public final Object get(long j, TimeUnit timeUnit) throws InterruptedException, TimeoutException {
        long nanos = timeUnit.toNanos(j);
        if (Thread.interrupted()) {
            throw new InterruptedException();
        }
        Object obj = this.a;
        if (obj != null) {
            return h(obj);
        }
        long jNanoTime = nanos > 0 ? System.nanoTime() + nanos : 0L;
        if (nanos >= 1000) {
            meg megVar = this.c;
            meg megVar2 = meg.c;
            if (megVar != megVar2) {
                meg megVar3 = new meg();
                do {
                    mk7 mk7Var = f;
                    mk7Var.K(megVar3, megVar);
                    if (mk7Var.P(this, megVar, megVar3)) {
                        do {
                            LockSupport.parkNanos(this, nanos);
                            if (Thread.interrupted()) {
                                g(megVar3);
                                throw new InterruptedException();
                            }
                            Object obj2 = this.a;
                            if (obj2 != null) {
                                return h(obj2);
                            }
                            nanos = jNanoTime - System.nanoTime();
                        } while (nanos >= 1000);
                        g(megVar3);
                    } else {
                        megVar = this.c;
                    }
                } while (megVar != megVar2);
            }
            return h(this.a);
        }
        while (nanos > 0) {
            Object obj3 = this.a;
            if (obj3 != null) {
                return h(obj3);
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
        String strConcat = "Waited " + j + " " + timeUnit.toString().toLowerCase(locale);
        if (nanos + 1000 < 0) {
            String strConcat2 = strConcat.concat(" (plus ");
            long j2 = -nanos;
            long jConvert = timeUnit.convert(j2, TimeUnit.NANOSECONDS);
            long nanos2 = j2 - timeUnit.toNanos(jConvert);
            boolean z = true;
            if (jConvert != 0 && nanos2 <= 1000) {
                z = false;
            }
            if (jConvert > 0) {
                String strConcat3 = strConcat2 + jConvert + " " + lowerCase;
                if (z) {
                    strConcat3 = strConcat3.concat(",");
                }
                strConcat2 = strConcat3.concat(" ");
            }
            if (z) {
                strConcat2 = b09.x(strConcat2, " nanoseconds ", nanos2);
            }
            strConcat = strConcat2.concat("delay)");
        }
        if (isDone()) {
            throw new TimeoutException(strConcat.concat(" but future completed as timeout expired"));
        }
        throw new TimeoutException(ev6.x(strConcat, " for ", string));
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.a instanceof x1g;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return this.a != null;
    }

    public final String toString() {
        String strConcat;
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("[status=");
        if (this.a instanceof x1g) {
            sb.append("CANCELLED");
        } else if (isDone()) {
            e(sb);
        } else {
            try {
                strConcat = c();
            } catch (RuntimeException e2) {
                strConcat = "Exception thrown from implementation: ".concat(String.valueOf(e2.getClass()));
            }
            if (strConcat != null && !strConcat.isEmpty()) {
                sb.append("PENDING, info=[");
                sb.append(strConcat);
                sb.append("]");
            } else if (isDone()) {
                e(sb);
            } else {
                sb.append("PENDING");
            }
        }
        sb.append("]");
        return sb.toString();
    }

    @Override // java.util.concurrent.Future
    public final Object get() throws InterruptedException {
        Object obj;
        if (!Thread.interrupted()) {
            Object obj2 = this.a;
            if (obj2 != null) {
                return h(obj2);
            }
            meg megVar = this.c;
            meg megVar2 = meg.c;
            if (megVar != megVar2) {
                meg megVar3 = new meg();
                do {
                    mk7 mk7Var = f;
                    mk7Var.K(megVar3, megVar);
                    if (mk7Var.P(this, megVar, megVar3)) {
                        do {
                            LockSupport.park(this);
                            if (!Thread.interrupted()) {
                                obj = this.a;
                            } else {
                                g(megVar3);
                                throw new InterruptedException();
                            }
                        } while (obj == null);
                        return h(obj);
                    }
                    megVar = this.c;
                } while (megVar != megVar2);
            }
            return h(this.a);
        }
        throw new InterruptedException();
    }
}
