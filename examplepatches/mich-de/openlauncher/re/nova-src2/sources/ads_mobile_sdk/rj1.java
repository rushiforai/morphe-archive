package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class rj1 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f9206a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f9207b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f9208t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ rj1(Ref.ObjectRef objectRef, Continuation continuation, int i5) {
        super(2, continuation);
        this.f9208t = i5;
        this.f9207b = objectRef;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f9208t) {
            case 0:
                return new rj1(this.f9207b, continuation, 0);
            default:
                return new rj1(this.f9207b, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f9208t) {
            case 0:
                return new rj1(this.f9207b, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                return new rj1(this.f9207b, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f9208t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f9206a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    tx0 tx0Var = (tx0) this.f9207b.f71863a;
                    if (tx0Var != null) {
                        this.f9206a = 1;
                        if (tx0Var.a(this) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
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
                int i11 = this.f9206a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    tx0 tx0Var2 = (tx0) this.f9207b.f71863a;
                    if (tx0Var2 != null) {
                        this.f9206a = 1;
                        if (tx0Var2.a(this) == coroutineSingletons2) {
                            return coroutineSingletons2;
                        }
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
