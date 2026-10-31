package t5;

import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class q0 {

    /* renamed from: a, reason: collision with root package name */
    public final SuspendLambda f88671a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.s f88672b;

    /* renamed from: c, reason: collision with root package name */
    public final i1 f88673c;

    /* renamed from: d, reason: collision with root package name */
    public final CoroutineContext f88674d;

    /* JADX WARN: Multi-variable type inference failed */
    public q0(Function2 function2, t70.s sVar, i1 i1Var, CoroutineContext callerContext) {
        Intrinsics.g(callerContext, "callerContext");
        this.f88671a = (SuspendLambda) function2;
        this.f88672b = sVar;
        this.f88673c = i1Var;
        this.f88674d = callerContext;
    }
}
