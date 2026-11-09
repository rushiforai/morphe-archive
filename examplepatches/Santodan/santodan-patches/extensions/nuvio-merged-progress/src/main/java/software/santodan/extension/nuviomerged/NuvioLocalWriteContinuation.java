package software.santodan.extension.nuviomerged;

import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;

/** Observe successful native persistence, including synchronous and suspended completion. */
public final class NuvioLocalWriteContinuation extends ContinuationImpl {
    /** Original beta.13 state machines re-enter the wrapper with placeholder arguments. */
    public static String nativeState(String method) {
        switch (method) {
            case "C": return "com.nuvio.tv.data.local.wb";
            case "D": return "com.nuvio.tv.data.local.xb";
            case "A": return "com.nuvio.tv.data.local.ub";
            case "B": return "com.nuvio.tv.data.local.vb";
            default: return null;
        }
    }
    public static Continuation<Object> observe(String method, Continuation<Object> completion,
            Function1<Continuation<Object>, Object> saved) {
        if (completion.getClass().getName().equals(nativeState(method))) return completion;
        return new NuvioLocalWriteContinuation(completion, saved);
    }
    private final Function1<Continuation<Object>, Object> saved;
    private final AtomicBoolean finished = new AtomicBoolean();
    public NuvioLocalWriteContinuation(Continuation<Object> completion, Function1<Continuation<Object>, Object> saved) {
        super(completion);
        this.saved = saved;
    }
    public Object inlineResult(Object result) {
        if (result != IntrinsicsKt.getCOROUTINE_SUSPENDED()) return succeeded(result);
        return result;
    }
    private Object succeeded(Object result) {
        ResultKt.throwOnFailure(result);
        if (finished.compareAndSet(false, true)) return saved.invoke(intercepted());
        return result;
    }
    @Override protected Object invokeSuspend(Object result) {
        return succeeded(result);
    }
}
