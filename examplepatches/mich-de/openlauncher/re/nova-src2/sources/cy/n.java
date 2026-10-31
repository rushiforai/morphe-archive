package cy;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f48514t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ d0 f48515u;

    /* renamed from: v, reason: collision with root package name */
    public int f48516v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(d0 d0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f48515u = d0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f48514t = obj;
        this.f48516v |= Integer.MIN_VALUE;
        return this.f48515u.j(null, this);
    }
}
