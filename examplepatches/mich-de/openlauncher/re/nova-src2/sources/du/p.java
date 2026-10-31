package du;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class p extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f49576t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ q f49577u;

    /* renamed from: v, reason: collision with root package name */
    public int f49578v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(q qVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49577u = qVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49576t = obj;
        this.f49578v |= Integer.MIN_VALUE;
        Object objG = this.f49577u.g(null, null, null, this);
        return objG == CoroutineSingletons.f71806a ? objG : new Result(objG);
    }
}
