package ky;

import g0.n1;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import m0.b0;
import t70.j0;
import t70.t0;

/* loaded from: classes4.dex */
public final class g extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f72780t = 1;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ b0 f72781u;

    /* renamed from: v, reason: collision with root package name */
    public int f72782v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ int f72783w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(b0 b0Var, int i5, int i11, Continuation continuation) {
        super(2, continuation);
        this.f72781u = b0Var;
        this.f72782v = i5;
        this.f72783w = i11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f72780t) {
            case 0:
                return new g(this.f72781u, this.f72783w, continuation);
            default:
                return new g(this.f72781u, this.f72782v, this.f72783w, continuation);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f72780t) {
            case 0:
                return ((g) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            default:
                return ((g) create((n1) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f72780t;
        int i11 = this.f72783w;
        b0 b0Var = this.f72781u;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i12 = this.f72782v;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    this.f72782v = 1;
                    if (t0.b(200L, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i12 != 1) {
                        if (i12 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    ResultKt.b(obj);
                }
                this.f72782v = 2;
                if (b0Var.f(i11, 500, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                b0Var.k(this.f72782v, i11);
                return Unit.f71706a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(b0 b0Var, int i5, Continuation continuation) {
        super(2, continuation);
        this.f72781u = b0Var;
        this.f72783w = i5;
    }
}
