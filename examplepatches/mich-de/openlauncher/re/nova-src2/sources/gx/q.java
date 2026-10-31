package gx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class q extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public b0 f58155t;

    /* renamed from: u, reason: collision with root package name */
    public dx.j0 f58156u;

    /* renamed from: v, reason: collision with root package name */
    public t70.s f58157v;

    /* renamed from: w, reason: collision with root package name */
    public long f58158w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f58159x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ b0 f58160y;

    /* renamed from: z, reason: collision with root package name */
    public int f58161z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(b0 b0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f58160y = b0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58159x = obj;
        this.f58161z |= Integer.MIN_VALUE;
        return this.f58160y.b(this);
    }
}
