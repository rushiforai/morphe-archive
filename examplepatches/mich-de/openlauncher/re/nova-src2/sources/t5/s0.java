package t5;

import androidx.datastore.core.NativeSharedCounter;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class s0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f88690t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ w0 f88691u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ s0(w0 w0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f88690t = i5;
        this.f88691u = w0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f88690t) {
            case 0:
                return new s0(this.f88691u, continuation, 0);
            default:
                return new s0(this.f88691u, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f88690t) {
        }
        return ((s0) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f88690t;
        NativeSharedCounter nativeSharedCounter = d1.f88563b;
        w0 w0Var = this.f88691u;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                return new Integer(nativeSharedCounter.nativeGetCounterValue(((d1) w0Var.f88739i.getValue()).f88564a));
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                return new Integer(nativeSharedCounter.nativeIncrementAndGetCounterValue(((d1) w0Var.f88739i.getValue()).f88564a));
        }
    }
}
