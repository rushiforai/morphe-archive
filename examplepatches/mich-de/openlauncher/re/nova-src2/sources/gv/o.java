package gv;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f57907t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x f57908u;

    /* renamed from: v, reason: collision with root package name */
    public int f57909v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(x xVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f57908u = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f57907t = obj;
        this.f57909v |= Integer.MIN_VALUE;
        Object objG = this.f57908u.g(null, null, null, this);
        return objG == CoroutineSingletons.f71806a ? objG : new Result(objG);
    }
}
