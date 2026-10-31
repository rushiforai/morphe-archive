package p1;

import kotlin.coroutines.CoroutineContext;

/* loaded from: classes.dex */
public abstract class b1 {
    public static final a1 a(CoroutineContext coroutineContext) {
        a1 a1Var = (a1) coroutineContext.get(z0.f81690a);
        if (a1Var != null) {
            return a1Var;
        }
        throw new IllegalStateException("A MonotonicFrameClock is not available in this CoroutineContext. Callers should supply an appropriate MonotonicFrameClock using withContext.");
    }
}
