package androidx.fragment.app;

import android.view.View;

/* loaded from: classes2.dex */
public final class v extends p0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ p0 f14699a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ DialogFragment f14700b;

    public v(DialogFragment dialogFragment, p0 p0Var) {
        this.f14700b = dialogFragment;
        this.f14699a = p0Var;
    }

    @Override // androidx.fragment.app.p0
    public final View b(int i5) {
        p0 p0Var = this.f14699a;
        return p0Var.c() ? p0Var.b(i5) : this.f14700b.onFindViewById(i5);
    }

    @Override // androidx.fragment.app.p0
    public final boolean c() {
        return this.f14699a.c() || this.f14700b.onHasView();
    }
}
