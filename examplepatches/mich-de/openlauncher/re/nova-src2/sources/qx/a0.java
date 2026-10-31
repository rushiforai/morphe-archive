package qx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f84426t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ g0 f84427u;

    /* renamed from: v, reason: collision with root package name */
    public int f84428v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a0(g0 g0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f84427u = g0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84426t = obj;
        this.f84428v |= Integer.MIN_VALUE;
        return this.f84427u.a(0, null, null, this);
    }
}
