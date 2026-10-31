package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class k1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.FloatRef f56607t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f56608u;

    /* renamed from: v, reason: collision with root package name */
    public int f56609v;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56608u = obj;
        this.f56609v |= Integer.MIN_VALUE;
        return m1.b(null, 0.0f, this);
    }
}
