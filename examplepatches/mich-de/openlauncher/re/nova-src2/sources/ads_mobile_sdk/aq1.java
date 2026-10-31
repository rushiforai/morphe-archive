package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class aq1 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f1060a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ tx0 f1061b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ com.google.gson.r f1062c;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f1063t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ aq1(tx0 tx0Var, com.google.gson.r rVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f1063t = i5;
        this.f1061b = tx0Var;
        this.f1062c = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f1063t) {
            case 0:
                return new aq1(this.f1061b, this.f1062c, continuation, 0);
            default:
                return new aq1(this.f1061b, this.f1062c, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f1063t) {
            case 0:
                com.google.gson.r rVar = this.f1062c;
                return new aq1(this.f1061b, rVar, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                com.google.gson.r rVar2 = this.f1062c;
                return new aq1(this.f1061b, rVar2, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f1063t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f1060a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    this.f1060a = 1;
                    if (this.f1061b.a(this.f1062c, "onScreenInfoChanged", this) == coroutineSingletons) {
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
                int i11 = this.f1060a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    this.f1060a = 1;
                    if (this.f1061b.a(this.f1062c, "onshow", this) == coroutineSingletons2) {
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
