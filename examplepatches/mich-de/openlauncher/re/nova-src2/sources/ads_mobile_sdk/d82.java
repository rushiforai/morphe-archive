package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final class d82 extends SuspendLambda implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public int f2210a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ tx0 f2211b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f2212t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d82(int i5, Continuation continuation, int i11) {
        super(i5, continuation);
        this.f2212t = i11;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f2212t) {
            case 0:
                d82 d82Var = new d82(3, (Continuation) obj3, 0);
                d82Var.f2211b = (tx0) obj;
                return d82Var.invokeSuspend(Unit.f71706a);
            default:
                d82 d82Var2 = new d82(3, (Continuation) obj3, 1);
                d82Var2.f2211b = (tx0) obj;
                return d82Var2.invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f2212t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f2210a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    tx0 tx0Var = this.f2211b;
                    com.google.gson.r rVar = new com.google.gson.r();
                    this.f2210a = 1;
                    if (tx0Var.a(rVar, "onSdkAdUserInteractionClick", this) == coroutineSingletons) {
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
                int i11 = this.f2210a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    tx0 tx0Var2 = this.f2211b;
                    com.google.gson.r rVar2 = new com.google.gson.r();
                    this.f2210a = 1;
                    if (tx0Var2.a(rVar2, "onSdkImpression", this) == coroutineSingletons2) {
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
