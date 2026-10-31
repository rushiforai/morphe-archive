package f10;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.view.View;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefDrawerAnimDialog;
import e10.b0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;

/* loaded from: classes4.dex */
public final class f extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54176a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ FancyPrefDrawerAnimDialog f54177b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b0 f54178c;

    public /* synthetic */ f(FancyPrefDrawerAnimDialog fancyPrefDrawerAnimDialog, b0 b0Var, int i5) {
        this.f54176a = i5;
        this.f54177b = fancyPrefDrawerAnimDialog;
        this.f54178c = b0Var;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        int i5;
        int i11 = this.f54176a;
        b0 b0Var = this.f54178c;
        FancyPrefDrawerAnimDialog fancyPrefDrawerAnimDialog = this.f54177b;
        switch (i11) {
            case 0:
                fancyPrefDrawerAnimDialog.f45994g0 = false;
                if (fancyPrefDrawerAnimDialog.f45993f0 != b0Var) {
                    fancyPrefDrawerAnimDialog.S();
                    return;
                }
                return;
            default:
                int i12 = FancyPrefDrawerAnimDialog.f45989h0;
                AnimatorSet animatorSet = new AnimatorSet();
                int iOrdinal = b0Var.ordinal();
                if (iOrdinal == 0) {
                    View view = fancyPrefDrawerAnimDialog.f45991d0;
                    if (view == null) {
                        Intrinsics.m("mDesktop");
                        throw null;
                    }
                    double d5 = (320 * 2.0f) / 3;
                    ObjectAnimator duration = ObjectAnimator.ofFloat(view, "alpha", 0.0f, 1.0f).setDuration(MathKt.c(d5));
                    View view2 = fancyPrefDrawerAnimDialog.f45991d0;
                    if (view2 == null) {
                        Intrinsics.m("mDesktop");
                        throw null;
                    }
                    ObjectAnimator duration2 = ObjectAnimator.ofFloat(view2, "scaleX", 0.5f, 1.0f).setDuration(320L);
                    View view3 = fancyPrefDrawerAnimDialog.f45991d0;
                    if (view3 == null) {
                        Intrinsics.m("mDesktop");
                        throw null;
                    }
                    ObjectAnimator duration3 = ObjectAnimator.ofFloat(view3, "scaleY", 0.5f, 1.0f).setDuration(320L);
                    View view4 = fancyPrefDrawerAnimDialog.f45992e0;
                    if (view4 == null) {
                        Intrinsics.m("mDrawer");
                        throw null;
                    }
                    ObjectAnimator duration4 = ObjectAnimator.ofFloat(view4, "alpha", 1.0f, 0.0f).setDuration(MathKt.c(d5));
                    View view5 = fancyPrefDrawerAnimDialog.f45992e0;
                    if (view5 == null) {
                        Intrinsics.m("mDrawer");
                        throw null;
                    }
                    ObjectAnimator duration5 = ObjectAnimator.ofFloat(view5, "scaleX", 1.0f, 1.5f).setDuration(320L);
                    View view6 = fancyPrefDrawerAnimDialog.f45992e0;
                    if (view6 == null) {
                        Intrinsics.m("mDrawer");
                        throw null;
                    }
                    animatorSet.playTogether(duration, duration2, duration3, duration4, duration5, ObjectAnimator.ofFloat(view6, "scaleY", 1.0f, 1.5f).setDuration(320L));
                    i5 = 0;
                    animatorSet.addListener(new e(fancyPrefDrawerAnimDialog, 0));
                } else if (iOrdinal == 1) {
                    View view7 = fancyPrefDrawerAnimDialog.f45991d0;
                    if (view7 == null) {
                        Intrinsics.m("mDesktop");
                        throw null;
                    }
                    ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(view7, "alpha", 0.0f, 1.0f);
                    float f11 = (320 * 2.0f) / 3;
                    ObjectAnimator duration6 = objectAnimatorOfFloat.setDuration(x7.f.O(f11));
                    View view8 = fancyPrefDrawerAnimDialog.f45991d0;
                    if (view8 == null) {
                        Intrinsics.m("mDesktop");
                        throw null;
                    }
                    ObjectAnimator duration7 = ObjectAnimator.ofFloat(view8, "scaleX", 0.5f, 1.0f).setDuration(320L);
                    View view9 = fancyPrefDrawerAnimDialog.f45991d0;
                    if (view9 == null) {
                        Intrinsics.m("mDesktop");
                        throw null;
                    }
                    ObjectAnimator duration8 = ObjectAnimator.ofFloat(view9, "scaleY", 0.5f, 1.0f).setDuration(320L);
                    View view10 = fancyPrefDrawerAnimDialog.f45992e0;
                    if (view10 == null) {
                        Intrinsics.m("mDrawer");
                        throw null;
                    }
                    ObjectAnimator duration9 = ObjectAnimator.ofFloat(view10, "alpha", 1.0f, 0.0f).setDuration(x7.f.O(f11));
                    View view11 = fancyPrefDrawerAnimDialog.f45992e0;
                    if (view11 == null) {
                        Intrinsics.m("mDrawer");
                        throw null;
                    }
                    if (fancyPrefDrawerAnimDialog.f45991d0 == null) {
                        Intrinsics.m("mDesktop");
                        throw null;
                    }
                    animatorSet.playTogether(duration6, duration7, duration8, duration9, ObjectAnimator.ofFloat(view11, "translationY", 0.0f, r13.getHeight()).setDuration(320L));
                    animatorSet.addListener(new e(fancyPrefDrawerAnimDialog, 1));
                    i5 = 0;
                } else {
                    if (iOrdinal != 2) {
                        throw new NoWhenBranchMatchedException();
                    }
                    View view12 = fancyPrefDrawerAnimDialog.f45991d0;
                    if (view12 == null) {
                        Intrinsics.m("mDesktop");
                        throw null;
                    }
                    ObjectAnimator duration10 = ObjectAnimator.ofFloat(view12, "alpha", 0.0f, 1.0f).setDuration(320L);
                    View view13 = fancyPrefDrawerAnimDialog.f45992e0;
                    if (view13 == null) {
                        Intrinsics.m("mDrawer");
                        throw null;
                    }
                    animatorSet.playTogether(duration10, ObjectAnimator.ofFloat(view13, "alpha", 1.0f, 0.0f).setDuration(320L));
                    i5 = 0;
                }
                animatorSet.addListener(new f(fancyPrefDrawerAnimDialog, b0Var, i5));
                animatorSet.setStartDelay(200L);
                animatorSet.start();
                return;
        }
    }
}
