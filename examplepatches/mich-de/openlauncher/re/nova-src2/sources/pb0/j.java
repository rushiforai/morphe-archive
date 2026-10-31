package pb0;

import java.util.concurrent.Future;

/* loaded from: classes5.dex */
public final class j implements ib0.i {

    /* renamed from: a, reason: collision with root package name */
    public final Future f82529a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l f82530b;

    public j(l lVar, Future future) {
        this.f82530b = lVar;
        this.f82529a = future;
    }

    @Override // ib0.i
    public final boolean a() {
        return this.f82529a.isCancelled();
    }

    @Override // ib0.i
    public final void b() {
        Object obj = this.f82530b.get();
        Thread threadCurrentThread = Thread.currentThread();
        Future future = this.f82529a;
        if (obj != threadCurrentThread) {
            future.cancel(true);
        } else {
            future.cancel(false);
        }
    }
}
