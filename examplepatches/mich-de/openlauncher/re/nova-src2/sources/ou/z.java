package ou;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class z extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public as.p f81015t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f81016u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ as.p f81017v;

    /* renamed from: w, reason: collision with root package name */
    public int f81018w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z(as.p pVar, Continuation continuation) {
        super(continuation);
        this.f81017v = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81016u = obj;
        this.f81018w |= Integer.MIN_VALUE;
        return this.f81017v.b(null, this);
    }
}
