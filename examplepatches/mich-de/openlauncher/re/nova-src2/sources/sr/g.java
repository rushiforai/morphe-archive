package sr;

import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityResult;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;
import w70.t1;

/* loaded from: classes4.dex */
public final class g extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f87704t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ l f87705u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Throwable f87706v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(l lVar, Throwable th2, Continuation continuation) {
        super(2, continuation);
        this.f87705u = lVar;
        this.f87706v = th2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new g(this.f87705u, this.f87706v, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((g) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f87704t;
        if (i5 == 0) {
            ResultKt.b(obj);
            t1 t1Var = this.f87705u.f87727e;
            c cVar = new c(new FinancialConnectionsSheetActivityResult.Failed(this.f87706v));
            this.f87704t = 1;
            if (t1Var.emit(cVar, this) == coroutineSingletons) {
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
