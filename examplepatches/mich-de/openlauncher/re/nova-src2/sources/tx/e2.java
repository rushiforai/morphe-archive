package tx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f89705t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ g2 f89706u;

    /* renamed from: v, reason: collision with root package name */
    public int f89707v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e2(g2 g2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89706u = g2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89705t = obj;
        this.f89707v |= Integer.MIN_VALUE;
        return this.f89706u.a(null, this);
    }
}
