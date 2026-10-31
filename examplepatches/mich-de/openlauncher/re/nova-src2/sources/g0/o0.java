package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class o0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v2.b f56639t;

    /* renamed from: u, reason: collision with root package name */
    public v2.n f56640u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56641v;

    /* renamed from: w, reason: collision with root package name */
    public int f56642w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56641v = obj;
        this.f56642w |= Integer.MIN_VALUE;
        return u2.a(null, null, this);
    }
}
