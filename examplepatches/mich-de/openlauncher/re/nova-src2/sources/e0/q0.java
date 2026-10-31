package e0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class q0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public i0.f f50100t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f50101u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ t0 f50102v;

    /* renamed from: w, reason: collision with root package name */
    public int f50103w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q0(t0 t0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f50102v = t0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f50101u = obj;
        this.f50103w |= Integer.MIN_VALUE;
        return t0.B(this.f50102v, this);
    }
}
