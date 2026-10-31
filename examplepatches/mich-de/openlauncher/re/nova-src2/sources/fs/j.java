package fs;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f55788t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ y f55789u;

    /* renamed from: v, reason: collision with root package name */
    public int f55790v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55789u = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55788t = obj;
        this.f55790v |= Integer.MIN_VALUE;
        return this.f55789u.j(null, null, this);
    }
}
