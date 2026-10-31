package x8;

import h6.a0;
import t70.r1;

/* loaded from: classes.dex */
public final class a implements q {

    /* renamed from: a, reason: collision with root package name */
    public final h6.u f95278a;

    /* renamed from: b, reason: collision with root package name */
    public final r1 f95279b;

    public a(h6.u uVar, r1 r1Var) {
        this.f95278a = uVar;
        this.f95279b = r1Var;
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public final void onDestroy(a0 a0Var) {
        this.f95279b.c(null);
    }

    @Override // x8.q
    public final void s() {
        this.f95278a.c(this);
    }

    @Override // x8.q
    public final void start() {
        this.f95278a.a(this);
    }
}
