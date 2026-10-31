package androidx.fragment.app;

import android.view.View;

/* loaded from: classes2.dex */
public final class a0 extends p0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h0 f14490a;

    public a0(h0 h0Var) {
        this.f14490a = h0Var;
    }

    @Override // androidx.fragment.app.p0
    public final View b(int i5) {
        h0 h0Var = this.f14490a;
        View view = h0Var.mView;
        if (view != null) {
            return view.findViewById(i5);
        }
        throw new IllegalStateException("Fragment " + h0Var + " does not have a view");
    }

    @Override // androidx.fragment.app.p0
    public final boolean c() {
        return this.f14490a.mView != null;
    }
}
