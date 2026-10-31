package h50;

import kotlin.coroutines.CoroutineContext;

/* loaded from: classes4.dex */
public final class a0 implements k50.b {

    /* renamed from: a, reason: collision with root package name */
    public final o50.s f59149a;

    /* renamed from: b, reason: collision with root package name */
    public final o50.f0 f59150b;

    /* renamed from: c, reason: collision with root package name */
    public final s50.d f59151c;

    /* renamed from: d, reason: collision with root package name */
    public final o50.o f59152d;

    public a0(k50.c cVar) {
        this.f59149a = cVar.f71118b;
        this.f59150b = cVar.f71117a.b();
        this.f59151c = cVar.f71122f;
        this.f59152d = new o50.o(cVar.f71119c.f86691a);
    }

    @Override // o50.q
    public final o50.m a() {
        return this.f59152d;
    }

    @Override // k50.b
    public final s50.d getAttributes() {
        return this.f59151c;
    }

    @Override // k50.b, t70.j0
    public final CoroutineContext getCoroutineContext() {
        throw new IllegalStateException("Call is not initialized");
    }

    @Override // k50.b
    public final o50.s getMethod() {
        return this.f59149a;
    }

    @Override // k50.b
    public final o50.f0 getUrl() {
        return this.f59150b;
    }
}
