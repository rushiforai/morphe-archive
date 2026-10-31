package cl;

import com.google.common.util.concurrent.ListenableFuture;

/* loaded from: classes3.dex */
public final class a extends c {
    @Override // cl.c
    public final Object u(Object obj, Throwable th2) {
        d0 d0Var = (d0) obj;
        ListenableFuture listenableFutureApply = d0Var.apply(th2);
        vk.b0.f(listenableFutureApply, "AsyncFunction.apply returned null instead of a Future. Did you mean to return immediateFuture(null)? %s", d0Var);
        return listenableFutureApply;
    }

    @Override // cl.c
    public final void v(Object obj) {
        p((ListenableFuture) obj);
    }
}
