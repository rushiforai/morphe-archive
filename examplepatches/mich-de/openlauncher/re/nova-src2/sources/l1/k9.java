package l1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class k9 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f73566t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ l9 f73567u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k9(l9 l9Var, Continuation continuation) {
        super(2, continuation);
        this.f73567u = l9Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new k9(this.f73567u, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((k9) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f73566t;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        ResultKt.b(obj);
        Ref.IntRef intRef = new Ref.IntRef();
        l9 l9Var = this.f73567u;
        w70.t1 t1Var = l9Var.f73612a.f61087a;
        j9 j9Var = new j9(intRef, l9Var);
        this.f73566t = 1;
        t1Var.collect(j9Var, this);
        return coroutineSingletons;
    }
}
