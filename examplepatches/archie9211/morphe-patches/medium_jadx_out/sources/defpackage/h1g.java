package defpackage;

import j$.util.Objects;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.LockSupport;
import java.util.logging.Level;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class h1g extends vzf implements x0g {
    public x0g h;
    public ScheduledFuture i;

    public static Object e(Object obj) throws ExecutionException {
        if (obj instanceof kzf) {
            CancellationException cancellationException = new CancellationException("Task was cancelled.");
            cancellationException.initCause(((kzf) obj).b);
            throw cancellationException;
        }
        if (obj instanceof mzf) {
            throw new ExecutionException(((mzf) obj).a);
        }
        if (obj == vzf.d) {
            return null;
        }
        return obj;
    }

    public static boolean g(Object obj) {
        return !(obj instanceof lzf);
    }

    public static Object h(x0g x0gVar) {
        Object obj;
        Throwable thD;
        if (x0gVar instanceof h1g) {
            Object kzfVar = ((h1g) x0gVar).a;
            if (kzfVar instanceof kzf) {
                kzf kzfVar2 = (kzf) kzfVar;
                if (kzfVar2.a) {
                    Throwable th = kzfVar2.b;
                    kzfVar = th != null ? new kzf(th, false) : kzf.d;
                }
            }
            Objects.requireNonNull(kzfVar);
            return kzfVar;
        }
        if ((x0gVar instanceof vzf) && (thD = ((vzf) x0gVar).d()) != null) {
            return new mzf(thD);
        }
        boolean zIsCancelled = x0gVar.isCancelled();
        boolean z = true;
        if ((!vzf.f) && zIsCancelled) {
            kzf kzfVar3 = kzf.d;
            Objects.requireNonNull(kzfVar3);
            return kzfVar3;
        }
        boolean z2 = false;
        while (true) {
            try {
                try {
                    try {
                        obj = x0gVar.get();
                        break;
                    } catch (Error e) {
                        e = e;
                        return new mzf(e);
                    }
                } catch (InterruptedException unused) {
                    z2 = z;
                } catch (Throwable th2) {
                    if (z2) {
                        Thread.currentThread().interrupt();
                    }
                    throw th2;
                }
            } catch (Error | Exception e2) {
                e = e2;
                return new mzf(e);
            } catch (CancellationException e3) {
                return !zIsCancelled ? new mzf(new IllegalArgumentException("get() threw CancellationException, despite reporting isCancelled() == false: ".concat(String.valueOf(x0gVar)), e3)) : new kzf(e3, false);
            } catch (ExecutionException e4) {
                return zIsCancelled ? new kzf(new IllegalArgumentException("get() did not throw CancellationException, despite reporting isCancelled() == true: ".concat(String.valueOf(x0gVar)), e4), false) : new mzf(e4.getCause());
            }
        }
        if (z2) {
            Thread.currentThread().interrupt();
        }
        return zIsCancelled ? new kzf(new IllegalArgumentException("get() did not throw CancellationException, despite reporting isCancelled() == true: ".concat(String.valueOf(x0gVar))), false) : obj == null ? vzf.d : obj;
    }

    public static void j(h1g h1gVar) {
        nzf nzfVar;
        nzf nzfVar2 = null;
        while (true) {
            h1gVar.getClass();
            for (tzf tzfVarK = vzf.g.K(h1gVar); tzfVarK != null; tzfVarK = tzfVarK.b) {
                Thread thread = tzfVarK.a;
                if (thread != null) {
                    tzfVarK.a = null;
                    LockSupport.unpark(thread);
                }
            }
            x0g x0gVar = h1gVar.h;
            if ((h1gVar.a instanceof kzf) & (x0gVar != null)) {
                Object obj = h1gVar.a;
                x0gVar.cancel((obj instanceof kzf) && ((kzf) obj).a);
            }
            ScheduledFuture scheduledFuture = h1gVar.i;
            if (scheduledFuture != null) {
                scheduledFuture.cancel(false);
            }
            h1gVar.h = null;
            h1gVar.i = null;
            nzf nzfVar3 = nzfVar2;
            nzf nzfVarG = vzf.g.G(h1gVar);
            nzf nzfVar4 = nzfVar3;
            while (nzfVarG != null) {
                nzf nzfVar5 = nzfVarG.c;
                nzfVarG.c = nzfVar4;
                nzfVar4 = nzfVarG;
                nzfVarG = nzfVar5;
            }
            while (nzfVar4 != null) {
                Runnable runnable = nzfVar4.a;
                nzfVar = nzfVar4.c;
                Objects.requireNonNull(runnable);
                if (runnable instanceof lzf) {
                    lzf lzfVar = (lzf) runnable;
                    h1gVar = lzfVar.a;
                    if (h1gVar.a == lzfVar) {
                        if (vzf.g.O(h1gVar, lzfVar, h(lzfVar.b))) {
                            break;
                        }
                    } else {
                        continue;
                    }
                } else {
                    Executor executor = nzfVar4.b;
                    Objects.requireNonNull(executor);
                    k(runnable, executor);
                }
                nzfVar4 = nzfVar;
            }
            return;
            nzfVar2 = nzfVar;
        }
    }

    public static void k(Runnable runnable, Executor executor) {
        try {
            executor.execute(runnable);
        } catch (Exception e) {
            vzf.e.a().logp(Level.SEVERE, "com.google.common.util.concurrent.AbstractFuture", "executeListener", lv8.r("RuntimeException while executing runnable ", String.valueOf(runnable), " with executor ", String.valueOf(executor)), (Throwable) e);
        }
    }

    @Override // defpackage.x0g
    public final void b(Runnable runnable, Executor executor) {
        nzf nzfVar;
        nzf nzfVar2 = nzf.d;
        if (executor == null) {
            z72.c("Executor was null.");
            return;
        }
        if (!isDone() && (nzfVar = this.b) != nzfVar2) {
            nzf nzfVar3 = new nzf(runnable, executor);
            do {
                nzfVar3.c = nzfVar;
                if (vzf.g.N(this, nzfVar, nzfVar3)) {
                    return;
                } else {
                    nzfVar = this.b;
                }
            } while (nzfVar != nzfVar2);
        }
        k(runnable, executor);
    }

    @Override // java.util.concurrent.Future
    public final boolean cancel(boolean z) {
        kzf kzfVar;
        Object obj = this.a;
        if (!(obj instanceof lzf) && !(obj == null)) {
            return false;
        }
        if (vzf.f) {
            kzfVar = new kzf(new CancellationException("Future.cancel() was called."), z);
        } else {
            kzfVar = z ? kzf.c : kzf.d;
            Objects.requireNonNull(kzfVar);
        }
        boolean z2 = false;
        while (true) {
            if (vzf.g.O(this, obj, kzfVar)) {
                j(this);
                if (!(obj instanceof lzf)) {
                    break;
                }
                x0g x0gVar = ((lzf) obj).b;
                if (!(x0gVar instanceof h1g)) {
                    x0gVar.cancel(z);
                    break;
                }
                this = (h1g) x0gVar;
                obj = this.a;
                if (!(obj == null) && !(obj instanceof lzf)) {
                    break;
                }
                z2 = true;
            } else {
                obj = this.a;
                if (g(obj)) {
                    return z2;
                }
            }
        }
        return true;
    }

    @Override // defpackage.vzf
    public final Throwable d() {
        if (!(this instanceof h1g)) {
            return null;
        }
        Object obj = this.a;
        if (obj instanceof mzf) {
            return ((mzf) obj).a;
        }
        return null;
    }

    public final String f() {
        x0g x0gVar = this.h;
        ScheduledFuture scheduledFuture = this.i;
        if (x0gVar == null) {
            return null;
        }
        String strX = ev6.x("inputFuture=[", x0gVar.toString(), "]");
        if (scheduledFuture != null) {
            long delay = scheduledFuture.getDelay(TimeUnit.MILLISECONDS);
            if (delay > 0) {
                return strX + ", remaining delay=[" + delay + " ms]";
            }
        }
        return strX;
    }

    public final void i(StringBuilder sb) {
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
            } catch (ExecutionException e) {
                sb.append("FAILURE, cause=[");
                sb.append(e.getCause());
                sb.append("]");
                return;
            } catch (Exception e2) {
                sb.append("UNKNOWN, cause=[");
                sb.append(e2.getClass());
                sb.append(" thrown from get()]");
                return;
            }
        }
        if (z) {
            Thread.currentThread().interrupt();
        }
        sb.append("SUCCESS, result=[");
        if (obj == null) {
            sb.append("null");
        } else if (obj == this) {
            sb.append("this future");
        } else {
            sb.append(obj.getClass().getName());
            sb.append("@");
            sb.append(Integer.toHexString(System.identityHashCode(obj)));
        }
        sb.append("]");
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.a instanceof kzf;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        Object obj = this.a;
        return (obj != null) & g(obj);
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x00ae  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String toString() {
        /*
            Method dump skipped, instruction units count: 240
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.h1g.toString():java.lang.String");
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00cd  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:60:0x00c0 -> B:37:0x0080). Please report as a decompilation issue!!! */
    @Override // java.util.concurrent.Future
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object get(long r20, java.util.concurrent.TimeUnit r22) throws java.lang.InterruptedException, java.util.concurrent.TimeoutException {
        /*
            Method dump skipped, instruction units count: 369
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.h1g.get(long, java.util.concurrent.TimeUnit):java.lang.Object");
    }

    @Override // java.util.concurrent.Future
    public final Object get() throws InterruptedException {
        Object obj;
        tzf tzfVar = tzf.c;
        if (!Thread.interrupted()) {
            Object obj2 = this.a;
            if ((obj2 != null) & g(obj2)) {
                return e(obj2);
            }
            tzf tzfVar2 = this.c;
            if (tzfVar2 != tzfVar) {
                tzf tzfVar3 = new tzf();
                do {
                    ur7 ur7Var = vzf.g;
                    ur7Var.L(tzfVar3, tzfVar2);
                    if (ur7Var.P(this, tzfVar2, tzfVar3)) {
                        do {
                            LockSupport.park(this);
                            if (!Thread.interrupted()) {
                                obj = this.a;
                            } else {
                                c(tzfVar3);
                                throw new InterruptedException();
                            }
                        } while (!((obj != null) & g(obj)));
                        return e(obj);
                    }
                    tzfVar2 = this.c;
                } while (tzfVar2 != tzfVar);
            }
            Object obj3 = this.a;
            Objects.requireNonNull(obj3);
            return e(obj3);
        }
        throw new InterruptedException();
    }
}
