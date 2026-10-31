package g0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final class h0 extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f56552t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ h0(int i5, Continuation continuation, int i11) {
        super(i5, continuation);
        this.f56552t = i11;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f56552t) {
            case 0:
                long j11 = ((h2.b) obj2).f59016a;
                return new h0(3, (Continuation) obj3, 0).invokeSuspend(Unit.f71706a);
            case 1:
                ((Number) obj2).floatValue();
                return new h0(3, (Continuation) obj3, 1).invokeSuspend(Unit.f71706a);
            default:
                long j12 = ((h2.b) obj2).f59016a;
                return new h0(3, (Continuation) obj3, 2).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f56552t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                break;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                break;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                break;
        }
        return Unit.f71706a;
    }
}
