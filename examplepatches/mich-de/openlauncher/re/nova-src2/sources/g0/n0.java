package g0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class n0 extends RestrictedSuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f56629t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f56630u;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        n0 n0Var = new n0(2, continuation);
        n0Var.f56630u = obj;
        return n0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((n0) create((v2.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f56629t;
        if (i5 == 0) {
            ResultKt.b(obj);
            v2.b bVar = (v2.b) this.f56630u;
            this.f56629t = 1;
            if (u2.a(bVar, v2.n.f91982c, this) == coroutineSingletons) {
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
