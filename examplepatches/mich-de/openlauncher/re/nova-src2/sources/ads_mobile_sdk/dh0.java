package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import ni.d;

/* loaded from: classes.dex */
public final class dh0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ih0 f2525a;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f2526t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ dh0(ih0 ih0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f2526t = i5;
        this.f2525a = ih0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f2526t) {
            case 0:
                return new dh0(this.f2525a, continuation, 0);
            case 1:
                return new dh0(this.f2525a, continuation, 1);
            case 2:
                return new dh0(this.f2525a, continuation, 2);
            default:
                return new dh0(this.f2525a, continuation, 3);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f2526t) {
            case 0:
                return new dh0(this.f2525a, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            case 1:
                return new dh0(this.f2525a, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
            case 2:
                return new dh0(this.f2525a, (Continuation) obj2, 2).invokeSuspend(Unit.f71706a);
            default:
                return new dh0(this.f2525a, (Continuation) obj2, 3).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f2526t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                synchronized (this.f2525a) {
                }
                break;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                d dVarA = this.f2525a.a();
                if (dVarA != null) {
                    dVarA.c();
                }
                break;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                d dVarA2 = this.f2525a.a();
                if (dVarA2 != null) {
                    dVarA2.e();
                }
                break;
            default:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                synchronized (this.f2525a) {
                }
                break;
        }
        return Unit.f71706a;
    }
}
