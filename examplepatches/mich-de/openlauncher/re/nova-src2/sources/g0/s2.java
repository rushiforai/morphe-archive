package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class s2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v2.b f56691t;

    /* renamed from: u, reason: collision with root package name */
    public v2.n f56692u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56693v;

    /* renamed from: w, reason: collision with root package name */
    public int f56694w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56693v = obj;
        this.f56694w |= Integer.MIN_VALUE;
        return t2.i(null, null, this);
    }
}
