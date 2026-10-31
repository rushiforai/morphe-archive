package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76640t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76641u;

    /* renamed from: v, reason: collision with root package name */
    public int f76642v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76641u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76640t = obj;
        this.f76642v |= Integer.MIN_VALUE;
        Object objF = this.f76641u.f(null, null, null, null, this);
        return objF == CoroutineSingletons.f71806a ? objF : new Result(objF);
    }
}
