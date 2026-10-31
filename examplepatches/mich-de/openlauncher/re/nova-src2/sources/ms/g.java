package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76649t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76650u;

    /* renamed from: v, reason: collision with root package name */
    public int f76651v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76650u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76649t = obj;
        this.f76651v |= Integer.MIN_VALUE;
        Object objG = this.f76650u.g(null, null, null, this);
        return objG == CoroutineSingletons.f71806a ? objG : new Result(objG);
    }
}
