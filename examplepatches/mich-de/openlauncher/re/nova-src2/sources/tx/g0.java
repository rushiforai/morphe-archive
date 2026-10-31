package tx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public String f89747t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f89748u;

    /* renamed from: v, reason: collision with root package name */
    public int f89749v;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89748u = obj;
        this.f89749v |= Integer.MIN_VALUE;
        j0 j0Var = j0.f89820a;
        return j0.a(null, null, this);
    }
}
