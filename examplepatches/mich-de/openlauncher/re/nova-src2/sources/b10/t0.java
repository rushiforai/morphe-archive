package b10;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class t0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f16913t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ boolean f16914u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t0(boolean z11, Continuation continuation) {
        super(2, continuation);
        this.f16914u = z11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new t0(this.f16914u, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((t0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f16913t;
        if (i5 == 0) {
            ResultKt.b(obj);
            s0 s0Var = new s0(this.f16914u, null, 0);
            this.f16913t = 1;
            if (t70.k0.d(s0Var, this) == coroutineSingletons) {
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
