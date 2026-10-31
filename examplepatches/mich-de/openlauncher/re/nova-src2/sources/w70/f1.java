package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class f1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93896t;

    /* renamed from: u, reason: collision with root package name */
    public int f93897u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ cw.x1 f93898v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f1(cw.x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f93898v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93896t = obj;
        this.f93897u |= Integer.MIN_VALUE;
        return this.f93898v.emit(null, this);
    }
}
