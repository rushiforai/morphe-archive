package kb0;

import android.os.Handler;
import ib0.i;
import rx.exceptions.OnErrorNotImplementedException;

/* loaded from: classes5.dex */
public final class c implements Runnable, i {

    /* renamed from: a, reason: collision with root package name */
    public final mb0.a f71319a;

    /* renamed from: b, reason: collision with root package name */
    public final Handler f71320b;

    /* renamed from: c, reason: collision with root package name */
    public volatile boolean f71321c;

    public c(mb0.a aVar, Handler handler) {
        this.f71319a = aVar;
        this.f71320b = handler;
    }

    @Override // ib0.i
    public final boolean a() {
        return this.f71321c;
    }

    @Override // ib0.i
    public final void b() {
        this.f71321c = true;
        this.f71320b.removeCallbacks(this);
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            this.f71319a.call();
        } catch (Throwable th2) {
            IllegalStateException illegalStateException = th2 instanceof OnErrorNotImplementedException ? new IllegalStateException("Exception thrown on Scheduler.Worker thread. Add `onError` handling.", th2) : new IllegalStateException("Fatal Exception thrown on Scheduler.Worker thread.", th2);
            ub0.d.f90783d.a().getClass();
            Thread threadCurrentThread = Thread.currentThread();
            threadCurrentThread.getUncaughtExceptionHandler().uncaughtException(threadCurrentThread, illegalStateException);
        }
    }
}
