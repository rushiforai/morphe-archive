package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class g0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93903t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h0 f93904u;

    /* renamed from: v, reason: collision with root package name */
    public int f93905v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g0(h0 h0Var, Continuation continuation) {
        super(continuation);
        this.f93904u = h0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93903t = obj;
        this.f93905v |= Integer.MIN_VALUE;
        return this.f93904u.emit(null, this);
    }
}
