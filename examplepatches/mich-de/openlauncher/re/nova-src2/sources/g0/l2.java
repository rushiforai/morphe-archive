package g0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class l2 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f56622t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h1 f56623u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l2(h1 h1Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f56622t = i5;
        this.f56623u = h1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f56622t) {
            case 0:
                return new l2(this.f56623u, continuation, 0);
            case 1:
                return new l2(this.f56623u, continuation, 1);
            case 2:
                return new l2(this.f56623u, continuation, 2);
            case 3:
                return new l2(this.f56623u, continuation, 3);
            case 4:
                return new l2(this.f56623u, continuation, 4);
            case 5:
                return new l2(this.f56623u, continuation, 5);
            case 6:
                return new l2(this.f56623u, continuation, 6);
            default:
                return new l2(this.f56623u, continuation, 7);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f56622t) {
        }
        return ((l2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f56622t;
        h1 h1Var = this.f56623u;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                h1Var.a();
                break;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                h1Var.b();
                break;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                h1Var.b();
                break;
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                h1Var.a();
                break;
            case 4:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                h1Var.b();
                break;
            case 5:
                CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                h1Var.b();
                break;
            case 6:
                CoroutineSingletons coroutineSingletons7 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                h1Var.a();
                break;
            default:
                CoroutineSingletons coroutineSingletons8 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                h1Var.b();
                break;
        }
        return Unit.f71706a;
    }
}
