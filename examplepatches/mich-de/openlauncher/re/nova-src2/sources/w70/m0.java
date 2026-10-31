package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class m0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93957t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ n0 f93958u;

    /* renamed from: v, reason: collision with root package name */
    public int f93959v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m0(n0 n0Var, Continuation continuation) {
        super(continuation);
        this.f93958u = n0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93957t = obj;
        this.f93959v |= Integer.MIN_VALUE;
        return this.f93958u.emit(null, this);
    }
}
