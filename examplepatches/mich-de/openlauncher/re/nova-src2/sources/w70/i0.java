package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class i0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public j0 f93925t;

    /* renamed from: u, reason: collision with root package name */
    public Object f93926u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f93927v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ j0 f93928w;

    /* renamed from: x, reason: collision with root package name */
    public int f93929x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i0(j0 j0Var, Continuation continuation) {
        super(continuation);
        this.f93928w = j0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93927v = obj;
        this.f93929x |= Integer.MIN_VALUE;
        return this.f93928w.emit(null, this);
    }
}
