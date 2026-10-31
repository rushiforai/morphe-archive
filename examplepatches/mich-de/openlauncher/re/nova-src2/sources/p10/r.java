package p10;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class r extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f81882t;

    /* renamed from: u, reason: collision with root package name */
    public int f81883u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ cw.x1 f81884v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(cw.x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f81884v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81882t = obj;
        this.f81883u |= Integer.MIN_VALUE;
        return this.f81884v.emit(null, this);
    }
}
