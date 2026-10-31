package mx;

import cw.x1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class y0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f77276t;

    /* renamed from: u, reason: collision with root package name */
    public int f77277u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x1 f77278v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y0(x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f77278v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f77276t = obj;
        this.f77277u |= Integer.MIN_VALUE;
        return this.f77278v.emit(null, this);
    }
}
