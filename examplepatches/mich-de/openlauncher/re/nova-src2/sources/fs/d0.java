package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f55754t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ f0 f55755u;

    /* renamed from: v, reason: collision with root package name */
    public int f55756v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d0(f0 f0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55755u = f0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55754t = obj;
        this.f55756v |= Integer.MIN_VALUE;
        Object objE = this.f55755u.e(null, null, this);
        return objE == CoroutineSingletons.f71806a ? objE : new Result(objE);
    }
}
