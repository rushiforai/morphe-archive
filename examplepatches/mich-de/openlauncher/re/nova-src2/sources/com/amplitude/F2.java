package com.amplitude;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class F2 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f20232a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f20233b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ SuspendLambda f20234c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public F2(Function2 function2, Continuation continuation) {
        super(2, continuation);
        this.f20234c = (SuspendLambda) function2;
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        F2 f22 = new F2(this.f20234c, continuation);
        f22.f20233b = obj;
        return f22;
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        F2 f22 = new F2(this.f20234c, (Continuation) obj2);
        f22.f20233b = (t70.j0) obj;
        return f22.invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Type inference failed for: r1v1, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f20232a;
        if (i5 == 0) {
            ResultKt.b(obj);
            t70.j0 j0Var = (t70.j0) this.f20233b;
            ?? r12 = this.f20234c;
            this.f20232a = 1;
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
