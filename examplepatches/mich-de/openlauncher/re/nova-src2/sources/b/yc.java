package b;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class yc extends SuspendLambda implements Function1 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f16032t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yc(int i5, Continuation continuation, int i11) {
        super(i5, continuation);
        this.f16032t = i11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        switch (this.f16032t) {
            case 0:
                return new yc(1, continuation, 0);
            default:
                return new yc(1, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f16032t) {
            case 0:
                new yc(1, (Continuation) obj, 0);
                Unit unit = Unit.f71706a;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(unit);
                return unit;
            default:
                return ((yc) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f16032t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                break;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                break;
        }
        return Unit.f71706a;
    }
}
