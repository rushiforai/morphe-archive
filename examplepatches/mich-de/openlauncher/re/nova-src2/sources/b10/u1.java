package b10;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class u1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f16932t;

    /* renamed from: u, reason: collision with root package name */
    public int f16933u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ int f16934v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f16935w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ u1(int i5, p1.e1 e1Var, Continuation continuation, int i11) {
        super(2, continuation);
        this.f16932t = i11;
        this.f16934v = i5;
        this.f16935w = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f16932t) {
            case 0:
                return new u1(this.f16934v, this.f16935w, continuation, 0);
            default:
                return new u1(this.f16934v, this.f16935w, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f16932t) {
        }
        return ((u1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f16932t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f16933u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    long j11 = (this.f16934v * 120) + 200;
                    this.f16933u = 1;
                    if (t70.t0.b(j11, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                this.f16935w.setValue(Boolean.TRUE);
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f16933u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    long j12 = this.f16934v * 60;
                    this.f16933u = 1;
                    if (t70.t0.b(j12, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                this.f16935w.setValue(Boolean.TRUE);
                return Unit.f71706a;
        }
    }
}
