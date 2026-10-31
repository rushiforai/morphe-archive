package pb0;

import java.util.LinkedList;
import java.util.concurrent.atomic.AtomicReference;
import rx.exceptions.OnErrorNotImplementedException;

/* loaded from: classes5.dex */
public final class l extends AtomicReference implements Runnable, ib0.i {

    /* renamed from: a, reason: collision with root package name */
    public final rb0.h f82534a;

    /* renamed from: b, reason: collision with root package name */
    public final mb0.a f82535b;

    public l(mb0.a aVar) {
        this.f82535b = aVar;
        this.f82534a = new rb0.h();
    }

    @Override // ib0.i
    public final boolean a() {
        return this.f82534a.f85789b;
    }

    @Override // ib0.i
    public final void b() {
        if (this.f82534a.f85789b) {
            return;
        }
        this.f82534a.b();
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            try {
                lazySet(Thread.currentThread());
                this.f82535b.call();
            } finally {
                b();
            }
        } catch (OnErrorNotImplementedException e3) {
            IllegalStateException illegalStateException = new IllegalStateException("Exception thrown on Scheduler.Worker thread. Add `onError` handling.", e3);
            ub0.a.a(illegalStateException);
            Thread threadCurrentThread = Thread.currentThread();
            threadCurrentThread.getUncaughtExceptionHandler().uncaughtException(threadCurrentThread, illegalStateException);
        } catch (Throwable th2) {
            IllegalStateException illegalStateException2 = new IllegalStateException("Fatal Exception thrown on Scheduler.Worker thread.", th2);
            ub0.a.a(illegalStateException2);
            Thread threadCurrentThread2 = Thread.currentThread();
            threadCurrentThread2.getUncaughtExceptionHandler().uncaughtException(threadCurrentThread2, illegalStateException2);
        }
    }

    public l(mb0.a aVar, rb0.h hVar) {
        this.f82535b = aVar;
        k kVar = new k(this, hVar, 0);
        rb0.h hVar2 = new rb0.h();
        LinkedList linkedList = new LinkedList();
        hVar2.f85788a = linkedList;
        linkedList.add(kVar);
        this.f82534a = hVar2;
    }
}
