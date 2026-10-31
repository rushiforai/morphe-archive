package qx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class h1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public i1 f84503t;

    /* renamed from: u, reason: collision with root package name */
    public l f84504u;

    /* renamed from: v, reason: collision with root package name */
    public sx.j f84505v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f84506w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ i1 f84507x;

    /* renamed from: y, reason: collision with root package name */
    public int f84508y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h1(i1 i1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f84507x = i1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84506w = obj;
        this.f84508y |= Integer.MIN_VALUE;
        return this.f84507x.o(null, this);
    }
}
