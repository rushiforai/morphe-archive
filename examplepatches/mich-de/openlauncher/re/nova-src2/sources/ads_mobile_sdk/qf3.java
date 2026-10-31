package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class qf3 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f8647a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ tf3 f8648b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f8649t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ qf3(tf3 tf3Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f8649t = i5;
        this.f8648b = tf3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f8649t) {
            case 0:
                return new qf3(this.f8648b, continuation, 0);
            default:
                return new qf3(this.f8648b, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f8649t) {
            case 0:
                return new qf3(this.f8648b, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                return new qf3(this.f8648b, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f8649t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f8647a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    y2 y2Var = this.f8648b.f9919b;
                    ni.s sVar = new ni.s(ni.r.f78317c, "This ad has already been shown.", null);
                    this.f8647a = 1;
                    if (y2Var.a(sVar, this) == coroutineSingletons) {
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
                int i11 = this.f8647a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    y2 y2Var2 = this.f8648b.f9919b;
                    ni.s sVar2 = new ni.s(ni.r.f78319e, "Mediation adapter failed to show Ad.", null);
                    this.f8647a = 1;
                    if (y2Var2.a(sVar2, this) == coroutineSingletons2) {
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
