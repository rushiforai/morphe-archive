package w20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93655t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ c f93656u;

    /* renamed from: v, reason: collision with root package name */
    public int f93657v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93656u = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93655t = obj;
        this.f93657v |= Integer.MIN_VALUE;
        return this.f93656u.b(null, this);
    }
}
