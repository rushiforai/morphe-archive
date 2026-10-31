package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76670t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76671u;

    /* renamed from: v, reason: collision with root package name */
    public int f76672v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76671u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.f76670t = obj;
        this.f76672v |= Integer.MIN_VALUE;
        Object objN = this.f76671u.n(null, null, null, null, null, null, null, null, null, this);
        return objN == CoroutineSingletons.f71806a ? objN : new Result(objN);
    }
}
