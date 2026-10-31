package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public y f55772t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f55773u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ y f55774v;

    /* renamed from: w, reason: collision with root package name */
    public int f55775w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55774v = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55773u = obj;
        this.f55775w |= Integer.MIN_VALUE;
        Object objG = this.f55774v.g(null, this);
        return objG == CoroutineSingletons.f71806a ? objG : new Result(objG);
    }
}
