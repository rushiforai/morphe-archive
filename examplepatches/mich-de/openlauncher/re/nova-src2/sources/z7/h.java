package z7;

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
public abstract class h implements ListenableFuture {

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f98292d = Boolean.parseBoolean(System.getProperty("guava.concurrent.generate_cancellation_cause", "false"));

    /* renamed from: e, reason: collision with root package name */
    public static final Logger f98293e = Logger.getLogger(h.class.getName());

    /* renamed from: f, reason: collision with root package name */
    public static final w.b f98294f;

    /* renamed from: g, reason: collision with root package name */
    public static final Object f98295g;

    /* renamed from: a, reason: collision with root package name */
    public volatile Object f98296a;

    /* renamed from: b, reason: collision with root package name */
    public volatile c f98297b;

    /* renamed from: c, reason: collision with root package name */
    public volatile g f98298c;

    static {
        w.b fVar;
        try {
            fVar = new d(AtomicReferenceFieldUpdater.newUpdater(g.class, Thread.class, "a"), AtomicReferenceFieldUpdater.newUpdater(g.class, g.class, "b"), AtomicReferenceFieldUpdater.newUpdater(h.class, g.class, "c"), AtomicReferenceFieldUpdater.newUpdater(h.class, c.class, "b"), AtomicReferenceFieldUpdater.newUpdater(h.class, Object.class, "a"));
            th = null;
        } catch (Throwable th2) {
            th = th2;
            fVar = new f();
        }
        f98294f = fVar;
        if (th != null) {
            f98293e.log(Level.SEVERE, "SafeAtomicHelper is broken!", th);
        }
        f98295g = new Object();
    }

    public static void d(h hVar) {
        c cVar;
        c cVar2;
        c cVar3 = null;
        while (true) {
            g gVar = hVar.f98298c;
            if (f98294f.d(hVar, gVar, g.f98289c)) {
                while (gVar != null) {
                    Thread thread = gVar.f98290a;
                    if (thread != null) {
                        gVar.f98290a = null;
                        LockSupport.unpark(thread);
                    }
                    gVar = gVar.f98291b;
                }
                do {
                    cVar = hVar.f98297b;
                } while (!f98294f.b(hVar, cVar, c.f98279d));
                while (true) {
                    cVar2 = cVar3;
                    cVar3 = cVar;
                    if (cVar3 == null) {
                        break;
                    }
                    cVar = cVar3.f98282c;
                    cVar3.f98282c = cVar2;
                }
                while (cVar2 != null) {
                    cVar3 = cVar2.f98282c;
                    Runnable runnable = cVar2.f98280a;
                    if (runnable instanceof e) {
                        e eVar = (e) runnable;
                        hVar = eVar.f98287a;
                        if (hVar.f98296a == eVar) {
                            if (f98294f.c(hVar, eVar, g(eVar.f98288b))) {
                                break;
                            }
                        } else {
                            continue;
                        }
                    } else {
                        e(runnable, cVar2.f98281b);
                    }
                    cVar2 = cVar3;
                }
                return;
            }
        }
    }

    public static void e(Runnable runnable, Executor executor) {
        try {
            executor.execute(runnable);
        } catch (RuntimeException e3) {
            f98293e.log(Level.SEVERE, "RuntimeException while executing runnable " + runnable + " with executor " + executor, (Throwable) e3);
        }
    }

    public static Object f(Object obj) throws ExecutionException {
        if (obj instanceof a) {
            Throwable th2 = ((a) obj).f98276b;
            CancellationException cancellationException = new CancellationException("Task was cancelled.");
            cancellationException.initCause(th2);
            throw cancellationException;
        }
        if (obj instanceof b) {
            throw new ExecutionException(((b) obj).f98278a);
        }
        if (obj == f98295g) {
            return null;
        }
        return obj;
    }

    public static Object g(ListenableFuture listenableFuture) {
        Object obj;
        if (listenableFuture instanceof h) {
            Object obj2 = ((h) listenableFuture).f98296a;
            if (!(obj2 instanceof a)) {
                return obj2;
            }
            a aVar = (a) obj2;
            return aVar.f98275a ? aVar.f98276b != null ? new a(false, aVar.f98276b) : a.f98274d : obj2;
        }
        boolean zIsCancelled = listenableFuture.isCancelled();
        boolean z11 = true;
        if ((!f98292d) && zIsCancelled) {
            return a.f98274d;
        }
        boolean z12 = false;
        while (true) {
            try {
                try {
                    obj = listenableFuture.get();
                    break;
                } catch (InterruptedException unused) {
                    z12 = z11;
                } catch (Throwable th2) {
                    if (z12) {
                        Thread.currentThread().interrupt();
                    }
                    throw th2;
                }
            } catch (CancellationException e3) {
                if (zIsCancelled) {
                    return new a(false, e3);
                }
                return new b(new IllegalArgumentException("get() threw CancellationException, despite reporting isCancelled() == false: " + listenableFuture, e3));
            } catch (ExecutionException e11) {
                return new b(e11.getCause());
            } catch (Throwable th3) {
                return new b(th3);
            }
        }
        if (z12) {
            Thread.currentThread().interrupt();
        }
        return obj == null ? f98295g : obj;
    }

    public final void a(StringBuilder sb2) {
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

    @Override // com.google.common.util.concurrent.ListenableFuture
    public final void b(Runnable runnable, Executor executor) {
        executor.getClass();
        c cVar = this.f98297b;
        c cVar2 = c.f98279d;
        if (cVar != cVar2) {
            c cVar3 = new c(runnable, executor);
            do {
                cVar3.f98282c = cVar;
                if (f98294f.b(this, cVar, cVar3)) {
                    return;
                } else {
                    cVar = this.f98297b;
                }
            } while (cVar != cVar2);
        }
        e(runnable, executor);
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x0053, code lost:
    
        return true;
     */
    @Override // java.util.concurrent.Future
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean cancel(boolean z11) {
        Object obj = this.f98296a;
        if (!(obj == null) && !(obj instanceof e)) {
            return false;
        }
        a aVar = f98292d ? new a(z11, new CancellationException("Future.cancel() was called.")) : z11 ? a.f98273c : a.f98274d;
        h hVar = this;
        boolean z12 = false;
        while (true) {
            if (f98294f.c(hVar, obj, aVar)) {
                d(hVar);
                if (!(obj instanceof e)) {
                    break;
                }
                ListenableFuture listenableFuture = ((e) obj).f98288b;
                if (!(listenableFuture instanceof h)) {
                    listenableFuture.cancel(z11);
                    break;
                }
                hVar = (h) listenableFuture;
                obj = hVar.f98296a;
                if (!(obj == null) && !(obj instanceof e)) {
                    break;
                }
                z12 = true;
            } else {
                obj = hVar.f98296a;
                if (!(obj instanceof e)) {
                    return z12;
                }
            }
        }
    }

    @Override // java.util.concurrent.Future
    public final Object get(long j11, TimeUnit timeUnit) throws InterruptedException, TimeoutException {
        boolean z11;
        g gVar = g.f98289c;
        long nanos = timeUnit.toNanos(j11);
        if (Thread.interrupted()) {
            throw new InterruptedException();
        }
        Object obj = this.f98296a;
        if ((obj != null) && (!(obj instanceof e))) {
            return f(obj);
        }
        long jNanoTime = nanos > 0 ? System.nanoTime() + nanos : 0L;
        if (nanos >= 1000) {
            g gVar2 = this.f98298c;
            if (gVar2 != gVar) {
                g gVar3 = new g();
                z11 = true;
                do {
                    w.b bVar = f98294f;
                    bVar.l(gVar3, gVar2);
                    if (bVar.d(this, gVar2, gVar3)) {
                        do {
                            LockSupport.parkNanos(this, nanos);
                            if (Thread.interrupted()) {
                                i(gVar3);
                                throw new InterruptedException();
                            }
                            Object obj2 = this.f98296a;
                            if ((obj2 != null) && (!(obj2 instanceof e))) {
                                return f(obj2);
                            }
                            nanos = jNanoTime - System.nanoTime();
                        } while (nanos >= 1000);
                        i(gVar3);
                    } else {
                        gVar2 = this.f98298c;
                    }
                } while (gVar2 != gVar);
            }
            return f(this.f98296a);
        }
        z11 = true;
        while (nanos > 0) {
            Object obj3 = this.f98296a;
            if ((obj3 != null ? z11 : false) && (!(obj3 instanceof e))) {
                return f(obj3);
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
            boolean z12 = (jConvert == 0 || nanos2 > 1000) ? z11 : false;
            if (jConvert > 0) {
                String strE2 = strE + jConvert + " " + lowerCase;
                if (z12) {
                    strE2 = c0.E(strE2, ",");
                }
                strE = c0.E(strE2, " ");
            }
            if (z12) {
                strE = strE + nanos2 + " nanoseconds ";
            }
            string3 = c0.E(strE, "delay)");
        }
        if (isDone()) {
            throw new TimeoutException(c0.E(string3, " but future completed as timeout expired"));
        }
        throw new TimeoutException(u4.m(string3, " for ", string));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final String h() {
        Object obj = this.f98296a;
        if (obj instanceof e) {
            StringBuilder sb2 = new StringBuilder("setFuture=[");
            ListenableFuture listenableFuture = ((e) obj).f98288b;
            return c0.q(sb2, listenableFuture == this ? "this future" : String.valueOf(listenableFuture), "]");
        }
        if (!(this instanceof ScheduledFuture)) {
            return null;
        }
        return "remaining delay=[" + ((ScheduledFuture) this).getDelay(TimeUnit.MILLISECONDS) + " ms]";
    }

    public final void i(g gVar) {
        gVar.f98290a = null;
        while (true) {
            g gVar2 = this.f98298c;
            if (gVar2 == g.f98289c) {
                return;
            }
            g gVar3 = null;
            while (gVar2 != null) {
                g gVar4 = gVar2.f98291b;
                if (gVar2.f98290a != null) {
                    gVar3 = gVar2;
                } else if (gVar3 != null) {
                    gVar3.f98291b = gVar4;
                    if (gVar3.f98290a == null) {
                        break;
                    }
                } else if (!f98294f.d(this, gVar2, gVar4)) {
                    break;
                }
                gVar2 = gVar4;
            }
            return;
        }
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.f98296a instanceof a;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return (!(r0 instanceof e)) & (this.f98296a != null);
    }

    public final String toString() {
        String strH;
        StringBuilder sb2 = new StringBuilder();
        sb2.append(super.toString());
        sb2.append("[status=");
        if (this.f98296a instanceof a) {
            sb2.append("CANCELLED");
        } else if (isDone()) {
            a(sb2);
        } else {
            try {
                strH = h();
            } catch (RuntimeException e3) {
                strH = "Exception thrown from implementation: " + e3.getClass();
            }
            if (strH != null && !strH.isEmpty()) {
                c0.C(sb2, "PENDING, info=[", strH, "]");
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
        g gVar = g.f98289c;
        if (!Thread.interrupted()) {
            Object obj2 = this.f98296a;
            if ((obj2 != null) & (!(obj2 instanceof e))) {
                return f(obj2);
            }
            g gVar2 = this.f98298c;
            if (gVar2 != gVar) {
                g gVar3 = new g();
                do {
                    w.b bVar = f98294f;
                    bVar.l(gVar3, gVar2);
                    if (bVar.d(this, gVar2, gVar3)) {
                        do {
                            LockSupport.park(this);
                            if (!Thread.interrupted()) {
                                obj = this.f98296a;
                            } else {
                                i(gVar3);
                                throw new InterruptedException();
                            }
                        } while (!((obj != null) & (!(obj instanceof e))));
                        return f(obj);
                    }
                    gVar2 = this.f98298c;
                } while (gVar2 != gVar);
            }
            return f(this.f98296a);
        }
        throw new InterruptedException();
    }
}
