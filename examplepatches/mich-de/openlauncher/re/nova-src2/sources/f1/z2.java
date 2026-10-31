package f1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class z2 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f54151t;

    /* renamed from: u, reason: collision with root package name */
    public int f54152u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ c3 f54153v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z2(c3 c3Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f54151t = i5;
        this.f54153v = c3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f54151t) {
            case 0:
                return new z2(this.f54153v, continuation, 0);
            case 1:
                return new z2(this.f54153v, continuation, 1);
            case 2:
                return new z2(this.f54153v, continuation, 2);
            default:
                return new z2(this.f54153v, continuation, 3);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f54151t) {
        }
        return ((z2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object objA;
        Object objA2;
        switch (this.f54151t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f54152u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    this.f54152u = 1;
                    if (this.f54153v.b(this) == coroutineSingletons) {
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
                int i11 = this.f54152u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    this.f54152u = 1;
                    if (this.f54153v.b(this) == coroutineSingletons2) {
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
                Object obj2 = CoroutineSingletons.f71806a;
                int i12 = this.f54152u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    this.f54152u = 1;
                    c3 c3Var = this.f54153v;
                    k2 k2VarG = c3Var.f53424b.g();
                    d3 d3Var = d3.f53457b;
                    if (!k2VarG.f53702a.containsKey(d3Var) || (objA = c3.a(c3Var, d3Var, this)) != obj2) {
                        objA = Unit.f71706a;
                    }
                    if (objA == obj2) {
                        return obj2;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                Object obj3 = CoroutineSingletons.f71806a;
                int i13 = this.f54152u;
                if (i13 == 0) {
                    ResultKt.b(obj);
                    this.f54152u = 1;
                    c3 c3Var2 = this.f54153v;
                    k2 k2VarG2 = c3Var2.f53424b.g();
                    d3 d3Var2 = d3.f53458c;
                    if (!k2VarG2.f53702a.containsKey(d3Var2) || (objA2 = c3.a(c3Var2, d3Var2, this)) != obj3) {
                        objA2 = Unit.f71706a;
                    }
                    if (objA2 == obj3) {
                        return obj3;
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
