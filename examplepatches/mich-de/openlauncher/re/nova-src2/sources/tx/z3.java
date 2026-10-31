package tx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class z3 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f90090t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ a4 f90091u;

    /* renamed from: v, reason: collision with root package name */
    public int f90092v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z3(a4 a4Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f90091u = a4Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f90090t = obj;
        this.f90092v |= Integer.MIN_VALUE;
        return this.f90091u.f(null, this);
    }
}
