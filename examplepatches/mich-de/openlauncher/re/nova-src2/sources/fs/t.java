package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class t extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public y f55829t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f55830u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ y f55831v;

    /* renamed from: w, reason: collision with root package name */
    public int f55832w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55831v = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55830u = obj;
        this.f55832w |= Integer.MIN_VALUE;
        Object objU = this.f55831v.u(null, null, null, null, null, null, this);
        return objU == CoroutineSingletons.f71806a ? objU : new Result(objU);
    }
}
