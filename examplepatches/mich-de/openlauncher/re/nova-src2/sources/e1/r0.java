package e1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class r0 extends SuspendLambda implements Function1 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f51373t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ a1 f51374u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r0(a1 a1Var, Continuation continuation, int i5) {
        super(1, continuation);
        this.f51373t = i5;
        this.f51374u = a1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        switch (this.f51373t) {
            case 0:
                return new r0(this.f51374u, continuation, 0);
            case 1:
                return new r0(this.f51374u, continuation, 1);
            case 2:
                return new r0(this.f51374u, continuation, 2);
            default:
                return new r0(this.f51374u, continuation, 3);
        }
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Continuation continuation = (Continuation) obj;
        switch (this.f51373t) {
        }
        return ((r0) create(continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f51373t;
        a1 a1Var = this.f51374u;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                a1Var.A = false;
                break;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                a1Var.h();
                break;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                a1Var.f(a1Var.A);
                break;
            default:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                a1Var.q();
                break;
        }
        return Unit.f71706a;
    }
}
