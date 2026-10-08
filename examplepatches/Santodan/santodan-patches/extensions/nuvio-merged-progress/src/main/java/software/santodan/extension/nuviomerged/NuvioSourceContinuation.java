package software.santodan.extension.nuviomerged;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/** Adapts a coroutine completion to Nuvio's optimized ContinuationImpl parameter. */
public final class NuvioSourceContinuation extends ContinuationImpl {
    public NuvioSourceContinuation(Continuation<Object> completion) { super(completion); }
    @Override protected Object invokeSuspend(Object result) { return result; }
}
