package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class b2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93862t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ c2 f93863u;

    /* renamed from: v, reason: collision with root package name */
    public int f93864v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b2(c2 c2Var, Continuation continuation) {
        super(continuation);
        this.f93863u = c2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93862t = obj;
        this.f93864v |= Integer.MIN_VALUE;
        return this.f93863u.a(0, this);
    }
}
