package p1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class w2 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f81620t;

    /* renamed from: u, reason: collision with root package name */
    public int f81621u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f81622v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Function2 f81623w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ e1 f81624x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ w2(Function2 function2, e1 e1Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f81620t = i5;
        this.f81623w = function2;
        this.f81624x = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f81620t) {
            case 0:
                w2 w2Var = new w2(this.f81623w, this.f81624x, continuation, 0);
                w2Var.f81622v = obj;
                return w2Var;
            default:
                w2 w2Var2 = new w2(this.f81623w, this.f81624x, continuation, 1);
                w2Var2.f81622v = obj;
                return w2Var2;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f81620t) {
        }
        return ((w2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f81620t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f81621u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    q1 q1Var = new q1(this.f81624x, ((t70.j0) this.f81622v).getCoroutineContext());
                    this.f81621u = 1;
                    if (this.f81623w.invoke(q1Var, this) == coroutineSingletons) {
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
                int i11 = this.f81621u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    uw.a aVar = new uw.a(this.f81624x, ((t70.j0) this.f81622v).getCoroutineContext());
                    this.f81621u = 1;
                    if (this.f81623w.invoke(aVar, this) == coroutineSingletons2) {
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
