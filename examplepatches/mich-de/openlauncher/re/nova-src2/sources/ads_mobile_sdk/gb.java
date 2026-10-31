package ads_mobile_sdk;

import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import t70.m0;

/* loaded from: classes.dex */
public final class gb extends SuspendLambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public int f3753a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f3754b;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f3755d;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f3756t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gb(Object obj, Object obj2, Continuation continuation, int i5) {
        super(1, continuation);
        this.f3756t = i5;
        this.f3754b = obj;
        this.f3755d = obj2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        switch (this.f3756t) {
            case 0:
                return new gb((sb) this.f3754b, (Set) this.f3755d, continuation, 0);
            case 1:
                return new gb((vw) this.f3754b, (com.google.gson.r) this.f3755d, continuation, 1);
            case 2:
                return new gb((lu2) this.f3755d, continuation, (Function1) this.f3754b);
            default:
                return new gb((vw) this.f3754b, (ri.a) this.f3755d, continuation, 3);
        }
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f3756t) {
            case 0:
                return ((gb) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
            case 1:
                return new gb((vw) this.f3754b, (com.google.gson.r) this.f3755d, (Continuation) obj, 1).invokeSuspend(Unit.f71706a);
            case 2:
                Function1 function1 = (Function1) this.f3754b;
                return new gb((lu2) this.f3755d, (Continuation) obj, function1).invokeSuspend(Unit.f71706a);
            default:
                return new gb((vw) this.f3754b, (ri.a) this.f3755d, (Continuation) obj, 3).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f3756t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f3753a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    sb sbVar = (sb) this.f3754b;
                    t70.j0 j0Var = sbVar.f9475a;
                    ar.a aVar = new ar.a(sbVar, (Set) this.f3755d, null, 5);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    t70.g2 g2VarT = m0.t(j0Var, context, null, new ar.a(aVar, null), 2);
                    this.f3753a = 1;
                    if (g2VarT.K(this) == coroutineSingletons) {
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
                int i11 = this.f3753a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    zj1 zj1Var = ((vw) this.f3754b).f10923h;
                    com.google.gson.r rVar = (com.google.gson.r) this.f3755d;
                    this.f3753a = 1;
                    zj1Var.getClass();
                    String string = rVar.toString();
                    Intrinsics.f(string, "toString(...)");
                    obj = zj1Var.a("google.afma.config.fetchAppSettings", string, this);
                    if (obj == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                b.a1 a1Var = (b.a1) obj;
                if (a1Var instanceof xu0) {
                    return (com.google.gson.r) ((xu0) a1Var).f11834b;
                }
                if (!(a1Var instanceof pu0)) {
                    throw new NoWhenBranchMatchedException();
                }
                zi3.a((pu0) a1Var, false);
                return null;
            case 2:
                lu2 lu2Var = (lu2) this.f3755d;
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f3753a;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    Function1 function1 = (Function1) this.f3754b;
                    this.f3753a = 1;
                    obj = function1.invoke(this);
                    if (obj == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i12 != 1) {
                        if (i12 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    ResultKt.b(obj);
                }
                long jL = Duration.l(((Duration) obj).f72041a, lu2Var.b());
                this.f3753a = 2;
                if (lu2.a(jL, lu2Var, this) == coroutineSingletons3) {
                    return coroutineSingletons3;
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i13 = this.f3753a;
                if (i13 == 0) {
                    ResultKt.b(obj);
                    vw vwVar = (vw) this.f3754b;
                    ri.a aVar2 = (ri.a) this.f3755d;
                    this.f3753a = 1;
                    obj = vw.a(vwVar, aVar2, this);
                    if (obj == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                b.a1 a1Var2 = (b.a1) obj;
                if (a1Var2 instanceof xu0) {
                    return (com.google.gson.r) ((xu0) a1Var2).f11834b;
                }
                if (!(a1Var2 instanceof pu0)) {
                    throw new NoWhenBranchMatchedException();
                }
                zi3.a((pu0) a1Var2, false);
                return null;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gb(lu2 lu2Var, Continuation continuation, Function1 function1) {
        super(1, continuation);
        this.f3756t = 2;
        this.f3754b = function1;
        this.f3755d = lu2Var;
    }
}
