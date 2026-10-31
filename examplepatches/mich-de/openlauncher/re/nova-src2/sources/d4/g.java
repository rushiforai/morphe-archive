package d4;

import ab.e0;
import b.c0;
import b.u4;
import com.google.common.util.concurrent.ListenableFuture;
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

/* loaded from: classes.dex */
public abstract class g implements ListenableFuture {

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f48959d = Boolean.parseBoolean(System.getProperty("guava.concurrent.generate_cancellation_cause", "false"));

    /* renamed from: e, reason: collision with root package name */
    public static final Logger f48960e = Logger.getLogger(g.class.getName());

    /* renamed from: f, reason: collision with root package name */
    public static final e0 f48961f;

    /* renamed from: g, reason: collision with root package name */
    public static final Object f48962g;

    /* renamed from: a, reason: collision with root package name */
    public volatile Object f48963a;

    /* renamed from: b, reason: collision with root package name */
    public volatile c f48964b;

    /* renamed from: c, reason: collision with root package name */
    public volatile f f48965c;

    static {
        e0 eVar;
        try {
            eVar = new d(AtomicReferenceFieldUpdater.newUpdater(f.class, Thread.class, "a"), AtomicReferenceFieldUpdater.newUpdater(f.class, f.class, "b"), AtomicReferenceFieldUpdater.newUpdater(g.class, f.class, "c"), AtomicReferenceFieldUpdater.newUpdater(g.class, c.class, "b"), AtomicReferenceFieldUpdater.newUpdater(g.class, Object.class, "a"));
            th = null;
        } catch (Throwable th2) {
            th = th2;
            eVar = new e();
        }
        f48961f = eVar;
        if (th != null) {
            f48960e.log(Level.SEVERE, "SafeAtomicHelper is broken!", th);
        }
        f48962g = new Object();
    }

    public static void g(g gVar) {
        f fVar;
        c cVar;
        c cVar2;
        c cVar3;
        do {
            fVar = gVar.f48965c;
        } while (!f48961f.p(gVar, fVar, f.f48956c));
        while (true) {
            cVar = null;
            if (fVar == null) {
                break;
            }
            Thread thread = fVar.f48957a;
            if (thread != null) {
                fVar.f48957a = null;
                LockSupport.unpark(thread);
            }
            fVar = fVar.f48958b;
        }
        gVar.d();
        do {
            cVar2 = gVar.f48964b;
        } while (!f48961f.n(gVar, cVar2, c.f48947d));
        while (true) {
            cVar3 = cVar;
            cVar = cVar2;
            if (cVar == null) {
                break;
            }
            cVar2 = cVar.f48950c;
            cVar.f48950c = cVar3;
        }
        while (cVar3 != null) {
            c cVar4 = cVar3.f48950c;
            h(cVar3.f48948a, cVar3.f48949b);
            cVar3 = cVar4;
        }
    }

    public static void h(Runnable runnable, Executor executor) {
        try {
            executor.execute(runnable);
        } catch (RuntimeException e3) {
            f48960e.log(Level.SEVERE, "RuntimeException while executing runnable " + runnable + " with executor " + executor, (Throwable) e3);
        }
    }

    public static Object i(Object obj) throws ExecutionException {
        if (obj instanceof a) {
            Throwable th2 = ((a) obj).f48945b;
            CancellationException cancellationException = new CancellationException("Task was cancelled.");
            cancellationException.initCause(th2);
            throw cancellationException;
        }
        if (obj instanceof b) {
            throw new ExecutionException(((b) obj).f48946a);
        }
        if (obj == f48962g) {
            return null;
        }
        return obj;
    }

    public static Object j(g gVar) {
        Object obj;
        boolean z11 = false;
        while (true) {
            try {
                obj = gVar.get();
                break;
            } catch (InterruptedException unused) {
                z11 = true;
            } catch (Throwable th2) {
                if (z11) {
                    Thread.currentThread().interrupt();
                }
                throw th2;
            }
        }
        if (z11) {
            Thread.currentThread().interrupt();
        }
        return obj;
    }

    public final void a(StringBuilder sb2) {
        try {
            Object objJ = j(this);
            sb2.append("SUCCESS, result=[");
            sb2.append(objJ == this ? "this future" : String.valueOf(objJ));
            sb2.append("]");
        } catch (CancellationException unused) {
            sb2.append("CANCELLED");
        } catch (RuntimeException e3) {
            sb2.append("UNKNOWN, cause=[");
            sb2.append(e3.getClass());
            sb2.append(" thrown from get()]");
        } catch (ExecutionException e11) {
            sb2.append("FAILURE, cause=[");
            sb2.append(e11.getCause());
            sb2.append("]");
        }
    }

    @Override // com.google.common.util.concurrent.ListenableFuture
    public final void b(Runnable runnable, Executor executor) {
        executor.getClass();
        c cVar = this.f48964b;
        c cVar2 = c.f48947d;
        if (cVar != cVar2) {
            c cVar3 = new c(runnable, executor);
            do {
                cVar3.f48950c = cVar;
                if (f48961f.n(this, cVar, cVar3)) {
                    return;
                } else {
                    cVar = this.f48964b;
                }
            } while (cVar != cVar2);
        }
        h(runnable, executor);
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z11) {
        Object obj = this.f48963a;
        if (obj == null) {
            if (f48961f.o(this, obj, f48959d ? new a(z11, new CancellationException("Future.cancel() was called.")) : z11 ? a.f48942c : a.f48943d)) {
                g(this);
                return true;
            }
        }
        return false;
    }

    public void d() {
    }

    @Override // java.util.concurrent.Future
    public final Object get(long j11, TimeUnit timeUnit) throws InterruptedException, TimeoutException {
        f fVar = f.f48956c;
        long nanos = timeUnit.toNanos(j11);
        if (Thread.interrupted()) {
            throw new InterruptedException();
        }
        Object obj = this.f48963a;
        if (obj != null) {
            return i(obj);
        }
        long jNanoTime = nanos > 0 ? System.nanoTime() + nanos : 0L;
        if (nanos >= 1000) {
            f fVar2 = this.f48965c;
            if (fVar2 != fVar) {
                f fVar3 = new f();
                do {
                    e0 e0Var = f48961f;
                    e0Var.P(fVar3, fVar2);
                    if (e0Var.p(this, fVar2, fVar3)) {
                        do {
                            LockSupport.parkNanos(this, nanos);
                            if (Thread.interrupted()) {
                                l(fVar3);
                                throw new InterruptedException();
                            }
                            Object obj2 = this.f48963a;
                            if (obj2 != null) {
                                return i(obj2);
                            }
                            nanos = jNanoTime - System.nanoTime();
                        } while (nanos >= 1000);
                        l(fVar3);
                    } else {
                        fVar2 = this.f48965c;
                    }
                } while (fVar2 != fVar);
            }
            return i(this.f48963a);
        }
        while (nanos > 0) {
            Object obj3 = this.f48963a;
            if (obj3 != null) {
                return i(obj3);
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
        StringBuilder sbU = c0.u(j11, "Waited ", " ");
        sbU.append(timeUnit.toString().toLowerCase(locale));
        String string3 = sbU.toString();
        if (nanos + 1000 < 0) {
            String strE = c0.E(string3, " (plus ");
            long j12 = -nanos;
            long jConvert = timeUnit.convert(j12, TimeUnit.NANOSECONDS);
            long nanos2 = j12 - timeUnit.toNanos(jConvert);
            boolean z11 = jConvert == 0 || nanos2 > 1000;
            if (jConvert > 0) {
                String strE2 = strE + jConvert + " " + lowerCase;
                if (z11) {
                    strE2 = c0.E(strE2, ",");
                }
                strE = c0.E(strE2, " ");
            }
            if (z11) {
                strE = strE + nanos2 + " nanoseconds ";
            }
            string3 = c0.E(strE, "delay)");
        }
        if (isDone()) {
            throw new TimeoutException(c0.E(string3, " but future completed as timeout expired"));
        }
        throw new TimeoutException(u4.m(string3, " for ", string));
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.f48963a instanceof a;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return this.f48963a != null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public String k() {
        if (!(this instanceof ScheduledFuture)) {
            return null;
        }
        return "remaining delay=[" + ((ScheduledFuture) this).getDelay(TimeUnit.MILLISECONDS) + " ms]";
    }

    public final void l(f fVar) {
        fVar.f48957a = null;
        while (true) {
            f fVar2 = this.f48965c;
            if (fVar2 == f.f48956c) {
                return;
            }
            f fVar3 = null;
            while (fVar2 != null) {
                f fVar4 = fVar2.f48958b;
                if (fVar2.f48957a != null) {
                    fVar3 = fVar2;
                } else if (fVar3 != null) {
                    fVar3.f48958b = fVar4;
                    if (fVar3.f48957a == null) {
                        break;
                    }
                } else if (!f48961f.p(this, fVar2, fVar4)) {
                    break;
                }
                fVar2 = fVar4;
            }
            return;
        }
    }

    public boolean m(Object obj) {
        if (obj == null) {
            obj = f48962g;
        }
        if (!f48961f.o(this, null, obj)) {
            return false;
        }
        g(this);
        return true;
    }

    public boolean n(Throwable th2) {
        th2.getClass();
        if (!f48961f.o(this, null, new b(th2))) {
            return false;
        }
        g(this);
        return true;
    }

    public final String toString() {
        String strK;
        StringBuilder sb2 = new StringBuilder();
        sb2.append(super.toString());
        sb2.append("[status=");
        if (this.f48963a instanceof a) {
            sb2.append("CANCELLED");
        } else if (isDone()) {
            a(sb2);
        } else {
            try {
                strK = k();
            } catch (RuntimeException e3) {
                strK = "Exception thrown from implementation: " + e3.getClass();
            }
            if (strK != null && !strK.isEmpty()) {
                c0.C(sb2, "PENDING, info=[", strK, "]");
            } else if (isDone()) {
                a(sb2);
            } else {
                sb2.append("PENDING");
            }
        }
        sb2.append("]");
        return sb2.toString();
    }

    @Override // java.util.concurrent.Future
    public final Object get() throws InterruptedException {
        Object obj;
        f fVar = f.f48956c;
        if (!Thread.interrupted()) {
            Object obj2 = this.f48963a;
            if (obj2 != null) {
                return i(obj2);
            }
            f fVar2 = this.f48965c;
            if (fVar2 != fVar) {
                f fVar3 = new f();
                do {
                    e0 e0Var = f48961f;
                    e0Var.P(fVar3, fVar2);
                    if (e0Var.p(this, fVar2, fVar3)) {
                        do {
                            LockSupport.park(this);
                            if (!Thread.interrupted()) {
                                obj = this.f48963a;
                            } else {
                                l(fVar3);
                                throw new InterruptedException();
                            }
                        } while (obj == null);
                        return i(obj);
                    }
                    fVar2 = this.f48965c;
                } while (fVar2 != fVar);
            }
            return i(this.f48963a);
        }
        throw new InterruptedException();
    }
}
