package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class s extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76689t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76690u;

    /* renamed from: v, reason: collision with root package name */
    public int f76691v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76690u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.f76689t = obj;
        this.f76691v |= Integer.MIN_VALUE;
        Object objR = this.f76690u.r(null, null, null, null, this);
        return objR == CoroutineSingletons.f71806a ? objR : new Result(objR);
    }
}
