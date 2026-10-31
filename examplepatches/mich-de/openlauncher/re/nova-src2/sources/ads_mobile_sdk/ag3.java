package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class ag3 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f985a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ bg3 f986b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f987t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ag3(bg3 bg3Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f987t = i5;
        this.f986b = bg3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f987t) {
            case 0:
                return new ag3(this.f986b, continuation, 0);
            case 1:
                return new ag3(this.f986b, continuation, 1);
            default:
                return new ag3(this.f986b, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f987t) {
            case 0:
                return new ag3(this.f986b, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            case 1:
                return new ag3(this.f986b, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
            default:
                return new ag3(this.f986b, (Continuation) obj2, 2).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f987t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f985a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    y2 y2Var = this.f986b.f1418i;
                    this.f985a = 1;
                    if (y2Var.q(this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f985a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    y2 y2Var2 = this.f986b.f1418i;
                    this.f985a = 1;
                    if (y2Var2.n(this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f985a;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    y2 y2Var3 = this.f986b.f1418i;
                    this.f985a = 1;
                    if (y2Var3.j(this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
