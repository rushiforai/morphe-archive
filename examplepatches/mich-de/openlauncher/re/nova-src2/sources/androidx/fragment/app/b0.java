package androidx.fragment.app;

import android.view.View;

/* loaded from: classes2.dex */
public final class b0 implements h6.y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h0 f14494a;

    public b0(h0 h0Var) {
        this.f14494a = h0Var;
    }

    @Override // h6.y
    public final void d(h6.a0 a0Var, h6.s sVar) {
        View view;
        if (sVar != h6.s.ON_STOP || (view = this.f14494a.mView) == null) {
            return;
        }
        view.cancelPendingInputEvents();
    }
}
