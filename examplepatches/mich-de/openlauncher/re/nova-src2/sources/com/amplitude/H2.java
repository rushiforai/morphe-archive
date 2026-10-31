package com.amplitude;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class H2 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f20262a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f20263b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ SuspendLambda f20264c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public H2(Function2 function2, Continuation continuation) {
        super(2, continuation);
        this.f20264c = (SuspendLambda) function2;
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        H2 h22 = new H2(this.f20264c, continuation);
        h22.f20263b = obj;
        return h22;
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        H2 h22 = new H2(this.f20264c, (Continuation) obj2);
        h22.f20263b = (t70.j0) obj;
        return h22.invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Type inference failed for: r1v1, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f20262a;
        if (i5 == 0) {
            ResultKt.b(obj);
            t70.j0 j0Var = (t70.j0) this.f20263b;
            ?? r12 = this.f20264c;
            this.f20262a = 1;
            if (r12.invoke(j0Var, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }
}
