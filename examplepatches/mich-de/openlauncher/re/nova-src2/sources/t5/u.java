package t5;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c0 f88699t;

    /* renamed from: u, reason: collision with root package name */
    public i1 f88700u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f88701v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f88702w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ c0 f88703x;

    /* renamed from: y, reason: collision with root package name */
    public int f88704y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(c0 c0Var, Continuation continuation) {
        super(continuation);
        this.f88703x = c0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88702w = obj;
        this.f88704y |= Integer.MIN_VALUE;
        return c0.e(this.f88703x, false, this);
    }
}
