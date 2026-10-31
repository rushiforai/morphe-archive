package androidx.fragment.app;

import android.view.View;
import android.view.Window;

/* loaded from: classes.dex */
public final class l0 extends s0 implements o4.e, o4.f, n4.o0, n4.p0, h6.o1, g.b0, j.j, a7.h, l1, a5.p {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ m0 f14610e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l0(m0 m0Var) {
        super(m0Var);
        this.f14610e = m0Var;
    }

    @Override // androidx.fragment.app.l1
    public final void a(h0 h0Var) {
        this.f14610e.onAttachFragment(h0Var);
    }

    @Override // a5.p
    public final void addMenuProvider(a5.u uVar) {
        this.f14610e.addMenuProvider(uVar);
    }

    @Override // o4.e
    public final void addOnConfigurationChangedListener(z4.a aVar) {
        this.f14610e.addOnConfigurationChangedListener(aVar);
    }

    @Override // n4.o0
    public final void addOnMultiWindowModeChangedListener(z4.a aVar) {
        this.f14610e.addOnMultiWindowModeChangedListener(aVar);
    }

    @Override // n4.p0
    public final void addOnPictureInPictureModeChangedListener(z4.a aVar) {
        this.f14610e.addOnPictureInPictureModeChangedListener(aVar);
    }

    @Override // o4.f
    public final void addOnTrimMemoryListener(z4.a aVar) {
        this.f14610e.addOnTrimMemoryListener(aVar);
    }

    @Override // androidx.fragment.app.p0
    public final View b(int i5) {
        return this.f14610e.findViewById(i5);
    }

    @Override // androidx.fragment.app.p0
    public final boolean c() {
        Window window = this.f14610e.getWindow();
        return (window == null || window.peekDecorView() == null) ? false : true;
    }

    @Override // j.j
    public final j.i getActivityResultRegistry() {
        return this.f14610e.getActivityResultRegistry();
    }

    @Override // h6.a0
    public final h6.u getLifecycle() {
        return this.f14610e.mFragmentLifecycleRegistry;
    }

    @Override // g.b0
    public final g.a0 getOnBackPressedDispatcher() {
        return this.f14610e.getOnBackPressedDispatcher();
    }

    @Override // a7.h
    public final a7.e getSavedStateRegistry() {
        return this.f14610e.getSavedStateRegistry();
    }

    @Override // h6.o1
    public final h6.n1 getViewModelStore() {
        return this.f14610e.getViewModelStore();
    }

    @Override // a5.p
    public final void removeMenuProvider(a5.u uVar) {
        this.f14610e.removeMenuProvider(uVar);
    }

    @Override // o4.e
    public final void removeOnConfigurationChangedListener(z4.a aVar) {
        this.f14610e.removeOnConfigurationChangedListener(aVar);
    }

    @Override // n4.o0
    public final void removeOnMultiWindowModeChangedListener(z4.a aVar) {
        this.f14610e.removeOnMultiWindowModeChangedListener(aVar);
    }

    @Override // n4.p0
    public final void removeOnPictureInPictureModeChangedListener(z4.a aVar) {
        this.f14610e.removeOnPictureInPictureModeChangedListener(aVar);
    }

    @Override // o4.f
    public final void removeOnTrimMemoryListener(z4.a aVar) {
        this.f14610e.removeOnTrimMemoryListener(aVar);
    }
}
