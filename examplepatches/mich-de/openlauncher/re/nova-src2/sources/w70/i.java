package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93922t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ j f93923u;

    /* renamed from: v, reason: collision with root package name */
    public int f93924v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(j jVar, Continuation continuation) {
        super(continuation);
        this.f93923u = jVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93922t = obj;
        this.f93924v |= Integer.MIN_VALUE;
        return this.f93923u.emit(null, this);
    }
}
