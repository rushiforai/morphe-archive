package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f55730t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ y f55731u;

    /* renamed from: v, reason: collision with root package name */
    public int f55732v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55731u = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55730t = obj;
        this.f55732v |= Integer.MIN_VALUE;
        Object objB = this.f55731u.b(null, this);
        return objB == CoroutineSingletons.f71806a ? objB : new Result(objB);
    }
}
