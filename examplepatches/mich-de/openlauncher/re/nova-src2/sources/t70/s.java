package t70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes.dex */
public final class s extends x1 implements r {
    public s(r1 r1Var) {
        super(true);
        U(r1Var);
    }

    public final boolean j0(Throwable th2) {
        return X(new v(false, th2));
    }

    @Override // t70.p0
    public final Object l(Continuation continuation) {
        Object objY = y(continuation);
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objY;
    }
}
