package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93884t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ cw.x1 f93885u;

    /* renamed from: v, reason: collision with root package name */
    public int f93886v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(cw.x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f93885u = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93884t = obj;
        this.f93886v |= Integer.MIN_VALUE;
        return this.f93885u.emit(null, this);
    }
}
