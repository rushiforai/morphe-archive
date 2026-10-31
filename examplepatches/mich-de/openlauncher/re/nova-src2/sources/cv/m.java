package cv;

import android.os.Handler;
import android.os.Looper;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import o9.d4;
import t70.j0;

/* loaded from: classes4.dex */
public final class m extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f48020t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ g2.s f48021u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m(g2.s sVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f48020t = i5;
        this.f48021u = sVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f48020t) {
            case 0:
                return new m(this.f48021u, continuation, 0);
            case 1:
                return new m(this.f48021u, continuation, 1);
            default:
                return new m(this.f48021u, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        j0 j0Var = (j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f48020t) {
        }
        return ((m) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f48020t;
        g2.s sVar = this.f48021u;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                g2.s.c(sVar);
                break;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                g2.s.c(sVar);
                break;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                new Handler(Looper.getMainLooper()).post(new d4(sVar, 1));
                break;
        }
        return Unit.f71706a;
    }
}
