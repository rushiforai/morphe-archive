package g0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class w1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f56744t;

    /* renamed from: u, reason: collision with root package name */
    public int f56745u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ a2 f56746v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ long f56747w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ w1(a2 a2Var, long j11, Continuation continuation, int i5) {
        super(2, continuation);
        this.f56744t = i5;
        this.f56746v = a2Var;
        this.f56747w = j11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f56744t) {
            case 0:
                return new w1(this.f56746v, this.f56747w, continuation, 0);
            case 1:
                return new w1(this.f56746v, this.f56747w, continuation, 1);
            default:
                return new w1(this.f56746v, this.f56747w, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f56744t) {
        }
        return ((w1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f56744t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f56745u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    h2 h2Var = this.f56746v.o;
                    this.f56745u = 1;
                    if (h2Var.b(this.f56747w, false, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f56745u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    h2 h2Var2 = this.f56746v.o;
                    e0.f1 f1Var = e0.f1.f49977b;
                    x1 x1Var = new x1(this.f56747w, null);
                    this.f56745u = 1;
                    if (h2Var2.f(f1Var, x1Var, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f56745u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    h2 h2Var3 = this.f56746v.o;
                    this.f56745u = 1;
                    if (h2Var3.b(this.f56747w, true, this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
