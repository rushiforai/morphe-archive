package p1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class v2 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f81604t;

    /* renamed from: u, reason: collision with root package name */
    public int f81605u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f81606v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Function2 f81607w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ e1 f81608x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v2(Function2 function2, e1 e1Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f81604t = i5;
        this.f81607w = function2;
        this.f81608x = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f81604t) {
            case 0:
                v2 v2Var = new v2(this.f81607w, this.f81608x, continuation, 0);
                v2Var.f81606v = obj;
                return v2Var;
            default:
                v2 v2Var2 = new v2(this.f81607w, this.f81608x, continuation, 1);
                v2Var2.f81606v = obj;
                return v2Var2;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f81604t) {
        }
        return ((v2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f81604t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f81605u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    q1 q1Var = new q1(this.f81608x, ((t70.j0) this.f81606v).getCoroutineContext());
                    this.f81605u = 1;
                    if (this.f81607w.invoke(q1Var, this) == coroutineSingletons) {
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
                int i11 = this.f81605u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    q1 q1Var2 = new q1(this.f81608x, ((t70.j0) this.f81606v).getCoroutineContext());
                    this.f81605u = 1;
                    if (this.f81607w.invoke(q1Var2, this) == coroutineSingletons2) {
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
