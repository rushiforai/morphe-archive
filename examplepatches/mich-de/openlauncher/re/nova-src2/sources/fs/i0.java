package fs;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class i0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public h0 f55785t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f55786u;

    /* renamed from: v, reason: collision with root package name */
    public int f55787v;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55786u = obj;
        this.f55787v |= Integer.MIN_VALUE;
        return j0.b(null, this);
    }
}
