package t70;

import java.util.concurrent.locks.LockSupport;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g extends a {

    /* renamed from: d, reason: collision with root package name */
    public final Thread f88794d;

    /* renamed from: e, reason: collision with root package name */
    public final i1 f88795e;

    public g(CoroutineContext coroutineContext, Thread thread, i1 i1Var) {
        super(coroutineContext, true);
        this.f88794d = thread;
        this.f88795e = i1Var;
    }

    @Override // t70.x1
    public final void u(Object obj) {
        Thread threadCurrentThread = Thread.currentThread();
        Thread thread = this.f88794d;
        if (Intrinsics.b(threadCurrentThread, thread)) {
            return;
        }
        LockSupport.unpark(thread);
    }
}
