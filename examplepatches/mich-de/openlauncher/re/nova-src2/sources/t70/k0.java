package t70;

import java.util.concurrent.CancellationException;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public abstract class k0 {
    public static final y70.d a(CoroutineContext coroutineContext) {
        if (coroutineContext.get(q1.f88853a) == null) {
            coroutineContext = coroutineContext.plus(m0.c());
        }
        return new y70.d(coroutineContext);
    }

    public static final y70.d b() {
        i2 i2VarD = m0.d();
        a80.e eVar = y0.f88884a;
        return new y70.d(CoroutineContext.Element.DefaultImpls.d(i2VarD, y70.o.f96819a));
    }

    public static final void c(j0 j0Var, CancellationException cancellationException) {
        r1 r1Var = (r1) j0Var.getCoroutineContext().get(q1.f88853a);
        if (r1Var != null) {
            r1Var.c(cancellationException);
        } else {
            throw new IllegalStateException(("Scope cannot be cancelled because it does not have a job: " + j0Var).toString());
        }
    }

    public static final Object d(Function2 function2, Continuation continuation) {
        y70.s sVar = new y70.s(continuation, continuation.getContext());
        Object objR = w20.e.r(sVar, true, sVar, function2);
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objR;
    }

    public static final void e(j0 j0Var) {
        m0.k(j0Var.getCoroutineContext());
    }

    public static final boolean f(j0 j0Var) {
        r1 r1Var = (r1) j0Var.getCoroutineContext().get(q1.f88853a);
        if (r1Var != null) {
            return r1Var.b();
        }
        return true;
    }
}
