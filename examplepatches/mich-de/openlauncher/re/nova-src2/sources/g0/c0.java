package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class c0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public o f56472t;

    /* renamed from: u, reason: collision with root package name */
    public i0.b f56473u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56474v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ g0 f56475w;

    /* renamed from: x, reason: collision with root package name */
    public int f56476x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c0(g0 g0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56475w = g0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56474v = obj;
        this.f56476x |= Integer.MIN_VALUE;
        return g0.D(this.f56475w, null, this);
    }
}
