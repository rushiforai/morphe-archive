package n0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class r extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f77463t;

    /* renamed from: u, reason: collision with root package name */
    public int f77464u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ t f77465v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r(t tVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f77463t = i5;
        this.f77465v = tVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f77463t) {
            case 0:
                return new r(this.f77465v, continuation, 0);
            case 1:
                return new r(this.f77465v, continuation, 1);
            case 2:
                return new r(this.f77465v, continuation, 2);
            case 3:
                return new r(this.f77465v, continuation, 3);
            default:
                return new r(this.f77465v, continuation, 4);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f77463t) {
        }
        return ((r) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f77463t;
        t tVar = this.f77465v;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = this.f77464u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    c0.e eVar = tVar.f77502p;
                    Float f11 = new Float(1.0f);
                    this.f77464u = 1;
                    if (eVar.g(f11, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i12 = this.f77464u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    c0.e eVar2 = tVar.o;
                    y3.k kVar = new y3.k(0L);
                    this.f77464u = 1;
                    if (eVar2.g(kVar, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                int i13 = t.f77488t;
                tVar.g(0L);
                tVar.f(false);
                return Unit.f71706a;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i14 = this.f77464u;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    c0.e eVar3 = tVar.o;
                    this.f77464u = 1;
                    if (eVar3.h(this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i14 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i15 = this.f77464u;
                if (i15 == 0) {
                    ResultKt.b(obj);
                    c0.e eVar4 = tVar.f77502p;
                    this.f77464u = 1;
                    if (eVar4.h(this) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                int i16 = this.f77464u;
                if (i16 == 0) {
                    ResultKt.b(obj);
                    c0.e eVar5 = tVar.f77502p;
                    this.f77464u = 1;
                    if (eVar5.h(this) == coroutineSingletons5) {
                        return coroutineSingletons5;
                    }
                } else {
                    if (i16 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
