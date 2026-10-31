package du;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f49564t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ m f49565u;

    /* renamed from: v, reason: collision with root package name */
    public int f49566v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(m mVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49565u = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49564t = obj;
        this.f49566v |= Integer.MIN_VALUE;
        Object objF = this.f49565u.f(null, null, this);
        return objF == CoroutineSingletons.f71806a ? objF : new Result(objF);
    }
}
