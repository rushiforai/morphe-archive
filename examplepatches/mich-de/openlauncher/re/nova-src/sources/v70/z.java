package v70;

import java.util.concurrent.CancellationException;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.SuspendLambda;

/* loaded from: classes.dex */
public interface z {
    void c(CancellationException cancellationException);

    n iterator();

    x7.h k();

    Object m(SuspendLambda suspendLambda);

    Object n();

    Object q(Continuation continuation);
}
