package gv;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class z extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public bn.i f57998t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f57999u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ a0 f58000v;

    /* renamed from: w, reason: collision with root package name */
    public int f58001w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z(a0 a0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f58000v = a0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f57999u = obj;
        this.f58001w |= Integer.MIN_VALUE;
        return this.f58000v.a(null, null, this);
    }
}
