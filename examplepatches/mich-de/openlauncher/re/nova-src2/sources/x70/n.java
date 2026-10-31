package x70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f95246t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ o f95247u;

    /* renamed from: v, reason: collision with root package name */
    public int f95248v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(o oVar, Continuation continuation) {
        super(continuation);
        this.f95247u = oVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f95246t = obj;
        this.f95248v |= Integer.MIN_VALUE;
        return this.f95247u.emit(null, this);
    }
}
