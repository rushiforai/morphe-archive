package h6;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class r0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f59426t;

    /* renamed from: u, reason: collision with root package name */
    public int f59427u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f59428v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Function2 f59429w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r0(Function2 function2, Continuation continuation, int i5) {
        super(2, continuation);
        this.f59426t = i5;
        this.f59429w = function2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f59426t) {
            case 0:
                r0 r0Var = new r0(this.f59429w, continuation, 0);
                r0Var.f59428v = obj;
                return r0Var;
            default:
                r0 r0Var2 = new r0(this.f59429w, continuation, 1);
                r0Var2.f59428v = obj;
                return r0Var2;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f59426t) {
        }
        return ((r0) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f59426t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f59427u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    t70.j0 j0Var = (t70.j0) this.f59428v;
                    this.f59427u = 1;
                    if (this.f59429w.invoke(j0Var, this) == coroutineSingletons) {
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
                int i11 = this.f59427u;
                if (i11 != 0) {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                t70.j0 j0Var2 = (t70.j0) this.f59428v;
                this.f59427u = 1;
                Object objInvoke = this.f59429w.invoke(j0Var2, this);
                return objInvoke == coroutineSingletons2 ? coroutineSingletons2 : objInvoke;
        }
    }
}
