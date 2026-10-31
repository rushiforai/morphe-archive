package w50;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93767t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ b f93768u;

    /* renamed from: v, reason: collision with root package name */
    public int f93769v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(b bVar, Continuation continuation) {
        super(continuation);
        this.f93768u = bVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93767t = obj;
        this.f93769v |= Integer.MIN_VALUE;
        return this.f93768u.e(this);
    }
}
