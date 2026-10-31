package p1;

import kotlin.coroutines.CoroutineContext;

/* loaded from: classes.dex */
public final class q1 implements p1, e1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e1 f81529a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f81530b;

    public q1(e1 e1Var, CoroutineContext coroutineContext) {
        this.f81529a = e1Var;
        this.f81530b = coroutineContext;
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f81530b;
    }

    @Override // p1.y2
    public final Object getValue() {
        return this.f81529a.getValue();
    }

    @Override // p1.e1
    public final void setValue(Object obj) {
        this.f81529a.setValue(obj);
    }
}
