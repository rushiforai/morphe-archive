package bn;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes3.dex */
public final class b1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public String f18134t;

    /* renamed from: u, reason: collision with root package name */
    public z0 f18135u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f18136v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ c1 f18137w;

    /* renamed from: x, reason: collision with root package name */
    public int f18138x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b1(c1 c1Var, Continuation continuation) {
        super(continuation);
        this.f18137w = c1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f18136v = obj;
        this.f18138x |= Integer.MIN_VALUE;
        return c1.a(this.f18137w, null, null, this);
    }
}
