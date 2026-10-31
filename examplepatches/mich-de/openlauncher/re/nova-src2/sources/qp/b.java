package qp;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f84297t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ c f84298u;

    /* renamed from: v, reason: collision with root package name */
    public int f84299v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f84298u = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84297t = obj;
        this.f84299v |= Integer.MIN_VALUE;
        return this.f84298u.a(null, null, this);
    }
}
