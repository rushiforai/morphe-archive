package e10;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class r2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f51785t;

    /* renamed from: u, reason: collision with root package name */
    public int f51786u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p2 f51787v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r2(p2 p2Var, Continuation continuation) {
        super(continuation);
        this.f51787v = p2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f51785t = obj;
        this.f51786u |= Integer.MIN_VALUE;
        return this.f51787v.emit(null, this);
    }
}
