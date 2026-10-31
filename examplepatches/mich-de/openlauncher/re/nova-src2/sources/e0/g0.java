package e0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class g0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f49997t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h0 f49998u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g0(h0 h0Var, Continuation continuation) {
        super(2, continuation);
        this.f49998u = h0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new g0(this.f49998u, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((g0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f49997t;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        ResultKt.b(obj);
        Ref.IntRef intRef = new Ref.IntRef();
        Ref.IntRef intRef2 = new Ref.IntRef();
        Ref.IntRef intRef3 = new Ref.IntRef();
        h0 h0Var = this.f49998u;
        w70.t1 t1Var = h0Var.f50005a.f61087a;
        f0 f0Var = new f0(intRef, intRef2, intRef3, h0Var);
        this.f49997t = 1;
        t1Var.collect(f0Var, this);
        return coroutineSingletons;
    }
}
