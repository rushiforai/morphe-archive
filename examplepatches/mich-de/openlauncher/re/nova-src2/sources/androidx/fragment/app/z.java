package androidx.fragment.app;

import android.os.Bundle;

/* loaded from: classes2.dex */
public final class z extends f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h0 f14724a;

    public z(h0 h0Var) {
        this.f14724a = h0Var;
    }

    @Override // androidx.fragment.app.f0
    public final void a() {
        h0 h0Var = this.f14724a;
        h0Var.mSavedStateRegistryController.f441a.d();
        h6.y0.b(h0Var);
        Bundle bundle = h0Var.mSavedFragmentState;
        h0Var.mSavedStateRegistryController.a(bundle != null ? bundle.getBundle("registryState") : null);
    }
}
