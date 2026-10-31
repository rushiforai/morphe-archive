package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class v extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76701t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76702u;

    /* renamed from: v, reason: collision with root package name */
    public int f76703v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76702u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76701t = obj;
        this.f76703v |= Integer.MIN_VALUE;
        Object objT = this.f76702u.t(null, this, false);
        return objT == CoroutineSingletons.f71806a ? objT : new Result(objT);
    }
}
