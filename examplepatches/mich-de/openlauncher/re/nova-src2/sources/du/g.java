package du;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f49546t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ i f49547u;

    /* renamed from: v, reason: collision with root package name */
    public int f49548v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49547u = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49546t = obj;
        this.f49548v |= Integer.MIN_VALUE;
        Object objE = this.f49547u.e(null, this);
        return objE == CoroutineSingletons.f71806a ? objE : new Result(objE);
    }
}
