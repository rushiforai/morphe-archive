package b10;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class s0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f16888t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f16889u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ boolean f16890v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ s0(boolean z11, Continuation continuation, int i5) {
        super(2, continuation);
        this.f16888t = i5;
        this.f16890v = z11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f16888t) {
            case 0:
                s0 s0Var = new s0(this.f16890v, continuation, 0);
                s0Var.f16889u = obj;
                return s0Var;
            default:
                s0 s0Var2 = new s0(this.f16890v, continuation, 1);
                s0Var2.f16889u = obj;
                return s0Var2;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f16888t) {
        }
        return ((s0) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f16888t;
        boolean z11 = this.f16890v;
        int i11 = 2;
        Continuation continuation = null;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                t70.j0 j0Var = (t70.j0) this.f16889u;
                t70.m0.t(j0Var, null, null, new r0(i11, continuation, 0), 3);
                if (z11) {
                    t70.m0.t(j0Var, null, null, new r0(i11, continuation, 1), 3);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                t70.j0 j0Var2 = (t70.j0) this.f16889u;
                t70.m0.t(j0Var2, null, null, new r0(i11, continuation, 17), 3);
                return t70.m0.t(j0Var2, null, null, new lw.c(z11, continuation, 7), 3);
        }
    }
}
