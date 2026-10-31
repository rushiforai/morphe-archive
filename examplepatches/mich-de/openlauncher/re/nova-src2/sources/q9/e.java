package q9;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import com.android.launcher3.allapps.AllAppsContainerView;

/* loaded from: classes2.dex */
public final class e extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ float f83817a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f83818b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ AllAppsContainerView f83819c;

    public e(AllAppsContainerView allAppsContainerView, float f11, float f12) {
        this.f83819c = allAppsContainerView;
        this.f83817a = f11;
        this.f83818b = f12;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        float f11 = 1.0f - this.f83817a;
        AllAppsContainerView allAppsContainerView = this.f83819c;
        int iMax = Math.max(1000, Math.abs(Math.round(Math.min(0.0f, ((f11 * allAppsContainerView.getHeight()) / (animator.getDuration() * 1.7f)) + this.f83818b) * 1200.0f)));
        ca.c cVar = AllAppsContainerView.U;
        allAppsContainerView.f21310b.onAbsorb(iMax);
        allAppsContainerView.invalidate();
    }
}
