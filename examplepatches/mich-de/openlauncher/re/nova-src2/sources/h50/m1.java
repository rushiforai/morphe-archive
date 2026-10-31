package h50;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;

/* loaded from: classes.dex */
public final class m1 extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f59241t;

    /* renamed from: u, reason: collision with root package name */
    public int f59242u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ w50.e f59243v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Function3 f59244w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m1(Function3 function3, Continuation continuation, int i5) {
        super(3, continuation);
        this.f59241t = i5;
        this.f59244w = function3;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        w50.e eVar = (w50.e) obj;
        switch (this.f59241t) {
            case 0:
                m1 m1Var = new m1(this.f59244w, (Continuation) obj3, 0);
                m1Var.f59243v = eVar;
                return m1Var.invokeSuspend(Unit.f71706a);
            case 1:
                m1 m1Var2 = new m1(this.f59244w, (Continuation) obj3, 1);
                m1Var2.f59243v = eVar;
                return m1Var2.invokeSuspend(Unit.f71706a);
            default:
                m1 m1Var3 = new m1(this.f59244w, (Continuation) obj3, 2);
                m1Var3.f59243v = eVar;
                return m1Var3.invokeSuspend(Unit.f71706a);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r4v1, types: [w50.e] */
    /* JADX WARN: Type inference failed for: r4v11 */
    /* JADX WARN: Type inference failed for: r4v12 */
    /* JADX WARN: Type inference failed for: r4v13 */
    /* JADX WARN: Type inference failed for: r4v14 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v5, types: [w50.e] */
    /* JADX WARN: Type inference failed for: r4v9 */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        int i5 = this.f59241t;
        Function3 function3 = this.f59244w;
        ?? r42 = "call to 'resume' before 'invoke' with coroutine";
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = this.f59242u;
                try {
                } catch (Throwable th2) {
                    k50.b bVarC = ((d50.b) r42.f93783a).c();
                    this.f59243v = null;
                    this.f59242u = 2;
                    obj = function3.invoke(bVarC, th2, this);
                    if (obj == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
                if (i11 == 0) {
                    ResultKt.b(obj);
                    w50.e eVar = this.f59243v;
                    this.f59243v = eVar;
                    this.f59242u = 1;
                    Object objC = eVar.c(this);
                    r42 = eVar;
                    if (objC == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        if (i11 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        Throwable th3 = (Throwable) obj;
                        if (th3 != null) {
                            throw th3;
                        }
                        return Unit.f71706a;
                    }
                    w50.e eVar2 = this.f59243v;
                    ResultKt.b(obj);
                    r42 = eVar2;
                }
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i12 = this.f59242u;
                try {
                } catch (Throwable th4) {
                    k50.c cVar = (k50.c) r42.f93783a;
                    za0.b bVar = b0.f59160a;
                    a0 a0Var = new a0(cVar);
                    this.f59243v = null;
                    this.f59242u = 2;
                    obj = function3.invoke(a0Var, th4, this);
                    if (obj == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                }
                if (i12 == 0) {
                    ResultKt.b(obj);
                    w50.e eVar3 = this.f59243v;
                    this.f59243v = eVar3;
                    this.f59242u = 1;
                    Object objC2 = eVar3.c(this);
                    r42 = eVar3;
                    if (objC2 == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i12 != 1) {
                        if (i12 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        Throwable th5 = (Throwable) obj;
                        if (th5 != null) {
                            throw th5;
                        }
                        return Unit.f71706a;
                    }
                    w50.e eVar4 = this.f59243v;
                    ResultKt.b(obj);
                    r42 = eVar4;
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i13 = this.f59242u;
                if (i13 == 0) {
                    ResultKt.b(obj);
                    w50.e eVar5 = this.f59243v;
                    Object obj2 = eVar5.f93783a;
                    p1 p1Var = new p1(1, 8, w50.e.class, eVar5, "proceed", "proceed(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;");
                    this.f59242u = 1;
                    if (function3.invoke(obj2, p1Var, this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
