package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;

/* loaded from: classes.dex */
public final class n1 implements q1, d, x70.s {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ q1 f93963a;

    public n1(l1 l1Var) {
        this.f93963a = l1Var;
    }

    @Override // x70.s
    public final m a(CoroutineContext coroutineContext, int i5, v70.a aVar) {
        return u1.t(this, coroutineContext, i5, aVar);
    }

    @Override // w70.m
    public final Object collect(n nVar, Continuation continuation) {
        return this.f93963a.collect(nVar, continuation);
    }
}
