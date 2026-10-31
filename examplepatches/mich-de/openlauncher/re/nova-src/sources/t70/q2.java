package t70;

import kotlin.coroutines.CoroutineContext;

/* loaded from: classes.dex */
public final class q2 extends c0 {

    /* renamed from: c, reason: collision with root package name */
    public static final q2 f88854c = new q2();

    @Override // t70.c0
    public final void c0(CoroutineContext coroutineContext, Runnable runnable) {
        v2 v2Var = (v2) coroutineContext.get(v2.f88875c);
        if (v2Var == null) {
            throw new UnsupportedOperationException("Dispatchers.Unconfined.dispatch function can only be used by the yield function. If you wrap Unconfined dispatcher in your code, make sure you properly delegate isDispatchNeeded and dispatch calls.");
        }
        v2Var.f88876b = true;
    }

    @Override // t70.c0
    public final c0 f0(int i5, String str) {
        throw new UnsupportedOperationException("limitedParallelism is not supported for Dispatchers.Unconfined");
    }

    @Override // t70.c0
    public final String toString() {
        return "Dispatchers.Unconfined";
    }
}
