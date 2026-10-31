package t5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class q extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c0 f88666t;

    /* renamed from: u, reason: collision with root package name */
    public c80.d f88667u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f88668v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ c0 f88669w;

    /* renamed from: x, reason: collision with root package name */
    public int f88670x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(c0 c0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88669w = c0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88668v = obj;
        this.f88670x |= Integer.MIN_VALUE;
        return c0.b(this.f88669w, this);
    }
}
