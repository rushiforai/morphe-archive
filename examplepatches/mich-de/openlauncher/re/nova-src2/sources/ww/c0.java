package ww;

import h6.n1;
import h6.o1;

/* loaded from: classes4.dex */
public final class c0 implements h6.a0, o1, a7.h {

    /* renamed from: a, reason: collision with root package name */
    public final h6.c0 f94757a = new h6.c0(this);

    /* renamed from: b, reason: collision with root package name */
    public final n1 f94758b = new n1();

    /* renamed from: c, reason: collision with root package name */
    public final a7.g f94759c = new a7.g(new c7.a(this, new a7.f(this, 0)));

    @Override // h6.a0
    public final h6.u getLifecycle() {
        return this.f94757a;
    }

    @Override // a7.h
    public final a7.e getSavedStateRegistry() {
        return this.f94759c.f442b;
    }

    @Override // h6.o1
    public final n1 getViewModelStore() {
        return this.f94758b;
    }
}
