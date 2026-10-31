package e0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class r0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f50112t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ t0 f50113u;

    /* renamed from: v, reason: collision with root package name */
    public int f50114v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r0(t0 t0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f50113u = t0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f50112t = obj;
        this.f50114v |= Integer.MIN_VALUE;
        return t0.D(this.f50113u, this);
    }
}
