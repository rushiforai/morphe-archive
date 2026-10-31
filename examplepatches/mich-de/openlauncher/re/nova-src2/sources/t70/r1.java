package t70;

import java.util.concurrent.CancellationException;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.sequences.Sequence;

/* loaded from: classes.dex */
public interface r1 extends CoroutineContext.Element {
    Object K(Continuation continuation);

    p M(x1 x1Var);

    a1 P(Function1 function1, boolean z11, boolean z12);

    boolean b();

    void c(CancellationException cancellationException);

    Sequence f();

    CancellationException h();

    boolean isCancelled();

    boolean isCompleted();

    boolean start();

    a1 w(Function1 function1);
}
