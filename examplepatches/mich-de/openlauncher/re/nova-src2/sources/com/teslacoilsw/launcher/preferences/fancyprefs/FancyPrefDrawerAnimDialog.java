package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import ay.k;
import e10.b0;
import f10.e;
import f10.f;
import f10.x;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefDrawerAnimDialog;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefSummaryListView;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class FancyPrefDrawerAnimDialog extends FancyPrefSummaryListView {

    /* renamed from: h0, reason: collision with root package name */
    public static final /* synthetic */ int f45989h0 = 0;

    /* renamed from: c0, reason: collision with root package name */
    public FrameLayout f45990c0;

    /* renamed from: d0, reason: collision with root package name */
    public View f45991d0;

    /* renamed from: e0, reason: collision with root package name */
    public View f45992e0;

    /* renamed from: f0, reason: collision with root package name */
    public b0 f45993f0;

    /* renamed from: g0, reason: collision with root package name */
    public boolean f45994g0;

    @JvmOverloads
    public FancyPrefDrawerAnimDialog(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.f45993f0 = b0.f51439c;
        this.L = 2131624096;
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSummaryListView, f10.d
    public final Function0 K(View view) {
        Function0 function0K = super.K(view);
        this.f45990c0 = (FrameLayout) view.findViewById(2131429249);
        this.f45991d0 = view.findViewById(2131427856);
        this.f45992e0 = view.findViewById(2131427913);
        FrameLayout frameLayout = this.f45990c0;
        if (frameLayout != null) {
            frameLayout.setOnClickListener(new k(this, 20));
            return function0K;
        }
        Intrinsics.m("mWorkspace");
        throw null;
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSummaryListView, f10.m
    public final void Q(x xVar) {
        String str = xVar.f54219a;
        this.f46007b0 = str;
        this.f45993f0 = b0.valueOf(str);
        S();
    }

    public final void S() {
        int i5;
        if (this.f45994g0) {
            return;
        }
        b0 b0Var = this.f45993f0;
        this.f45994g0 = true;
        AnimatorSet animatorSet = new AnimatorSet();
        if (b0Var == b0.f51438b) {
            View view = this.f45991d0;
            if (view == null) {
                Intrinsics.m("mDesktop");
                throw null;
            }
            view.setPivotX(view.getWidth() / 2);
            View view2 = this.f45991d0;
            if (view2 == null) {
                Intrinsics.m("mDesktop");
                throw null;
            }
            view2.setPivotY(view2.getHeight() / 2);
            View view3 = this.f45992e0;
            if (view3 == null) {
                Intrinsics.m("mDrawer");
                throw null;
            }
            view3.setPivotX(view3.getWidth() / 2);
            View view4 = this.f45992e0;
            if (view4 == null) {
                Intrinsics.m("mDrawer");
                throw null;
            }
            view4.setPivotY(view4.getHeight() / 2);
            View view5 = this.f45991d0;
            if (view5 == null) {
                Intrinsics.m("mDesktop");
                throw null;
            }
            double d5 = (400 * 2.0f) / 3;
            ObjectAnimator duration = ObjectAnimator.ofFloat(view5, "alpha", 1.0f, 0.0f).setDuration(MathKt.c(d5));
            View view6 = this.f45991d0;
            if (view6 == null) {
                Intrinsics.m("mDesktop");
                throw null;
            }
            ObjectAnimator duration2 = ObjectAnimator.ofFloat(view6, "scaleX", 1.0f, 0.3f).setDuration(400L);
            View view7 = this.f45991d0;
            if (view7 == null) {
                Intrinsics.m("mDesktop");
                throw null;
            }
            i5 = 1;
            ObjectAnimator duration3 = ObjectAnimator.ofFloat(view7, "scaleY", 1.0f, 0.3f).setDuration(400L);
            View view8 = this.f45992e0;
            if (view8 == null) {
                Intrinsics.m("mDrawer");
                throw null;
            }
            ObjectAnimator duration4 = ObjectAnimator.ofFloat(view8, "alpha", 0.0f, 1.0f).setDuration(MathKt.c(d5));
            View view9 = this.f45992e0;
            if (view9 == null) {
                Intrinsics.m("mDrawer");
                throw null;
            }
            ObjectAnimator duration5 = ObjectAnimator.ofFloat(view9, "scaleX", 5.0f, 1.0f).setDuration(400L);
            View view10 = this.f45992e0;
            if (view10 == null) {
                Intrinsics.m("mDrawer");
                throw null;
            }
            animatorSet.playTogether(duration, duration2, duration3, duration4, duration5, ObjectAnimator.ofFloat(view10, "scaleY", 5.0f, 1.0f).setDuration(400L));
            animatorSet.addListener(new e(this, 2));
        } else {
            i5 = 1;
            if (b0Var == b0.f51439c) {
                View view11 = this.f45991d0;
                if (view11 == null) {
                    Intrinsics.m("mDesktop");
                    throw null;
                }
                view11.setPivotX(view11.getWidth() / 2);
                View view12 = this.f45991d0;
                if (view12 == null) {
                    Intrinsics.m("mDesktop");
                    throw null;
                }
                view12.setPivotY(view12.getHeight() / 2);
                View view13 = this.f45991d0;
                if (view13 == null) {
                    Intrinsics.m("mDesktop");
                    throw null;
                }
                ObjectAnimator duration6 = ObjectAnimator.ofFloat(view13, "alpha", 1.0f, 0.0f).setDuration(400L);
                View view14 = this.f45991d0;
                if (view14 == null) {
                    Intrinsics.m("mDesktop");
                    throw null;
                }
                ObjectAnimator duration7 = ObjectAnimator.ofFloat(view14, "scaleX", 1.0f, 0.5f).setDuration(400L);
                View view15 = this.f45991d0;
                if (view15 == null) {
                    Intrinsics.m("mDesktop");
                    throw null;
                }
                ObjectAnimator duration8 = ObjectAnimator.ofFloat(view15, "scaleY", 1.0f, 0.5f).setDuration(400L);
                View view16 = this.f45992e0;
                if (view16 == null) {
                    Intrinsics.m("mDrawer");
                    throw null;
                }
                ObjectAnimator duration9 = ObjectAnimator.ofFloat(view16, "alpha", 0.0f, 1.0f).setDuration(MathKt.c((400 * 2.0f) / 3.0f));
                View view17 = this.f45992e0;
                if (view17 == null) {
                    Intrinsics.m("mDrawer");
                    throw null;
                }
                if (this.f45991d0 == null) {
                    Intrinsics.m("mDesktop");
                    throw null;
                }
                animatorSet.playTogether(duration6, duration7, duration8, duration9, ObjectAnimator.ofFloat(view17, "translationY", r8.getHeight(), 0.0f).setDuration(400L));
            } else if (b0Var == b0.f51440d) {
                View view18 = this.f45991d0;
                if (view18 == null) {
                    Intrinsics.m("mDesktop");
                    throw null;
                }
                ObjectAnimator duration10 = ObjectAnimator.ofFloat(view18, "alpha", 1.0f, 0.0f).setDuration(400L);
                View view19 = this.f45992e0;
                if (view19 == null) {
                    Intrinsics.m("mDrawer");
                    throw null;
                }
                animatorSet.playTogether(duration10, ObjectAnimator.ofFloat(view19, "alpha", 0.0f, 1.0f).setDuration(400L));
            }
        }
        animatorSet.addListener(new f(this, b0Var, i5));
        animatorSet.start();
    }
}
