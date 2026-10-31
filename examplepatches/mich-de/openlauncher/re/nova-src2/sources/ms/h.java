package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class h extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76652t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76653u;

    /* renamed from: v, reason: collision with root package name */
    public int f76654v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76653u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76652t = obj;
        this.f76654v |= Integer.MIN_VALUE;
        Object objH = this.f76653u.h(null, null, this);
        return objH == CoroutineSingletons.f71806a ? objH : new Result(objH);
    }
}
