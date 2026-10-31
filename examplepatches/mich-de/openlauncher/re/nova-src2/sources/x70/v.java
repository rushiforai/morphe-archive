package x70;

import e10.j2;
import kotlin.Result;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes.dex */
public final class v extends ContinuationImpl implements w70.n {

    /* renamed from: t, reason: collision with root package name */
    public final w70.n f95268t;

    /* renamed from: u, reason: collision with root package name */
    public final CoroutineContext f95269u;

    /* renamed from: v, reason: collision with root package name */
    public final int f95270v;

    /* renamed from: w, reason: collision with root package name */
    public CoroutineContext f95271w;

    /* renamed from: x, reason: collision with root package name */
    public Continuation f95272x;

    public v(w70.n nVar, CoroutineContext coroutineContext) {
        super(t.f95265a, EmptyCoroutineContext.f71803a);
        this.f95268t = nVar;
        this.f95269u = coroutineContext;
        this.f95270v = ((Number) coroutineContext.fold(0, new m3.a0(14))).intValue();
    }

    public final Object e(Continuation continuation, Object obj) {
        CoroutineContext context = continuation.getContext();
        m0.k(context);
        CoroutineContext coroutineContext = this.f95271w;
        if (coroutineContext != context) {
            if (coroutineContext instanceof r) {
                throw new IllegalStateException(r70.f.o0("\n            Flow exception transparency is violated:\n                Previous 'emit' call has thrown exception " + ((r) coroutineContext).f95264b + ", but then emission attempt of value '" + obj + "' has been detected.\n                Emissions from 'catch' blocks are prohibited in order to avoid unspecified behaviour, 'Flow.catch' operator can be used instead.\n                For a more detailed explanation, please refer to Flow documentation.\n            ").toString());
            }
            if (((Number) context.fold(0, new j2(this, 13))).intValue() != this.f95270v) {
                throw new IllegalStateException(("Flow invariant is violated:\n\t\tFlow was collected in " + this.f95269u + ",\n\t\tbut emission happened in " + context + ".\n\t\tPlease refer to 'flow' documentation or use 'flowOn' instead").toString());
            }
            this.f95271w = context;
        }
        this.f95272x = continuation;
        Function3 function3 = x.f95274a;
        w70.n nVar = this.f95268t;
        Intrinsics.e(nVar, "null cannot be cast to non-null type kotlinx.coroutines.flow.FlowCollector<kotlin.Any?>");
        Object objInvoke = function3.invoke(nVar, obj, this);
        if (!Intrinsics.b(objInvoke, CoroutineSingletons.f71806a)) {
            this.f95272x = null;
        }
        return objInvoke;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        try {
            Object objE = e(continuation, obj);
            return objE == CoroutineSingletons.f71806a ? objE : Unit.f71706a;
        } catch (Throwable th2) {
            this.f95271w = new r(continuation.getContext(), th2);
            throw th2;
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl, kotlin.coroutines.jvm.internal.CoroutineStackFrame
    public final CoroutineStackFrame getCallerFrame() {
        Continuation continuation = this.f95272x;
        if (continuation instanceof CoroutineStackFrame) {
            return (CoroutineStackFrame) continuation;
        }
        return null;
    }

    @Override // kotlin.coroutines.jvm.internal.ContinuationImpl, kotlin.coroutines.Continuation
    public final CoroutineContext getContext() {
        CoroutineContext coroutineContext = this.f95271w;
        return coroutineContext == null ? EmptyCoroutineContext.f71803a : coroutineContext;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final StackTraceElement getStackTraceElement() {
        return null;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Throwable thA = Result.a(obj);
        if (thA != null) {
            this.f95271w = new r(getContext(), thA);
        }
        Continuation continuation = this.f95272x;
        if (continuation != null) {
            continuation.resumeWith(obj);
        }
        return CoroutineSingletons.f71806a;
    }
}
