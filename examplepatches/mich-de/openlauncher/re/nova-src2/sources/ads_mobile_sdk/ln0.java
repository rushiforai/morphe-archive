package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class ln0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f6297a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ qn0 f6298b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f6299t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ln0(qn0 qn0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f6299t = i5;
        this.f6298b = qn0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f6299t) {
            case 0:
                return new ln0(this.f6298b, continuation, 0);
            default:
                return new ln0(this.f6298b, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f6299t) {
            case 0:
                return new ln0(this.f6298b, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                return new ln0(this.f6298b, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f6299t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f6297a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    y2 y2Var = this.f6298b.M;
                    this.f6297a = 1;
                    if (y2Var.g(this) == coroutineSingletons) {
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
                int i11 = this.f6297a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    y2 y2Var2 = this.f6298b.M;
                    ni.s sVar = new ni.s(ni.r.f78316b, "show() is not supported for cross-process ad.", null);
                    this.f6297a = 1;
                    if (y2Var2.a(sVar, this) == coroutineSingletons2) {
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
