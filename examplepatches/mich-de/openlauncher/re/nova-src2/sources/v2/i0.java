package v2;

import kotlin.coroutines.jvm.internal.BaseContinuationImpl;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class i0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f91938t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ j0 f91939u;

    /* renamed from: v, reason: collision with root package name */
    public int f91940v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i0(j0 j0Var, BaseContinuationImpl baseContinuationImpl) {
        super(baseContinuationImpl);
        this.f91939u = j0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f91938t = obj;
        this.f91940v |= Integer.MIN_VALUE;
        return this.f91939u.m(0L, null, this);
    }
}
