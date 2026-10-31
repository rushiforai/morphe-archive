package r3;

import java.util.concurrent.atomic.AtomicReference;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class e0 {

    /* renamed from: a, reason: collision with root package name */
    public final a0 f85435a;

    /* renamed from: b, reason: collision with root package name */
    public final u f85436b;

    public e0(a0 a0Var, u uVar) {
        this.f85435a = a0Var;
        this.f85436b = uVar;
    }

    public final void a() {
        a0 a0Var = this.f85435a;
        AtomicReference atomicReference = a0Var.f85391b;
        while (!atomicReference.compareAndSet(this, null)) {
            if (atomicReference.get() != this) {
                return;
            }
        }
        a0Var.f85390a.d();
    }

    public final void b(h2.c cVar) {
        if (Intrinsics.b((e0) this.f85435a.f85391b.get(), this)) {
            this.f85436b.g(cVar);
        }
    }

    public final void c(z zVar, z zVar2) {
        if (Intrinsics.b((e0) this.f85435a.f85391b.get(), this)) {
            this.f85436b.c(zVar, zVar2);
        }
    }
}
