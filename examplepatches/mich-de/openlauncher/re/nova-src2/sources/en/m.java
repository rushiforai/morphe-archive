package en;

import dv.u;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;
import w70.u1;

/* loaded from: classes3.dex */
public final class m extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f52843t;

    /* renamed from: u, reason: collision with root package name */
    public int f52844u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ o f52845v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m(o oVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f52843t = i5;
        this.f52845v = oVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f52843t) {
            case 0:
                return new m(this.f52845v, continuation, 0);
            default:
                return new m(this.f52845v, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        j0 j0Var = (j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f52843t) {
        }
        return ((m) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f52843t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f52844u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    o oVar = this.f52845v;
                    w70.m data = oVar.f52851c.getData();
                    u uVar = new u(oVar.f52852d, 1);
                    this.f52844u = 1;
                    if (data.collect(uVar, this) == coroutineSingletons) {
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
                int i11 = this.f52844u;
                if (i11 != 0) {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                w70.m data2 = this.f52845v.f52851c.getData();
                this.f52844u = 1;
                Object objO = u1.o(data2, this);
                return objO == coroutineSingletons2 ? coroutineSingletons2 : objO;
        }
    }
}
