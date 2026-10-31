package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class hs0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f4505a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ et0 f4506b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f4507t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ hs0(et0 et0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f4507t = i5;
        this.f4506b = et0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f4507t) {
            case 0:
                return new hs0(this.f4506b, continuation, 0);
            default:
                return new hs0(this.f4506b, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f4507t) {
            case 0:
                return new hs0(this.f4506b, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                return new hs0(this.f4506b, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f4507t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f4505a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    et0 et0Var = this.f4506b;
                    tx0 tx0VarJ = et0Var.j();
                    this.f4505a = 1;
                    if (et0Var.b(tx0VarJ, this) == coroutineSingletons) {
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
                int i11 = this.f4505a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    tx0 tx0VarJ2 = this.f4506b.j();
                    com.google.gson.r rVar = new com.google.gson.r();
                    this.f4505a = 1;
                    if (tx0VarJ2.a(rVar, "onbackblocked", this) == coroutineSingletons2) {
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
