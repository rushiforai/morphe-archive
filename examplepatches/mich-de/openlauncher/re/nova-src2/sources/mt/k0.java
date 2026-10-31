package mt;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76776t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ n0 f76777u;

    /* renamed from: v, reason: collision with root package name */
    public int f76778v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k0(n0 n0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76777u = n0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76776t = obj;
        this.f76778v |= Integer.MIN_VALUE;
        return this.f76777u.b(this);
    }
}
