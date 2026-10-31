package gx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public q0 f58132t;

    /* renamed from: u, reason: collision with root package name */
    public Object f58133u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f58134v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f58135w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ q0 f58136x;

    /* renamed from: y, reason: collision with root package name */
    public int f58137y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n0(q0 q0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f58136x = q0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58135w = obj;
        this.f58137y |= Integer.MIN_VALUE;
        return q0.b(this.f58136x, null, false, this);
    }
}
