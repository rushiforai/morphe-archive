package kw;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class l0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f72468t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ e0.a2 f72469u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f72470v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l0(e0.a2 a2Var, Ref.IntRef intRef, Continuation continuation) {
        super(2, continuation);
        this.f72469u = a2Var;
        this.f72470v = intRef;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new l0(this.f72469u, this.f72470v, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((l0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f72468t;
        if (i5 == 0) {
            ResultKt.b(obj);
            int i11 = this.f72470v.f71861a;
            this.f72468t = 1;
            if (g0.m1.b(this.f72469u, i11 - r1.h(), this) == coroutineSingletons) {
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
