package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76698t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76699u;

    /* renamed from: v, reason: collision with root package name */
    public int f76700v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76699u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.f76698t = obj;
        this.f76700v |= Integer.MIN_VALUE;
        Object objS = this.f76699u.s(null, null, null, null, null, null, null, this);
        return objS == CoroutineSingletons.f71806a ? objS : new Result(objS);
    }
}
