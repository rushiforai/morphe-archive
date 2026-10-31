package h;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class l extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f58707t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(Ref.BooleanRef booleanRef, Continuation continuation) {
        super(3, continuation);
        this.f58707t = booleanRef;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        return new l(this.f58707t, (Continuation) obj3).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        this.f58707t.f71859a = true;
        return Unit.f71706a;
    }
}
