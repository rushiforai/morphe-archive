package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class h extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f55778t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ y f55779u;

    /* renamed from: v, reason: collision with root package name */
    public int f55780v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55779u = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55778t = obj;
        this.f55780v |= Integer.MIN_VALUE;
        Object objH = this.f55779u.h(this);
        return objH == CoroutineSingletons.f71806a ? objH : new Result(objH);
    }
}
