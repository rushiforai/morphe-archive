package y40;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f96650t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ b0 f96651u;

    /* renamed from: v, reason: collision with root package name */
    public int f96652v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a0(b0 b0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f96651u = b0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f96650t = obj;
        this.f96652v |= Integer.MIN_VALUE;
        return this.f96651u.a(this);
    }
}
