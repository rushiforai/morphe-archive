package t70;

import java.util.concurrent.CancellationException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.DispatchException;

/* loaded from: classes.dex */
public abstract class v0 extends a80.i {

    /* renamed from: c, reason: collision with root package name */
    public int f88870c;

    public v0(int i5) {
        super(0L, false);
        this.f88870c = i5;
    }

    public void d(CancellationException cancellationException) {
    }

    public abstract Continuation e();

    public Throwable f(Object obj) {
        v vVar = obj instanceof v ? (v) obj : null;
        if (vVar != null) {
            return vVar.f88869a;
        }
        return null;
    }

    public Object h(Object obj) {
        return obj;
    }

    public final void j(Throwable th2) {
        g0.a(e().getContext(), new d9.h("Fatal exception in coroutines machinery for " + this + ". Please read KDoc to 'handleFatalException' method and report this incident to maintainers", th2));
    }

    public abstract Object k();

    @Override // java.lang.Runnable
    public final void run() {
        try {
            Continuation continuationE = e();
            Intrinsics.e(continuationE, "null cannot be cast to non-null type kotlinx.coroutines.internal.DispatchedContinuation<T of kotlinx.coroutines.DispatchedTask>");
            y70.f fVar = (y70.f) continuationE;
            ContinuationImpl continuationImpl = fVar.f96794e;
            Object obj = fVar.f96796g;
            CoroutineContext context = continuationImpl.getContext();
            Object objC = y70.w.c(context, obj);
            r1 r1Var = null;
            r2 r2VarC = objC != y70.w.f96829a ? z.c(continuationImpl, context, objC) : null;
            try {
                CoroutineContext context2 = continuationImpl.getContext();
                Object objK = k();
                Throwable thF = f(objK);
                if (thF == null) {
                    int i5 = this.f88870c;
                    boolean z11 = true;
                    if (i5 != 1 && i5 != 2) {
                        z11 = false;
                    }
                    if (z11) {
                        r1Var = (r1) context2.get(q1.f88853a);
                    }
                }
                if (r1Var != null && !r1Var.b()) {
                    CancellationException cancellationExceptionH = r1Var.h();
                    d(cancellationExceptionH);
                    int i11 = Result.f71687b;
                    continuationImpl.resumeWith(ResultKt.a(cancellationExceptionH));
                } else if (thF != null) {
                    int i12 = Result.f71687b;
                    continuationImpl.resumeWith(ResultKt.a(thF));
                } else {
                    int i13 = Result.f71687b;
                    continuationImpl.resumeWith(h(objK));
                }
                Unit unit = Unit.f71706a;
                if (r2VarC == null || r2VarC.n0()) {
                    y70.w.a(context, objC);
                }
            } catch (Throwable th2) {
                if (r2VarC == null || r2VarC.n0()) {
                    y70.w.a(context, objC);
                }
                throw th2;
            }
        } catch (DispatchException e3) {
            g0.a(e().getContext(), e3.f72059a);
        } catch (Throwable th3) {
            j(th3);
        }
    }
}
