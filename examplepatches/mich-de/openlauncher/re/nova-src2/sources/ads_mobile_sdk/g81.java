package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import ni.x;

/* loaded from: classes2.dex */
public final class g81 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ x f3667a;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f3668t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g81(Continuation continuation, x xVar, int i5) {
        super(2, continuation);
        this.f3668t = i5;
        this.f3667a = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f3668t) {
            case 0:
                return new g81(continuation, this.f3667a, 0);
            case 1:
                return new g81(continuation, this.f3667a, 1);
            case 2:
                return new g81(continuation, this.f3667a, 2);
            case 3:
                return new g81(continuation, this.f3667a, 3);
            default:
                return new g81(continuation, this.f3667a, 4);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f3668t) {
            case 0:
                return new g81((Continuation) obj2, this.f3667a, 0).invokeSuspend(Unit.f71706a);
            case 1:
                return new g81((Continuation) obj2, this.f3667a, 1).invokeSuspend(Unit.f71706a);
            case 2:
                return new g81((Continuation) obj2, this.f3667a, 2).invokeSuspend(Unit.f71706a);
            case 3:
                return new g81((Continuation) obj2, this.f3667a, 3).invokeSuspend(Unit.f71706a);
            default:
                return new g81((Continuation) obj2, this.f3667a, 4).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f3668t;
        x xVar = this.f3667a;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                xVar.a(w81.R);
                break;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                xVar.a(w81.P);
                break;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                xVar.a(w81.N);
                break;
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                xVar.a(w81.P);
                break;
            default:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                xVar.a(w81.O);
                break;
        }
        return Unit.f71706a;
    }
}
