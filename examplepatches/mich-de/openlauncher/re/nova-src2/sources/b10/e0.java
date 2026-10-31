package b10;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class e0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f16649t;

    /* renamed from: u, reason: collision with root package name */
    public int f16650u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p0.b f16651v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e0(p0.b bVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f16649t = i5;
        this.f16651v = bVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f16649t) {
            case 0:
                return new e0(this.f16651v, continuation, 0);
            case 1:
                return new e0(this.f16651v, continuation, 1);
            case 2:
                return new e0(this.f16651v, continuation, 2);
            case 3:
                return new e0(this.f16651v, continuation, 3);
            default:
                return new e0(this.f16651v, continuation, 4);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f16649t) {
        }
        return ((e0) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f16649t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f16650u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    p0.b bVar = this.f16651v;
                    int iP = bVar.p() + 1;
                    this.f16650u = 1;
                    if (bVar.f(iP, c0.f.h(0.0f, 0.0f, null, 7), this) == coroutineSingletons) {
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
                int i11 = this.f16650u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    p0.b bVar2 = this.f16651v;
                    int iP2 = bVar2.p() + 1;
                    this.f16650u = 1;
                    if (bVar2.f(iP2, c0.f.h(0.0f, 0.0f, null, 7), this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f16650u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    p0.b bVar3 = this.f16651v;
                    int iP3 = bVar3.p() + 1;
                    this.f16650u = 1;
                    if (bVar3.f(iP3, c0.f.h(0.0f, 0.0f, null, 7), this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i13 = this.f16650u;
                if (i13 == 0) {
                    ResultKt.b(obj);
                    p0.b bVar4 = this.f16651v;
                    int iP4 = bVar4.p() + 1;
                    this.f16650u = 1;
                    if (bVar4.f(iP4, c0.f.h(0.0f, 0.0f, null, 7), this) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                int i14 = this.f16650u;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    p0.b bVar5 = this.f16651v;
                    int iK = bVar5.k() + 1;
                    this.f16650u = 1;
                    if (bVar5.f(iK, c0.f.h(0.0f, 0.0f, null, 7), this) == coroutineSingletons5) {
                        return coroutineSingletons5;
                    }
                } else {
                    if (i14 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
