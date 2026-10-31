package t70;

import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.BaseContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlinx.coroutines.CompletionHandlerException;
import kotlinx.coroutines.DispatchException;

/* loaded from: classes.dex */
public abstract class a extends x1 implements Continuation, j0 {

    /* renamed from: c, reason: collision with root package name */
    public final CoroutineContext f88769c;

    public a(CoroutineContext coroutineContext, boolean z11) {
        super(z11);
        U((r1) coroutineContext.get(q1.f88853a));
        this.f88769c = coroutineContext.plus(this);
    }

    @Override // t70.x1
    public final String E() {
        return getClass().getSimpleName().concat(" was cancelled");
    }

    @Override // t70.x1
    public final void T(CompletionHandlerException completionHandlerException) {
        g0.a(this.f88769c, completionHandlerException);
    }

    @Override // t70.x1
    public final void c0(Object obj) {
        if (!(obj instanceof v)) {
            k0(obj);
            return;
        }
        v vVar = (v) obj;
        j0(v.f88868b.get(vVar) == 1, vVar.f88869a);
    }

    @Override // kotlin.coroutines.Continuation
    public final CoroutineContext getContext() {
        return this.f88769c;
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f88769c;
    }

    public void j0(boolean z11, Throwable th2) {
    }

    public void k0(Object obj) {
    }

    public final void l0(l0 l0Var, a aVar, Function2 function2) {
        Object objInvoke;
        int iOrdinal = l0Var.ordinal();
        if (iOrdinal == 0) {
            z70.a.b(function2, aVar, this);
            return;
        }
        if (iOrdinal != 1) {
            if (iOrdinal == 2) {
                Intrinsics.g(function2, "<this>");
                Continuation continuationB = IntrinsicsKt.b(IntrinsicsKt.a(aVar, this, function2));
                int i5 = Result.f71687b;
                continuationB.resumeWith(Unit.f71706a);
                return;
            }
            if (iOrdinal != 3) {
                throw new NoWhenBranchMatchedException();
            }
            try {
                CoroutineContext coroutineContext = this.f88769c;
                Object objC = y70.w.c(coroutineContext, null);
                try {
                    if (function2 instanceof BaseContinuationImpl) {
                        TypeIntrinsics.e(2, function2);
                        objInvoke = function2.invoke(aVar, this);
                    } else {
                        objInvoke = IntrinsicsKt.c(aVar, this, function2);
                    }
                    y70.w.a(coroutineContext, objC);
                    if (objInvoke != CoroutineSingletons.f71806a) {
                        int i11 = Result.f71687b;
                        resumeWith(objInvoke);
                    }
                } catch (Throwable th2) {
                    y70.w.a(coroutineContext, objC);
                    throw th2;
                }
            } catch (Throwable th3) {
                th = th3;
                if (th instanceof DispatchException) {
                    th = ((DispatchException) th).f72059a;
                }
                int i12 = Result.f71687b;
                resumeWith(ResultKt.a(th));
            }
        }
    }

    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(Object obj) {
        Throwable thA = Result.a(obj);
        if (thA != null) {
            obj = new v(false, thA);
        }
        Object objY = Y(obj);
        if (objY == m0.f88829e) {
            return;
        }
        v(objY);
    }
}
