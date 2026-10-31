package hv;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class h0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f60278t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ i0 f60279u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h0(i0 i0Var, Continuation continuation) {
        super(2, continuation);
        this.f60279u = i0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new h0(this.f60279u, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((h0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f60278t;
        if (i5 == 0) {
            ResultKt.b(obj);
            i0 i0Var = this.f60279u;
            w70.g2 g2Var = i0Var.f60311h;
            e0 e0Var = new e0(i0Var, 5);
            this.f60278t = 1;
            Object objCollect = g2Var.collect(new cw.x1(e0Var, 8), this);
            if (objCollect != coroutineSingletons) {
                objCollect = Unit.f71706a;
            }
            if (objCollect == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }
}
