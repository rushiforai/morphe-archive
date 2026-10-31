package p1;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public interface a1 extends CoroutineContext.Element {
    @Override // kotlin.coroutines.CoroutineContext.Element
    default CoroutineContext.Key getKey() {
        return z0.f81690a;
    }

    Object s(Function1 function1, Continuation continuation);
}
