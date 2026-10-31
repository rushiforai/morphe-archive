package r20;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function4;
import x80.v;

/* loaded from: classes4.dex */
public final class f extends SuspendLambda implements Function4 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ v f85355t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ c f85356u;

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        f fVar = new f(4, (Continuation) obj4);
        fVar.f85355t = (v) obj;
        fVar.f85356u = (c) obj3;
        return fVar.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        v vVar = this.f85355t;
        vVar.g("user_id", this.f85356u.f85344a);
        return vVar;
    }
}
