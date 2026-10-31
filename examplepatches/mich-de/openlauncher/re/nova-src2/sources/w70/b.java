package w70;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v70.x f93850t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f93851u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ c f93852v;

    /* renamed from: w, reason: collision with root package name */
    public int f93853w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93852v = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93851u = obj;
        this.f93853w |= Integer.MIN_VALUE;
        return this.f93852v.e(null, this);
    }
}
