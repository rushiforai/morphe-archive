package w70;

import java.util.List;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;

/* loaded from: classes.dex */
public final class o1 implements g2, d, x70.s {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g2 f93973a;

    public o1(m1 m1Var) {
        this.f93973a = m1Var;
    }

    @Override // x70.s
    public final m a(CoroutineContext coroutineContext, int i5, v70.a aVar) {
        return (((i5 < 0 || i5 >= 2) && i5 != -2) || aVar != v70.a.f92142b) ? u1.t(this, coroutineContext, i5, aVar) : this;
    }

    @Override // w70.m
    public final Object collect(n nVar, Continuation continuation) {
        return this.f93973a.collect(nVar, continuation);
    }

    @Override // w70.q1
    public final List getReplayCache() {
        return this.f93973a.getReplayCache();
    }

    @Override // w70.g2
    public final Object getValue() {
        return this.f93973a.getValue();
    }
}
