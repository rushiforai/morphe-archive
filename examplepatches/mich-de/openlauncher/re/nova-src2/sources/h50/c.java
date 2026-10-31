package h50;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;

/* loaded from: classes.dex */
public final class c extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ k50.c f59163t;

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        c cVar = new c(3, (Continuation) obj3);
        cVar.f59163t = (k50.c) obj;
        cVar.invokeSuspend(Unit.f71706a);
        return null;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        if (this.f59163t.f71122f.d(e.f59173a) == null) {
            return null;
        }
        throw new ClassCastException();
    }
}
