package kotlin.coroutines.jvm.internal;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
/** Compile-only reference to the exact shipped superclass. */
public abstract class ContinuationImpl implements Continuation {
    public ContinuationImpl(Continuation completion, CoroutineContext context) {}
    public CoroutineContext getContext() { throw new AssertionError("Compile stub"); }
    public final void resumeWith(Object value) { throw new AssertionError("Compile stub"); }
    protected abstract Object invokeSuspend(Object result);
}
