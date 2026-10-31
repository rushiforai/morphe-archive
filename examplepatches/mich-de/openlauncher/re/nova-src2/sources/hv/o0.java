package hv;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public p0 f60448t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f60449u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p0 f60450v;

    /* renamed from: w, reason: collision with root package name */
    public int f60451w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o0(p0 p0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f60450v = p0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f60449u = obj;
        this.f60451w |= Integer.MIN_VALUE;
        return p0.a(this.f60450v, this);
    }
}
