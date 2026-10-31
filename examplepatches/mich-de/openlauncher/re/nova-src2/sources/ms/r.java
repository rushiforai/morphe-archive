package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class r extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76686t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76687u;

    /* renamed from: v, reason: collision with root package name */
    public int f76688v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76687u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.f76686t = obj;
        this.f76688v |= Integer.MIN_VALUE;
        Object objQ = this.f76687u.q(null, null, null, this);
        return objQ == CoroutineSingletons.f71806a ? objQ : new Result(objQ);
    }
}
