package v70;

import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class h extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f92156t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ i f92157u;

    /* renamed from: v, reason: collision with root package name */
    public int f92158v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f92157u = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f92156t = obj;
        this.f92158v |= Integer.MIN_VALUE;
        Object objG = this.f92157u.G(null, 0, 0L, this);
        return objG == CoroutineSingletons.f71806a ? objG : new r(objG);
    }
}
