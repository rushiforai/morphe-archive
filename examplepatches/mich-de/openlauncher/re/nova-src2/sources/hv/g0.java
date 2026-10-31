package hv;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f60266t;

    /* renamed from: u, reason: collision with root package name */
    public int f60267u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ cw.x1 f60268v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g0(cw.x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f60268v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f60266t = obj;
        this.f60267u |= Integer.MIN_VALUE;
        return this.f60268v.emit(null, this);
    }
}
