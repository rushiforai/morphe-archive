package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class d0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public p f56489t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f56490u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ g0 f56491v;

    /* renamed from: w, reason: collision with root package name */
    public int f56492w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d0(g0 g0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56491v = g0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56490u = obj;
        this.f56492w |= Integer.MIN_VALUE;
        return g0.E(this.f56491v, null, this);
    }
}
