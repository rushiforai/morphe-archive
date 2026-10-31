package h6;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class w0 implements y, AutoCloseable {

    /* renamed from: a, reason: collision with root package name */
    public final String f59464a;

    /* renamed from: b, reason: collision with root package name */
    public final u0 f59465b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f59466c;

    public w0(String str, u0 u0Var) {
        this.f59464a = str;
        this.f59465b = u0Var;
    }

    public final void a(a7.e registry, u lifecycle) {
        Intrinsics.g(registry, "registry");
        Intrinsics.g(lifecycle, "lifecycle");
        if (this.f59466c) {
            throw new IllegalStateException("Already attached to lifecycleOwner");
        }
        this.f59466c = true;
        lifecycle.a(this);
        registry.b(this.f59464a, (j6.a) this.f59465b.f59455b.f18283f);
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
    }

    @Override // h6.y
    public final void d(a0 a0Var, s sVar) {
        if (sVar == s.ON_DESTROY) {
            this.f59466c = false;
            a0Var.getLifecycle().c(this);
        }
    }
}
