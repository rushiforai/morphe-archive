package t70;

import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class w0 {
    public static final void a(m mVar, Continuation continuation, boolean z11) {
        Object objH;
        Object obj = m.f88821g.get(mVar);
        Throwable thF = mVar.f(obj);
        if (thF != null) {
            int i5 = Result.f71687b;
            objH = ResultKt.a(thF);
        } else {
            int i11 = Result.f71687b;
            objH = mVar.h(obj);
        }
        if (!z11) {
            continuation.resumeWith(objH);
            return;
        }
        Intrinsics.e(continuation, "null cannot be cast to non-null type kotlinx.coroutines.internal.DispatchedContinuation<T of kotlinx.coroutines.DispatchedTaskKt.resume>");
        y70.f fVar = (y70.f) continuation;
        ContinuationImpl continuationImpl = fVar.f96794e;
        Object obj2 = fVar.f96796g;
        CoroutineContext context = continuationImpl.getContext();
        Object objC = y70.w.c(context, obj2);
        r2 r2VarC = objC != y70.w.f96829a ? z.c(continuationImpl, context, objC) : null;
        try {
            continuationImpl.resumeWith(objH);
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
    }
}
