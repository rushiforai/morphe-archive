package bn;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class q0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f18266t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ r0 f18267u;

    /* renamed from: v, reason: collision with root package name */
    public int f18268v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q0(r0 r0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f18267u = r0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f18266t = obj;
        this.f18268v |= Integer.MIN_VALUE;
        return r0.a(this.f18267u, this);
    }
}
