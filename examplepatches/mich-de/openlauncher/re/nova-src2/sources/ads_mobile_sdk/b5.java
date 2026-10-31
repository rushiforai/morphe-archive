package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.t0;

/* loaded from: classes.dex */
public final class b5 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f1272a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f5 f1273b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f1274t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b5(f5 f5Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f1274t = i5;
        this.f1273b = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f1274t) {
            case 0:
                return new b5(this.f1273b, continuation, 0);
            default:
                return new b5(this.f1273b, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f1274t) {
            case 0:
                return new b5(this.f1273b, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                return new b5(this.f1273b, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f1274t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f1272a;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return Unit.f71706a;
                }
                ResultKt.b(obj);
                this.f1272a = 1;
                f5.b(this.f1273b, this);
                return coroutineSingletons;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f1272a;
                f5 f5Var = this.f1273b;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    long j11 = f5Var.f3168l;
                    this.f1272a = 1;
                    if (t0.c(j11, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        if (i11 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    ResultKt.b(obj);
                }
                this.f1272a = 2;
                if (f5.a(f5Var, this) == coroutineSingletons2) {
                    return coroutineSingletons2;
                }
                return Unit.f71706a;
        }
    }
}
