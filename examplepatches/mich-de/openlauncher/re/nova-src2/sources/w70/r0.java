package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class r0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93996t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ cw.x1 f93997u;

    /* renamed from: v, reason: collision with root package name */
    public int f93998v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r0(cw.x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f93997u = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93996t = obj;
        this.f93998v |= Integer.MIN_VALUE;
        return this.f93997u.a(null, this);
    }
}
