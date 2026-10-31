package w70;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class z0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f94091t;

    /* renamed from: u, reason: collision with root package name */
    public t0 f94092u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f94093v;

    /* renamed from: w, reason: collision with root package name */
    public int f94094w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94093v = obj;
        this.f94094w |= Integer.MIN_VALUE;
        return u1.q(null, this);
    }
}
