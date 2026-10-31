package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.view.View;
import android.view.animation.LinearInterpolator;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class dj extends lt {
    private int htf;
    private Runnable thx;
    ObjectAnimator ycx;

    /* renamed from: zb, reason: collision with root package name */
    ObjectAnimator f23394zb;

    public dj(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        this.htf = 0;
        this.thx = new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.dj.1
            @Override // java.lang.Runnable
            public void run() {
                dj.this.ycx();
            }
        };
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud, android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        for (int i5 = 0; i5 < getChildCount(); i5++) {
            View childAt = getChildAt(i5);
            FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
            layoutParams.topMargin = (this.fby - layoutParams.height) / 2;
            childAt.setLayoutParams(layoutParams);
            if (i5 != 0) {
                childAt.setVisibility(8);
            }
        }
        postDelayed(this.thx, 2500L);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.kgy
    public void zb() {
        removeCallbacks(this.thx);
        ObjectAnimator objectAnimator = this.ycx;
        if (objectAnimator != null) {
            objectAnimator.removeAllUpdateListeners();
            this.ycx.cancel();
        }
        ObjectAnimator objectAnimator2 = this.f23394zb;
        if (objectAnimator2 != null) {
            objectAnimator2.removeAllUpdateListeners();
            this.f23394zb.cancel();
        }
        super.zb();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx() {
        final View childAt = getChildAt(this.htf);
        final View childAt2 = getChildAt((this.htf + 1) % getChildCount());
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(childAt, "translationY", 0.0f, (-(getChildAt(this.htf).getHeight() + this.fby)) / 2);
        this.ycx = objectAnimatorOfFloat;
        objectAnimatorOfFloat.setInterpolator(new LinearInterpolator());
        this.ycx.addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.dj.2
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
                childAt.setVisibility(8);
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator) {
            }
        });
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(childAt2, "translationY", (childAt2.getHeight() + this.fby) / 2, 0.0f);
        this.f23394zb = objectAnimatorOfFloat2;
        objectAnimatorOfFloat2.setInterpolator(new LinearInterpolator());
        this.f23394zb.addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.dj.3
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator) {
                childAt2.setVisibility(0);
            }
        });
        this.ycx.setDuration(500L);
        this.f23394zb.setDuration(500L);
        this.ycx.start();
        this.f23394zb.start();
        int i5 = this.htf + 1;
        this.htf = i5;
        this.htf = i5 % getChildCount();
        postDelayed(this.thx, 2000L);
    }
}
