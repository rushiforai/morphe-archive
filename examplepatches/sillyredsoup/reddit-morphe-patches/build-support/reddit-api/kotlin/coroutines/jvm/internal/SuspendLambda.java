package kotlin.coroutines.jvm.internal;

import wl3.a;

/** Compile-time shape of Reddit's suspend lambda base. Never packaged. */
public abstract class SuspendLambda extends ContinuationImpl {
    public SuspendLambda(int arity, a<Object> completion) { super(completion); }
}
