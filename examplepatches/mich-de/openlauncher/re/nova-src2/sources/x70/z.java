package x70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;

/* loaded from: classes5.dex */
public final class z implements Continuation, CoroutineStackFrame {

    /* renamed from: a, reason: collision with root package name */
    public final Continuation f95276a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f95277b;

    public z(Continuation continuation, CoroutineContext coroutineContext) {
        this.f95276a = continuation;
        this.f95277b = coroutineContext;
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    public final CoroutineStackFrame getCallerFrame() {
        Continuation continuation = this.f95276a;
        if (continuation instanceof CoroutineStackFrame) {
            return (CoroutineStackFrame) continuation;
        }
        return null;
    }

    @Override // kotlin.coroutines.Continuation
    public final CoroutineContext getContext() {
        return this.f95277b;
    }

    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(Object obj) {
        this.f95276a.resumeWith(obj);
    }
}
