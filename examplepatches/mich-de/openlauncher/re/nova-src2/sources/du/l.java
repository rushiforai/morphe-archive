package du;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f49567t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ m f49568u;

    /* renamed from: v, reason: collision with root package name */
    public int f49569v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(m mVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49568u = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49567t = obj;
        this.f49569v |= Integer.MIN_VALUE;
        Object objG = this.f49568u.g(null, null, null, this);
        return objG == CoroutineSingletons.f71806a ? objG : new Result(objG);
    }
}
