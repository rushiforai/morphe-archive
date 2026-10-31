package t5;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final class o extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f88660t = 1;

    /* renamed from: u, reason: collision with root package name */
    public int f88661u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f88662v;

    public /* synthetic */ o(int i5, Continuation continuation) {
        super(i5, continuation);
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f88660t) {
            case 0:
                return new o((c0) this.f88662v, (Continuation) obj3).invokeSuspend(Unit.f71706a);
            default:
                ((Boolean) obj2).getClass();
                o oVar = new o(3, (Continuation) obj3);
                oVar.f88662v = (a1) obj;
                return oVar.invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f88660t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f88661u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    c0 c0Var = (c0) this.f88662v;
                    this.f88661u = 1;
                    if (c0.b(c0Var, this) == coroutineSingletons) {
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
                int i11 = this.f88661u;
                if (i11 != 0) {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                a1 a1Var = (a1) this.f88662v;
                this.f88661u = 1;
                Object objE = a1Var.e(this);
                return objE == coroutineSingletons2 ? coroutineSingletons2 : objE;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(c0 c0Var, Continuation continuation) {
        super(3, continuation);
        this.f88662v = c0Var;
    }
}
