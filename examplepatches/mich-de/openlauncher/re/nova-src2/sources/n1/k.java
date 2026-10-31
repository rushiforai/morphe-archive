package n1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;

/* loaded from: classes2.dex */
public final class k extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f77658t;

    /* renamed from: u, reason: collision with root package name */
    public int f77659u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ n f77660v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ k(n nVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f77658t = i5;
        this.f77660v = nVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f77658t) {
            case 0:
                return new k(this.f77660v, continuation, 0);
            case 1:
                return new k(this.f77660v, continuation, 1);
            default:
                return new k(this.f77660v, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        j0 j0Var = (j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f77658t) {
        }
        return ((k) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f77658t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f77659u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    n nVar = this.f77660v;
                    if (nVar.f77669a) {
                        o oVar = nVar.f77672d;
                        this.f77659u = 1;
                        if (((q) oVar).a(1.0f, this) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    } else {
                        o oVar2 = nVar.f77672d;
                        this.f77659u = 2;
                        if (((q) oVar2).a(0.0f, this) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                } else {
                    if (i5 != 1 && i5 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f77659u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    n nVar2 = this.f77660v;
                    o oVar3 = nVar2.f77672d;
                    float fM = nVar2.f77675g.m() / nVar2.F();
                    this.f77659u = 1;
                    if (((q) oVar3).a(fM, this) == coroutineSingletons2) {
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
                int i12 = this.f77659u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    n nVar3 = this.f77660v;
                    if (nVar3.f77669a) {
                        this.f77659u = 2;
                        if (nVar3.D(this) == coroutineSingletons3) {
                            return coroutineSingletons3;
                        }
                    } else {
                        this.f77659u = 1;
                        if (nVar3.B(this) == coroutineSingletons3) {
                            return coroutineSingletons3;
                        }
                    }
                } else {
                    if (i12 != 1 && i12 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
