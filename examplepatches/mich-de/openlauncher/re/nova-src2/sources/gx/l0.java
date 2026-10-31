package gx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public q0 f58116t;

    /* renamed from: u, reason: collision with root package name */
    public c0 f58117u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f58118v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ q0 f58119w;

    /* renamed from: x, reason: collision with root package name */
    public int f58120x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l0(q0 q0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f58119w = q0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58118v = obj;
        this.f58120x |= Integer.MIN_VALUE;
        return this.f58119w.h(this);
    }
}
