package l1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class g0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f73325t;

    /* renamed from: u, reason: collision with root package name */
    public c0.l1 f73326u;

    /* renamed from: v, reason: collision with root package name */
    public Ref.FloatRef f73327v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f73328w;

    /* renamed from: x, reason: collision with root package name */
    public int f73329x;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f73328w = obj;
        this.f73329x |= Integer.MIN_VALUE;
        return i0.f(null, 0.0f, null, null, this);
    }
}
