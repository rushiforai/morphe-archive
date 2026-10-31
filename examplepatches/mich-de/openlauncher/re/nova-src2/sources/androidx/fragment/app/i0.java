package androidx.fragment.app;

import android.os.Bundle;

/* loaded from: classes.dex */
public final /* synthetic */ class i0 implements a7.d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14595a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f14596b;

    public /* synthetic */ i0(Object obj, int i5) {
        this.f14595a = i5;
        this.f14596b = obj;
    }

    @Override // a7.d
    public final Bundle a() {
        switch (this.f14595a) {
            case 0:
                m0 m0Var = (m0) this.f14596b;
                m0Var.markFragmentsCreated();
                m0Var.mFragmentLifecycleRegistry.f(h6.s.ON_STOP);
                return new Bundle();
            default:
                return ((h1) this.f14596b).X();
        }
    }
}
