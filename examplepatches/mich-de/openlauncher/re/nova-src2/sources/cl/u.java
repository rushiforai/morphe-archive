package cl;

import com.google.common.util.concurrent.ListenableFuture;

/* loaded from: classes.dex */
public final class u extends w {
    @Override // cl.w
    public final Object s(Object obj, Object obj2) {
        d0 d0Var = (d0) obj;
        ListenableFuture listenableFutureApply = d0Var.apply(obj2);
        vk.b0.f(listenableFutureApply, "AsyncFunction.apply returned null instead of a Future. Did you mean to return immediateFuture(null)? %s", d0Var);
        return listenableFutureApply;
    }

    @Override // cl.w
    public final void t(Object obj) {
        p((ListenableFuture) obj);
    }
}
