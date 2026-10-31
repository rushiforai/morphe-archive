package t70;

import java.util.concurrent.Executor;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlinx.coroutines.DispatchException;

/* loaded from: classes.dex */
public final class x0 implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public final c0 f88881a;

    public x0(c0 c0Var) {
        this.f88881a = c0Var;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) throws DispatchException {
        EmptyCoroutineContext emptyCoroutineContext = EmptyCoroutineContext.f71803a;
        c0 c0Var = this.f88881a;
        if (y70.g.f(c0Var, emptyCoroutineContext)) {
            y70.g.e(c0Var, emptyCoroutineContext, runnable);
        } else {
            runnable.run();
        }
    }

    public final String toString() {
        return this.f88881a.toString();
    }
}
