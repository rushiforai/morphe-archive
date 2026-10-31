package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class g1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93906t;

    /* renamed from: u, reason: collision with root package name */
    public int f93907u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ as.p f93908v;

    /* renamed from: w, reason: collision with root package name */
    public Object f93909w;

    /* renamed from: x, reason: collision with root package name */
    public n f93910x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g1(as.p pVar, Continuation continuation) {
        super(continuation);
        this.f93908v = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93906t = obj;
        this.f93907u |= Integer.MIN_VALUE;
        return this.f93908v.emit(null, this);
    }
}
