package e1;

import kotlin.coroutines.jvm.internal.BaseContinuationImpl;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class z extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v2.b f51420t;

    /* renamed from: u, reason: collision with root package name */
    public t0.g1 f51421u;

    /* renamed from: v, reason: collision with root package name */
    public v2.t f51422v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f51423w;

    /* renamed from: x, reason: collision with root package name */
    public int f51424x;

    public z(BaseContinuationImpl baseContinuationImpl) {
        super(baseContinuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f51423w = obj;
        this.f51424x |= Integer.MIN_VALUE;
        return b0.c(null, null, null, this);
    }
}
