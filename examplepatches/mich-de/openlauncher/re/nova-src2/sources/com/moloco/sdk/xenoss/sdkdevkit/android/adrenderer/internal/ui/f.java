package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.view.View;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class f {

    @SourceDebugExtension
    public static final class a implements Animator.AnimatorListener {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ View f39801a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ float f39802b;

        public a(View view, float f11) {
            this.f39801a = view;
            this.f39802b = f11;
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationCancel(@NotNull Animator animator) {
            Intrinsics.g(animator, "animator");
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationEnd(@NotNull Animator animator) {
            Intrinsics.g(animator, "animator");
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationRepeat(@NotNull Animator animator) {
            Intrinsics.g(animator, "animator");
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationStart(@NotNull Animator animator) {
            Intrinsics.g(animator, "animator");
            this.f39801a.setScaleX(this.f39802b);
            this.f39801a.setScaleY(this.f39802b);
            this.f39801a.setVisibility(0);
        }
    }

    public static final void a(@NotNull View view) {
        Intrinsics.g(view, "<this>");
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(view, "scaleX", 1.0f, 1.05f);
        objectAnimatorOfFloat.setDuration(750L);
        objectAnimatorOfFloat.setRepeatMode(2);
        objectAnimatorOfFloat.setRepeatCount(-1);
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(view, "scaleY", 1.0f, 1.05f);
        objectAnimatorOfFloat2.setDuration(750L);
        objectAnimatorOfFloat2.setRepeatMode(2);
        objectAnimatorOfFloat2.setRepeatCount(-1);
        ObjectAnimator objectAnimatorOfFloat3 = ObjectAnimator.ofFloat(view, "scaleX", 1.05f, 1.0f);
        objectAnimatorOfFloat3.setDuration(750L);
        ObjectAnimator objectAnimatorOfFloat4 = ObjectAnimator.ofFloat(view, "scaleY", 1.05f, 1.0f);
        objectAnimatorOfFloat4.setDuration(750L);
        ObjectAnimator objectAnimatorOfFloat5 = ObjectAnimator.ofFloat(view, "scaleX", 0.0f, 1.05f);
        objectAnimatorOfFloat5.setDuration(250L);
        ObjectAnimator objectAnimatorOfFloat6 = ObjectAnimator.ofFloat(view, "scaleY", 0.0f, 1.05f);
        objectAnimatorOfFloat6.setDuration(250L);
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.play(objectAnimatorOfFloat5).with(objectAnimatorOfFloat6);
        AnimatorSet animatorSet2 = new AnimatorSet();
        animatorSet2.play(objectAnimatorOfFloat3).with(objectAnimatorOfFloat4);
        AnimatorSet animatorSet3 = new AnimatorSet();
        animatorSet3.play(objectAnimatorOfFloat).with(objectAnimatorOfFloat2);
        AnimatorSet animatorSet4 = new AnimatorSet();
        animatorSet4.addListener(new a(view, 0.0f));
        animatorSet4.playSequentially(animatorSet, animatorSet2, animatorSet3);
        animatorSet4.setStartDelay(1000L);
        animatorSet4.start();
    }
}
