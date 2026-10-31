package n1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f77661t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ n f77662u;

    /* renamed from: v, reason: collision with root package name */
    public int f77663v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(n nVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f77662u = nVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f77661t = obj;
        this.f77663v |= Integer.MIN_VALUE;
        return this.f77662u.t(0L, this);
    }
}
