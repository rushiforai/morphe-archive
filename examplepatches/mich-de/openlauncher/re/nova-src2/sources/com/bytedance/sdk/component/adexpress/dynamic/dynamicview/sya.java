package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.LinearInterpolator;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class sya extends lt {
    private int htf;
    private boolean thx;
    private Runnable wwx;
    ObjectAnimator ycx;

    /* renamed from: zb, reason: collision with root package name */
    ObjectAnimator f23419zb;

    public sya(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        this.htf = 0;
        this.thx = false;
        this.wwx = new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.sya.1
            @Override // java.lang.Runnable
            public void run() {
                sya.this.ycx();
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
        postDelayed(this.wwx, 2500L);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.kgy
    public void zb() {
        removeCallbacks(this.wwx);
        ObjectAnimator objectAnimator = this.ycx;
        if (objectAnimator != null) {
            objectAnimator.removeAllUpdateListeners();
            this.ycx.cancel();
        }
        ObjectAnimator objectAnimator2 = this.f23419zb;
        if (objectAnimator2 != null) {
            objectAnimator2.removeAllUpdateListeners();
            this.f23419zb.cancel();
        }
        super.zb();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx() {
        final View childAt;
        final View childAt2 = getChildAt(this.htf);
        if (childAt2 == null) {
            return;
        }
        int i5 = this.htf;
        if (i5 == 0) {
            this.thx = false;
        }
        if (i5 + 1 >= getChildCount() || ((ViewGroup) getChildAt(this.htf + 1)).getChildCount() <= 0) {
            this.thx = true;
            childAt = getChildAt(this.htf - 1);
            this.ycx = ObjectAnimator.ofFloat(childAt2, "translationX", 0.0f, (getChildAt(this.htf).getWidth() + this.f23416ul) / 2);
        } else {
            childAt = getChildAt(this.htf + 1);
            this.ycx = ObjectAnimator.ofFloat(childAt2, "translationX", 0.0f, (-(getChildAt(this.htf).getWidth() + this.f23416ul)) / 2);
        }
        if (childAt == null) {
            return;
        }
        this.ycx.setInterpolator(new LinearInterpolator());
        this.ycx.addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.sya.2
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
                childAt2.setVisibility(8);
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator) {
            }
        });
        if (this.thx) {
            this.f23419zb = ObjectAnimator.ofFloat(childAt, "translationX", (-(childAt.getWidth() + this.f23416ul)) / 2, 0.0f);
        } else {
            this.f23419zb = ObjectAnimator.ofFloat(childAt, "translationX", (childAt.getWidth() + this.f23416ul) / 2, 0.0f);
        }
        this.f23419zb.setInterpolator(new LinearInterpolator());
        this.f23419zb.addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.sya.3
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
                childAt.setVisibility(0);
            }
        });
        this.ycx.setDuration(500L);
        this.f23419zb.setDuration(500L);
        this.ycx.start();
        this.f23419zb.start();
        if (this.thx) {
            this.htf--;
        } else {
            this.htf++;
        }
        postDelayed(this.wwx, 2000L);
    }
}
