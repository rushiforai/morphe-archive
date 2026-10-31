package ms;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76631t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f76632u;

    /* renamed from: v, reason: collision with root package name */
    public int f76633v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76632u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76631t = obj;
        this.f76633v |= Integer.MIN_VALUE;
        Object objE = this.f76632u.e(null, null, null, null, this);
        return objE == CoroutineSingletons.f71806a ? objE : new Result(objE);
    }
}
