package rs;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import p1.e1;
import t70.j0;

/* loaded from: classes4.dex */
public final class u extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f86302t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ Function1 f86303u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ e1 f86304v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ u(Function1 function1, e1 e1Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f86302t = i5;
        this.f86303u = function1;
        this.f86304v = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f86302t) {
            case 0:
                return new u(this.f86303u, this.f86304v, continuation, 0);
            default:
                return new u(this.f86303u, this.f86304v, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        j0 j0Var = (j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f86302t) {
        }
        return ((u) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f86302t;
        e1 e1Var = this.f86304v;
        Function1 function1 = this.f86303u;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                function1.invoke((j) e1Var.getValue());
                break;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                function1.invoke((j) e1Var.getValue());
                break;
        }
        return Unit.f71706a;
    }
}
