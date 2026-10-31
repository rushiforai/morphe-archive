package ou;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public g2 f80816t;

    /* renamed from: u, reason: collision with root package name */
    public String f80817u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f80818v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ g2 f80819w;

    /* renamed from: x, reason: collision with root package name */
    public int f80820x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c2(g2 g2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f80819w = g2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f80818v = obj;
        this.f80820x |= Integer.MIN_VALUE;
        return this.f80819w.b(null, this);
    }
}
