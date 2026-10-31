package cy;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public String f48428t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f48429u;

    /* renamed from: v, reason: collision with root package name */
    public int f48430v;

    public b0(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f48429u = obj;
        this.f48430v |= Integer.MIN_VALUE;
        return d0.J(null, this);
    }
}
