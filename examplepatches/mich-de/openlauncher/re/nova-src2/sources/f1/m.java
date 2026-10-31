package f1;

import androidx.compose.material.AnchoredDragFinishedSignal;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class m extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f53737t;

    /* renamed from: u, reason: collision with root package name */
    public int f53738u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Function2 f53739v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Object f53740w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f53741x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m(Function2 function2, Object obj, t70.j0 j0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f53737t = i5;
        this.f53739v = function2;
        this.f53740w = obj;
        this.f53741x = j0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f53737t) {
            case 0:
                return new m(this.f53739v, this.f53740w, this.f53741x, continuation, 0);
            default:
                return new m(this.f53739v, this.f53740w, this.f53741x, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f53737t) {
        }
        return ((m) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f53737t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f53738u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    this.f53738u = 1;
                    if (this.f53739v.invoke(this.f53740w, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                t70.k0.c(this.f53741x, new AnchoredDragFinishedSignal());
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f53738u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    this.f53738u = 1;
                    if (this.f53739v.invoke(this.f53740w, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                t70.k0.c(this.f53741x, new m1.f());
                return Unit.f71706a;
        }
    }
}
