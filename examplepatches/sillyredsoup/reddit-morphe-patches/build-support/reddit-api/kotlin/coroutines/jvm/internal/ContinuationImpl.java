package kotlin.coroutines.jvm.internal;

import kotlin.coroutines.CoroutineContext;
import wl3.a;

/** Compile-time shape of Reddit's continuation base. Never packaged. */
public abstract class ContinuationImpl implements a<Object> {
    private final a<Object> completion;
    public ContinuationImpl(a<Object> completion) { this.completion = completion; }
    @Override public CoroutineContext getContext() { return null; }
    @Override public void resumeWith(Object result) {}
    protected abstract Object invokeSuspend(Object result);
}
