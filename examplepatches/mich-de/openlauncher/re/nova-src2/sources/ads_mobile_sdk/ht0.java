package ads_mobile_sdk;

import b.b9;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class ht0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f4524a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ kt0 f4525b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f4526t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ht0(kt0 kt0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f4526t = i5;
        this.f4525b = kt0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f4526t) {
            case 0:
                return new ht0(this.f4525b, continuation, 0);
            default:
                return new ht0(this.f4525b, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f4526t) {
            case 0:
                return new ht0(this.f4525b, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                return new ht0(this.f4525b, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f4526t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f4524a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b9 b9Var = this.f4525b.F;
                    this.f4524a = 1;
                    if (b9Var.m(this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f4524a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    y2 y2Var = this.f4525b.N;
                    this.f4524a = 1;
                    if (y2Var.g(this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
