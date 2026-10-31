package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class ex0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ tx0 f3082a;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f3083t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ex0(tx0 tx0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f3083t = i5;
        this.f3082a = tx0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f3083t) {
            case 0:
                return new ex0(this.f3082a, continuation, 0);
            case 1:
                return new ex0(this.f3082a, continuation, 1);
            case 2:
                return new ex0(this.f3082a, continuation, 2);
            case 3:
                return new ex0(this.f3082a, continuation, 3);
            default:
                return new ex0(this.f3082a, continuation, 4);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f3083t) {
            case 0:
                return new ex0(this.f3082a, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            case 1:
                return new ex0(this.f3082a, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
            case 2:
                return new ex0(this.f3082a, (Continuation) obj2, 2).invokeSuspend(Unit.f71706a);
            case 3:
                return new ex0(this.f3082a, (Continuation) obj2, 3).invokeSuspend(Unit.f71706a);
            default:
                return new ex0(this.f3082a, (Continuation) obj2, 4).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f3083t;
        tx0 tx0Var = this.f3082a;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                tx0Var.loadUrl("about:blank");
                break;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                tx0Var.destroy();
                break;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                tx0Var.destroy();
                break;
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                tx0Var.destroy();
                break;
            default:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                tx0Var.setVisibility(0);
                break;
        }
        return Unit.f71706a;
    }
}
