package ou;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public as.p f80812t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f80813u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ as.p f80814v;

    /* renamed from: w, reason: collision with root package name */
    public int f80815w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c1(as.p pVar, Continuation continuation) {
        super(continuation);
        this.f80814v = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f80813u = obj;
        this.f80815w |= Integer.MIN_VALUE;
        return this.f80814v.e(null, this);
    }
}
