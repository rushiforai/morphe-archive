package w5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c f93754t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f93755u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ c f93756v;

    /* renamed from: w, reason: collision with root package name */
    public int f93757w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93756v = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93755u = obj;
        this.f93757w |= Integer.MIN_VALUE;
        return this.f93756v.b(null, this);
    }
}
