package cl;

import b.u4;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Locale;
import java.util.Objects;
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
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public abstract class s extends dl.a implements ListenableFuture {

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f20069d;

    /* renamed from: e, reason: collision with root package name */
    public static final Logger f20070e;

    /* renamed from: f, reason: collision with root package name */
    public static final bh.g f20071f;

    /* renamed from: g, reason: collision with root package name */
    public static final Object f20072g;

    /* renamed from: a, reason: collision with root package name */
    public volatile Object f20073a;

    /* renamed from: b, reason: collision with root package name */
    public volatile g f20074b;

    /* renamed from: c, reason: collision with root package name */
    public volatile r f20075c;

    static {
        boolean z11;
        Throwable th2;
        bh.g jVar;
        try {
            z11 = Boolean.parseBoolean(System.getProperty("guava.concurrent.generate_cancellation_cause", "false"));
        } catch (SecurityException unused) {
            z11 = false;
        }
        f20069d = z11;
        f20070e = Logger.getLogger(s.class.getName());
        Throwable th3 = null;
        try {
            jVar = new q();
            th2 = null;
        } catch (Error | RuntimeException e3) {
            th2 = e3;
            try {
                jVar = new h(AtomicReferenceFieldUpdater.newUpdater(r.class, Thread.class, "a"), AtomicReferenceFieldUpdater.newUpdater(r.class, r.class, "b"), AtomicReferenceFieldUpdater.newUpdater(s.class, r.class, "c"), AtomicReferenceFieldUpdater.newUpdater(s.class, g.class, "b"), AtomicReferenceFieldUpdater.newUpdater(s.class, Object.class, "a"));
            } catch (Error | RuntimeException e11) {
                th3 = e11;
                jVar = new j();
            }
        }
        f20071f = jVar;
        if (th3 != null) {
            Logger logger = f20070e;
            Level level = Level.SEVERE;
            logger.log(level, "UnsafeAtomicHelper is broken!", th2);
            logger.log(level, "SafeAtomicHelper is broken!", th3);
        }
        f20072g = new Object();
    }

    public static void g(s sVar, boolean z11) {
        g gVar = null;
        while (true) {
            for (r rVarS = f20071f.S(sVar); rVarS != null; rVarS = rVarS.f20068b) {
                Thread thread = rVarS.f20067a;
                if (thread != null) {
                    rVarS.f20067a = null;
                    LockSupport.unpark(thread);
                }
            }
            if (z11) {
                sVar.k();
                z11 = false;
            }
            sVar.e();
            g gVar2 = gVar;
            g gVarR = f20071f.R(sVar);
            g gVar3 = gVar2;
            while (gVarR != null) {
                g gVar4 = gVarR.f20005c;
                gVarR.f20005c = gVar3;
                gVar3 = gVarR;
                gVarR = gVar4;
            }
            while (gVar3 != null) {
                gVar = gVar3.f20005c;
                Runnable runnable = gVar3.f20003a;
                Objects.requireNonNull(runnable);
                if (runnable instanceof i) {
                    i iVar = (i) runnable;
                    sVar = iVar.f20018a;
                    if (sVar.f20073a == iVar) {
                        if (f20071f.E(sVar, iVar, j(iVar.f20019b))) {
                            break;
                        }
                    } else {
                        continue;
                    }
                } else {
                    Executor executor = gVar3.f20004b;
                    Objects.requireNonNull(executor);
                    h(runnable, executor);
                }
                gVar3 = gVar;
            }
            return;
        }
    }

    public static void h(Runnable runnable, Executor executor) {
        try {
            executor.execute(runnable);
        } catch (RuntimeException e3) {
            f20070e.log(Level.SEVERE, "RuntimeException while executing runnable " + runnable + " with executor " + executor, (Throwable) e3);
        }
    }

    public static Object i(Object obj) throws ExecutionException {
        if (obj instanceof d) {
            Throwable th2 = ((d) obj).f19994b;
            CancellationException cancellationException = new CancellationException("Task was cancelled.");
            cancellationException.initCause(th2);
            throw cancellationException;
        }
        if (obj instanceof f) {
            throw new ExecutionException(((f) obj).f19998a);
        }
        if (obj == f20072g) {
            return null;
        }
        return obj;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static Object j(ListenableFuture listenableFuture) {
        Object obj;
        Throwable thA;
        if (listenableFuture instanceof k) {
            Object dVar = ((s) listenableFuture).f20073a;
            if (dVar instanceof d) {
                d dVar2 = (d) dVar;
                if (dVar2.f19993a) {
                    dVar = dVar2.f19994b != null ? new d(false, dVar2.f19994b) : d.f19992d;
                }
            }
            Objects.requireNonNull(dVar);
            return dVar;
        }
        if ((listenableFuture instanceof dl.a) && (thA = ((dl.a) listenableFuture).a()) != null) {
            return new f(thA);
        }
        boolean zIsCancelled = listenableFuture.isCancelled();
        boolean z11 = true;
        if ((!f20069d) && zIsCancelled) {
            d dVar3 = d.f19992d;
            Objects.requireNonNull(dVar3);
            return dVar3;
        }
        boolean z12 = false;
        while (true) {
            try {
                try {
                    try {
                        obj = listenableFuture.get();
                        break;
                    } catch (Error e3) {
                        e = e3;
                        return new f(e);
                    }
                } catch (InterruptedException unused) {
                    z12 = z11;
                } catch (Throwable th2) {
                    if (z12) {
                        Thread.currentThread().interrupt();
                    }
                    throw th2;
                }
            } catch (Error | RuntimeException e11) {
                e = e11;
                return new f(e);
            } catch (CancellationException e12) {
                if (zIsCancelled) {
                    return new d(false, e12);
                }
                return new f(new IllegalArgumentException("get() threw CancellationException, despite reporting isCancelled() == false: " + listenableFuture, e12));
            } catch (ExecutionException e13) {
                if (!zIsCancelled) {
                    return new f(e13.getCause());
                }
                return new d(false, new IllegalArgumentException("get() did not throw CancellationException, despite reporting isCancelled() == true: " + listenableFuture, e13));
            }
        }
        if (z12) {
            Thread.currentThread().interrupt();
        }
        if (!zIsCancelled) {
            return obj == null ? f20072g : obj;
        }
        return new d(false, new IllegalArgumentException("get() did not throw CancellationException, despite reporting isCancelled() == true: " + listenableFuture));
    }

    @Override // dl.a
    public final Throwable a() {
        if (!(this instanceof k)) {
            return null;
        }
        Object obj = this.f20073a;
        if (obj instanceof f) {
            return ((f) obj).f19998a;
        }
        return null;
    }

    @Override // com.google.common.util.concurrent.ListenableFuture
    public void b(Runnable runnable, Executor executor) {
        g gVar;
        g gVar2 = g.f20002d;
        vk.b0.g(executor, "Executor was null.");
        if (!isDone() && (gVar = this.f20074b) != gVar2) {
            g gVar3 = new g(runnable, executor);
            do {
                gVar3.f20005c = gVar;
                if (f20071f.D(this, gVar, gVar3)) {
                    return;
                } else {
                    gVar = this.f20074b;
                }
            } while (gVar != gVar2);
        }
        h(runnable, executor);
    }

    @Override // java.util.concurrent.Future
    public boolean cancel(boolean z11) {
        d dVar;
        Object obj = this.f20073a;
        if (!(obj == null) && !(obj instanceof i)) {
            return false;
        }
        if (f20069d) {
            dVar = new d(z11, new CancellationException("Future.cancel() was called."));
        } else {
            dVar = z11 ? d.f19991c : d.f19992d;
            Objects.requireNonNull(dVar);
        }
        s sVar = this;
        boolean z12 = false;
        while (true) {
            if (f20071f.E(sVar, obj, dVar)) {
                g(sVar, z11);
                if (!(obj instanceof i)) {
                    break;
                }
                ListenableFuture listenableFuture = ((i) obj).f20019b;
                if (!(listenableFuture instanceof k)) {
                    listenableFuture.cancel(z11);
                    break;
                }
                sVar = (s) listenableFuture;
                obj = sVar.f20073a;
                if (!(obj == null) && !(obj instanceof i)) {
                    break;
                }
                z12 = true;
            } else {
                obj = sVar.f20073a;
                if (!(obj instanceof i)) {
                    return z12;
                }
            }
        }
        return true;
    }

    public final void d(StringBuilder sb2) {
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
        f(sb2, obj);
        sb2.append("]");
    }

    public void e() {
    }

    public final void f(StringBuilder sb2, Object obj) {
        if (obj == null) {
            sb2.append(AbstractJsonLexerKt.NULL);
        } else {
            if (obj == this) {
                sb2.append("this future");
                return;
            }
            sb2.append(obj.getClass().getName());
            sb2.append("@");
            sb2.append(Integer.toHexString(System.identityHashCode(obj)));
        }
    }

    @Override // java.util.concurrent.Future
    public Object get(long j11, TimeUnit timeUnit) throws InterruptedException, TimeoutException {
        boolean z11;
        long j12;
        r rVar = r.f20066c;
        long nanos = timeUnit.toNanos(j11);
        if (Thread.interrupted()) {
            throw new InterruptedException();
        }
        Object obj = this.f20073a;
        if ((obj != null) && (!(obj instanceof i))) {
            return i(obj);
        }
        long j13 = 0;
        long jNanoTime = nanos > 0 ? System.nanoTime() + nanos : 0L;
        if (nanos >= 1000) {
            r rVar2 = this.f20075c;
            if (rVar2 != rVar) {
                r rVar3 = new r();
                z11 = true;
                while (true) {
                    bh.g gVar = f20071f;
                    gVar.f0(rVar3, rVar2);
                    if (gVar.F(this, rVar2, rVar3)) {
                        j12 = j13;
                        do {
                            LockSupport.parkNanos(this, Math.min(nanos, 2147483647999999999L));
                            if (Thread.interrupted()) {
                                m(rVar3);
                                throw new InterruptedException();
                            }
                            Object obj2 = this.f20073a;
                            if ((obj2 != null) && (!(obj2 instanceof i))) {
                                return i(obj2);
                            }
                            nanos = jNanoTime - System.nanoTime();
                        } while (nanos >= 1000);
                        m(rVar3);
                    } else {
                        long j14 = j13;
                        rVar2 = this.f20075c;
                        if (rVar2 == rVar) {
                            break;
                        }
                        j13 = j14;
                    }
                }
            }
            Object obj3 = this.f20073a;
            Objects.requireNonNull(obj3);
            return i(obj3);
        }
        z11 = true;
        j12 = 0;
        while (nanos > j12) {
            Object obj4 = this.f20073a;
            if ((obj4 != null ? z11 : false) && (!(obj4 instanceof i))) {
                return i(obj4);
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
        StringBuilder sbU = b.c0.u(j11, "Waited ", " ");
        sbU.append(timeUnit.toString().toLowerCase(locale));
        String string3 = sbU.toString();
        if (nanos + 1000 < j12) {
            String strE = b.c0.E(string3, " (plus ");
            long j15 = -nanos;
            long jConvert = timeUnit.convert(j15, TimeUnit.NANOSECONDS);
            long nanos2 = j15 - timeUnit.toNanos(jConvert);
            boolean z12 = (jConvert == j12 || nanos2 > 1000) ? z11 : false;
            if (jConvert > j12) {
                String strE2 = strE + jConvert + " " + lowerCase;
                if (z12) {
                    strE2 = b.c0.E(strE2, ",");
                }
                strE = b.c0.E(strE2, " ");
            }
            if (z12) {
                strE = strE + nanos2 + " nanoseconds ";
            }
            string3 = b.c0.E(strE, "delay)");
        }
        if (isDone()) {
            throw new TimeoutException(b.c0.E(string3, " but future completed as timeout expired"));
        }
        throw new TimeoutException(u4.m(string3, " for ", string));
    }

    public boolean isCancelled() {
        return this.f20073a instanceof d;
    }

    @Override // java.util.concurrent.Future
    public boolean isDone() {
        return (!(r0 instanceof i)) & (this.f20073a != null);
    }

    public void k() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    public String l() {
        if (!(this instanceof ScheduledFuture)) {
            return null;
        }
        return "remaining delay=[" + ((ScheduledFuture) this).getDelay(TimeUnit.MILLISECONDS) + " ms]";
    }

    public final void m(r rVar) {
        rVar.f20067a = null;
        while (true) {
            r rVar2 = this.f20075c;
            if (rVar2 == r.f20066c) {
                return;
            }
            r rVar3 = null;
            while (rVar2 != null) {
                r rVar4 = rVar2.f20068b;
                if (rVar2.f20067a != null) {
                    rVar3 = rVar2;
                } else if (rVar3 != null) {
                    rVar3.f20068b = rVar4;
                    if (rVar3.f20067a == null) {
                        break;
                    }
                } else if (!f20071f.F(this, rVar2, rVar4)) {
                    break;
                }
                rVar2 = rVar4;
            }
            return;
        }
    }

    public boolean n(Object obj) {
        if (obj == null) {
            obj = f20072g;
        }
        if (!f20071f.E(this, null, obj)) {
            return false;
        }
        g(this, false);
        return true;
    }

    public boolean o(Throwable th2) {
        th2.getClass();
        if (!f20071f.E(this, null, new f(th2))) {
            return false;
        }
        g(this, false);
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x004a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean p(ListenableFuture listenableFuture) {
        f fVar;
        listenableFuture.getClass();
        Object obj = this.f20073a;
        if (obj != null) {
            if (obj instanceof d) {
                listenableFuture.cancel(((d) obj).f19993a);
            }
        } else if (listenableFuture.isDone()) {
            if (f20071f.E(this, null, j(listenableFuture))) {
                g(this, false);
                return true;
            }
        } else {
            i iVar = new i(this, listenableFuture);
            if (f20071f.E(this, null, iVar)) {
                try {
                    listenableFuture.b(iVar, m0.f20038a);
                    return true;
                } catch (Error | RuntimeException e3) {
                    try {
                        fVar = new f(e3);
                    } catch (Error | RuntimeException unused) {
                        fVar = f.f19997b;
                    }
                    f20071f.E(this, iVar, fVar);
                    return true;
                }
            }
            obj = this.f20073a;
            if (obj instanceof d) {
            }
        }
        return false;
    }

    public final boolean q() {
        Object obj = this.f20073a;
        return (obj instanceof d) && ((d) obj).f19993a;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00bf  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public String toString() {
        String strL;
        StringBuilder sb2 = new StringBuilder();
        if (getClass().getName().startsWith("com.google.common.util.concurrent.")) {
            sb2.append(getClass().getSimpleName());
        } else {
            sb2.append(getClass().getName());
        }
        sb2.append('@');
        sb2.append(Integer.toHexString(System.identityHashCode(this)));
        sb2.append("[status=");
        if (isCancelled()) {
            sb2.append("CANCELLED");
        } else if (isDone()) {
            d(sb2);
        } else {
            int length = sb2.length();
            sb2.append("PENDING");
            Object obj = this.f20073a;
            if (obj instanceof i) {
                sb2.append(", setFuture=[");
                ListenableFuture listenableFuture = ((i) obj).f20019b;
                try {
                    if (listenableFuture == this) {
                        sb2.append("this future");
                    } else {
                        sb2.append(listenableFuture);
                    }
                } catch (RuntimeException e3) {
                    e = e3;
                    sb2.append("Exception thrown from implementation: ");
                    sb2.append(e.getClass());
                    sb2.append("]");
                    if (isDone()) {
                    }
                    sb2.append("]");
                    return sb2.toString();
                } catch (StackOverflowError e11) {
                    e = e11;
                    sb2.append("Exception thrown from implementation: ");
                    sb2.append(e.getClass());
                    sb2.append("]");
                    if (isDone()) {
                    }
                    sb2.append("]");
                    return sb2.toString();
                }
                sb2.append("]");
            } else {
                try {
                    strL = l();
                    if (vk.l.a(strL)) {
                        strL = null;
                    }
                } catch (RuntimeException | StackOverflowError e12) {
                    strL = "Exception thrown from implementation: " + e12.getClass();
                }
                if (strL != null) {
                    b.c0.C(sb2, ", info=[", strL, "]");
                }
            }
            if (isDone()) {
                sb2.delete(length, sb2.length());
                d(sb2);
            }
        }
        sb2.append("]");
        return sb2.toString();
    }

    @Override // java.util.concurrent.Future
    public Object get() throws InterruptedException {
        Object obj;
        r rVar = r.f20066c;
        if (!Thread.interrupted()) {
            Object obj2 = this.f20073a;
            if ((obj2 != null) & (!(obj2 instanceof i))) {
                return i(obj2);
            }
            r rVar2 = this.f20075c;
            if (rVar2 != rVar) {
                r rVar3 = new r();
                do {
                    bh.g gVar = f20071f;
                    gVar.f0(rVar3, rVar2);
                    if (gVar.F(this, rVar2, rVar3)) {
                        do {
                            LockSupport.park(this);
                            if (!Thread.interrupted()) {
                                obj = this.f20073a;
                            } else {
                                m(rVar3);
                                throw new InterruptedException();
                            }
                        } while (!((obj != null) & (!(obj instanceof i))));
                        return i(obj);
                    }
                    rVar2 = this.f20075c;
                } while (rVar2 != rVar);
            }
            Object obj3 = this.f20073a;
            Objects.requireNonNull(obj3);
            return i(obj3);
        }
        throw new InterruptedException();
    }
}
