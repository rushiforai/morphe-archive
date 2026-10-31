package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class k2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v2.b f56610t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f56611u;

    /* renamed from: v, reason: collision with root package name */
    public int f56612v;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56611u = obj;
        this.f56612v |= Integer.MIN_VALUE;
        return t2.a(null, this);
    }
}
