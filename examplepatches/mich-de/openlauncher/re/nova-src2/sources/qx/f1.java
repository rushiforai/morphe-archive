package qx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class f1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public i1 f84485t;

    /* renamed from: u, reason: collision with root package name */
    public l f84486u;

    /* renamed from: v, reason: collision with root package name */
    public sx.j f84487v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f84488w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ i1 f84489x;

    /* renamed from: y, reason: collision with root package name */
    public int f84490y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f1(i1 i1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f84489x = i1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84488w = obj;
        this.f84490y |= Integer.MIN_VALUE;
        return this.f84489x.n(null, this);
    }
}
