package kotlin.coroutines.intrinsics;

import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.jvm.internal.BaseContinuationImpl;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.RestrictedContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;

@Metadata(d1 = {"kotlin/coroutines/intrinsics/IntrinsicsKt", "kotlin/coroutines/intrinsics/IntrinsicsKt"}, d2 = {}, k = 4, mv = {2, 1, 0}, xi = 49)
/* loaded from: classes.dex */
public final class IntrinsicsKt {
    private IntrinsicsKt() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static Continuation a(final Continuation continuation, final Continuation continuation2, final Function2 function2) {
        Intrinsics.g(function2, "<this>");
        if (function2 instanceof BaseContinuationImpl) {
            return ((BaseContinuationImpl) function2).create(continuation, continuation2);
        }
        final CoroutineContext context = continuation2.getContext();
        return context == EmptyCoroutineContext.f71803a ? new RestrictedContinuationImpl(continuation2) { // from class: kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$3

            /* renamed from: t, reason: collision with root package name */
            public int f71814t;

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final Object invokeSuspend(Object obj) {
                int i5 = this.f71814t;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("This coroutine had already completed");
                    }
                    this.f71814t = 2;
                    ResultKt.b(obj);
                    return obj;
                }
                this.f71814t = 1;
                ResultKt.b(obj);
                Function2 function22 = function2;
                Intrinsics.e(function22, "null cannot be cast to non-null type kotlin.Function2<R of kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsJvmKt.createCoroutineUnintercepted, kotlin.coroutines.Continuation<T of kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsJvmKt.createCoroutineUnintercepted>, kotlin.Any?>");
                TypeIntrinsics.e(2, function22);
                return function22.invoke(continuation, this);
            }
        } : new ContinuationImpl(continuation2, context) { // from class: kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$4

            /* renamed from: t, reason: collision with root package name */
            public int f71817t;

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final Object invokeSuspend(Object obj) {
                int i5 = this.f71817t;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("This coroutine had already completed");
                    }
                    this.f71817t = 2;
                    ResultKt.b(obj);
                    return obj;
                }
                this.f71817t = 1;
                ResultKt.b(obj);
                Function2 function22 = function2;
                Intrinsics.e(function22, "null cannot be cast to non-null type kotlin.Function2<R of kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsJvmKt.createCoroutineUnintercepted, kotlin.coroutines.Continuation<T of kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsJvmKt.createCoroutineUnintercepted>, kotlin.Any?>");
                TypeIntrinsics.e(2, function22);
                return function22.invoke(continuation, this);
            }
        };
    }

    public static Continuation b(Continuation continuation) {
        Continuation<Object> continuationIntercepted;
        Intrinsics.g(continuation, "<this>");
        ContinuationImpl continuationImpl = continuation instanceof ContinuationImpl ? (ContinuationImpl) continuation : null;
        return (continuationImpl == null || (continuationIntercepted = continuationImpl.intercepted()) == null) ? continuation : continuationIntercepted;
    }

    public static Object c(Object obj, Continuation continuation, Function2 function2) {
        Intrinsics.g(function2, "<this>");
        CoroutineContext context = continuation.getContext();
        Object intrinsicsKt__IntrinsicsJvmKt$createSimpleCoroutineForSuspendFunction$1 = context == EmptyCoroutineContext.f71803a ? new IntrinsicsKt__IntrinsicsJvmKt$createSimpleCoroutineForSuspendFunction$1(continuation) : new IntrinsicsKt__IntrinsicsJvmKt$createSimpleCoroutineForSuspendFunction$2(continuation, context);
        TypeIntrinsics.e(2, function2);
        return function2.invoke(obj, intrinsicsKt__IntrinsicsJvmKt$createSimpleCoroutineForSuspendFunction$1);
    }
}
