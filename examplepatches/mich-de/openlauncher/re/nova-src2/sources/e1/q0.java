package e1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class q0 extends SuspendLambda implements Function1 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f51367t;

    /* renamed from: u, reason: collision with root package name */
    public int f51368u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ a1 f51369v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ q0(a1 a1Var, Continuation continuation, int i5) {
        super(1, continuation);
        this.f51367t = i5;
        this.f51369v = a1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        switch (this.f51367t) {
            case 0:
                return new q0(this.f51369v, continuation, 0);
            default:
                return new q0(this.f51369v, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Continuation continuation = (Continuation) obj;
        switch (this.f51367t) {
        }
        return ((q0) create(continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f51367t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f51368u;
                a1 a1Var = this.f51369v;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    this.f51368u = 1;
                    if (a1Var.t(this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        if (i5 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    ResultKt.b(obj);
                }
                this.f51368u = 2;
                if (a1.b(a1Var, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f51368u;
                a1 a1Var2 = this.f51369v;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    this.f51368u = 1;
                    if (a1Var2.t(this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        if (i11 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        a1Var2.A = true;
                        return Unit.f71706a;
                    }
                    ResultKt.b(obj);
                }
                this.f51368u = 2;
                if (a1.b(a1Var2, this) == coroutineSingletons2) {
                    return coroutineSingletons2;
                }
                a1Var2.A = true;
                return Unit.f71706a;
        }
    }
}
