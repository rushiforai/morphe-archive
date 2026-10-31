package hq;

import cw.x1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class q extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f59995t;

    /* renamed from: u, reason: collision with root package name */
    public int f59996u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x1 f59997v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f59997v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f59995t = obj;
        this.f59996u |= Integer.MIN_VALUE;
        return this.f59997v.emit(null, this);
    }
}
