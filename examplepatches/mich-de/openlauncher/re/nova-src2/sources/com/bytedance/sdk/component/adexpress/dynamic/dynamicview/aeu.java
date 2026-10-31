package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.LinearInterpolator;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class aeu extends lt {
    private int htf;
    private boolean thx;
    private Runnable wwx;
    ObjectAnimator ycx;

    /* renamed from: zb, reason: collision with root package name */
    ObjectAnimator f23391zb;

    public aeu(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        this.htf = 0;
        this.thx = false;
        this.wwx = new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.aeu.1
            @Override // java.lang.Runnable
            public void run() {
                aeu.this.ycx();
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
        ObjectAnimator objectAnimator2 = this.f23391zb;
        if (objectAnimator2 != null) {
            objectAnimator2.removeAllUpdateListeners();
            this.f23391zb.cancel();
        }
        super.zb();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx() {
        final View childAt;
        final View childAt2 = getChildAt(this.htf);
        int i5 = this.htf;
        if (i5 == 0) {
            this.thx = false;
        }
        boolean z11 = i5 + 1 >= getChildCount() || ((ViewGroup) getChildAt(this.htf + 1)).getChildCount() <= 0;
        if (this.f23414ry.jc().lud().ycx() || !z11) {
            View childAt3 = z11 ? getChildAt((this.htf + 2) % getChildCount()) : getChildAt((this.htf + 1) % getChildCount());
            this.ycx = ObjectAnimator.ofFloat(childAt2, "translationY", 0.0f, (-(getChildAt(this.htf).getHeight() + this.fby)) / 2);
            if (z11) {
                this.htf++;
            }
            childAt = childAt3;
        } else {
            this.thx = true;
            childAt = getChildAt(this.htf - 1);
            this.ycx = ObjectAnimator.ofFloat(childAt2, "translationY", 0.0f, (getChildAt(this.htf).getHeight() + this.fby) / 2);
        }
        this.ycx.setInterpolator(new LinearInterpolator());
        this.ycx.addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.aeu.2
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
            this.f23391zb = ObjectAnimator.ofFloat(childAt, "translationY", (-(childAt.getHeight() + this.fby)) / 2, 0.0f);
        } else {
            this.f23391zb = ObjectAnimator.ofFloat(childAt, "translationY", (childAt.getHeight() + this.fby) / 2, 0.0f);
        }
        this.f23391zb.setInterpolator(new LinearInterpolator());
        this.f23391zb.addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.aeu.3
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
        this.f23391zb.setDuration(500L);
        this.ycx.start();
        this.f23391zb.start();
        if (this.thx) {
            this.htf--;
        } else {
            int i11 = this.htf + 1;
            this.htf = i11;
            this.htf = i11 % getChildCount();
        }
        postDelayed(this.wwx, 3000L);
    }
}
