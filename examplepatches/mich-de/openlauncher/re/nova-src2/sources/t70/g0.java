package t70;

import kotlin.ExceptionsKt;
import kotlin.coroutines.CoroutineContext;
import kotlinx.coroutines.DispatchException;

/* loaded from: classes.dex */
public abstract class g0 {
    public static final void a(CoroutineContext coroutineContext, Throwable th2) {
        if (th2 instanceof DispatchException) {
            th2 = ((DispatchException) th2).f72059a;
        }
        try {
            f0 f0Var = (f0) coroutineContext.get(e0.f88787a);
            if (f0Var != null) {
                f0Var.handleException(coroutineContext, th2);
            } else {
                pg.p.m(coroutineContext, th2);
            }
        } catch (Throwable th3) {
            if (th2 != th3) {
                RuntimeException runtimeException = new RuntimeException("Exception while trying to handle coroutine exception", th3);
                ExceptionsKt.a(runtimeException, th2);
                th2 = runtimeException;
            }
            pg.p.m(coroutineContext, th2);
        }
    }
}
