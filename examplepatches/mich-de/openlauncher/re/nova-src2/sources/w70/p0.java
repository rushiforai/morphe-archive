package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class p0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public as.p f93981t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f93982u;

    /* renamed from: v, reason: collision with root package name */
    public int f93983v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ as.p f93984w;

    /* renamed from: x, reason: collision with root package name */
    public Object f93985x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p0(as.p pVar, Continuation continuation) {
        super(continuation);
        this.f93984w = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93982u = obj;
        this.f93983v |= Integer.MIN_VALUE;
        return this.f93984w.emit(null, this);
    }
}
