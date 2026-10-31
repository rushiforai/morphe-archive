package gv;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f57837t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ c0 f57838u;

    /* renamed from: v, reason: collision with root package name */
    public int f57839v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(c0 c0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f57838u = c0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f57837t = obj;
        this.f57839v |= Integer.MIN_VALUE;
        return this.f57838u.a(null, null, this);
    }
}
