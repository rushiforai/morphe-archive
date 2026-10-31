package mv;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76827t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ g f76828u;

    /* renamed from: v, reason: collision with root package name */
    public int f76829v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(g gVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76828u = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76827t = obj;
        this.f76829v |= Integer.MIN_VALUE;
        Object objG = this.f76828u.g(null, false, null, null, this);
        return objG == CoroutineSingletons.f71806a ? objG : new Result(objG);
    }
}
