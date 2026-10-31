package com.bytedance.sdk.component.adexpress.lt;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;

/* loaded from: classes2.dex */
public class xkz extends FrameLayout {

    /* renamed from: dj, reason: collision with root package name */
    private AnimatorSet f23620dj;
    private boolean lud;
    private wwx sya;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ImageView f23621zb;

    public xkz(Context context) {
        super(context);
        this.lud = true;
        this.ycx = context;
        this.f23620dj = new AnimatorSet();
        sya();
        dj();
        post(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.lt.xkz.1
            @Override // java.lang.Runnable
            public void run() {
                FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) xkz.this.f23621zb.getLayoutParams();
                layoutParams.topMargin = (int) ((xkz.this.sya.getMeasuredHeight() / 2.0f) - com.bytedance.sdk.component.adexpress.dj.ul.ycx(xkz.this.getContext(), 5.0f));
                layoutParams.leftMargin = (int) ((xkz.this.sya.getMeasuredWidth() / 2.0f) - com.bytedance.sdk.component.adexpress.dj.ul.ycx(xkz.this.getContext(), 5.0f));
                layoutParams.bottomMargin = (int) (com.bytedance.sdk.component.adexpress.dj.ul.ycx(xkz.this.getContext(), 5.0f) + ((-xkz.this.sya.getMeasuredHeight()) / 2.0f));
                layoutParams.rightMargin = (int) (com.bytedance.sdk.component.adexpress.dj.ul.ycx(xkz.this.getContext(), 5.0f) + ((-xkz.this.sya.getMeasuredWidth()) / 2.0f));
                layoutParams.setMarginStart(layoutParams.leftMargin);
                layoutParams.setMarginEnd(layoutParams.rightMargin);
                xkz.this.f23621zb.setLayoutParams(layoutParams);
            }
        });
    }

    private void dj() {
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this.f23621zb, "scaleX", 1.0f, 0.9f);
        objectAnimatorOfFloat.setDuration(800L);
        objectAnimatorOfFloat.setRepeatMode(2);
        objectAnimatorOfFloat.setRepeatCount(-1);
        objectAnimatorOfFloat.setInterpolator(new AccelerateDecelerateInterpolator());
        objectAnimatorOfFloat.addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.component.adexpress.lt.xkz.2
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animator) {
                if (xkz.this.lud) {
                    xkz.this.sya.ycx();
                }
                xkz.this.lud = !r2.lud;
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator) {
                ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(xkz.this.f23621zb, "alpha", 0.0f, 1.0f);
                objectAnimatorOfFloat2.setDuration(200L);
                objectAnimatorOfFloat2.setInterpolator(new AccelerateDecelerateInterpolator());
                objectAnimatorOfFloat2.start();
                xkz.this.f23621zb.setVisibility(0);
            }
        });
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(this.f23621zb, "scaleY", 1.0f, 0.9f);
        objectAnimatorOfFloat2.setDuration(800L);
        objectAnimatorOfFloat2.setRepeatMode(2);
        objectAnimatorOfFloat2.setRepeatCount(-1);
        objectAnimatorOfFloat2.setInterpolator(new AccelerateDecelerateInterpolator());
        this.f23620dj.playTogether(objectAnimatorOfFloat, objectAnimatorOfFloat2);
    }

    private void sya() {
        this.sya = new wwx(this.ycx);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 40.0f), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 40.0f));
        layoutParams.gravity = 8388627;
        addView(this.sya, layoutParams);
        this.f23621zb = new ImageView(this.ycx);
        FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 62.0f), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 62.0f));
        layoutParams2.gravity = 16;
        this.f23621zb.setImageResource(com.bytedance.sdk.component.utils.wwx.dj(this.ycx, "tt_splash_hand"));
        addView(this.f23621zb, layoutParams2);
    }

    public void zb() {
        AnimatorSet animatorSet = this.f23620dj;
        if (animatorSet != null) {
            animatorSet.cancel();
        }
        wwx wwxVar = this.sya;
        if (wwxVar != null) {
            wwxVar.zb();
        }
        ImageView imageView = this.f23621zb;
        if (imageView != null) {
            imageView.clearAnimation();
        }
    }

    public void ycx() {
        this.f23620dj.start();
    }
}
