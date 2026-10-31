package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class q extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76683t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76684u;

    /* renamed from: v, reason: collision with root package name */
    public int f76685v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76684u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76683t = obj;
        this.f76685v |= Integer.MIN_VALUE;
        Object objP = this.f76684u.p(null, this, false);
        return objP == CoroutineSingletons.f71806a ? objP : new Result(objP);
    }
}
