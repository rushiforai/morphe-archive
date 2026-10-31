package b10;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class z0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f16982t;

    /* renamed from: u, reason: collision with root package name */
    public int f16983u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p0.y f16984v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z0(int i5, Continuation continuation, p0.y yVar) {
        super(2, continuation);
        this.f16982t = i5;
        this.f16984v = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f16982t) {
            case 0:
                return new z0(0, continuation, this.f16984v);
            case 1:
                return new z0(1, continuation, this.f16984v);
            case 2:
                return new z0(2, continuation, this.f16984v);
            default:
                return new z0(3, continuation, this.f16984v);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f16982t) {
        }
        return ((z0) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object objF;
        Object objF2;
        int i5 = this.f16982t;
        p0.y yVar = this.f16984v;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = this.f16983u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    int iP = yVar.p() + 1;
                    this.f16983u = 1;
                    if (yVar.f(iP, c0.f.h(0.0f, 0.0f, null, 7), this) == coroutineSingletons) {
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
                Object obj2 = CoroutineSingletons.f71806a;
                int i12 = this.f16983u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    this.f16983u = 1;
                    float f11 = p0.b0.f81129a;
                    if (yVar.k() - 1 < 0 || (objF = yVar.f(yVar.k() - 1, c0.f.h(0.0f, 0.0f, null, 7), this)) != obj2) {
                        objF = Unit.f71706a;
                    }
                    if (objF == obj2) {
                        return obj2;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 2:
                Object obj3 = CoroutineSingletons.f71806a;
                int i13 = this.f16983u;
                if (i13 == 0) {
                    ResultKt.b(obj);
                    this.f16983u = 1;
                    float f12 = p0.b0.f81129a;
                    if (yVar.k() + 1 >= yVar.m() || (objF2 = yVar.f(yVar.k() + 1, c0.f.h(0.0f, 0.0f, null, 7), this)) != obj3) {
                        objF2 = Unit.f71706a;
                    }
                    if (objF2 == obj3) {
                        return obj3;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i14 = this.f16983u;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    this.f16983u = 1;
                    if (g0.m1.c(yVar, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
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
