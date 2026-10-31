package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class w extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76704t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76705u;

    /* renamed from: v, reason: collision with root package name */
    public int f76706v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76705u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76704t = obj;
        this.f76706v |= Integer.MIN_VALUE;
        Object objU = this.f76705u.u(null, null, this);
        return objU == CoroutineSingletons.f71806a ? objU : new Result(objU);
    }
}
