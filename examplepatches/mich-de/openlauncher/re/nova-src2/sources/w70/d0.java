package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class d0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public e0 f93875t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f93876u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ e0 f93877v;

    /* renamed from: w, reason: collision with root package name */
    public int f93878w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d0(e0 e0Var, Continuation continuation) {
        super(continuation);
        this.f93877v = e0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93876u = obj;
        this.f93878w |= Integer.MIN_VALUE;
        return this.f93877v.emit(null, this);
    }
}
