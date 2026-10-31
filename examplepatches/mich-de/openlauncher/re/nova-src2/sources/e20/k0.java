package e20;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f52043t;

    /* renamed from: u, reason: collision with root package name */
    public int f52044u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ as.p f52045v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k0(as.p pVar, Continuation continuation) {
        super(continuation);
        this.f52045v = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52043t = obj;
        this.f52044u |= Integer.MIN_VALUE;
        return this.f52045v.emit(null, this);
    }
}
