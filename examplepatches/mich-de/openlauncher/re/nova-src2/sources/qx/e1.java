package qx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public i1 f84474t;

    /* renamed from: u, reason: collision with root package name */
    public l f84475u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f84476v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ i1 f84477w;

    /* renamed from: x, reason: collision with root package name */
    public int f84478x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e1(i1 i1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f84477w = i1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84476v = obj;
        this.f84478x |= Integer.MIN_VALUE;
        return i1.b(this.f84477w, null, this);
    }
}
