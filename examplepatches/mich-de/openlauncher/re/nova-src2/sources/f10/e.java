package f10;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefDrawerAnimDialog;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54174a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ FancyPrefDrawerAnimDialog f54175b;

    public /* synthetic */ e(FancyPrefDrawerAnimDialog fancyPrefDrawerAnimDialog, int i5) {
        this.f54174a = i5;
        this.f54175b = fancyPrefDrawerAnimDialog;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationEnd(Animator animator) {
        switch (this.f54174a) {
            case 0:
                FancyPrefDrawerAnimDialog fancyPrefDrawerAnimDialog = this.f54175b;
                View view = fancyPrefDrawerAnimDialog.f45992e0;
                if (view == null) {
                    Intrinsics.m("mDrawer");
                    throw null;
                }
                view.setLayerType(0, null);
                View view2 = fancyPrefDrawerAnimDialog.f45991d0;
                if (view2 == null) {
                    Intrinsics.m("mDesktop");
                    throw null;
                }
                view2.setLayerType(0, null);
                View view3 = fancyPrefDrawerAnimDialog.f45992e0;
                if (view3 == null) {
                    Intrinsics.m("mDrawer");
                    throw null;
                }
                view3.setScaleX(1.0f);
                View view4 = fancyPrefDrawerAnimDialog.f45992e0;
                if (view4 != null) {
                    view4.setScaleY(1.0f);
                    return;
                } else {
                    Intrinsics.m("mDrawer");
                    throw null;
                }
            case 1:
                FancyPrefDrawerAnimDialog fancyPrefDrawerAnimDialog2 = this.f54175b;
                View view5 = fancyPrefDrawerAnimDialog2.f45992e0;
                if (view5 == null) {
                    Intrinsics.m("mDrawer");
                    throw null;
                }
                view5.setLayerType(0, null);
                View view6 = fancyPrefDrawerAnimDialog2.f45991d0;
                if (view6 == null) {
                    Intrinsics.m("mDesktop");
                    throw null;
                }
                view6.setLayerType(0, null);
                View view7 = fancyPrefDrawerAnimDialog2.f45992e0;
                if (view7 != null) {
                    view7.setTranslationY(0.0f);
                    return;
                } else {
                    Intrinsics.m("mDrawer");
                    throw null;
                }
            default:
                super.onAnimationEnd(animator);
                return;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationStart(Animator animator) {
        switch (this.f54174a) {
            case 2:
                FancyPrefDrawerAnimDialog fancyPrefDrawerAnimDialog = this.f54175b;
                View view = fancyPrefDrawerAnimDialog.f45992e0;
                if (view == null) {
                    Intrinsics.m("mDrawer");
                    throw null;
                }
                view.setLayerType(2, null);
                View view2 = fancyPrefDrawerAnimDialog.f45991d0;
                if (view2 != null) {
                    view2.setLayerType(2, null);
                    return;
                } else {
                    Intrinsics.m("mDesktop");
                    throw null;
                }
            default:
                super.onAnimationStart(animator);
                return;
        }
    }
}
