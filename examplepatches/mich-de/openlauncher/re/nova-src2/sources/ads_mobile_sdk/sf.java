package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class sf extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f9553a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ag f9554b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f9555t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ sf(ag agVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f9555t = i5;
        this.f9554b = agVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f9555t) {
            case 0:
                return new sf(this.f9554b, continuation, 0);
            default:
                return new sf(this.f9554b, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f9555t) {
            case 0:
                return new sf(this.f9554b, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                return new sf(this.f9554b, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f9555t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f9553a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    this.f9553a = 1;
                    if (ag.b(this.f9554b, this) == coroutineSingletons) {
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
                int i11 = this.f9553a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    this.f9553a = 1;
                    if (ag.a(this.f9554b, this) == coroutineSingletons2) {
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
