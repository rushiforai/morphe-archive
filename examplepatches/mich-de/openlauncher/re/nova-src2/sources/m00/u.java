package m00;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public as.o f75644t;

    /* renamed from: u, reason: collision with root package name */
    public String f75645u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f75646v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ as.o f75647w;

    /* renamed from: x, reason: collision with root package name */
    public int f75648x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(as.o oVar, Continuation continuation) {
        super(continuation);
        this.f75647w = oVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75646v = obj;
        this.f75648x |= Integer.MIN_VALUE;
        return this.f75647w.a(null, this);
    }
}
