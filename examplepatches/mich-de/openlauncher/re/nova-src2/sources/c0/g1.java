package c0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class g1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f18813t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f18814u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ i1 f18815v;

    /* renamed from: w, reason: collision with root package name */
    public int f18816w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g1(i1 i1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f18815v = i1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f18814u = obj;
        this.f18816w |= Integer.MIN_VALUE;
        return i1.l(this.f18815v, this);
    }
}
