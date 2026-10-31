package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public x70.v f93841t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f93842u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p1 f93843v;

    /* renamed from: w, reason: collision with root package name */
    public int f93844w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(p1 p1Var, Continuation continuation) {
        super(continuation);
        this.f93843v = p1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93842u = obj;
        this.f93844w |= Integer.MIN_VALUE;
        return this.f93843v.collect(null, this);
    }
}
