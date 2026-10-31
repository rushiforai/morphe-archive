package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class u0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v0 f94036t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f94037u;

    /* renamed from: v, reason: collision with root package name */
    public int f94038v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ v0 f94039w;

    /* renamed from: x, reason: collision with root package name */
    public Object f94040x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u0(v0 v0Var, Continuation continuation) {
        super(continuation);
        this.f94039w = v0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94037u = obj;
        this.f94038v |= Integer.MIN_VALUE;
        return this.f94039w.emit(null, this);
    }
}
