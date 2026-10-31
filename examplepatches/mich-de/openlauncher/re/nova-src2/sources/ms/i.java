package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76655t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76656u;

    /* renamed from: v, reason: collision with root package name */
    public int f76657v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76656u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76655t = obj;
        this.f76657v |= Integer.MIN_VALUE;
        Object objI = this.f76656u.i(null, null, this);
        return objI == CoroutineSingletons.f71806a ? objI : new Result(objI);
    }
}
