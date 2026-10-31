package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f55760t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ f0 f55761u;

    /* renamed from: v, reason: collision with root package name */
    public int f55762v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e0(f0 f0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55761u = f0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55760t = obj;
        this.f55762v |= Integer.MIN_VALUE;
        Object objG = this.f55761u.g(null, null, null, null, null, null, this);
        return objG == CoroutineSingletons.f71806a ? objG : new Result(objG);
    }
}
