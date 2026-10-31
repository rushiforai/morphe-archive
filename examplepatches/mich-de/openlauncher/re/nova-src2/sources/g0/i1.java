package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class i1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.FloatRef f56578t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f56579u;

    /* renamed from: v, reason: collision with root package name */
    public int f56580v;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56579u = obj;
        this.f56580v |= Integer.MIN_VALUE;
        return m1.a(null, 0.0f, null, this);
    }
}
