package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class qr0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ tx0 f8781a;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f8782t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ qr0(tx0 tx0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f8782t = i5;
        this.f8781a = tx0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f8782t) {
            case 0:
                return new qr0(this.f8781a, continuation, 0);
            case 1:
                return new qr0(this.f8781a, continuation, 1);
            case 2:
                return new qr0(this.f8781a, continuation, 2);
            case 3:
                return new qr0(this.f8781a, continuation, 3);
            case 4:
                return new qr0(this.f8781a, continuation, 4);
            default:
                return new qr0(this.f8781a, continuation, 5);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f8782t) {
            case 0:
                return new qr0(this.f8781a, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            case 1:
                return new qr0(this.f8781a, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
            case 2:
                return new qr0(this.f8781a, (Continuation) obj2, 2).invokeSuspend(Unit.f71706a);
            case 3:
                return new qr0(this.f8781a, (Continuation) obj2, 3).invokeSuspend(Unit.f71706a);
            case 4:
                return new qr0(this.f8781a, (Continuation) obj2, 4).invokeSuspend(Unit.f71706a);
            default:
                return new qr0(this.f8781a, (Continuation) obj2, 5).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f8782t;
        tx0 tx0Var = this.f8781a;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                tx0Var.requestLayout();
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                tx0Var.destroy();
                return Unit.f71706a;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                tx0Var.onResume();
                return Unit.f71706a;
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                tx0Var.onPause();
                return Unit.f71706a;
            case 4:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                tx0Var.destroy();
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                return new xu0(new jy0(tx0Var));
        }
    }
}
