package kotlin;

import a70.a;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsJvmKt$createSimpleCoroutineForSuspendFunction$1;
import kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsJvmKt$createSimpleCoroutineForSuspendFunction$2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002*r\b\u0002\u0010\u0005\"5\b\u0001\u0012\f\u0012\n\u0012\u0002\b\u0003\u0012\u0002\b\u00030\u0001\u0012\u0006\u0012\u0004\u0018\u00010\u0002\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0000¢\u0006\u0002\b\u000425\b\u0001\u0012\f\u0012\n\u0012\u0002\b\u0003\u0012\u0002\b\u00030\u0001\u0012\u0006\u0012\u0004\u0018\u00010\u0002\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0000¢\u0006\u0002\b\u0004¨\u0006\u0006"}, d2 = {"Lkotlin/Function3;", "Lkotlin/DeepRecursiveScope;", b.f42142b, "Lkotlin/coroutines/Continuation;", "Lkotlin/ExtensionFunctionType;", "DeepRecursiveFunctionBlock", "kotlin-stdlib"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* renamed from: kotlin.DeepRecursiveKt, reason: from Kotlin metadata */
/* loaded from: classes4.dex */
public final class Function3 {

    /* renamed from: a, reason: collision with root package name */
    public static final CoroutineSingletons f71670a;

    static {
        int i5 = Result.f71687b;
        f71670a = CoroutineSingletons.f71806a;
    }

    public static final Object a(DeepRecursiveFunction deepRecursiveFunction, Object obj) {
        Object objInvoke;
        kotlin.jvm.functions.Function3 function3 = deepRecursiveFunction.f71669a;
        a aVar = new a(0);
        aVar.f443a = function3;
        aVar.f444b = obj;
        aVar.f445c = aVar;
        CoroutineSingletons coroutineSingletons = f71670a;
        aVar.f446d = coroutineSingletons;
        while (true) {
            Object obj2 = aVar.f446d;
            Continuation continuation = aVar.f445c;
            if (continuation == null) {
                ResultKt.b(obj2);
                return obj2;
            }
            int i5 = Result.f71687b;
            if (Intrinsics.b(coroutineSingletons, obj2)) {
                try {
                    kotlin.jvm.functions.Function3 function32 = aVar.f443a;
                    Object obj3 = aVar.f444b;
                    if (function32 == null) {
                        Intrinsics.g(function32, "<this>");
                        CoroutineContext context = continuation.getContext();
                        Object intrinsicsKt__IntrinsicsJvmKt$createSimpleCoroutineForSuspendFunction$1 = context == EmptyCoroutineContext.f71803a ? new IntrinsicsKt__IntrinsicsJvmKt$createSimpleCoroutineForSuspendFunction$1(continuation) : new IntrinsicsKt__IntrinsicsJvmKt$createSimpleCoroutineForSuspendFunction$2(continuation, context);
                        TypeIntrinsics.e(3, function32);
                        objInvoke = function32.invoke(aVar, obj3, intrinsicsKt__IntrinsicsJvmKt$createSimpleCoroutineForSuspendFunction$1);
                    } else {
                        TypeIntrinsics.e(3, function32);
                        objInvoke = function32.invoke(aVar, obj3, continuation);
                    }
                    if (objInvoke != CoroutineSingletons.f71806a) {
                        continuation.resumeWith(objInvoke);
                    }
                } catch (Throwable th2) {
                    int i11 = Result.f71687b;
                    continuation.resumeWith(ResultKt.a(th2));
                }
            } else {
                aVar.f446d = coroutineSingletons;
                continuation.resumeWith(obj2);
            }
        }
    }
}
